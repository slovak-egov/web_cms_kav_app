<?php

namespace Drupal\svksk_content\Plugin\QueueWorker;

use Drupal\Core\Queue\DelayedRequeueException;
use Drupal\Core\Queue\QueueWorkerBase;
use Drupal\svksk_base\Defaults;

/**
 * Processes Tasks for Rebuilding FE.
 *
 * @QueueWorker(
 *   id = "svksk_content_next_revalidate_queue",
 *   title = @Translation("Content: Next revalidate queue"),
 *   cron = {"time" = 60}
 * )
 */
class NextRevalidateWorker extends QueueWorkerBase {

  /**
   * {@inheritdoc}
   */
  public function processItem($data) {
    /** @var \Drupal\Core\Entity\EntityTypeManager $entity_manager */
    $entity_manager = \Drupal::entityTypeManager();
    /** @var \Drupal\svksk_content\NextCacheInvalidator $next_cache_invalidator */
    $next_cache_invalidator = \Drupal::service('svksk_content.next_cache_invalidator');

    /** @var \Drupal\next\Entity\NextSiteInterface $next_site */
    $next_site = $entity_manager->getStorage('next_site')
      ->load(Defaults::NEXT_SITE_ID);
    if (!$next_cache_invalidator->invalidateSitePath($data['path'], $next_site)) {
      // In case the revalidation wasn't successful requeue item to try again.
      throw new DelayedRequeueException(120);
    }
  }

}
