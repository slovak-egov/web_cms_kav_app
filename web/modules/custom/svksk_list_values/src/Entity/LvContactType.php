<?php

namespace Drupal\svksk_list_values\Entity;

use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\StringTranslation\TranslatableMarkup;

/**
 * Defines Contact Type list values entity.
 *
 * @ingroup svksk_list_values
 *
 * @ContentEntityType(
 *   id = "lv_contact_type",
 *   label = @Translation("LV Contact Type"),
 *   handlers = {
 *     "access" = "Drupal\svksk_list_values\ListValuesAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "lv_contact_type",
 *   data_table = "lv_contact_type_field_data",
 *   translatable = TRUE,
 *   admin_permission = "administer list values",
 *   entity_keys = {
 *     "id" = "code",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "langcode" = "langcode",
 *   }
 * )
 */
class LvContactType extends LvBase {

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    unset($fields['short_name']);

    $fields['description'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Description'))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 255,
        'text_processing' => 0,
      ]);

    return $fields;
  }

}
