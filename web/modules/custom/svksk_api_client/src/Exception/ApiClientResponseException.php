<?php

namespace Drupal\svksk_api_client\Exception;

use Throwable;
use Psr\Http\Message\ResponseInterface;

/**
 * Class ApiClientResponseException.
 *
 * @package Drupal\svksk_api_client\Exception
 */
class ApiClientResponseException extends \Exception {

  private $response;

  /**
   * ApiClientException constructor.
   *
   * @param string $message
   * @param \Psr\Http\Message\ResponseInterface|NULL $response
   */
  public function __construct(string $message, ResponseInterface $response = NULL) {
    parent::__construct($message);
    $this->response = $response;
  }

  /**
   * Get the response.
   */
  public function getResponse() {
    return $this->response;
  }

}
