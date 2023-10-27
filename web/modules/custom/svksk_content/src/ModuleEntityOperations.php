<?php

namespace Drupal\svksk_content;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityPublishedInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Queue\QueueFactory;
use Drupal\language\ConfigurableLanguageManagerInterface;
use Drupal\node\NodeInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Defines custom operations triggered in entity hooks.
 *
 * @internal
 */
class ModuleEntityOperations implements ContainerInjectionInterface {

  const SUPPORTED_REVALIDATE_ENTITY_BUNDLES = [
    'node:article',
    'node:life_event',
    'node:news',
    'node:notice',
    'node:organization',
    'node:page',
    'node:service',
    'taxonomy_term:life_event_categories',
  ];

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\svksk_content\ReferencesService
   */
  protected $contentReferences;

  /**
   * @var \Drupal\Core\Queue\QueueInterface
   */
  protected $nextRevalidateQueue;

  /**
   * The language manager.
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  protected $languageManager;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, ReferencesService $svksk_content_references, QueueFactory $queue, ConfigurableLanguageManagerInterface $language_manager) {
    $this->entityTypeManager = $entity_type_manager;
    $this->contentReferences = $svksk_content_references;
    $this->nextRevalidateQueue = $queue->get('svksk_content_next_revalidate_queue');
    $this->languageManager = $language_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
      $container->get('svksk_content.references'),
      $container->get('queue'),
      $container->get('language_manager')
    );
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function entityPresave(EntityInterface $entity): void {
    $this->contentReferences->invalidateCacheTags($entity);

    if ($entity instanceof NodeInterface) {
      $publishing_existing_node = !$entity->isNew()
        && $entity->isPublished()
        && !empty($entity->original)
        && !$entity->original->isPublished();

      if ($publishing_existing_node) {
        $entity->setCreatedTime(\Drupal::time()->getRequestTime());
      }
    }

    // Logger for content entity changes
    if ($entity instanceof ContentEntityInterface && !$entity->isNew()) {
      /** @var Drupal\Core\Logger\LoggerChannel $logger */
      $logger = \Drupal::logger('svksk_entity_operation');
      $message = strtoupper($entity->getEntityTypeId() . ' | ' . $entity->bundle() . ' | ' . $entity->id() . ' | UPDATED');

//      /** @var \TreeWalker $treewalker */
//      $treewalker = new \TreeWalker([
//          'debug' => FALSE,
//          'returntype' => 'jsonstring',
//        ]
//      );
//
//      if (isset($entity->original)) {
//        $entity_original = $entity->original;
//        if ($entity->isTranslatable()) {
//          $entity_langcode = $entity->language()->getId();
//          $entity_original = $entity_original->hasTranslation($entity_langcode) ?
//            $entity_original->getTranslation($entity_langcode) : $entity_original;
//        }
//        $diff = $treewalker->getdiff($entity->toArray(), $entity_original->toArray(), FALSE);
//        $message .= ' | DIFF: ' . $diff;
//      }

      $logger->info($message);
    }
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function entityInsert(EntityInterface $entity): void {
    $this->revalidateEntityCanonicalUrl($entity);
    $this->contentReferences->updateIndexData($entity);
    $this->contentReferences->revalidateEntityReferences($entity);

    if ($entity instanceof EntityPublishedInterface && $entity->isPublished()) {
      $this->revalidateOrganizations($entity);
    }
  }

  /**
   * @param int $organizationalUnitId
   *   The organizational unit Id.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   * @throws \Drupal\Core\Entity\EntityMalformedException
   */
  public function revalidateOrganizationsPathById(int $organizationalUnitId): void {
    $languages = $this->languageManager->getLanguages();
    $organizations = \Drupal::entityTypeManager()
      ->getStorage('node')
      ->loadByProperties([
        'type' => 'organization',
        'field_organizational_unit' => $organizationalUnitId,
      ]);
    foreach ($organizations as $organization) {
      foreach ($languages as $langcode => $lang) {
        if ($organization->hasTranslation($langcode)) {
          $this->contentReferences->revalidatePath($organization->toUrl()
            ->setOption('language', $lang)
            ->toString());
        }
      }
    }
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function entityUpdate(EntityInterface $entity): void {
    $this->revalidateEntityCanonicalUrl($entity);
    $this->contentReferences->revalidateEntityReferences($entity);
    $this->contentReferences->updateIndexData($entity);

    // Revalidate referencies in case we have new index data
    $this->contentReferences->revalidateEntityReferences($entity);

    // Check if this node is not a frontpage
    if ($entity->getEntityTypeId() === 'node') {
      /** @var NodeInterface $node */
      $node = $entity;
      $config = \Drupal::config('svksk_base.general_settings');
      preg_match_all('/\(([^)]*)\)[^(]*$/', $config->get('front_page_node'), $front_page_node);
      $front_page_uuid = isset($front_page_node[1][0]) ? $front_page_node[1][0] : NULL;
      if ($node->uuid() === $front_page_uuid) {
        $translation_languages = $node->getTranslationLanguages();
        foreach ($translation_languages as $langcode => $language) {
          if ($langcode === 'sk') {
            $this->contentReferences->revalidatePath('/');
          } else {
            $this->contentReferences->revalidatePath("/{$langcode}");
          }
        }
      }
    }

    $this->revalidateOrganizations($entity);
  }

  /**
   * Add organizations into revalidation queue.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *   The entity to save.
   *
   * @return void
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   * @throws \Drupal\Core\Entity\EntityMalformedException
   */
  public function revalidateOrganizations(EntityInterface $entity): void {
    if ($entity->getEntityTypeId() === 'node' && $entity->hasField('field_organizational_unit')) {
      $newOrganizationalUnitId = !$entity->get('field_organizational_unit')
        ->isEmpty() ? $entity->get('field_organizational_unit')->target_id : NULL;

      if ($newOrganizationalUnitId) {
        $this->revalidateOrganizationsPathById($newOrganizationalUnitId);
      }

      if ($entity->original && !$entity->original->get('field_organizational_unit')
          ->isEmpty()) {
        $oldOrganizationalUnitId = $entity->original->get('field_organizational_unit')->target_id;

        if ($oldOrganizationalUnitId && $oldOrganizationalUnitId != $newOrganizationalUnitId) {
          $this->revalidateOrganizationsPathById($oldOrganizationalUnitId);
        }
      }
    }
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function entityDelete(EntityInterface $entity): void {
    $this->contentReferences->revalidateEntityReferences($entity);
    $this->contentReferences->invalidateCacheTags($entity);
    $this->contentReferences->deleteIndexData($entity);
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function menuLinkPresave(EntityInterface $entity): void {
    if ($entity->getMenuName() === 'sitemap') {
      foreach (\Drupal::languageManager()->getLanguages() as $langcode => $language) {
        if ($langcode !== 'sk') {
          $this->nextRevalidateQueue->createItem([
            'path' => strtok('/'.$langcode.'/mapa-stranok', '?'),
          ]);
        } else {
          $this->nextRevalidateQueue->createItem([
            'path' => strtok('/mapa-stranok', '?'),
          ]);
        }
      }
    }
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function pathAliasUpdate(EntityInterface $entity): void {
    /** @var \Drupal\path_alias\PathAliasInterface $original_path_alias */
    $original_path_alias = $entity->original;
    if ($original_path_alias->getAlias() != $entity->getAlias()) {
      $this->nextRevalidateQueue->createItem([
        'path' => strtok($original_path_alias->getAlias(), '?'),
      ]);
    }
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function pathAliasDelete(EntityInterface $entity): void {
    $this->nextRevalidateQueue->createItem([
      'path' => strtok($entity->getAlias(), '?'),
    ]);
  }

  /**
   * Revalidate given entity in case it's used on frontend.
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   * @throws \Drupal\Core\Entity\EntityMalformedException
   */
  protected function revalidateEntityCanonicalUrl(EntityInterface $entity) : void {
    $key = implode(':', [$entity->getEntityTypeId(), $entity->bundle()]);
    if (!in_array($key, self::SUPPORTED_REVALIDATE_ENTITY_BUNDLES) || !$entity->hasLinkTemplate('canonical')) {
      return;
    }
    $this->nextRevalidateQueue->createItem([
      'path' => $entity->toUrl()->toString(),
    ]);
  }

}
