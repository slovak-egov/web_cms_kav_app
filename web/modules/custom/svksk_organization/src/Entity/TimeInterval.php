<?php

namespace Drupal\svksk_organization\Entity;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityPublishedInterface;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\EntityPublishedTrait;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\StringTranslation\TranslatableMarkup;

/**
 * Defines the Time Interval entity.
 *
 * @ingroup svksk_organization
 *
 * @ContentEntityType(
 *   id = "time_interval",
 *   label = @Translation("Time Interval"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *     "route_provider" = {
 *       "html" = "Drupal\Core\Entity\Routing\DefaultHtmlRouteProvider",
 *     },
 *   },
 *   base_table = "time_interval",
 *   data_table = "time_interval_field_data",
 *   translatable = TRUE,
 *   content_translation_ui_skip = TRUE,
 *   admin_permission = "administer time interval entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "langcode" = "langcode",
 *   }
 * )
 */
class TimeInterval extends ContentEntityBase implements ContentEntityInterface {

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    $fields['time_from'] = BaseFieldDefinition::create('time')
      ->setLabel(new TranslatableMarkup('Time from'))
      ->setRequired(TRUE)
      ->setTranslatable(FALSE)
      ->setSettings([
        'seconds' => FALSE,
      ])
      ->setDisplayOptions('form', [
        'type' => 'time_widget',
        'weight' => 0,
      ])
      ->setDisplayOptions('view', [
        'type' => 'time_widget',
        'label' => 'hidden',
        'settings' => [
          'time_format' => 'H:i',
        ],
      ]);

    $fields['time_to'] = BaseFieldDefinition::create('time')
      ->setLabel(new TranslatableMarkup('Time to'))
      ->setRequired(TRUE)
      ->setTranslatable(FALSE)
      ->setDisplayOptions('form', [
        'type' => 'time_widget',
        'weight' => 1,
      ])
      ->setDisplayOptions('view', [
        'type' => 'time_widget',
        'label' => 'hidden',
        'settings' => [
          'time_format' => 'H:i',
        ],
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

    $fields['interval_type'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Type'))
      ->setRequired(TRUE)
      ->setSetting('target_type', 'lv_interval_type')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 4,
      ]);

    return $fields;
  }

}
