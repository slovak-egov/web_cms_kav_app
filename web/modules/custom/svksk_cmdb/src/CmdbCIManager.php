<?php

namespace Drupal\svksk_cmdb;

use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Logger\LoggerChannelFactoryInterface;
use Drupal\Core\Queue\QueueFactory;
use Drupal\field\Entity\FieldConfig;
use Drupal\field\Entity\FieldStorageConfig;
use Drupal\svksk_api_client\Exception\ApiClientException;
use Drupal\svksk_api_client\Exception\ApiClientRequestException;
use Drupal\svksk_api_client\Exception\ApiClientResponseException;
use Drupal\svksk_cmdb\ApiClient\ApiClientCmdbInterface;
use Drupal\svksk_cmdb\Cmdb\CICategory;
use Drupal\svksk_cmdb\Cmdb\CIClassification;
use Drupal\svksk_cmdb\Cmdb\CIPriority;
use Drupal\svksk_cmdb\Cmdb\CISource;
use Drupal\svksk_cmdb\Cmdb\CIState;
use Drupal\svksk_cmdb\Cmdb\CIType;

/**
 * Class CmdbCIManager.
 *
 * @package Drupal\svksk_cmdb
 */
class CmdbCIManager {

  protected const CMDB_DATE_FORMAT = 'Y-m-d\TH:i:s.v\Z';

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\svksk_cmdb\ApiClient\ApiClientCmdbInterface
   */
  protected $apiClient;

  /**
   * @var \Drupal\Core\Queue\QueueFactory
   */
  private $queue;

  /**
   * @var \Psr\Log\LoggerInterface
   */
  protected $logger;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   * @param \Drupal\svksk_cmdb\ApiClient\ApiClientCmdbInterface $api_client
   * @param \Drupal\Core\Queue\QueueFactory $queue_factory
   * @param \Drupal\Core\Logger\LoggerChannelFactoryInterface $logger_channel_factory
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, ApiClientCmdbInterface $api_client, QueueFactory $queue_factory, LoggerChannelFactoryInterface $logger_channel_factory) {
    $this->entityTypeManager = $entity_type_manager;
    $this->apiClient = $api_client;
    $this->queue = $queue_factory->get('svksk_cmdb_ci_sync_queue');
    $this->logger = $logger_channel_factory->get('svksk_cmdb');
  }

  /**
   * Ensure there is a ConfigurationItem created in Cmdb for given node.
   * Store UUID of ConfigurationItem in ci_id field.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   * @throws \Drupal\svksk_cmdb\Exception\CmdbMissingMappingException
   */
  public function ensureCIRecord(EntityInterface $entity): void {
    // in case given entity doesn't have ci_id field we skip processing
    if (!method_exists($entity, 'hasField') || !$entity->hasField('ci_id')) {
      return;
    }
    // in case of saving entity from svksk_cmdb_ci_sync_queue worker we check revision_log and avoid running same logic again.
    $revision_log = $entity->hasField('revision_log') ? strval($entity->get('revision_log')->value) : '';
    if (strpos($revision_log, 'CMDB_CI_ID:') === 0) {
      return;
    }

    $configurationItemid = !$entity->get('ci_id')
      ->isEmpty() ? $entity->get('ci_id')->value : NULL;

    if ($configurationItemid && !empty($configurationItemid)) {
      try {
        $configurationItem = $this->apiClient->get("configuration-items/{$configurationItemid}");
      } catch (ApiClientException|ApiClientRequestException|ApiClientResponseException $exception) {
        if ($exception->getCode() === 404) {
          // We reset our configuration item identifier since it seems that it no longer exists in CMDB
          $configurationItem = NULL;
        } else {
          throw $exception;
        }
      }

      if ($configurationItem) {
        $this->updateCIRecord($entity, $configurationItem);
        return;
      }
    }

    // We should skip CI creation for services.
    if ($entity->getEntityTypeId() === 'node' && $entity->bundle() === 'service') {
      return;
    }

    $configurationItemid = $this->createCIRecord($entity);
    $entity->set('ci_id', $configurationItemid);
  }

  /**
   * Create Configuration item in CMDB.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return string
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   * @throws \Drupal\svksk_cmdb\Exception\CmdbMissingMappingException
   */
  public function createCIRecord(EntityInterface $entity): string {
    // This basic dataset will not change after configuration item is created.
    $data = [
      'CICategoryId' => CICategory::getIdByEntity($entity),
      'CITypeId' => CIType::DATA,
      'priorityId' => CIPriority::MEDIUM,
      'sourceId' => CISource::CMS,
      'version' => '1.0.0',
    ];
    $this->setCiState($entity, $data);
    $this->setCiClassification($entity, $data);
    $this->setCiValidityDates($entity, $data);
    $this->setCiTranslations($entity, $data);

    try {
      $response = $this->apiClient->post('configuration-items', $data);
    } catch (ApiClientException|ApiClientRequestException|ApiClientResponseException $exception) {
      throw new ApiClientResponseException('Property configurationItemId was not returned while creating configurationItem.');
    }

    return $response['configurationItemId'] ?? '';
  }

  /**
   * Updates configuration item in CMDB.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param mixed $configurationItem
   *
   * @return void
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   */
  public function updateCIRecord(EntityInterface $entity, mixed $configurationItem): void {
    if (!($entity->getEntityTypeId() === 'node' && $entity->bundle() === 'service')) {
      // Update state and validity dates only for non-service entities.
      $this->setCiState($entity, $configurationItem);
      $this->setCiValidityDates($entity, $configurationItem);
    }
    $this->setCiTranslations($entity, $configurationItem);
    $this->apiClient->put("configuration-items/{$configurationItem['id']}", $configurationItem);
  }

  /**
   * Prepares the ci_id field.
   *
   * @param string $entity_type_id
   * @param string $bundle
   *
   * @return false|void
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function prepareEntityCiIdField(string $entity_type_id, string $bundle) {
    // Do not create field when syncing configuration.
    if (\Drupal::isConfigSyncing()) {
      return FALSE;
    }
    // Create field if it doesn't exist.
    if (!FieldStorageConfig::loadByName($entity_type_id, 'ci_id')) {
      FieldStorageConfig::create([
        'field_name' => 'ci_id',
        'entity_type' => $entity_type_id,
        'type' => 'string',
        'translatable' => FALSE,
      ])->save();
    }
    // Create field instance if it doesn't exist.
    if (!FieldConfig::loadByName($entity_type_id, $bundle, 'ci_id')) {
      FieldConfig::create([
        'label' => 'CI ID',
        'description' => '',
        'field_name' => 'ci_id',
        'entity_type' => $entity_type_id,
        'bundle' => $bundle,
      ])->save();
    }
  }

  protected function setCiState(EntityInterface $entity, &$data) : void {
    $data['CIStateId'] = CIState::getIdByEntity($entity);
  }

  /**
   * Set configuration item classification ID for given entity.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param $data
   *
   * @return void
   */
  protected function setCiClassification(EntityInterface $entity, &$data) : void {
    if ($classificationId = CIClassification::getIdByEntity($entity)) {
      $data['CIClassificationId'] = $classificationId;
    }
  }

  /**
   * Set configuration item validFrom and validThru dates for given entity.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param $data
   *
   * @return void
   */
  protected function setCiValidityDates(EntityInterface $entity, &$data) : void {
    $validFromTimestamp = !$entity->get('publish_on')->isEmpty() ? $entity->get('publish_on')->value : $entity->get('created')->value;
    $validToTimestamp = !$entity->get('unpublish_on')->isEmpty() ? $entity->get('unpublish_on')->value : NULL;
    if ($validFromTimestamp) {
      $data['validFrom'] = date(self::CMDB_DATE_FORMAT, $validFromTimestamp);
    }
    if ($validToTimestamp) {
      $data['validThru'] = date(self::CMDB_DATE_FORMAT, $validToTimestamp);
    }
  }

  /**
   * Set configuration item translations data for given entity.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param $data
   *
   * @return void
   */
  protected function setCiTranslations(EntityInterface $entity, &$data) : void {
    $translations = [];
    $languages = $entity->getTranslationLanguages();
    foreach ($languages as $language) {
      $langcode = $language->getId();
      $translation = $entity->getTranslation($langcode);
      $translations[$langcode]['name'] = substr($translation->label(), 0, 250);
      if ($translation->hasField('field_perex') && !$translation->get('field_perex')->isEmpty()) {
        $translations[$langcode]['description'] = strip_tags($translation->get('field_perex')->value);
      }
    }
    if (!empty($translations)) {
      $data['translations'] = $translations;
    }
  }

}
