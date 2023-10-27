<?php

namespace Drupal\svksk_base;

use Drupal\Core\Database\Connection;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Entity\EntityDefinitionUpdateManagerInterface;
use Drupal\Core\Config\FileStorage;
use Drupal\Core\Site\Settings;
use Drupal\field\Entity\FieldConfig;
use Drupal\field\Entity\FieldStorageConfig;

class EntitySchemaManager {

  /**
   * @var \Drupal\Core\Database\Connection
   */
  protected $connection;

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\Core\Entity\EntityDefinitionUpdateManagerInterface
   */
  protected $entityDefinitionUpdateManager;

  /**
   * @param \Drupal\Core\File\FileSystemInterface $file_system
   */
  public function __construct(Connection $connection, EntityTypeManagerInterface $entity_type_manager, EntityDefinitionUpdateManagerInterface $entity_definition_update_manager) {
    $this->connection = $connection;
    $this->entityTypeManager = $entity_type_manager;
    $this->entityDefinitionUpdateManager = $entity_definition_update_manager;
  }

  /**
   * Install entity if not exist.
   *
   * @param string $entity_type_id
   *
   * @return bool
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function installEntity(string $entity_type_id): bool {
    $definition = $this->entityTypeManager->getDefinition($entity_type_id);
    $base_table = $definition->getBaseTable();
    if (!$this->connection->schema()->tableExists($base_table)) {
      $this->entityTypeManager->clearCachedDefinitions();
      $this->entityDefinitionUpdateManager->installEntityType($definition);
      return TRUE;
    }
    return FALSE;
  }

  /**
   * @param string $entity_type_id
   * @param string $bundle
   * @param string $field_name
   *
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function ensureField(string $entity_type_id, string $bundle, string $field_name): void {
    $config_directory = new FileStorage(Settings::get('config_sync_directory'));
    $field_storage_name = 'field.storage.' . $entity_type_id . '.' . $field_name;
    $config_record = $config_directory->read($field_storage_name);
    if (!FieldStorageConfig::loadByName($config_record['entity_type'], $config_record['field_name'])) {
      FieldStorageConfig::create($config_record)->save();
    }
    $field_config_name = 'field.field.' . $entity_type_id . '.' . $bundle . '.' . $field_name;
    $config_record = $config_directory->read($field_config_name);
    if (!FieldConfig::loadByName($config_record['entity_type'], $config_record['bundle'], $config_record['field_name'])) {
      FieldConfig::create($config_record)->save();
    }
  }

}
