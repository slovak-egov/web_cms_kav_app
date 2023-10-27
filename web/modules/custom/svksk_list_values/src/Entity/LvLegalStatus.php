<?php

namespace Drupal\svksk_list_values\Entity;

use Drupal\Core\Entity\EntityTypeInterface;

/**
 * Defines Legal Status list values entity.
 *
 * @ingroup svksk_list_values
 *
 * @ContentEntityType(
 *   id = "lv_legal_status",
 *   label = @Translation("LV Legal Status"),
 *   handlers = {
 *     "access" = "Drupal\svksk_list_values\ListValuesAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "lv_legal_status",
 *   data_table = "lv_legal_status_field_data",
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
class LvLegalStatus extends LvBase {

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    unset($fields['short_name']);

    return $fields;
  }

}
