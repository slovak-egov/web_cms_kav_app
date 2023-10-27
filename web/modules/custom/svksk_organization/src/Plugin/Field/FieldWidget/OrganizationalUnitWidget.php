<?php

namespace Drupal\svksk_organization\Plugin\Field\FieldWidget;

use Drupal\Core\Field\FieldItemListInterface;
use Drupal\Core\Field\Plugin\Field\FieldWidget\OptionsSelectWidget;
use Drupal\Core\Form\FormStateInterface;

/**
 * Plugin implementation of the 'organizational_unit_widget' widget.
 *
 * @FieldWidget(
 *   id = "organizational_unit_widget",
 *   label = @Translation("Organizational Unit"),
 *   field_types = {
 *     "entity_reference"
 *   },
 *   multiple_values = TRUE
 * )
 */
class OrganizationalUnitWidget extends OptionsSelectWidget {

  /**
   * {@inheritdoc}
   */
  public function formElement(FieldItemListInterface $items, $delta, array $element, array &$form, FormStateInterface $form_state) {
    $element = parent::formElement($items, $delta, $element, $form, $form_state);
    $default = $element['#default_value'];
    /** @var \Drupal\Core\Session\AccountInterface $account */
    $account = \Drupal::currentUser();

    /** @var \Drupal\user\UserInterface $user */
    if (($user = \Drupal::entityTypeManager()
        ->getStorage('user')
        ->load($account->id())) && !$default) {
      if (!$user->get('field_organizational_unit')->isEmpty()) {
        $default = $user->get('field_organizational_unit')->target_id;
      }
    }

    $element['#default_value'] = $default;

    // Lock reference selection in case user doesn't have sufficient rights to change it
    if (!$account->hasPermission('change content organizational unit assignment')) {
      $element['#disabled'] = TRUE;
      $element['#value'] = $default;
    }

    return $element;
  }

}
