<?php

namespace Drupal\request_data\Routing;

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
    if ($route = $collection->get('request_data')) {
        $requirements = $route->getRequirements();
        if (!empty($requirements['_csrf_request_header_token'])) {
          unset($requirements['_csrf_request_header_token']);
          unset($requirements['_permission']);
          $options = $route->getOptions();
          unset($options['_auth']);
          $route->setOptions($options);
          $route->setRequirements($requirements);
        }
    }
  }

}
