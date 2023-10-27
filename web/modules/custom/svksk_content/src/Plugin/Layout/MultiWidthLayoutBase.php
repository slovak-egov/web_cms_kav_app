<?php

namespace Drupal\svksk_content\Plugin\Layout;

use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Plugin\PluginFormInterface;
use Drupal\layout_options\Plugin\Layout\LayoutOptions;

/**
 * Base class of layouts with configurable widths.
 *
 * @internal
 *   Plugin classes are internal.
 */
abstract class MultiWidthLayoutBase extends LayoutOptions implements PluginFormInterface {

  /**
   * {@inheritdoc}
   */
  public function defaultConfiguration() {
    $configuration = parent::defaultConfiguration();

    if (method_exists($this, 'getDefaultWidth')) {
      $configuration['column_widths'] = $this->getDefaultWidth();
    }

    return $configuration;
  }

  /**
   * {@inheritdoc}
   */
  public function buildConfigurationForm(array $form, FormStateInterface $form_state) {
    $form = parent::buildConfigurationForm($form, $form_state);
    $options_width = $this->getWidthOptions();

    if (!empty($options_width)) {
      $form['column_widths'] = [
        '#type' => 'select',
        '#title' => $this->t('Column widths'),
        '#default_value' => $this->configuration['column_widths'],
        '#options' => $options_width,
        '#validated' => TRUE,
        '#weight' => -99,
      ];
    }

    if (isset($form['label'])) {
      unset($form['label']);
    }

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitConfigurationForm(array &$form, FormStateInterface $form_state) {
    parent::submitConfigurationForm($form, $form_state);

    if (isset($form['column_widths'])) {
      $this->configuration['column_widths'] = $form_state->getValue('column_widths');
    }
  }

  /**
   * {@inheritdoc}
   */
  public function build(array $regions) {
    $build = parent::build($regions);

    $build['#attributes']['class'][] = $this->getPluginDefinition()
      ->getTemplate();

    if (isset($this->configuration['column_widths'])) {
      $build['#attributes']['class'][] = $this->getPluginDefinition()
          ->getTemplate() . '--' . $this->configuration['column_widths'];
    }

    return $build;
  }

  /**
   * Gets the width options for the configuration form.
   *
   * The first option will be used as the default 'column_widths' configuration
   * value.
   *
   * @return string[]
   *   The width options array where the keys are strings that will be added to
   *   the CSS classes and the values are the human-readable labels.
   */
  abstract protected function getWidthOptions();

}
