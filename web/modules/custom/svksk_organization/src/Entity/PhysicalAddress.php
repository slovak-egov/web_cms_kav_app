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
 * Defines the Physical Address entity.
 *
 * @ingroup svksk_organization
 *
 * @ContentEntityType(
 *   id = "physical_address",
 *   label = @Translation("Organization Physical Address"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *   },
 *   base_table = "physical_address",
 *   data_table = "physical_address_field_data",
 *   translatable = TRUE,
 *   admin_permission = "administer physical address entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "uuid" = "uuid",
 *     "langcode" = "langcode",
 *     "published" = "active",
 *   }
 * )
 */
class PhysicalAddress extends ContentEntityBase implements ContentEntityInterface, EntityPublishedInterface {

  use EntityPublishedTrait;

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    $fields['address_type_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Address Type', [], ['context' => 'physical address']))
      ->setSetting('target_type', 'lv_address_type')
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

    $fields['street_name'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Street name', [], ['context' => 'physical address']))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 1,
      ]);

    $fields['building_number'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Building number', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 2,
      ]);

    $fields['registration_number'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Registration number', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 2,
      ]);

    $fields['municipality_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Municipality', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_municipality')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'select2_entity_reference',
        'settings' => [
          'autocomplete' => FALSE
        ],
        'weight' => 3,
      ]);

    $fields['zip_code'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('ZIP Code', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setTranslatable(FALSE)
      ->setSettings([
        'max_length' => 20,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 4,
      ])
      ->setDisplayOptions('view', [
        'label' => 'above',
        'type' => 'string',
        'weight' => 4,
      ]);

    $fields['country'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Country', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_country')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'select2_entity_reference',
        'settings' => [
          'autocomplete' => FALSE
        ],
        'weight' => 5,
      ]);

    $fields['primary'] = BaseFieldDefinition::create('boolean')
      ->setLabel(new TranslatableMarkup('Primary address', [], ['context' => 'physical address']))
      ->setDefaultValue(TRUE)
      ->setDisplayOptions('form', [
        'type' => 'boolean_checkbox',
        'weight' => 6,
      ]);

    $fields['active'] = BaseFieldDefinition::create('boolean')
      ->setLabel(new TranslatableMarkup('Active', [], ['context' => 'physical address']))
      ->setDefaultValue(TRUE)
      ->setDisplayOptions('form', [
        'type' => 'boolean_checkbox',
        'weight' => 7,
      ]);

    $fields['region_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Region', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_region')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'select2_entity_reference',
        'settings' => [
          'autocomplete' => FALSE
        ],
        'weight' => 8,
      ]);

    $fields['district_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('District', [], ['context' => 'physical address']))
      ->setRequired(FALSE)
      ->setSetting('target_type', 'lv_district')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'select2_entity_reference',
        'settings' => [
          'autocomplete' => FALSE
        ],
        'weight' => 9,
      ]);

    $fields['county_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('County', [], ['context' => 'physical address']))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_county')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'select2_entity_reference',
        'settings' => [
          'autocomplete' => FALSE
        ],
        'weight' => 10,
      ]);

    $fields['floor'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Floor', [], ['context' => 'physical address']))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 50,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 11,
      ]);

    $fields['workplace_number'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Workplace number', [], ['context' => 'physical address']))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 50,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 12,
      ]);

    $fields['gps_coordinates'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('GPS Coordinates', [], ['context' => 'physical address']))
      ->setRequired(FALSE)
      ->setTranslatable(FALSE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 13,
      ]);

    $fields['formatted_address'] = BaseFieldDefinition::create('string_long')
      ->setLabel(new TranslatableMarkup('Formatted Address', [], ['context' => 'physical address']))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setDisplayOptions('form', [
        'region' => 'hidden',
      ]);

    return $fields;
  }

  /**
   * {@inheritdoc}
   */
  public function label() {
    if (!$this->get('formatted_address')->isEmpty()) {
      $lines = explode("\n", $this->get('formatted_address')->value);
      return implode(", ", $lines);
    }
    return NULL;
  }

}
