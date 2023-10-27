<?php

namespace Drupal\svksk_cmdb;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\Core\Queue\QueueFactory;
use Drupal\svksk_api_client\Exception\ApiClientException;
use Drupal\svksk_api_client\Exception\ApiClientRequestException;
use Drupal\svksk_api_client\Exception\ApiClientResponseException;
use Drupal\svksk_cmdb\Exception\CmdbMissingMappingException;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Defines custom operations triggered in entity hooks.
 *
 * @internal
 */
class ModuleEntityOperations implements ContainerInjectionInterface {

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * The language manager.
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  protected $languageManager;

  /**
   * @var \Drupal\svksk_cmdb\CmdbCIManager
   */
  protected $cmdbCIManager;

  /**
   * @var \Drupal\Core\Queue\QueueInterface
   */
   protected $queue;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   * @param \Drupal\Core\Language\LanguageManagerInterface $language_manager
   * @param \Drupal\svksk_cmdb\CmdbCIManager $cmdb_ci_manager
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, LanguageManagerInterface $language_manager, CmdbCIManager $cmdb_ci_manager, QueueFactory $queue_factory) {
    $this->entityTypeManager = $entity_type_manager;
    $this->languageManager = $language_manager;
    $this->cmdbCIManager = $cmdb_ci_manager;
    $this->queue = $queue_factory->get('svksk_cmdb_ci_sync_queue');
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
      $container->get('language_manager'),
      $container->get('svksk_cmdb.ci_manager'),
      $container->get('queue'),
    );
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function entityPresave(EntityInterface $entity): void {
    try {
      $this->cmdbCIManager->ensureCIRecord($entity);
    } catch (ApiClientException|ApiClientRequestException|ApiClientResponseException $exception) {
      $isTimeout = $exception->getCode() === 408;
      $is5xxError = $exception->getCode() >= 500 && $exception->getCode() < 600;
      if ($isTimeout || $is5xxError) {
        $this->queue->createItem([
          'entity_id' => $entity->id(),
          'entity_type' => $entity->getEntityTypeId(),
        ]);
      }
    } catch (CmdbMissingMappingException $exception) {
      // For current entity some CMDB mapping is missing therefore we will not try to create it.
    }
  }

}
