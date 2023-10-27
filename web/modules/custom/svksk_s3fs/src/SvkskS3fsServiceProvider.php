<?php

namespace Drupal\svksk_s3fs;

use Drupal\Core\DependencyInjection\ContainerBuilder;
use Drupal\Core\DependencyInjection\ServiceProviderBase;

/**
 * Override S3 stream wrapper.
 */
class SvkskS3fsServiceProvider extends ServiceProviderBase {

  /**
   * {@inheritdoc}
   */
  public function alter(ContainerBuilder $container) {
    if ($container->hasDefinition('stream_wrapper.public')) {
      $definition = $container->getDefinition('stream_wrapper.public');
      $definition->setClass('Drupal\svksk_s3fs\StreamWrapper\S3PublicStream');
    }
  }
}
