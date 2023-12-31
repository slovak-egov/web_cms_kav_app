<?php

namespace Drupal\skit_time_field\Plugin\Field\FieldWidget;

use Drupal\Core\Field\FieldItemListInterface;
use Drupal\Core\Field\WidgetBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\skit_time_field\Time;

/**
 * Plugin implementation of the 'time_widget' widget.
 *
 * @FieldWidget(
 *   id = "time_widget",
 *   label = @Translation("Time widget"),
 *   field_types = {
 *     "time"
 *   }
 * )
 */
class TimeWidget extends WidgetBase {

  /**
   * {@inheritdoc}
   */
  public static function defaultSettings() {
    return [
      'step' => 5,
    ] + parent::defaultSettings();
  }

  /**
   * {@inheritdoc}
   */
  public function settingsForm(array $form, FormStateInterface $form_state) {
    return [
      'step' => [
        '#type' => 'textfield',
        '#title' => $this->t('Step to change seconds'),
        '#open' => TRUE,
        '#default_value' => $this->getSetting('step'),
        '#access' => $this->fieldDefinition->getSetting('seconds'),
      ],
    ] + parent::settingsForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   *
   * @see \Drupal\skit_time_field\Element\TimeElement::preRenderTime()
   */
  public function formElement(FieldItemListInterface $items, $delta, array $element, array &$form, FormStateInterface $form_state) {
    // Determine if we're showing seconds in the widget.
    $show_seconds = (bool) $this->fieldDefinition->getSetting('seconds');
    $additional = [
      '#type' => 'time',
      '#default_value' => isset($items[$delta]->value) ? Time::createFromHtml5Format(
        $items[$delta]->value
      )->formatForWidget($show_seconds) : NULL,
    ];
    // Add the step attribute if we're showing seconds in the widget.
    if ($show_seconds) {
      $additional['#attributes']['step'] = $this->getSetting('step');
    }
    // Set a property to determine the format in TimeElement::preRenderTime().
    $additional['#show_seconds'] = $show_seconds;
    $element['value'] = $element + $additional;
    return $element;
  }

}
