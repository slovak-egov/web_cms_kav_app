<?php

namespace Drupal\svksk_s3fs\Routing;

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
    if ($route = $collection->get('system.files')) {
      $route->setDefault('_controller', '\Drupal\svksk_s3fs\Controller\S3FileDownloadController::download');
    }
    if ($route = $collection->get('system.files')) {
      $route->setDefault('_controller', '\Drupal\svksk_s3fs\Controller\S3FileDownloadController::download');
    }
    if ($route = $collection->get('s3fs.image_styles')) {
      $route->setDefault('_controller', '\Drupal\svksk_s3fs\Controller\S3ImageStyleDownloadController::deliver');
    }
  }

}
