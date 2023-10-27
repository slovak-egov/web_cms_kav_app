<?php

namespace Drupal\svksk_list_values;

use Drupal\Core\Entity\EntityAccessControlHandler;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Session\AccountInterface;
use Drupal\Core\Access\AccessResult;

/**
 * Access controller for the Translated string entity.
 *
 * @see \Drupal\svksk_list_values\Entity\TranslationEntity.
 */
class ListValuesAccessControlHandler extends EntityAccessControlHandler {

  /**
   * {@inheritdoc}
   */
  protected function checkAccess(EntityInterface $entity, $operation, AccountInterface $account) {
    /** @var \Drupal\svksk_list_values\Entity\PhysicalAddress $entity */

    switch ($operation) {

      case 'view':
        return AccessResult::allowed();

      default:
        return AccessResult::allowedIfHasPermission($account, 'administer list values');
    }
  }

  /**
   * {@inheritdoc}
   */
  protected function checkCreateAccess(AccountInterface $account, array $context, $entity_bundle = NULL) {
    return AccessResult::allowedIfHasPermission($account, 'administer list values');
  }


}
