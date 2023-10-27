<?php

namespace Drupal\svksk_term\Entity;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityChangedInterface;
use Drupal\Core\Entity\EntityChangedTrait;
use Drupal\Core\Entity\EntityPublishedInterface;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\EntityPublishedTrait;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\StringTranslation\TranslatableMarkup;
use Symfony\Contracts\Translation\TranslatorTrait;

/**
 * Defines the Term entity.
 *
 * @ingroup svksk_term
 *
 * @ContentEntityType(
 *   id = "term",
 *   label = @Translation("Term"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "list_builder" = "Drupal\svksk_term\TermEntityListBuilder",
 *     "form" = {
 *       "default" = "Drupal\svksk_term\TermEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *       "edit" = "Drupal\svksk_term\TermEntityForm"
 *     },
 *     "route_provider" = {
 *       "html" = "Drupal\Core\Entity\Routing\DefaultHtmlRouteProvider",
 *     },
 *     "translation" = "Drupal\content_translation\ContentTranslationHandler",
 *   },
 *   translatable = TRUE,
 *   base_table = "term",
 *   data_table = "term_field_data",
 *   admin_permission = "administer term entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "uid" = "uid",
 *     "langcode" = "langcode",
 *     "published" = "published",
 *   },
 *   links = {
 *     "add-form" = "/admin/kav/term/add",
 *     "edit-form" = "/admin/kav/term/{term}",
 *     "delete-form" = "/admin/kav/term/{term}/delete",
 *     "collection" = "/admin/kav/term",
 *   }
 * )
 */
class Term extends ContentEntityBase implements ContentEntityInterface, EntityPublishedInterface, EntityChangedInterface {

  use EntityPublishedTrait;
  use EntityChangedTrait;

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);

    $fields['name'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Name'))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 2,
      ])
      ->addConstraint('UniqueField');

    $fields['description'] = BaseFieldDefinition::create('string_long')
      ->setLabel(new TranslatableMarkup('Description'))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string',
        'weight' => 3,
          'third_party_settings' => [
            'maxlength' => [
              'maxlength_js' => 500,
              'maxlength_js_label' => t('Term description is limited to @limit characters, remaining: <strong>@remaining</strong>'),
              'maxlength_js_enforce' => TRUE,
              'maxlength_js_truncate_html' => FALSE,
            ]
          ]
      ]);

    $fields['category'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Category'))
      ->setRequired(FALSE)
      ->setSetting('target_type', 'taxonomy_term')
      ->setSetting('handler_settings', [
        'target_bundles' => ['term_categories' => 'term_categories'],
      ])
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 5,
      ]);

    $fields['langcode'] = BaseFieldDefinition::create('language')
      ->setName('langcode')
      ->setDefaultValue('x-default')
      ->setStorageRequired(TRUE)
      ->setLabel(t('Language code'))
      ->setDescription(t('The language code.'))
      ->setTranslatable(TRUE);

    $fields['default_langcode'] = BaseFieldDefinition::create('boolean')
      ->setName('default_langcode')
      ->setLabel(t('Default Language code'))
      ->setDescription(t('Indicates if this is the default language.'))
      ->setDefaultValue(1)
      ->setTargetEntityTypeId('term')
      ->setTargetBundle(NULL)
      ->setStorageRequired(TRUE)
      ->setTranslatable(TRUE);

    $fields['created'] = BaseFieldDefinition::create('created')
      ->setLabel(t('Created'))
      ->setDescription(t('The time that the entity was created.'));

    $fields['changed'] = BaseFieldDefinition::create('changed')
      ->setLabel(t('Changed'))
      ->setDescription(t('The time that the entity was changed.'));

    $fields += static::publishedBaseFieldDefinitions($entity_type);

    if (isset($fields['published'])) {
      $fields['published']->setDisplayOptions('form', [
        'type' => 'boolean_checkbox',
        'weight' => 10,
      ]);
    }

    return $fields;
  }

  /**
   * {@inheritdoc}
   */
  function toUrl($rel = 'canonical', array $options = []) {
    if ($rel === 'canonical') {
      $rel = 'edit-form';
    }
    return parent::toUrl($rel, $options);
  }

}
