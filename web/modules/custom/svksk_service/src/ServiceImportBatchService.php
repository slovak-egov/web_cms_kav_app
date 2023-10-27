<?php

namespace Drupal\svksk_service;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Messenger\MessengerInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Class ServiceImportBatchService.
 */
class ServiceImportBatchService {

  use StringTranslationTrait;

  /**
   * Process batch.
   *
   * @param int $id
   * @param array $operation_details
   * @param $context
   *
   * @return void
   */
  public static function process(int $id, array $item, &$context) {
    try {
      \Drupal::service('svksk_service.sync_manager')->syncService($item['serviceId'], $item);
      // Optional message displayed under the progressbar.
      $translation = isset($item['translations']) ? current($item['translations']) : NULL;
      $context['message'] = t('Imported service @serviceId @title (batch_id: @id)', [
        '@id' => $id,
        '@title' => $translation ? $translation['name'] : 'Name not found',
        '@serviceId' => $item['serviceId'],
      ]);
      $context['results'][] = $id;
    } catch (\Exception $e) {
      $context['message'] = t('Error occured while importing service @serviceId @title (batch_id: @id): @error', [
        '@id' => $id,
        '@title' => $item['name'],
        '@serviceId' => $item['serviceId'],
        '@error' => $e->getMessage(),
      ]);
      \Drupal::logger('svksk_service')->error(
        'Error importing service @serviceId: @message',
        [
          '@serviceId' => $item['serviceId'],
          '@message' => $e->getMessage(),
        ]
      );
    }
  }

  /**
   * Batch finished callback.
   *
   * @param bool $success
   *   Whether the batch process succeeded.
   * @param array $results
   *   Results of the batch process.
   * @param array $operations
   *   Operations of the batch process.
   */
  public static function finish($success, array $results, array $operations) {
    $messenger = \Drupal::messenger();
    if ($success) {
      // Here we could do something meaningful with the results.
      // We just display the number of nodes we processed...
      $messenger->addMessage(t('@count results processed.', [
        '@count' => count($results),
      ]));
    }
    else {
      // An error occurred.
      // $operations contains the operations that remained unprocessed.
      $error_operation = reset($operations);
      $messenger->addError(t('An error occurred while processing @operation with arguments : @args', [
        '@operation' => $error_operation[0],
        '@args' => print_r($error_operation[0], TRUE),
      ]));
    }
  }

}
