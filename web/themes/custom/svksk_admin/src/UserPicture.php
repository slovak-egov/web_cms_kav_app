<?php

namespace Drupal\svksk_admin;

use Drupal\gin\GinUserPicture;

/**
 * User picture build callback for the gin theme.
 */
class UserPicture extends GinUserPicture {

  /**
   * Lazy builder callback for the user picture.
   */
  public function build(): array {
    $build = parent::build();

    /** @var \Drupal\user\UserInterface $user */
    $user = $this->entityTypeManager->getStorage('user')
      ->load($this->currentUser->id());
    $file = $user->user_picture ? $user->user_picture->entity : NULL;

    if ($file === NULL) {
      if ($role = self::getRole($user)) {
        $build['link']['#title']['#markup'] .= ' (' . $role->label() . ')';
      }
    }

    return $build;
  }

  /**
   * Static method to get most recent user role
   */
  public static function getRole($user) {
    $roles = array_filter($user->getRoles(), function ($value) {
      return !in_array($value, ['anonymous', 'authenticated']);
    });

    if (!empty($roles)) {
      return \Drupal::entityTypeManager()
        ->getStorage('user_role')
        ->load(end($roles));
    }

    return FALSE;
  }

}
