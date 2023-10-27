<?php

namespace Drupal\svksk_cmdb\Cmdb;

use Drupal\Core\Entity\EntityInterface;
use Drupal\svksk_cmdb\Exception\CmdbMissingMappingException;

/**
 * Class CICategory contains static map of UUIDs in Cmdb LV_CI_CATEGORY
 */
class CICategory {

  const CONTENT = 'cf680c0e-af49-1041-aabe-e08e4227018d';

  const LIFE_EVENT = 'd2682537-32e4-6f43-acdb-56067dbac4e7';

  const LIFE_EVENT_STEP = 'e6d8e55a-2ab5-404c-93bc-aca01b2c5184';

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return string
   * @throws \Drupal\svksk_cmdb\Exception\CmdbMissingMappingException\
   */
  static function getIdByEntity(EntityInterface $entity) : string {
    if ($entity->getEntityTypeId() === 'node' && $entity->bundle() === 'life_event') {
      return self::LIFE_EVENT;
    } else if ($entity->getEntityTypeId() === 'node') {
      return self::CONTENT;
    } else if ($entity->getEntityTypeId() === 'paragraph_item' && $entity->bundle() === 'life_event_step') {
      return self::LIFE_EVENT_STEP;
    }
    throw new CmdbMissingMappingException(sprintf('Missing CICategory mapping for given entity (%s:%s)', $entity->getEntityTypeId(), $entity->id()));
  }

}
