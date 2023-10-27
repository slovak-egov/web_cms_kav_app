<?php

namespace Drupal\svksk_api_client\ApiClient;

use Drupal\Component\Serialization\Json;
use Drupal\Component\Utility\Xss;
use Drupal\Component\Uuid\UuidInterface;
use Drupal\skit_services_env_parameter\SkitEnvUtils;
use Drupal\svksk_api_client\Exception\ApiClientException;
use GuzzleHttp\Client;
use GuzzleHttp\Exception\BadResponseException;
use GuzzleHttp\Exception\ConnectException;
use GuzzleHttp\Exception\GuzzleException;
use Drupal\svksk_api_client\Exception\ApiClientRequestException;
use Drupal\svksk_api_client\Exception\ApiClientResponseException;
use Psr\Http\Message\ResponseInterface;
use ReflectionException;
use Symfony\Component\DependencyInjection\Exception\EnvNotFoundException;

/**
 * Base Api Client class.
 */
class ApiClientBase implements ApiClientInterface {

  /**
   * @var \GuzzleHttp\Client
   */
  protected $httpClient;

  /**
   * @var \Drupal\Component\Uuid\UuidInterface
   */
  protected $uuidGenerator;

  /**
   * Allow to override the base url.
   * @var string
   */
  protected ?string $baseUrlOverride = NULL;

  /**
   * Api Client constructor
   *
   * @param \GuzzleHttp\Client $http_client
   * @param \Drupal\Component\Uuid\UuidInterface $uuid
   */
  public function __construct(Client $http_client, UuidInterface $uuid) {
    $this->httpClient = $http_client;
    $this->uuidGenerator = $uuid;
  }

  /**
   * {@inheritdoc}
   */
  public function request($request_method, $uri, array $json_data = [], array $headers = []) : ResponseInterface {
    try {
      $options = [
        'headers' => $headers,
      ];
      if (!empty($json_data)) {
        $options['json'] = $json_data;
      }

      return $this->httpClient->request($request_method, $uri, $options);
    }
    catch (BadResponseException | GuzzleException $exception) {
      $code = $exception->getCode();
      $params = !empty($options['json']) ? (json_encode($options['json'])) : "";
      $response = NULL;
      if ($exception instanceof ConnectException) {
        $code = 408;
        $content = $exception->getMessage();
      } else {
        $response = $exception->getResponse();
        $content = $response ? Xss::filter($response->getBody()->getContents()) : $exception->getMessage();
      }
      $message = "{$exception->getCode()} {$request_method} {$uri} {$params} {$content}";
      // We catch a bad response and throw our own Eapi exception.
      throw new ApiClientRequestException(
        $message,
        $code,
        $exception->getPrevious(),
        $response
      );
    }
  }

  /**
   * {@inheritdoc}
   */
  public function requestJson($request_method, $uri, array $json_data = [], array $headers = []) : mixed {
    $response = $this->request($request_method, $uri, $json_data, $headers);

    /** @var null|array $content_type */
    $content_type = $response->hasHeader('Content-Type') ? $response->getHeader('Content-Type') : NULL;
    if ($content_type && !str_starts_with(reset($content_type), 'application/json')) {
      throw new ApiClientResponseException(
        "Response data are not of requested type application/json, received {$content_type[0]} instead.",
        $response
      );
    }

    $content = $response->getBody()->getContents();
    return Json::decode($content);
  }

  /**
   * Build URI to call an endpoint.
   *
   * @param $endpoint
   * @param array $params
   *
   * @return string
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   */
  protected function buildUri($endpoint, array $params = []) : string {
    $apiBaseUrl = $this->baseUrlOverride;

    // If the base url is not overridden, try to get it from the base environment variable.
    if (empty($apiBaseUrl)) {
      try {
        $apiBaseUrl = SkitEnvUtils::getEnv('API_BASE_URL');
        if (empty($apiBaseUrl)) {
          throw new ApiClientException('Environment variable API_BASE_URL is empty.');
        }
      } catch (EnvNotFoundException $e) {
        throw new ApiClientException('Environment variable API_BASE_URL is not defined.');
      }
    }
    $baseUri = rtrim($apiBaseUrl, '/');

    // Get the URL suffix from the constant of current class.
    $class_name = get_class($this);
    try {
      $constant_reflex = new \ReflectionClassConstant($class_name, 'URL_SUFFIX');
      $baseUri .= '/' . ltrim($constant_reflex->getValue(), '/');
    } catch (ReflectionException $e) {
      throw new ApiClientException("Url suffix constant (URL_SUFFIX) for API client {$class_name} is not defined.");
    }

    $uri = rtrim($baseUri, '/') . '/' . ltrim($endpoint, '/');
    if (!empty($params)) {
      $uri .= '?' . http_build_query($params);
    }
    return $uri;
  }
}
