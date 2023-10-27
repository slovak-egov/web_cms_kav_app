<?php

namespace Drupal\svksk_base;

use Drupal\Core\Entity\EntityAccessControlHandler;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Session\AccountInterface;
use Drupal\Core\Access\AccessResult;

/**
 * Entity access manager for entites.
 */
class BaseEntityAccessControlHandler extends EntityAccessControlHandler {

  /**
   * {@inheritdoc}
   */
  protected function checkAccess(EntityInterface $entity, $operation, AccountInterface $account) {
    switch ($operation) {

      case 'view':
        if (!method_exists($entity, 'isPublished') || $entity->isPublished()) {
          return AccessResult::allowed();
        }

      default:
        return $this->hasAdminPermission($account);
    }
  }

  /**
   * {@inheritdoc}
   */
  protected function checkCreateAccess(AccountInterface $account, array $context, $entity_bundle = NULL) {
    return $this->hasAdminPermission($account);
  }

  /**
   * @param \Drupal\Core\Session\AccountInterface $account
   *
   * @return \Drupal\Core\Access\AccessResult|\Drupal\Core\Access\AccessResultNeutral|\Drupal\Core\Access\AccessResultReasonInterface
   */
  protected function hasAdminPermission(AccountInterface $account) {
    $permission = $this->entityType->getAdminPermission();
    return $permission ? AccessResult::allowedIfHasPermission($account, $permission) : AccessResult::neutral();
  }


}
