<?php

namespace Drupal\svksk_http_client;

use Drupal\Core\DependencyInjection\ContainerBuilder;
use Drupal\Core\DependencyInjection\ServiceProviderBase;
use Symfony\Component\DependencyInjection\Reference;

/**
 * Override HTTP clients in services.
 */
class SvkskHttpClientServiceProvider extends ServiceProviderBase {

  /**
   * {@inheritdoc}
   */
  public function alter(ContainerBuilder $container) {
    if ($container->hasDefinition('media.oembed.url_resolver')) {
      $definition = $container->getDefinition('media.oembed.url_resolver');
      $definition->setArgument(2, new Reference('svksk_http_client.proxy_client'));
    }
    if ($container->hasDefinition('media.oembed.provider_repository')) {
      $definition = $container->getDefinition('media.oembed.provider_repository');
      $definition->setArgument(0, new Reference('svksk_http_client.proxy_client'));
    }
    if ($container->hasDefinition('media.oembed.resource_fetcher')) {
      $definition = $container->getDefinition('media.oembed.resource_fetcher');
      $definition->setArgument(0, new Reference('svksk_http_client.proxy_client'));
    }
  }
}
