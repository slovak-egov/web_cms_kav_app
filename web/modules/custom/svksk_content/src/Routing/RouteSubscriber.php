<?php

namespace Drupal\svksk_content\Routing;

use Drupal\Core\Routing\RouteSubscriberBase;
use Symfony\Component\Routing\RouteCollection;

/**
 * Listens to the dynamic route events.
 */
class RouteSubscriber extends RouteSubscriberBase {

  /**
   * {@inheritdoc}
   */
  protected function alterRoutes(RouteCollection $collection) {
    if ($route = $collection->get('comment.reply')) {
      $route->setDefault('_controller', '\Drupal\svksk_content\Controller\ContentController::getReplyForm');
    }
  }

}
