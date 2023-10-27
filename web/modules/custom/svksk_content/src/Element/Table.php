<?php

namespace Drupal\svksk_content\Element;

use Drupal\Core\Form\FormStateInterface;
use Drupal\tablefield\Element\Tablefield;

/**
 * Provides a form element for tabular data.
 *
 * @FormElement("svksk_table")
 */
class Table extends Tablefield {

  const REBUILD_MAX_COLS = 20;
  const REBUILD_MAX_ROWS = 300;

  /**
   * Processes a checkboxes form element.
   */
  public static function processTablefield(&$element, FormStateInterface $form_state, &$complete_form) {
    $element = parent::processTablefield($element, $form_state, $complete_form);

    $element['tablefield']['rebuild']['cols']['#required'] = TRUE;
    $element['tablefield']['rebuild']['cols']['#max'] = self::REBUILD_MAX_COLS;

    $element['tablefield']['rebuild']['rows']['#required'] = TRUE;
    $element['tablefield']['rebuild']['rows']['#max'] = self::REBUILD_MAX_ROWS;

    return $element;
  }

}
