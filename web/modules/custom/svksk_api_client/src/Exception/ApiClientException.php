<?php

namespace Drupal\svksk_api_client\Exception;

use Throwable;
use Psr\Http\Message\ResponseInterface;

/**
 * Class ApiClientException.
 *
 * @package Drupal\svksk_api_client\Exception
 */
class ApiClientException extends \Exception {

  /**
   * ApiClientException constructor.
   *
   * @param string $message
   */
  public function __construct(string $message) {
    parent::__construct($message);
  }

}
