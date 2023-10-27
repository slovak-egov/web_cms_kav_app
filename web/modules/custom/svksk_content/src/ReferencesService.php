<?php

namespace Drupal\svksk_content;

use Drupal\Core\Cache\Cache;
use Drupal\Core\Database\Connection;
use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityFieldManager;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityTypeManager;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\taxonomy\TermInterface;

/**
 * References service to build and maintain index of content references used
 * to invalidate related content.
 */
class ReferencesService {

  /**
   * Name of DB storage table.
   */
  const INDEX_TABLE_NAME = 'content_entity_references';

  /**
   * Name of drupal_static bucker
   */
  const STATIC_BUCKET_NAME = 'content_entity_references_paths';

  /**
   * List of entity type ids for which we index entity references.
   */
  const INDEXED_ENTITY_TYPES = ['node', 'taxonomy_term', 'organizational_unit'];

  /**
   * The database.
   *
   * @var \Drupal\Core\Database\Database
   */
  protected $database;

  /**
   * The entity manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManager
   */
  protected $entityTypeManager;

  /**
   * The entity field manager.
   *
   * @var \Drupal\Core\Entity\EntityFieldManager
   */
  protected $entityFieldManager;

  /**
   * The queue.
   *
   * @var \Drupal\Core\Queue\QueueWorkerInterface
   */
  protected $queue;

  /**
   * Language manager
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  protected $languageManager;

  /**
   * ContentService interface constructor.
   *
   * @param \Drupal\Core\Database\Connection $database
   *   The database.
   * @param \Drupal\Core\Entity\EntityTypeManager $entity_manager
   *   The entity manager.
   * @param \Drupal\Core\Entity\EntityFieldManager $entity_field_manager
   *   The entity field manager.
   * @param \Drupal\Core\Language\LanguageManagerInterface $language_manager
   */
  public function __construct(Connection $database, EntityTypeManager $entity_manager, EntityFieldManager $entity_field_manager, LanguageManagerInterface $language_manager) {
    $this->database = $database;
    $this->entityTypeManager = $entity_manager;
    $this->entityFieldManager = $entity_field_manager;
    $this->languageManager = $language_manager;
    $this->queue = \Drupal::queue('svksk_content_next_revalidate_queue');
  }

  /**
   * Revalidate entity references.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   */
  public function revalidateEntityReferences(EntityInterface $entity) {
    if (!$this->isSupportedEntity($entity)) {
      return;
    }
    $references = array_merge(
      $this->getIndexData([
        'entity_type' => $entity->getEntityTypeId(),
        'entity_id' => $entity->id(),
      ]),
      $this->getIndexData([
        'reference_entity_type' => $entity->getEntityTypeId(),
        'reference_entity_id' => $entity->id(),
      ]),
      $this->getIndexData([
        'reference_entity_bundle' => $entity->bundle(),
        'reference_entity_id' => 0,
      ])
    );

    if (empty($references)) {
      return;
    }

    $this->queue->createQueue();

    $reference_invalidate_paths = &drupal_static(self::STATIC_BUCKET_NAME, []);
    foreach ($references as $reference) {
      try {
        if ($reference->entity_type === $entity->getEntityTypeId() &&
          $reference->entity_id === $entity->id()) {
          $entity_type = $reference->reference_entity_type;
          $entity_id = $reference->reference_entity_id;
        }
        else {
          $entity_type = $reference->entity_type;
          $entity_id = $reference->entity_id;
        }

        $referenced_entity = $this->entityTypeManager->getStorage($entity_type)
          ->load($entity_id);
        if (!$referenced_entity) {
          continue;
        }

        if (method_exists($referenced_entity, 'getTranslationLanguages')) {
          $translations = $referenced_entity->getTranslationLanguages(TRUE);
          foreach ($translations as $language) {
            $url = $referenced_entity
              ->toUrl('canonical', ['language' => $language])
              ->toString();
            if (strpos($url, '/admin/') !== 0) {
              $reference_invalidate_paths[] = strtok($url, '?');
            }
          }
        } else {
          $url = $referenced_entity->toUrl()->toString();
          if (strpos($url, '/admin/') !== 0) {
            $reference_invalidate_paths[] = strtok($url, '?');
          }
        }
      } catch (\Exception $e) {
        // Skip creating a cue if reference counld not be loaded.
      }
    }
  }

  /**
   * Revalidate single path.
   *
   * @param $path
   *
   * @return void
   */
  public function revalidatePath($path) {
    $reference_invalidate_paths = &drupal_static(self::STATIC_BUCKET_NAME, []);
    $reference_invalidate_paths[] = strtok($path, '?');
  }

  /**
   * This method is called on Drupal terminate event.
   *
   * @return void
   */
  public function onTerminate() {
    $reference_invalidate_paths = &drupal_static(self::STATIC_BUCKET_NAME, []);
    $reference_invalidate_paths = array_unique($reference_invalidate_paths);
    foreach ($reference_invalidate_paths as $path) {
      $this->queue->createItem([
        'path' => strtok($path, '?'),
      ]);
    }
    drupal_static_reset(self::STATIC_BUCKET_NAME);
  }

  /**
   * Update entity reference index.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @throws \Exception
   */
  public function updateIndexData(EntityInterface $entity) {
    $this->deleteIndexData($entity, FALSE);

    if (!$this->isSupportedEntity($entity)) {
      return;
    }

    // Get all references from paragraphs
    $references = $this->extractEntityReferences($entity);

    if (empty($references) || !$this->tableExist()) {
      return;
    }

    // Update reference index table
    foreach ($references as $reference) {
      $this->database->insert(self::INDEX_TABLE_NAME)
        ->fields(array_merge($reference, [
          'entity_type' => $entity->getEntityTypeId(),
          'entity_id' => $entity->id(),
        ]))->execute();
    }
  }

  /**
   * Delete index data.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param bool $including_references
   *  Weather we want to delete reference occurrences for the entity
   */
  public function deleteIndexData(EntityInterface $entity, $including_references = TRUE) {
    if (!$this->isSupportedEntity($entity) || !$this->tableExist()) {
      return;
    }
    $this->database->delete(self::INDEX_TABLE_NAME)
      ->condition('entity_type', $entity->getEntityTypeId())
      ->condition('entity_id', $entity->id())
      ->execute();

    if ($including_references) {
      $this->database->delete(self::INDEX_TABLE_NAME)
        ->condition('reference_entity_type', $entity->getEntityTypeId())
        ->condition('reference_entity_id', $entity->id())
        ->execute();
    }
  }

  /**
   * Return indexed references data.
   *
   * @param array $conditions
   *
   * @return array
   */
  protected function getIndexData(array $conditions) {
    if (!$this->tableExist()) {
      return [];
    }
    $query = $this->database->select(self::INDEX_TABLE_NAME, 'r')
      ->fields('r');

    if (!empty($conditions)) {
      foreach ($conditions as $field => $value) {
        $query->condition($field, $value);
      }
    }

    return $query->execute()->fetchAll() ?: [];
  }

  /**
   * Ensure storage index table exists.
   *
   * @return bool
   */
  protected function tableExist() {
    return $this->database->schema()->tableExists(self::INDEX_TABLE_NAME);
  }

  /**
   * Is given entity supported.
   *
   * @return bool
   */
  protected function isSupportedEntity(EntityInterface $entity) {
    return ($entity instanceof ContentEntityInterface) &&
      in_array($entity->getEntityTypeId(), self::INDEXED_ENTITY_TYPES) &&
      is_numeric($entity->id());
  }

  /**
   * Extract entity referenced entities and list
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return array
   */
  protected function extractEntityReferences(EntityInterface $entity) {
    $references = [];

    // Recursively extract references from entity fields and paragraphs
    $this->extractEntityFieldReferences($entity, $references);

    return $references;
  }

  /**
   * Recursive function to walk entity field definition to extract all entity
   * reference value.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param $references
   */
  protected function extractEntityFieldReferences(EntityInterface $entity, &$references) {
    $entity_fields = $this->entityFieldManager->getFieldDefinitions($entity->getEntityTypeId(), $entity->bundle());
    /** @var  \Drupal\Core\Field\FieldDefinition $definition */
    foreach ($entity_fields as $name => $definition) {
      if ($definition->getType() == 'entity_reference' && !$definition->isReadOnly()) {
        $entity_references = $entity->get($name)->referencedEntities();

        foreach ($entity_references as $entity_reference) {
          $entity_reference_data = [
            'reference_entity_type' => $entity_reference->getEntityTypeId(),
            'reference_entity_bundle' => $entity_reference->bundle(),
            'reference_entity_id' => $entity_reference->id(),
          ];
          $entity_reference_key = implode(':', $entity_reference_data);
          // Check duplicate keys in references and skip user entity reference
          if (!array_key_exists($entity_reference_key, $references) && !in_array($entity_reference->getEntityTypeId(), ['user']) && is_numeric($entity_reference->id())) {
            $references[$entity_reference_key] = $entity_reference_data;
          }
        }
      }
      else {
        if ($definition->getType() == 'entity_reference_revisions' && !$definition->isReadOnly()) {
          $entity_references = $entity->get($name)->referencedEntities();

          foreach ($entity_references as $entity_reference) {
            $bundle = $entity_reference->bundle();
            $bundle_map = [
              'life_event_categories' => 'life_event',
              'organization_search' => 'organization',
              'search_service' => 'service',
              'faq' => 'faq',
            ];

            if ($entity_reference->hasField('field_content_type')) {
              $bundle_map['view'] = $entity_reference->get('field_content_type')->target_id;
            }

            if ($entity_reference->getEntityTypeId() === 'paragraph' && in_array($bundle, array_keys($bundle_map))) {
              $references[] = [
                'reference_entity_type' => 'node',
                'reference_entity_bundle' => $bundle_map[$bundle],
                'reference_entity_id' => 0,
              ];

              if ($bundle == 'life_event_categories') {
                $references[] = [
                  'reference_entity_type' => 'taxonomy_term',
                  'reference_entity_bundle' => 'life_event_categories',
                  'reference_entity_id' => 0,
                ];

                $references[] = [
                  'reference_entity_type' => 'taxonomy_term',
                  'reference_entity_bundle' => 'user_segments',
                  'reference_entity_id' => 0,
                ];
              }
            }

            $this->extractEntityFieldReferences($entity_reference, $references);
          }
        }
      }
    }
  }

  /**
   * Invalidate all cache tags associated with the entity.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function invalidateCacheTags(EntityInterface $entity): void {
    if (!($entity instanceof ContentEntityInterface)) {
      return;
    }

    $tags = $this->extractCacheTags($entity);

    if (!$entity->isNew() && !empty($entity->original)) {
      $tags = Cache::mergeTags($tags, $this->extractCacheTags($entity->original));
    }

    if ($tags) {
      Cache::invalidateTags($tags);
    }
  }

  /**
   * Get all relevant cache tags from entity for invalidation.
   *
   * @param \Drupal\Core\Entity\ContentEntityInterface $entity
   *
   * @return array
   */
  protected function extractCacheTags(ContentEntityInterface $entity): array {
    $tags = [];

    return array_merge($tags, $this->referencedCategoriesCacheTags($entity));
  }

  /**
   * Get cache tags from entities that reference Life Event Categories.
   *
   * @param \Drupal\Core\Entity\ContentEntityInterface $entity
   *
   * @return array
   */
  private function referencedCategoriesCacheTags(ContentEntityInterface $entity): array {
    $tags = [];
    if ($entity->getEntityTypeId() !== 'node') {
      return $tags;
    }

    $category_fields = ['field_categories', 'field_category'];
    foreach ($category_fields as $field_name) {
      if (!$entity->hasField($field_name)) {
        continue;
      }
      /** @var \Drupal\taxonomy\TermInterface[] $terms */
      $terms = $entity->get($field_name)->referencedEntities();
      foreach ($terms as $term) {
        $tags = Cache::mergeTags($tags, $term->getCacheTags());
      }
    }

    if ($tags && $term instanceof TermInterface) {
      $tags = Cache::mergeTags($tags, $term->getEntityType()->getListCacheTags());
    }

    return $tags;
  }

}
