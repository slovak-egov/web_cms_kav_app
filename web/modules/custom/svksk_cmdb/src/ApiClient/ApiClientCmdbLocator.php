<?php

namespace Drupal\svksk_cmdb\ApiClient;

use Drupal\Component\Uuid\UuidInterface;
use Drupal\Core\Logger\LoggerChannelFactoryInterface;
use Drupal\skit_services_env_parameter\SkitEnvUtils;
use Drupal\svksk_api_client\ApiClient\ApiClientBase;
use Drupal\svksk_api_client\Exception\ApiClientRequestException;
use Drupal\svksk_api_client\Exception\ApiClientResponseException;
use GuzzleHttp\Client;
use Symfony\Component\DependencyInjection\Exception\EnvNotFoundException;

/**
 * CMDB EgovService Locator Api Client class.
 */
class ApiClientCmdbLocator extends ApiClientCmdb implements ApiClientCmdbLocatorInterface {

  /**
   * @var string Url suffix for the eGov Service Locator API.
   */
  const URL_SUFFIX = '/v1/egov-service-locator';

  /**
   * @var string Environment variable name for overriding the base URL.
   */
  const API_URL_OVERRIDE_ENV = 'LOCATOR_API_URL';

}
