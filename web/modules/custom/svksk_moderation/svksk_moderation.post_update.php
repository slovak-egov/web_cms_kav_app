<?php

/**
 * @file
 * Post update functions for svksk moderation module.
 */

/**
 * Implements hook_post_update_NAME().
 */
function svksk_moderation_post_update_change_moderation_states() {
  $database = \Drupal::database();

  $states = [
    'canceled' => 'deleted',
    'to_supplement' => 'amendment_needed',
    'verification' => 'in_review',
    'ended' => 'obsolete',
    'archived' => 'deleted',
  ];

  foreach (['data', 'revision'] as $type) {
    foreach ($states as $oldState => $newState) {
      $database->update('content_moderation_state_field_' . $type)
        ->fields(['moderation_state' => $newState])
        ->condition('moderation_state', $oldState)
        ->execute();
    }
  }
}
