<?php

namespace Drupal\svksk_service;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Logger\LoggerChannelInterface;

/**
 * Class ServiceSyncManager.
 *
 * @package Drupal\svksk_service
 */
class ServiceSyncManager implements ServiceSyncManagerInterface {

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Psr\Log\LoggerInterface
   */
  protected $logger;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entityTypeManager
   * @param \Drupal\Core\Logger\LoggerChannelInterface $loggerChannel
   */
  public function __construct(EntityTypeManagerInterface $entityTypeManager, LoggerChannelInterface $loggerChannel) {
    $this->entityTypeManager = $entityTypeManager;
    $this->logger = $loggerChannel;
  }

  /**
   * {@inheritdoc}
   */
  public function syncService(string $serviceId, array $serviceData): void {
    $nodes = $this->entityTypeManager->getStorage('node')->loadByProperties([
      'type' => 'service',
      'egov_service_id' => $serviceId,
    ]);
    /** @var \Drupal\node\NodeInterface $node */
    if (empty($nodes)) {
      $node = $this->entityTypeManager->getStorage('node')->create([
        'type' => 'service',
        'egov_service_id' => $serviceId,
        'uid' => 1,
      ]);
    }
    else {
      $node = reset($nodes);
    }
    if (empty($serviceData['translations'])) {
      throw new \Exception('Service translations is empty');
    }
    $node->set('langcode',
      array_key_exists(self::DEFAULT_LANGCODE, $serviceData['translations']) ?
        self::DEFAULT_LANGCODE : key($serviceData['translations']));
    foreach ($serviceData['translations'] as $langcode => $translation) {
      if ($langcode === self::DEFAULT_LANGCODE) {
        $node->set('title', $translation['name']);
        $node->set('field_perex', $translation['description']);
        $node->field_perex->format = 'plain_text';
      }
      else {
        $node->addTranslation($langcode, [
          'title' => $translation['name'],
          'field_perex' => [
            'value' => $translation['description'],
            'format' => 'plain_text',
          ],
        ]);
      }
    }
    $node->set('ci_id', $serviceData['configurationItemId']);

    if (array_key_exists('validThru', $serviceData)) {
      $validThruTimestamp = strtotime($serviceData['validThru']);

      // Check if validThru is not too big for database int column (4 bytes).
      if ($validThruTimestamp < 2147483647) {
        $node->set('unpublish_on', $validThruTimestamp);
      }
    }

    try {
      if (empty($serviceData['serviceCategoryName'])) {
        throw new \Exception('Service category name is empty');
      }
      $tid = $this->ensureServiceCategory($serviceData['serviceCategoryIdCodebook'], $serviceData['serviceCategoryName']);
      $node->set('field_category', $tid);
    }
    catch (\Exception $exception) {
      $this->logger->error("Error while saving Service category @error", [
        '@error' => $exception->getMessage(),
      ]);
    }

    $extAttr = $serviceData['extAttrs'] ? $this->flattenExtAttrs($serviceData['extAttrs']) : [];
    if (array_key_exists('UPVS_LOCATOR_METAIS_EXTERNAL_CODE', $extAttr)) {
      $node->set('field_service_code', $extAttr['UPVS_LOCATOR_METAIS_EXTERNAL_CODE']);
    }

    $node->save();
  }

  /**
   * {@inheritdoc}
   */
  public function ensureServiceCategory(string $serviceCategoryId, string $name): int {
    $terms = $this->entityTypeManager->getStorage('taxonomy_term')
      ->loadByProperties([
        'vid' => 'services_categories',
        'external_id' => $serviceCategoryId,
      ]);
    if (empty($terms)) {
      $term = $this->entityTypeManager->getStorage('taxonomy_term')->create([
        'vid' => 'services_categories',
        'external_id' => $serviceCategoryId,
        'name' => $name,
      ]);
      $term->save();
      return $term->id();
    }
    $term = reset($terms);
    return $term->id();
  }

  /**
   * Flatten list of extAttrs.
   *
   * @param array $extAttrs
   *
   * @return array
   */
  private function flattenExtAttrs(array $extAttrs): array {
    $returnExtAttrs = [];
    foreach ($extAttrs as $nestedArray) {
      foreach ($nestedArray as $key => $value) {
        $returnExtAttrs[$key] = $value;
      }
    }
    return $returnExtAttrs;
  }

}
