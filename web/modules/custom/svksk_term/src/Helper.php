<?php

namespace Drupal\svksk_term;

use Drupal\Core\Cache\Cache;
use Drupal\Core\Database\Connection;
use Drupal\Core\Entity\EntityTypeManager;
use Drupal\Core\Language\LanguageManager;
use Drupal\Core\Queue\QueueFactory;
use Drupal\node\Entity\Node;
use Drupal\node\NodeInterface;
use Drupal\paragraphs\Entity\Paragraph;
use Drupal\svksk_term\Entity\Term;

/**
 * Helper service.
 */
class Helper {

  /**
   * @var \Drupal\Core\Entity\EntityTypeManager
   */
  protected $entityManager;

  /**
   * @var \Drupal\Core\Language\LanguageManager
   */
  protected $languageManager;

  /**
   * @var \Drupal\Core\Database\Connection
   */
  protected $connection;

  /**
   * The queue factory.
   *
   * @var \Drupal\Core\Queue\QueueInterface
   */
  protected $queue;

  /**
   * @var array
   */
  private $terms;

  /**
   * @var array
   */
  private $mapping;

  /**
   * Helper constructor.
   *
   * @param \Drupal\Core\Entity\EntityTypeManager $entity_manager
   * @param \Drupal\Core\Language\LanguageManager $language_manager
   * @param \Drupal\Core\Queue\QueueFactory $queue_factory
   * @param \Drupal\Core\Database\Connection $connection
   */
  public function __construct(EntityTypeManager $entity_manager, LanguageManager $language_manager, Connection $connection, QueueFactory $queue_factory) {
    $this->entityManager = $entity_manager;
    $this->languageManager = $language_manager;
    $this->connection = $connection;

    $this->queue = $queue_factory->get('svksk_content_next_revalidate_queue');
    $this->terms = $entity_manager->getStorage('term')->loadMultiple();

    $this->mapping = [
      // Mapping array to define which node fields to process
      'node' => [
        // 'service' => [
        //   'field_additional_info',
        //   'field_service_description',
        //   'field_service_process',
        // ],
        'faq' => [
          'field_faq_question',
          'field_faq_answer',
        ],
      ],
      // Mapping array to define which fields to process on which paragraph type
      'paragraph' => [
        'text' => ['field_content'],
        'life_event_step' => ['field_description'],
      ],
    ];
  }

  /**
   * Process node fields
   *
   * @param \Drupal\node\Entity\Node $node
   * @param string $op
   */
  public function processNode(Node $node, $op) {
    if (!isset($this->mapping['node'][$node->bundle()])) {
      return;
    }

    // Process node field value
    foreach ($this->mapping['node'][$node->bundle()] as $field_name) {
      $this->processEntityField($node, $field_name, $op);
    }

  }

  /**
   * Process paragraph fields
   *
   * @param \Drupal\paragraphs\Entity\Paragraph $paragraph
   * @param string $op
   */
  public function processParagraph(Paragraph $paragraph, $op) {
    if (!isset($this->mapping['paragraph'][$paragraph->bundle()])) {
      return;
    }

    // Get parent node and translation
    if ($node = $this->getParent($paragraph)) {
      $langcode = $node->language()->getId();

      if ($paragraph->hasTranslation($langcode)) {
        $paragraph = $paragraph->getTranslation($langcode);
      }
    }

    // Process paragraph field value
    foreach ($this->mapping['paragraph'][$paragraph->bundle()] as $field_name) {
      $this->processEntityField($paragraph, $field_name, $op);
    }

    // Trigger node rebuild
    if ($node) {
      Cache::invalidateTags(['node:' . $node->id()]);

      $this->queue->createItem([
        'path' => strtok($node->toUrl()->toString(), '?'),
      ]);
    }
  }

  /**
   * Process term
   *
   * @param \Drupal\svksk_term\Entity\Term $term
   * @param string $op
   */
  public function processTerm(Term $term, $op) {
    $entities = [];

    // Add new term to list of terms to process
    if ($op == 'create') {
      $this->terms += [$term];
    }

    // Replace updated term in list of terms to process
    if ($op == 'update') {
      $this->terms[$term->id()] = $term;
    }

    // Get all entities from mapping that include update term
    foreach ($this->mapping as $entity_type => $definiton) {
      $query = \Drupal::entityQuery($entity_type)
        ->condition('type', array_keys($definiton), 'IN');
      $group = $query->orConditionGroup();

      foreach ($definiton as $fields) {
        foreach ($fields as $field) {
          $group->condition($field, "%" . $this->connection->escapeLike($term->label()) . "%", 'LIKE');
        }
      }

      $ids = $query->condition($group)->accessCheck(true)->execute();

      if (!empty($ids)) {
        $entities = array_merge($entities, $this->entityManager->getStorage($entity_type)
          ->loadMultiple($ids));
      }
    }

    // Save entities to update terms in them
    if (!empty($entities)) {
      foreach ($entities as $entities) {
        $entities->save();
      }
    }
  }

  /**
   * Process entity field
   *
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param string $field
   * @param string $op
   */
  private function processEntityField($entity, $field, $op) {
    if (!$entity->hasField($field)) {
      return;
    }

    if ($entity->get($field)->isEmpty()) {
      return;
    }

    if ($text = $this->replaceTag($this->terms, $entity->get($field)->value, $op)) {
      $entity->set($field, [
        'value' => $text,
        'format' => $entity->get($field)->format,
      ]);
    }
  }

  /**
   * Replace tag word with abbr tag and description
   *
   * @param array $terms
   * @param string $text
   * @param strng $op
   *
   * @return string|false
   */
  private function replaceTag($terms, $text) {
    $term_list = [];
    $current_langcode = $this->languageManager->getCurrentLanguage()->getId();

    /** @var \Drupal\svksk_term\Entity\Term $term */
    foreach ($terms as $term) {
      if ($term->hasTranslation($current_langcode)) {
        $term = $term->getTranslation($current_langcode);
      }

      if ($term->isPublished() && !$term->get('description')->isEmpty()) {
        $term_list[$term->uuid()] = [
          'name' => $term->label(),
          'description' => $term->get('description')->value,
        ];
      }
    }

    if (empty($term_list)) {
      return FALSE;
    }

    // Remove all tooltip tags
    $text = preg_replace('/<\/?abbr( data-tip)?[^>]*?>/', '$2', $text);
    // Process all terms
    foreach ($term_list as $uuid => $item) {
      $text = preg_replace('/\b' . $item['name'] . '\b(?!(?:(?!<\/?a\b[^>]*>).)*?<\/a>)/u', $uuid, $text);
    }

    foreach ($term_list as $uuid => $item) {
      $text = str_replace($uuid, '<abbr data-tip="' . htmlentities($item['description']) . '" data-uuid="' . $uuid . '">' . $item['name'] . '</abbr>', $text);
    }

    return $text;
  }

  /**
   * Get paragraph parent node
   *
   * @param \Drupal\paragraphs\Entity\Paragraph $paragraph
   *
   * @return Node|false
   */
  private function getParent(Paragraph $paragraph) {
    if ($parent = $paragraph->getParentEntity()) {
      if ($parent instanceof NodeInterface) {
        return $parent;
      }

      return $this->getParent($parent);
    }

    return FALSE;
  }

}
