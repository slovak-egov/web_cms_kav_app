<?php

namespace Drupal\svksk_cmdb\Cmdb;

use Drupal\Core\Entity\EntityInterface;
use Drupal\svksk_cmdb\Exception\CmdbMissingMappingException;

/**
 * Class CIClassification contains static map of UUIDs in Cmdb LV_CI_CLASSIFICATION
 */
class CIClassification {

  const ARTICLE = 'e2261ccd-4a87-2b4a-a925-beb0cd77c5fa';

  const NEWS = '58f4b0ae-4d86-5b49-ad45-cf5ca4140601';

  const PAGE = '7046d477-0782-db45-b9d7-5787cdbd3931';

  const FAQ = '75929a09-bc63-b445-8150-62f912b85c88';

  const EVENT = 'da6daf6e-f80f-254a-bd11-2c61f75cc204';

  const NOTICE = '25150f7d-0368-ac47-9190-58b10069189d';

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return string|null
   */
  static function getIdByEntity(EntityInterface $entity) : ?string {
    if ($entity->getEntityTypeId() === 'node') {
      switch ($entity->bundle()) {
        case 'article':
          return self::ARTICLE;
        case 'news':
          return self::NEWS;
        case 'notice':
          return self::NOTICE;
        case 'faq':
          return self::FAQ;
        case 'event':
          return self::EVENT;
        case 'page':
          return self::PAGE;
      }
    }
    // Classification is not required so in case there is no mapping we return NULL
    return NULL;
  }

}
