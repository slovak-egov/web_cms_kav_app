<?php

namespace Drupal\svksk_list_values\Entity;

use Drupal\Core\Entity\EntityTypeInterface;

/**
 * Defines Service Hours Type list values entity.
 *
 * @ingroup svksk_list_values
 *
 * @ContentEntityType(
 *   id = "lv_service_hour_type",
 *   label = @Translation("LV Service Hour Type"),
 *   handlers = {
 *     "access" = "Drupal\svksk_list_values\ListValuesAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "lv_service_hour_type",
 *   data_table = "lv_service_hour_type_field_data",
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
class LvServiceHoursType extends LvBase {

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    unset($fields['short_name']);

    return $fields;
  }

}
