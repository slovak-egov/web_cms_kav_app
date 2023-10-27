<?php

namespace Drupal\svksk_ui_translations\Entity;

use Drupal\views\EntityViewsData;

/**
 * Provides Views data for Translated string entities.
 */
class TranslationEntityViewsData extends EntityViewsData {

  /**
   * {@inheritdoc}
   */
  public function getViewsData() {
    $data = parent::getViewsData();

    // Additional information for Views integration, such as table joins, can be
    // put here.
    return $data;
  }

}
