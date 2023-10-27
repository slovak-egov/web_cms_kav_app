<?php

namespace Drupal\svksk_content\Plugin\Field\FieldWidget;

use Drupal\Core\Field\FieldItemListInterface;
use Drupal\Core\Form\FormStateInterface;
use Drupal\tablefield\Plugin\Field\FieldWidget\TablefieldWidget;

/**
 * Plugin implementation of the 'tablefield' widget.
 *
 * @FieldWidget (
 *   id = "svksk_table",
 *   label = @Translation("SVKSK Table"),
 *   field_types = {
 *     "tablefield"
 *   },
 * )
 */
class TableWidget extends TablefieldWidget {

  /**
   * {@inheritdoc}
   */
  public function formElement(FieldItemListInterface $items, $delta, array $element, array &$form, FormStateInterface $form_state) {
    $element = parent::formElement($items, $delta, $element, $form, $form_state);

    $element['#type'] = 'svksk_table';
    $element['#import'] = FALSE;
    $element['caption']['#access'] = FALSE;

    return $element;
  }

  /**
   * {@inheritdoc}
   */
  public function validateTablefield(array &$element, FormStateInterface &$form_state, array $form) {
    parent::validateTablefield($element, $form_state, $form);
  }

}
