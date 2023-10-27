<?php

namespace Drupal\svksk_s3fs\StreamWrapper;

use Drupal\Core\Url;
use Drupal\s3fs\StreamWrapper\S3fsStream;

/**
 * Defines a Drupal s3fs stream wrapper class for use with public scheme.
 *
 * Provides support for storing files on the amazon s3 file system with the
 * Drupal file interface.
 */
class S3PublicStream extends S3fsStream {

  /**
   * {@inheritdoc}
   */
  public function getName() {
    return $this->t('Public files (s3fs)');
  }

  /**
   * {@inheritdoc}
   */
  public function getDescription() {
    return $this->t('Public files served from Amazon S3 proxified with local path.');
  }

  /**
   * {@inheritdoc}
   */
  public function getExternalUrl() {
    $router_match = \Drupal::routeMatch();
    // Skip file proxy for jsonapi routes.
    if (
      strpos($router_match->getRouteName(), 'jsonapi') === 0 ||
      strpos($router_match->getRouteName(), 'svksk_api.jsonapi') === 0
    ) {
      return parent::getExternalUrl();
    }

    $s3_key = str_replace('\\', '/', $this->streamWrapperManager::getTarget($this->uri));
    if (strpos($s3_key, 'styles/') === 0) {
      $url_parts = explode('/', $s3_key);
      $style_url = Url::fromRoute(
        's3fs.image_styles',
        [
          'image_style' => $url_parts[1],
          'scheme' => 'public',
        ],
        ['absolute' => TRUE, 'path_processing' => FALSE]
      )->toString();
      unset($url_parts[0], $url_parts[1], $url_parts[2]);
      return $style_url . '/' . implode('/', $url_parts);
    } else {
      return Url::fromRoute(
        'system.private_file_download',
        ['filepath' => 'public/' . $s3_key],
        ['absolute' => TRUE, 'path_processing' => FALSE]
      )->toString();
    }
  }

}
