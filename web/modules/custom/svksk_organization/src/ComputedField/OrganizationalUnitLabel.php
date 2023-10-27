<?php

namespace Drupal\svksk_organization\ComputedField;

use Drupal\Core\Field\FieldItemList;
use Drupal\Core\TypedData\ComputedItemListTrait;

class OrganizationalUnitLabel extends FieldItemList {

  use ComputedItemListTrait;

  /**
   * Computes the field value.
   */
  protected function computeValue() {
    $entity = $this->getEntity();

    if ($entity->get('field_organizational_unit')->isEmpty()) {
      return;
    }

    $this->list[0] = $this->createItem(0, $entity->get('field_organizational_unit')->entity->label());
  }

}
