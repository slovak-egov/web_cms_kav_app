<?php

namespace Drupal\svksk_ui_translations;

use Drupal\Core\Entity\EntityAccessControlHandler;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Session\AccountInterface;
use Drupal\Core\Access\AccessResult;

/**
 * Access controller for the Translated string entity.
 *
 * @see \Drupal\svksk_ui_translations\Entity\TranslationEntity.
 */
class TranslationEntityAccessControlHandler extends EntityAccessControlHandler {

  /**
   * {@inheritdoc}
   */
  protected function checkAccess(EntityInterface $entity, $operation, AccountInterface $account) {
    /** @var \Drupal\svksk_ui_translations\Entity\TranslationEntityInterface $entity */

    switch ($operation) {

      case 'view':

        if (!$entity->isPublished()) {
          return AccessResult::allowedIfHasPermission($account, 'view unpublished translated string entities');
        }


        return AccessResult::allowedIfHasPermission($account, 'view published translated string entities');

      case 'update':

        return AccessResult::allowedIfHasPermission($account, 'edit translated string entities');

      case 'delete':

        return AccessResult::allowedIfHasPermission($account, 'delete translated string entities');
    }

    // Unknown operation, no opinion.
    return AccessResult::neutral();
  }

  /**
   * {@inheritdoc}
   */
  protected function checkCreateAccess(AccountInterface $account, array $context, $entity_bundle = NULL) {
    return AccessResult::allowedIfHasPermission($account, 'add translated string entities');
  }


}
