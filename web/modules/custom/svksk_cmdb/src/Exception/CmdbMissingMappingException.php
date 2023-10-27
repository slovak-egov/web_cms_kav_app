<?php

namespace Drupal\svksk_cmdb\Exception;

use Throwable;
use Psr\Http\Message\ResponseInterface;

/**
 * Class CmdbMissingMappingException.
 *
 * @package Drupal\svksk_cmdb\Exception
 */
class CmdbMissingMappingException extends \Exception {

  /**
   * ApiClientException constructor.
   *
   * @param string $message
   */
  public function __construct(string $message) {
    parent::__construct($message);
  }

}
