<?php

namespace Drupal\svksk_http_client;

use Drupal\Core\Http\ClientFactory;
use GuzzleHttp\ClientInterface;
use GuzzleHttp\RequestOptions;

/**
 * Helper class to construct an HTTP client.
 */
class HttpClientFactory extends ClientFactory {

  /**
   * Constructs a new client object from configuration.
   *
   * @return \GuzzleHttp\Client
   *   The HTTP client.
   */
  public function fromOptions($options = []): ClientInterface {
    $verify = $options['verify'] ?? TRUE;

    // If the verify option is set to a string, assume it's a path to a
    // certificate authority file.
    if ($verify && !empty($options['ca'])) {
      $verify = $options['ca'];
    }

    $config = [
      RequestOptions::VERIFY => $verify,
    ];

    // Add proxy settings.
    if (array_key_exists('proxy_http', $options)) {
      $config[RequestOptions::PROXY]['http'] = $options['proxy_http'];
    }
    if (array_key_exists('proxy_https', $options)) {
      $config[RequestOptions::PROXY]['https'] = $options['proxy_https'];
    }
    if (array_key_exists('proxy_no', $options)) {
      $config[RequestOptions::PROXY]['no'] = explode(',', $options['proxy_no']);
    }

    return parent::fromOptions($config);
  }

}
