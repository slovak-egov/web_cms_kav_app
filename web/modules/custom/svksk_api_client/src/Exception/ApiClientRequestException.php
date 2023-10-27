<?php

namespace Drupal\svksk_api_client\Exception;

use Throwable;
use Psr\Http\Message\ResponseInterface;

/**
 * Class ApiClientRequestException.
 *
 * @package Drupal\svksk_api_client\Exception
 */
class ApiClientRequestException extends \Exception {

  private $response;

  /**
   * ApiClientException constructor.
   *
   * @param string $message
   * @param int $code
   * @param \Throwable|NULL $previous
   * @param \Psr\Http\Message\ResponseInterface|NULL $response
   */
  public function __construct(string $message, int $code = 0, Throwable $previous = NULL, ResponseInterface $response = NULL) {
    parent::__construct($message, $code);
    $this->response = $response;
  }

  /**
   * Get the response.
   */
  public function getResponse() {
    return $this->response;
  }

}
