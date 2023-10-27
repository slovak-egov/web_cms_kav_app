<?php

namespace Drupal\svksk_list_values\Entity;

/**
 * Defines Municipality list values entity.
 *
 * @ingroup svksk_list_values
 *
 * @ContentEntityType(
 *   id = "lv_municipality",
 *   label = @Translation("LV Municipality"),
 *   handlers = {
 *     "access" = "Drupal\svksk_list_values\ListValuesAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "lv_municipality",
 *   data_table = "lv_municipality_field_data",
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
class LvMunicipality extends LvBase {

}
