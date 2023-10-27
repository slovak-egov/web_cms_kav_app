<?php

namespace Drupal\svksk_cmdb;

/**
 * Class BatchService.
 */
class BatchService {

  /**
   * Process batch.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param array $context
   *
   * @return void
   */
  public static function process($entity, $total, &$context) {
    if (!isset($context['results']['total'])) {
      $context['results']['total'] = $total;
    }

    if (!isset($context['results']['processed'])) {
      $context['results']['processed'] = 0;
    }

    try {
      $entity->save();
      $context['results']['processed']++;
    } catch (\Exception $e) {

    }
  }

  /**
   * Finish batch.
   *
   * @param bool $success
   * @param array $results
   * @param array $operations
   */
  public static function finish($success, $results, $operations) {
    $messenger = \Drupal::messenger();

    if ($success) {
      $messenger->addMessage(t('Updated @count / @total entities.', [
        '@count' => $results['processed'],
        '@total' => $results['total'],
      ]));
    }
    else {

    }
  }

}
