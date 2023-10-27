<?php

namespace Drupal\svksk_cmdb\Cmdb;

use Drupal\Core\Entity\EntityInterface;
use Drupal\svksk_cmdb\Exception\CmdbMissingMappingException;

/**
 * Class CIState contains static map of UUIDs in Cmdb LV_OBJECT_STATE
 */
class CIState {

  const NEW = '4b0c9b9f-7678-3f41-b9ac-adf0963d85e5';

  const ACTIVE = '628bc788-8e12-7f4f-9122-0b95faad5678';

  const OBSOLETE = '2f6e96ae-6c2d-254b-8555-5fad69ba05b9';

  const HIDDEN = '50d43384-3876-b341-bfc9-5cfe1a5db45b';


  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return string
   * @throws \Drupal\svksk_cmdb\Exception\CmdbMissingMappingException
   */
  static function getIdByEntity(EntityInterface $entity) : string {
    $moderationState = !$entity->get('moderation_state')
      ->isEmpty() ? $entity->get('moderation_state')->value : NULL;
    switch ($moderationState) {
      case 'new':
      case 'amendment_needed':
      case 'approved':
      case 'in_review':
      case 'sent_for_assesment':
        return self::NEW;
      case 'published':
        return self::ACTIVE;
      case 'obsolete':
        return self::OBSOLETE;
      case 'deleted':
        return self::HIDDEN;
    }

    throw new CmdbMissingMappingException(sprintf('Missing CICategory mapping for given entity (%s:%s)', $entity->getEntityTypeId(), $entity->id()));
  }

}
