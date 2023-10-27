<?php

namespace Drupal\svksk_content\EventSubscriber;

use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\KernelEvents;

/**
 * EventSubscriber related to reference invalidation.
 */
class ReferencesEventSubscriber implements EventSubscriberInterface {

  /**
   * Fill up queue with collected paths to invalidate.
   */
  public function onTerminate() {
    /** @var \Drupal\svksk_content\ReferencesService $references_service */
    $references_service = \Drupal::service('svksk_content.references');
    $references_service->onTerminate();
  }

  /**
   * {@inheritdoc}
   */
  public static function getSubscribedEvents() {
    $events[KernelEvents::TERMINATE][] = ['onTerminate'];
    return $events;
  }

}
