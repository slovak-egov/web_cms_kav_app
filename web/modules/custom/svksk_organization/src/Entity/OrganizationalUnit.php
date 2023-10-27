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
 * Defines the Organization Unit entity.
 *
 * @ingroup svksk_organization
 *
 * @ContentEntityType(
 *   id = "organizational_unit",
 *   label = @Translation("Organizational Unit"),
 *   handlers = {
 *     "access" = "Drupal\svksk_base\BaseEntityAccessControlHandler",
 *     "views_data" = "Drupal\views\EntityViewsData",
 *     "view_builder" = "Drupal\Core\Entity\EntityViewBuilder",
 *     "list_builder" = "Drupal\svksk_organization\OrganizationalUnitEntityListBuilder",
 *     "translation" = "Drupal\content_translation\ContentTranslationHandler",
 *     "form" = {
 *       "default" = "Drupal\Core\Entity\ContentEntityForm",
 *       "delete" = "Drupal\Core\Entity\ContentEntityDeleteForm",
 *     },
 *     "route_provider" = {
 *       "html" = "Drupal\Core\Entity\Routing\DefaultHtmlRouteProvider",
 *     },
 *   },
 *   translatable = TRUE,
 *   base_table = "organizational_unit",
 *   revision_table = "organizational_unit_revision",
 *   data_table = "organizational_unit_field_data",
 *   revision_data_table = "organizational_unit_field_revision",
 *   admin_permission = "administer organizational unit entities",
 *   entity_keys = {
 *     "id" = "id",
 *     "revision" = "revision_id",
 *     "uuid" = "uuid",
 *     "label" = "name",
 *     "uid" = "uid",
 *     "owner" = "uid",
 *     "langcode" = "langcode",
 *     "revision_translation_affected" = "revision_translation_affected"
 *   },
 *   links = {
 *     "canonical" = "/admin/kav/organizational-unit/{organizational_unit}/view",
 *     "add-form" = "/admin/kav/organizational-unit/add",
 *     "edit-form" = "/admin/kav/organizational-unit/{organizational_unit}",
 *     "delete-form" = "/admin/kav/organizational-unit/{organizational_unit}/delete",
 *     "collection" = "/admin/kav/organizational-unit",
 *   }
 * )
 */
class OrganizationalUnit extends ContentEntityBase implements ContentEntityInterface, EntityChangedInterface, EntityOwnerInterface {

  use EntityChangedTrait;
  use EntityOwnerTrait;

  /**
   * Return IDs of Organization Unit service hours categories.
   *
   * @return array
   */
  public function getServiceHoursCategoriesIds() {
    return array_map(function($item) {
      return $item['target_id'];
    }, $this->get('service_hours_categories')->getValue());
  }

  /**
   * {@inheritdoc}
   */
  public static function baseFieldDefinitions(EntityTypeInterface $entity_type) {
    $fields = parent::baseFieldDefinitions($entity_type);
    $fields += static::ownerBaseFieldDefinitions($entity_type);

    $fields['code'] = BaseFieldDefinition::create('string')
      ->setLabel(new TranslatableMarkup('Code'))
      ->setRequired(FALSE)
      ->setTranslatable(FALSE)
      ->setSettings([
        'max_length' => 250,
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string_textfield',
        'weight' => 1,
      ]);

    $fields['type_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Type'))
      ->setTranslatable(FALSE)
      ->setSetting('target_type', 'lv_organizational_unit_type')
      ->setSetting('handler', 'default')
      ->setSetting('handler_settings', [
        'sort' => [
          'field' => 'name',
        ],
      ])
      ->setDisplayOptions('form', [
        'type' => 'options_select',
        'weight' => 2,
      ]);

    $fields['master_unit_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Master unit', [], ['context' => 'organizational unit']))
      ->setTranslatable(FALSE)
      ->addConstraint('ExcludeSelfReference', [])
      ->setSetting('target_type', 'organizational_unit')
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

    $fields['parent_unit_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Parent unit', [], ['context' => 'organizational unit']))
      ->setTranslatable(FALSE)
      ->addConstraint('ExcludeSelfReference', [])
      ->setSetting('target_type', 'organizational_unit')
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

    $fields['corporate_body_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Corporate body', [], ['context' => 'organizational unit']))
      ->setTranslatable(FALSE)
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
        'weight' => 5,
      ]);

    $fields['cost_center_id'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Cost center', [], ['context' => 'organizational unit']))
      ->setTranslatable(FALSE)
      ->setSetting('target_type', 'cost_center')
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
        'weight' => 6,
      ]);

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
        'weight' => 7,
      ]);

    $fields['description'] = BaseFieldDefinition::create('string_long')
      ->setLabel(new TranslatableMarkup('Description'))
      ->setRequired(FALSE)
      ->setTranslatable(TRUE)
      ->setSettings([
        'text_processing' => 0,
      ])
      ->setDisplayOptions('form', [
        'type' => 'string',
        'weight' => 8,
      ]);

    $fields['physical_address'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Physical address'))
      ->setRequired(TRUE)
      ->setCardinality(FieldStorageDefinitionInterface::CARDINALITY_UNLIMITED)
      ->setSetting('target_type', 'physical_address')
      ->setSetting('handler', 'default')
      ->setDisplayOptions('form', [
        'type' => 'inline_entity_form_complex',
        'weight' => 9,
        'settings' => [
          'allow_new' => TRUE,
          'allow_existing' => FALSE,
          'allow_duplicate' => FALSE,
        ],
      ]);

    $fields['contact'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Contact'))
      ->setRequired(TRUE)
      ->setTranslatable(FALSE)
      ->setCardinality(FieldStorageDefinitionInterface::CARDINALITY_UNLIMITED)
      ->setSetting('target_type', 'contact')
      ->setSetting('handler', 'default')
      ->setDisplayOptions('form', [
        'type' => 'inline_entity_form_complex',
        'weight' => 10,
        'settings' => [
          'allow_new' => TRUE,
          'allow_existing' => FALSE,
          'allow_duplicate' => FALSE,
        ],
      ]);

    $fields['service_hours_categories'] = BaseFieldDefinition::create('entity_reference')
      ->setLabel(new TranslatableMarkup('Service hours categories'))
      ->setRequired(TRUE)
      ->setTranslatable(FALSE)
      ->setCardinality(FieldStorageDefinitionInterface::CARDINALITY_UNLIMITED)
      ->setSetting('target_type', 'service_hours_category')
      ->setSetting('handler', 'default')
      ->setDisplayOptions('form', [
        'type' => 'inline_entity_form_complex',
        'weight' => 11,
        'settings' => [
          'allow_new' => TRUE,
          'allow_existing' => FALSE,
          'allow_duplicate' => FALSE,
        ],
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
