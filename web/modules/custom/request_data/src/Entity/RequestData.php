<?php

namespace Drupal\request_data\Entity;
use Drupal\Core\Entity\ContentEntityBase;
use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\Field\BaseFieldDefinition;

/**
 *
 * @ingroup request_data
 *
 * @ContentEntityType(
 *  id = "request_data",
 *  label = @Translation("Request data"),
 *  base_table = "request_data",
 *  entity_keys = {
 *      "id" = "id",
 *      "uuid" = "uuid",
 *      "name" = "name",
 *      "surname" = "surname",
 *      "phone_number" = "phone_number",
 *      "email"="email",
 *      "organization" = "organization",
 *      "interest" = "interest",
 *      "request" = "request"
 *  }
 * )
 */
class RequestData extends ContentEntityBase implements ContentEntityInterface
{
    public static function baseFieldDefinitions(
        EntityTypeInterface $entity_type
    ) {
        $fields = parent::baseFieldDefinitions($entity_type);

        // Standard field, used as unique if primary index.
        $fields['id'] = BaseFieldDefinition::create('integer')
            ->setLabel(t('ID'))
            ->setDescription(t('The ID of the RequestData entity.'))
            ->setReadOnly(true);

        // Standard field, unique outside of the scope of the current project.
        $fields['uuid'] = BaseFieldDefinition::create('uuid')
            ->setLabel(t('UUID'))
            ->setDescription(t('The UUID of the RequestData entity.'))
            ->setReadOnly(true);

        // Standard field, unique outside of the scope of the current project.
        $fields['name'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Name'))
            ->setDescription(t('Name'))
            ->setRequired(true)
            ->setTranslatable(true);

        $fields['surname'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Surname'))
            ->setDescription(t('Surname'))
            ->setRequired(true)
            ->setTranslatable(true);

        $fields['email'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Phone number'))
            ->setDescription(t('Phone number'))
            ->setRequired(false)
            ->setTranslatable(true);


        $fields['phone_number'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Phone number'))
            ->setDescription(t('Phone number'))
            ->setRequired(false)
            ->setTranslatable(true);

        $fields['organization'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Organization'))
            ->setDescription(t('Organization'))
            ->setRequired(true)
            ->setTranslatable(true);

        $fields['interest'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Interest'))
            ->setDescription(t('Interest'))
            ->setRequired(true)
            ->setTranslatable(true);

        $fields['request'] = BaseFieldDefinition::create('string')
            ->setLabel(t('Request'))
            ->setDescription(t('Request'))
            ->setRequired(false)
            ->setTranslatable(true);

        return $fields;
    }
}
