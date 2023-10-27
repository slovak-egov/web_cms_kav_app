<?php

namespace Drupal\svksk_cmdb\ApiClient;


use Drupal\svksk_api_client\ApiClient\ApiClientInterface;

/**
 * CMDB Api Client class.
 */
interface ApiClientCmdbInterface extends ApiClientInterface {

  /**
   * Make GET request to CMDB API.
   *
   * @param string $endpoint
   * @param array $params
   * @param array $headers
   *
   * @return mixed
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   */
  public function get(string $endpoint, array $params = [], array $headers = []): mixed;

  /**
   * Make POST request to CMDB API.
   *
   * @param string $endpoint
   * @param array $data
   * @param array $headers
   *
   * @return mixed
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   */
  public function post(string $endpoint, array $data = [], array $headers = []) : mixed;

  /**
   * Make PUT request to CMDB API.
   *
   * @param string $endpoint
   * @param array $data
   * @param array $headers
   *
   * @return mixed
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   */
  public function put(string $endpoint, array $data = [], array $headers = []) : mixed;

  /**
   * Make DELETE request to CMDB API.
   *
   * @param string $endpoint
   * @param array $data
   * @param array $headers
   *
   * @return mixed
   * @throws \Drupal\svksk_api_client\Exception\ApiClientException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   */
  public function delete(string $endpoint, array $data = [], array $headers = []) : mixed;


}
