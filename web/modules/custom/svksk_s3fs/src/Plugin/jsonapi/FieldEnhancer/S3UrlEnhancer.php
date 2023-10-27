<?php

namespace Drupal\svksk_s3fs\Plugin\jsonapi\FieldEnhancer;

use Drupal\Core\Datetime\DrupalDateTime;
use Drupal\jsonapi_extras\Plugin\DateTimeEnhancerBase;
use Drupal\jsonapi_extras\Plugin\ResourceFieldEnhancerBase;
use Shaper\Util\Context;

/**
 * Perform additional manipulations to timestamp fields.
 *
 * @ResourceFieldEnhancer(
 *   id = "s3_url",
 *   label = @Translation("File S3 Url (directly from S3)"),
 *   description = @Translation("Format source Uri to point directly to S3 file."),
 *   dependencies = {"file"}
 * )
 */
class S3UrlEnhancer extends ResourceFieldEnhancerBase {

  /**
   * {@inheritdoc}
   */
  public function getOutputJsonSchema() {
    return [
      'type' => 'string',
    ];
  }

  /**
   * {@inheritdoc}
   */
  protected function doUndoTransform($data, Context $context) {
    return 'undo';
  }

  /**
   * {@inheritdoc}
   */
  protected function doTransform($data, Context $context) {
    return 'do';
  }

}
