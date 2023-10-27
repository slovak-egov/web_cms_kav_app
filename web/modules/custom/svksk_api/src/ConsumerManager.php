<?php

namespace Drupal\svksk_api;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Logger\LoggerChannelFactoryInterface;

class ConsumerManager {

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Psr\Log\LoggerInterface
   */
  protected $logger;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, LoggerChannelFactoryInterface $logger_channel_factory) {
    $this->entityTypeManager = $entity_type_manager;
    $this->logger = $logger_channel_factory->get('svksk_api');
  }

  /**
   * Restore consumer keys based on environment variables.
   *
   * @throws \Exception
   */
  public function restoreDefaultConsumerKeys() {
    $consumer = $this->getDefaultConsumer();
    if (!$consumer) {
      throw new \Exception('There is no default consumer.');
    } else if (!getenv('CONSUMER_CLIENT_ID') || !getenv('CONSUMER_CLIENT_SECRET')) {
      throw new \Exception('Environment variable CONSUMER_CLIENT_ID or CONSUMER_CLIENT_SECRET are not properly defined.');
    }

    try {
      $consumer->set('uuid', getenv('CONSUMER_CLIENT_ID'));
      $consumer->set('secret', getenv('CONSUMER_CLIENT_SECRET'));
      $consumer->set('user_id', 1);
      $consumer->set('roles', ['content_admin']);
      $consumer->save();
    } catch (\Exception $exception) {
      throw new \Exception('There was an error while updating default consumer.');
    }
  }

  /**
   * Return default site Consumer entity.
   *
   * @return false|mixed
   */
  private function getDefaultConsumer() {
    try {
      $consumers = $this->entityTypeManager->getStorage('consumer')->loadByProperties([
        'is_default' => TRUE
      ]);
      return reset($consumers);
    } catch (\Exception $exception) {
      $this->logger->error('There is no default consumer found.');
      return FALSE;
    }
  }

}
