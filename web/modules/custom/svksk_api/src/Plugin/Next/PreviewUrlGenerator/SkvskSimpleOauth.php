<?php

namespace Drupal\svksk_api\Plugin\Next\PreviewUrlGenerator;

use Drupal\Component\Serialization\Json;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Url;
use Drupal\next\Annotation\PreviewUrlGenerator;
use Drupal\next\Entity\NextSiteInterface;
use Drupal\next\Exception\InvalidPreviewUrlRequest;
use Drupal\next\Plugin\Next\PreviewUrlGenerator\SimpleOauth;
use Symfony\Component\HttpFoundation\Request;

/**
 * Provides the preview_url_generator plugin based on simple_oauth.
 *
 * @PreviewUrlGenerator(
 *  id = "svksk_simple_oauth",
 *  label = "SVKSK - Simple OAuth",
 *  description = "This plugin generates token for role-based access control.
 *   Access control is handle using OAuth scopes."
 * )
 */
class SkvskSimpleOauth extends SimpleOauth {

  /**
   * {@inheritdoc}
   */
  public function generate(NextSiteInterface $next_site, EntityInterface $entity, string $resource_version = NULL): ?Url {
    /** @var \Drupal\Core\Url $url */
    $url = parent::generate($next_site, $entity, $resource_version);
    $options = $url->getOptions();

    if (isset($options['query']['secret'])) {
      $options['query']['secret'] = $next_site->getPreviewSecret();
    }

    $url->setOptions($options);

    return $url;
  }

  /**
   * {@inheritdoc}
   */
  public function validate(Request $request) {
    $body = Json::decode($request->getContent());

    // Validate the slug.
    // We do not check for existing slug. We let the next.js site handle this.
    if (empty($body['slug'])) {
      throw new InvalidPreviewUrlRequest("Field 'slug' is missing");
    }

    // Validate the timestamp.
    if (empty($body['timestamp'])) {
      throw new InvalidPreviewUrlRequest("Field 'timestamp' is missing");
    }

    $timestamp = (int) $body['timestamp'];
    if ($this->time->getRequestTime() > $timestamp + (int) $this->configuration['secret_expiration']) {
      throw new InvalidPreviewUrlRequest("The provided secret has expired.");
    }

    if (empty($body['scope'])) {
      throw new InvalidPreviewUrlRequest("Field 'scope' is missing");
    }

    // Validate the secret.
    if (empty($body['secret'])) {
      throw new InvalidPreviewUrlRequest("Field 'secret' is missing");
    }

    return [
      'scope' => $body['scope'],
    ];
  }

}
