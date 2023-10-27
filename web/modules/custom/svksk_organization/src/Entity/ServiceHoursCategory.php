<?php

namespace Drupal\svksk_organization\Entity;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityPublishedInterface;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\EntityPublishedTrait;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\StringTranslation\TranslatableMarkup;

/**
 * Defines the Service Hours Category entity.
 *
 * @ingroup svksk_organization
 *
 * @ContentEntityType(
 *   id = "service_hours_category",
 *   label = @Translation("Service Hours Category"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "service_hours_category",
 *   data_table = "service_hours_category_field_data",
 *   translatable = TRUE,
 *   content_translation_ui_skip = TRUE,
 *   admin_permission = "administer service hours category entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "langcode" = "langcode",
 *     "published" = "active",
 *   }
 * )
 */
class ServiceHoursCategory extends ContentEntityBase implements ContentEntityInterface {

  /**
   * Get service hours category entity.
   *
   * @return \Drupal\Core\Entity\EntityInterface|null
   */
  public function geOrganizationalUnit() {
    try {
      $storage = $this->entityTypeManager()->getStorage('organizational_unit');
      $entities = $storage->loadByProperties([
        'service_hours_categories' => $this->id()
      ]);
    } catch (\Exception $e) {
      return NULL;
    }
    return reset($entities) ?? NULL;
  }

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    $fields['service_hours_type_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Type'))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_service_hour_type')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 0,
      ]);

    $fields['name'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Name'))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 255,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 1,
      ]);

    $fields['description'] = BaseFieldDefinition::create('text_long')
      ->setLabel(new TranslatableMarkup('Description'))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'text_processing' => TRUE,
      ])
      ->setDisplayOptions('form', [
        'type' => 'text_textarea',
        'weight' => 2,
      ]);

    return $fields;
  }

}
