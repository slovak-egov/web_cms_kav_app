<?php

namespace Drupal\svksk_ui_translations\Entity;

use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\EntityPublishedTrait;
use Drupal\Core\Entity\EntityTypeInterface;

/**
 * Defines the Translated string entity.
 *
 * @ingroup svksk_ui_translations
 *
 * @ContentEntityType(
 *   id = "svksk_ui_translation",
 *   label = @Translation("UI Translation"),
 *   handlers = {
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "list_builder" =
 *   "Drupal\svksk_ui_translations\TranslationEntityListBuilder",
 *     "views_data" =
 *   "Drupal\svksk_ui_translations\Entity\TranslationEntityViewsData",
 *     "translation" =
 *   "Drupal\svksk_ui_translations\TranslationEntityTranslationHandler",
 *     "form" = {
 *       "default" = "Drupal\svksk_ui_translations\Form\TranslationEntityForm",
 *       "add" = "Drupal\svksk_ui_translations\Form\TranslationEntityForm",
 *       "edit" = "Drupal\svksk_ui_translations\Form\TranslationEntityForm",
 *       "delete" =
 *   "Drupal\svksk_ui_translations\Form\TranslationEntityDeleteForm",
 *     },
 *     "route_provider" = {
 *       "html" =
 *   "Drupal\svksk_ui_translations\TranslationEntityHtmlRouteProvider",
 *     },
 *     "access" =
 *   "Drupal\svksk_ui_translations\TranslationEntityAccessControlHandler",
 *   },
 *   base_table = "svksk_ui_translation",
 *   data_table = "svksk_ui_translation_field_data",
 *   translatable = TRUE,
 *   admin_permission = "administer translated string entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "label" = "string",
 *     "uuid" = "uuid",
 *     "langcode" = "langcode",
 *     "published" = "status",
 *   },
 *   links = {
 *     "canonical" = "/admin/kav/ui-translation/{svksk_ui_translation}",
 *     "add-form" = "/admin/kav/ui-translation/add",
 *     "edit-form" =
 *   "/admin/kav/ui-translation/{svksk_ui_translation}/edit",
 *     "delete-form" =
 *   "/admin/kav/ui-translation/{svksk_ui_translation}/delete",
 *     "collection" = "/admin/kav/ui-translations",
 *   },
 *   field_ui_base_route = "svksk_ui_translation.settings"
 * )
 */
class TranslationEntity extends ContentEntityBase implements TranslationEntityInterface {

  use EntityPublishedTrait;

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    // Add the published field.
    $fields += static::publishedBaseFieldDefinitions($entity_type);

    $fields['machine_name'] = BaseFieldDefinition::create('string')
      ->setLabel(t('Key'))
      ->setRequired(TRUE)
      ->setSetting('max_length', 255)
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => -2,
      ])
      ->setDisplayConfigurable('form', TRUE);

    $fields['string'] = BaseFieldDefinition::create('string_long')
      ->setLabel(t('Translated string'))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setDisplayOptions('form', [
        'type' => 'string_textarea',
        'weight' => 0,
        'settings' => [
          'rows' => 1,
        ],
      ])
      ->setDisplayConfigurable('form', TRUE)
      ->setDisplayOptions('view', [
        'type' => 'string',
        'weight' => 0,
        'label' => 'hidden',
      ])
      ->setDisplayConfigurable('view', TRUE);

    $fields['string_plural'] = BaseFieldDefinition::create('string_long')
      ->setLabel(t('Translated string - Plural'))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setDisplayOptions('form', [
        'type' => 'string_textarea',
        'weight' => 0,
        'settings' => [
          'rows' => 1,
        ],
      ])
      ->setDisplayConfigurable('form', TRUE)
      ->setDisplayOptions('view', [
        'type' => 'string',
        'weight' => 0,
        'label' => 'hidden',
      ])
      ->setDisplayConfigurable('view', TRUE);

    $fields['status']->setDescription(t('A boolean indicating whether the Translated string is published.'))
      ->setDisplayOptions('form', [
        'type' => 'boolean_checkbox',
        'weight' => -3,
      ]);

    return $fields;
  }

  /**
   * {@inheritdoc}
   */
  public function getChangedTime() {
    return $this->get('content_translation_changed')->value;
  }

}
