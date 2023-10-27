<?php

namespace Drupal\svksk_cmdb\Plugin\QueueWorker;

use Drupal\Core\Queue\DelayedRequeueException;
use Drupal\Core\Queue\QueueWorkerBase;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\svksk_api_client\Exception\ApiClientException;
use Drupal\svksk_api_client\Exception\ApiClientRequestException;
use Drupal\svksk_api_client\Exception\ApiClientResponseException;
use Drupal\svksk_cmdb\Exception\CmdbMissingMappingException;

/**
 * Processes Tasks to create/update ConfigurationItem to CMDB.
 *
 * @QueueWorker(
 *   id = "svksk_cmdb_ci_sync_queue",
 *   title = @Translation("CMDB: Sync CI"),
 *   cron = {"time" = 60}
 * )
 */
class CmdbCISyncWorker extends QueueWorkerBase {

  use StringTranslationTrait;

  /**
   * {@inheritdoc}
   */
  public function processItem($data) {
    /** @var \Drupal\Core\Entity\EntityTypeManager $entity_manager */
    $entity_manager = \Drupal::entityTypeManager();
    /** @var \Drupal\svksk_cmdb\CmdbCIManager $cmdb_ci_manager */
    $cmdb_ci_manager = \Drupal::service('svksk_cmdb.ci_manager');

    try {
      $entity = $entity_manager
        ->getStorage($data['entity_type'])
        ->load($data['entity_id']);

      if (!$entity) {
        return;
      }

      $cmdb_ci_manager->ensureCIRecord($entity);
      if (method_exists($entity, 'setNewRevision')) {
        $entity->setNewRevision(TRUE);
        $entity->set('revision_log', 'CMDB_CI_ID: ' . $this->t('Updated configuration item ID in CMDB.'));
      }
      $entity->save();
    } catch (ApiClientException|ApiClientRequestException|ApiClientResponseException $exception) {
      throw new DelayedRequeueException(120);
    } catch (CmdbMissingMappingException $exception) {
      // For current entity some CMDB mapping is missing therefore we will not try to create it again.
    }
  }

}
