<?php

namespace Drupal\svksk_organization\Entity;

use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityChangedInterface;
use Drupal\Core\Entity\EntityChangedTrait;
use Drupal\Core\Field\BaseFieldDefinition;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\Field\FieldStorageDefinitionInterface;
use Drupal\Core\StringTranslation\TranslatableMarkup;
use Drupal\user\EntityOwnerInterface;
use Drupal\user\EntityOwnerTrait;

/**
 * Defines the Corporate Body entity.
 *
 * @ingroup svksk_organization
 *
 * @ContentEntityType(
 *   id = "corporate_body",
 *   label = @Translation("Corporate Body"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "list_builder" = "Drupal\svksk_organization\CorporateBodyEntityListBuilder",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *     "route_provider" = {
 *       "html" = "Drupal\Core\Entity\Routing\DefaultHtmlRouteProvider",
 *     },
 *   },
 *   translatable = FALSE,
 *   base_table = "corporate_body",
 *   revision_table = "corporate_body_revision",
 *   data_table = "corporate_body_field_data",
 *   revision_data_table = "corporate_body_field_revision",
 *   admin_permission = "administer corporate body entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "revision" = "revision_id",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "uid" = "uid",
 *     "owner" = "uid",
 *     "langcode" = "langcode",
 *   },
 *   links = {
 *     "add-form" = "/admin/kav/corporate-body/add",
 *     "edit-form" = "/admin/kav/corporate-body/{corporate_body}",
 *     "delete-form" = "/admin/kav/corporate-body/{corporate_body}/delete",
 *     "collection" = "/admin/kav/corporate-body",
 *   }
 * )
 */
class CorporateBody extends ContentEntityBase implements ContentEntityInterface, EntityChangedInterface, EntityOwnerInterface {

  use EntityChangedTrait;
  use EntityOwnerTrait;

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);
    $fields += static::ownerBaseFieldDefinitions($entity_type);

    $fields['alternate_name'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Alternate name', [], ['context' => 'corporate body']))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 255,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 1,
      ]);

    $fields['code'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Code', [], ['context' => 'corporate body']))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 2,
      ]);

    $fields['type_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Type', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'lv_corporate_body_type')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 3,
      ]);

    $fields['category_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Category', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'lv_nace')
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
        'weight' => 4,
      ]);

    $fields['fullname'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Full name', [], ['context' => 'corporate body']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 5,
      ]);

    $fields['name'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Name', [], ['context' => 'corporate body']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 6,
      ]);

    $fields['legal_form_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Legal form', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'lv_legal_form')
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
        'weight' => 7,
      ]);

    $fields['legal_status_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Legal status', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'lv_legal_status')
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

    $fields['size_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Size', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'lv_size_corporate')
      ->setSetting('handler', 'default')
      ->setDefaultValue(2)
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 9,
      ]);

    $fields['tin'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('TIN', [], ['context' => 'corporate body']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 10,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 10,
      ]);

    $fields['cin'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('CIN', [], ['context' => 'corporate body']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 12,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 11,
      ]);

    $fields['vat'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('VAT', [], ['context' => 'corporate body']))
      ->setRequired(TRUE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'max_length' => 12,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 12,
      ]);

    $fields['legal_predecessor_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Legal predecessor', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'corporate_body')
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
        'weight' => 13,
      ]);

    $fields['legal_successor_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Legal successor', [], ['context' => 'corporate body']))
      ->setSetting('target_type', 'corporate_body')
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
        'weight' => 14,
      ]);

    $fields['established'] = BaseFieldDefinition::create('datetime')
      ->setLabel(new TranslatableMarkup('Established'))
      ->setRequired(FALSE)
      ->setSetting('datetime_type', 'date')
      ->setDisplayOptions('form', [
        'type' => 'datetime_default',
        'weight' => 15,
      ]);

    $fields['terminated'] = BaseFieldDefinition::create('datetime')
      ->setLabel(new TranslatableMarkup('Terminated'))
      ->setRequired(FALSE)
      ->setSetting('datetime_type', 'date')
      ->setDisplayOptions('form', [
        'type' => 'datetime_default',
        'weight' => 16,
      ]);

    $fields['created'] = BaseFieldDefinition::create('created')
      ->setLabel(t('Created'))
      ->setDescription(t('The time that the entity was created.'));

    $fields['changed'] = BaseFieldDefinition::create('changed')
      ->setLabel(t('Changed'))
      ->setDescription(t('The time that the entity was changed.'));

    return $fields;
  }

  function toUrl($rel = 'canonical', array $options = []) {
    if ($rel === 'canonical') {
      $rel = 'edit-form';
    }
    return parent::toUrl($rel, $options);
  }

}
