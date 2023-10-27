<?php

namespace Drupal\svksk_organization\Entity;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\Field\FieldStorageDefinitionInterface;
use Drupal\Core\StringTranslation\TranslatableMarkup;
use Drupal\svksk_organization\AllowedValues\DaysOfWeekAllowedValues;

/**
 * Defines the Service Hours entity.
 *
 * @ingroup svksk_organization
 *
 * @ContentEntityType(
 *   id = "service_hours",
 *   label = @Translation("Service Hours"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "list_builder" = "Drupal\svksk_organization\ServiceHoursEntityListBuilder",
 *     "translation" = "Drupal\content_translation\ContentTranslationHandler",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *     "route_provider" = {
 *       "html" = "Drupal\Core\Entity\Routing\DefaultHtmlRouteProvider",
 *     },
 *   },
 *   base_table = "service_hours",
 *   data_table = "service_hours_field_data",
 *   translatable = TRUE,
 *   content_translation_ui_skip = TRUE,
 *   admin_permission = "administer service hours entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "langcode" = "langcode",
 *   },
 *   links = {
 *     "add-form" = "/admin/kav/organizational-unit/{organizational_unit}/service-hours/add",
 *     "edit-form" = "/admin/kav/organizational-unit/{organizational_unit}/service-hours/{service_hours}",
 *     "delete-form" = "/admin/kav/organizational-unit/{organizational_unit}/service-hours/{service_hours}/delete",
 *   }
 * )
 */
class ServiceHours extends ContentEntityBase implements ContentEntityInterface {

  /**
   * Get service hours category entity.
   */
  public function getServiceHoursCategory() : EntityInterface {
    return $this->get('service_hours_category_id')->entity;
  }

  public function getDayOfWeekValue() : ?TranslatableMarkup {
    if ($this->get('service_hours_category_id')->isEmpty()) {
      return NULL;
    }
    $allowed_values = DaysOfWeekAllowedValues::getValues();
    $key = $this->get('day_of_week')->value;
    if (!array_key_exists($key, $allowed_values)) {
      return NULL;
    }
    return $allowed_values[$key];
  }

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    $fields['service_hours_category_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Category'))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'service_hours_category')
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

    $fields['day_of_week'] = BaseFieldDefinition::create('list_integer')
      ->setLabel(new TranslatableMarkup('Day of Week'))
      ->setRequired(TRUE)
      ->setSetting('allowed_values_function', '\Drupal\svksk_organization\AllowedValues\DaysOfWeekAllowedValues::getValues')
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 0,
      ]);

    $fields['name'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Name'))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 255,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 2,
      ]);

    $fields['description'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Description'))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 255,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string',
        'weight' => 3,
      ]);

    $fields['time_intervals'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Time intervals'))
      ->setRequired(TRUE)
      ->setCardinality(FieldStorageDefinitionInterface::CARDINALITY_UNLIMITED)
      ->setSetting('target_type', 'time_interval')
      ->setSetting('handler', 'default')
      ->setDisplayOptions('form', [
        'type' => 'inline_entity_form_complex',
        'weight' => 4,
        'settings' => [
          'allow_new' => TRUE,
          'allow_existing' => FALSE,
          'allow_duplicate' => FALSE,
        ],
      ]);

    return $fields;
  }

  function toUrl($rel = 'canonical', array $options = []) {
    if ($rel === 'canonical') {
      $rel = 'edit-form';
    }
    return parent::toUrl($rel, $options);
  }

  /**
   * {@inheritdoc}
   */
  protected function urlRouteParameters($rel) {
    $uri_route_parameters = parent::urlRouteParameters($rel);
    if ($category = $this->getServiceHoursCategory()) {
      $uri_route_parameters['organizational_unit'] = $category->geOrganizationalUnit()->id();
    }
    return $uri_route_parameters;
  }

}
