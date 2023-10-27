<?php

/**
 * @file
 * Provide views data.
 */

/**
 * Implements hook_views_data_alter().
 */
function svksk_term_views_data_alter(&$data) {
  $data['term_field_data']['term_category_tid'] = array(
    'help' => t('Term reference.'),
    'real field' => 'category',
    'argument' => array(
      'title' => t('Category'),
      'id' => 'taxonomy_index_tid',
    ),
    'filter' => array(
      'title' => t('Category'),
      'id' => 'svksk_taxonomy_index_tid',
      'allow empty' => TRUE
    ),
  );
}
