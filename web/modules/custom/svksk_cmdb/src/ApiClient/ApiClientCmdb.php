<?php

namespace Drupal\svksk_cmdb\ApiClient;

use Drupal\Component\Uuid\UuidInterface;
use Drupal\Core\Logger\LoggerChannelFactoryInterface;
use Drupal\skit_services_env_parameter\SkitEnvUtils;
use Drupal\svksk_api_client\ApiClient\ApiClientBase;
use Drupal\svksk_api_client\Exception\ApiClientException;
use Drupal\svksk_api_client\Exception\ApiClientRequestException;
use Drupal\svksk_api_client\Exception\ApiClientResponseException;
use GuzzleHttp\Client;
use ReflectionException;
use Symfony\Component\DependencyInjection\Exception\EnvNotFoundException;

/**
 * CMDB Api Client class.
 */
class ApiClientCmdb extends ApiClientBase implements ApiClientCmdbInterface {

  /**
   * @var string Url suffix for the CMDB API.
   */
  const URL_SUFFIX = '/v1/cmdb';

  /**
   * @var string Environment variable name for overriding the base URL.
   */
  const API_URL_OVERRIDE_ENV = 'CMDB_API_URL';

  /**
   * @var \Psr\Log\LoggerInterface
   */
  protected $logger;

  /**
   * @param \GuzzleHttp\Client $http_client
   * @param \Drupal\Component\Uuid\UuidInterface $uuid
   * @param \Drupal\Core\Logger\LoggerChannelFactoryInterface $logger_channel_factory
   */
  public function __construct(Client $http_client, UuidInterface $uuid, LoggerChannelFactoryInterface $logger_channel_factory) {
    parent::__construct($http_client, $uuid);
    $this->logger = $logger_channel_factory->get('svksk_cmdb');

    $class_name = get_class($this);
    try {
      $constant_reflex = new \ReflectionClassConstant($class_name, 'API_URL_OVERRIDE_ENV');
      $this->baseUrlOverride = SkitEnvUtils::getEnv($constant_reflex->getValue());
    } catch (ReflectionException | EnvNotFoundException $exception) {
      // Ignore and leave baseUrlOverride as null.
    }
  }

  /**
   * {@inheritdoc}
   */
  public function get(string $endpoint, array $params = [], array $headers = []) : mixed {
    $uri = $this->buildUri($endpoint, $params);
    $headers = $this->buildHeaders($headers);
    try {
      return $this->requestJson('GET', $uri, [], $headers);
    } catch (ApiClientRequestException | ApiClientResponseException $exception) {
      $this->logError($exception->getMessage());
      throw $exception;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function post(string $endpoint, array $data = [], array $headers = []) : mixed {
    $uri = $this->buildUri($endpoint);
    $headers = $this->buildHeaders($headers);
    try {
      return $this->requestJson('POST', $uri, $data, $headers);
    } catch (ApiClientRequestException | ApiClientResponseException $exception) {
      $this->logError($exception->getMessage());
      throw $exception;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function put(string $endpoint, array $data = [], array $headers = []) : mixed {
    $uri = $this->buildUri($endpoint);
    $headers = $this->buildHeaders($headers);
    try {
      return $this->requestJson('PUT', $uri, $data, $headers);
    } catch (ApiClientRequestException | ApiClientResponseException $exception) {
      $this->logError($exception->getMessage());
      throw $exception;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function delete(string $endpoint, array $data = [], array $headers = []) : mixed {
    $uri = $this->buildUri($endpoint);
    $headers = $this->buildHeaders($headers);
    try {
      return $this->requestJson('DELETE', $uri, $data, $headers);
    } catch (ApiClientRequestException | ApiClientResponseException $exception) {
      $this->logError($exception->getMessage());
      throw $exception;
    }
  }

  /**
   * Build headers for request.
   *
   * @param array $headers
   *
   * @return array
   */
  protected function buildHeaders(array $headers = []) : array {
    $defaultHeaders = [
      'Accept-Language' => 'sk',
      'Accept' => 'application/json',
      'correlationId' => $this->uuidGenerator->generate(),
      'X-APP-ID' => 'b18de785-454b-4bbb-a773-cc602006f0f8', // TODO: Make this configurable
      'X-APP-VERSION' => '1.0.0',
      'X-APP-PLATFORM' => 'web',
      'X-CAMP-PP-AUTH-TYPE' => 'CAMP_PP_AUTH_EXT',
      'X-CAMP-APP-AUTH-TYPE' => 'CAMP_APP_AUTH_OAUTH',
      'X-CAMP-APP-AUTH' => 'Bearer 456789OIUZTFGHJK987654567ZGHJ',
    ];
    return array_merge($defaultHeaders, $headers);
  }

  /**
   * Log error.
   *
   * @param string $message
   *
   * @return void
   */
  protected function logError(string $message) : void {
    $this->logger->error($message);
  }

}
