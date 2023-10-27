<?php

namespace Drupal\svksk_base\ComputedField;

use Drupal\Core\Field\FieldItemList;
use Drupal\Core\TypedData\ComputedItemListTrait;
use Drupal\file\FileInterface;

/**
 * Field with icon file content.
 */
class IconFileContent extends FieldItemList {

  use ComputedItemListTrait;

  /**
   * Computes the field value.
   */
  protected function computeValue() {
    if ($this->getEntity()->isNew()) {
      return;
    }

    /** @var FileInterface $file */
    $file = $this->getEntity()->field_svg_file->entity;

    if ($file) {
      $this->list[0] = $this->createItem(0, file_get_contents($file->getFileUri()));
    }
  }

}
