<?php

namespace Drupal\svksk_api_client\ApiClient;

use Psr\Http\Message\ResponseInterface;

/**
 * Api Client interface.
 */
interface ApiClientInterface {

  /**
   * Make a request to the API.
   *
   * @param $request_method
   * @param $uri
   * @param array $json_data
   * @param array $headers
   *
   * @return \Psr\Http\Message\ResponseInterface
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   */
  public function request($request_method, $uri, array $json_data = [], array $headers = []) : ResponseInterface;

  /**
   * Make a request to the API and return parsed JSON response.
   *
   * @param $request_method
   * @param $uri
   * @param array $json_data
   * @param array $headers
   *
   * @return mixed
   * @throws \Drupal\svksk_api_client\Exception\ApiClientRequestException
   * @throws \Drupal\svksk_api_client\Exception\ApiClientResponseException
   */
  public function requestJson($request_method, $uri, array $json_data = [], array $headers = []) : mixed;

}
