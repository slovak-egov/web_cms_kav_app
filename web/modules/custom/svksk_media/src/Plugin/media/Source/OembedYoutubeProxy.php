<?php

namespace Drupal\svksk_media\Plugin\media\Source;

use Drupal\media\Plugin\media\Source\OEmbed;
use Drupal\media\Plugin\media\Source\OEmbedInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Media source extending Oembed source for YouTube to fetch data over
 * proxy http client.
 *
 * @MediaSource(
 *   id = "oembed_youtube_proxy",
 *   label = @Translation("oEmbed source (Youtube proxy)"),
 *   description = @Translation("Use oEmbed URL for reusable media."),
 *   allowed_field_types = {"string"},
 *   default_thumbnail_filename = "video.png",
 *   providers = {"YouTube"},
 * )
 */
class OembedYoutubeProxy extends OEmbed implements OEmbedInterface {

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container, array $configuration, $plugin_id, $plugin_definition) {
    return new static(
      $configuration,
      $plugin_id,
      $plugin_definition,
      $container->get('entity_type.manager'),
      $container->get('entity_field.manager'),
      $container->get('config.factory'),
      $container->get('plugin.manager.field.field_type'),
      $container->get('logger.factory')->get('media'),
      $container->get('messenger'),
      $container->get('svksk_http_client.proxy_client'),
      $container->get('media.oembed.resource_fetcher'),
      $container->get('media.oembed.url_resolver'),
      $container->get('media.oembed.iframe_url_helper'),
      $container->get('file_system'),
      $container->get('token')
    );
  }

}
