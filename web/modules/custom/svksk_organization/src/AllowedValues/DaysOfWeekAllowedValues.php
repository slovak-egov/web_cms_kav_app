<?php

namespace Drupal\svksk_organization\AllowedValues;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\StringTranslation\TranslatableMarkup;
use Drupal\field\Entity\FieldStorageConfig;
use Drupal\locale\TranslationString;

class DaysOfWeekAllowedValues {

  static function getValues() {
    return [
      0 => new TranslatableMarkup('Monday'),
      1 => new TranslatableMarkup('Tuesday'),
      2 => new TranslatableMarkup('Wednesday'),
      3 => new TranslatableMarkup('Thursday'),
      4 => new TranslatableMarkup('Friday'),
      5 => new TranslatableMarkup('Saturday'),
      6 => new TranslatableMarkup('Sunday'),
    ];
  }

}
