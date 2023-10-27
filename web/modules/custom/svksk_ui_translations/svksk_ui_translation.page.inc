<?php

/**
 * @file
 * Contains svksk_ui_translation.page.inc.
 *
 * Page callback for Translated string entities.
 */

use Drupal\Core\Render\Element;

/**
 * Prepares variables for Translated string templates.
 *
 * Default template: svksk_ui_translation.html.twig.
 *
 * @param array $variables
 *   An associative array containing:
 *   - elements: An associative array containing the user information and any
 *   - attributes: HTML attributes for the containing element.
 */
function template_preprocess_svksk_ui_translation(array &$variables) {
  // Fetch TranslationEntity Entity Object.
  $svksk_ui_translation = $variables['elements']['#svksk_ui_translation'];

  // Helpful $content variable for templates.
  foreach (Element::children($variables['elements']) as $key) {
    $variables['content'][$key] = $variables['elements'][$key];
  }
}
