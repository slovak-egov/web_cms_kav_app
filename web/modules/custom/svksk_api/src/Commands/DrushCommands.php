<?php

namespace Drupal\svksk_api\Commands;

/**
 * A drush command file.
 *
 * @package Drupal\svksk_ui_translations\Commands
 */
class DrushCommands extends \Drush\Commands\DrushCommands {

  /**
   * Drush command that export UI Translations.
   *
   * @command svksk-api:restore-consumer-keys
   * @aliases svksk-rck
   * @usage svksk-rck
   */
  public function restoreConsumerKeys() {
    try {
      /** @var \Drupal\svksk_api\ConsumerManager $consumer_manager */
      $consumer_manager = \Drupal::service('svksk_api.consumer_manager');
      $consumer_manager->restoreDefaultConsumerKeys();
      $this->logger()->notice('Consumer record was successfully restored.');
    } catch (\Exception $e) {
      $this->logger()->error($e->getMessage());
    }
  }

}
