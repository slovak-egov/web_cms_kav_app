<?php

namespace Drupal\svksk_ui_translations\Entity;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityPublishedInterface;

/**
 * Provides an interface for defining Translated string entities.
 *
 * @ingroup svksk_ui_translations
 */
interface TranslationEntityInterface extends ContentEntityInterface, EntityPublishedInterface {

  /**
   * Add get/set methods for your configuration properties here.
   */
}
