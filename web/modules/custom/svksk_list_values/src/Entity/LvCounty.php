<?php

namespace Drupal\svksk_list_values\Entity;

use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\StringTranslation\TranslatableMarkup;

/**
 * Defines County list values entity.
 *
 * @ingroup svksk_list_values
 *
 * @ContentEntityType(
 *   id = "lv_county",
 *   label = @Translation("LV County"),
 *   handlers = {
 *     "access" = "Drupal\svksk_list_values\ListValuesAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "lv_county",
 *   data_table = "lv_county_field_data",
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
class LvCounty extends LvBase {

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    $fields['region_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Region'))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_region')
      ->setSetting('handler', 'default');

    return $fields;
  }

}
