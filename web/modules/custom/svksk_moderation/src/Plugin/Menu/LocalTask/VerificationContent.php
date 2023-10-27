<?php

namespace Drupal\svksk_moderation\Plugin\Menu\LocalTask;

use Drupal\Core\Entity\ContentEntityStorageInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\Core\Menu\LocalTaskDefault;
use Drupal\Core\Plugin\ContainerFactoryPluginInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\Request;

/**
 * Provides a local task that shows the amount of verification content.
 */
class VerificationContent extends LocalTaskDefault implements ContainerFactoryPluginInterface {

  use StringTranslationTrait;

  /**
   * The entity storage.
   *
   * @var \Drupal\Core\Entity\ContentEntityStorageInterface
   */
  protected $storage;

  /**
   * The language manager.
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface|null
   */
  protected $languageManager;

  /**
   * Construct the VerificationContent object.
   *
   * @param array $configuration
   *   A configuration array containing information about the plugin instance.
   * @param string $plugin_id
   *   The plugin_id for the plugin instance.
   * @param array $plugin_definition
   *   The plugin implementation definition.
   * @param \Drupal\Core\Entity\ContentEntityStorageInterface $content_moderation_storage
   *   The comment storage service.
   * @param \Drupal\Core\Language\LanguageManagerInterface $language_manager
   *   The language manager.
   */
  public function __construct(array $configuration, $plugin_id, array $plugin_definition, ContentEntityStorageInterface $content_moderation_storage, LanguageManagerInterface $language_manager) {
    parent::__construct($configuration, $plugin_id, $plugin_definition);
    $this->storage = $content_moderation_storage;
    $this->languageManager = $language_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container, array $configuration, $plugin_id, $plugin_definition) {
    return new static(
      $configuration,
      $plugin_id,
      $plugin_definition,
      $container->get('entity_type.manager')
        ->getStorage('content_moderation_state'),
      $container->get('language_manager')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getTitle(Request $request = NULL) {
    $count = 0;
    $sent_for_assesment = 0;

    foreach ($this->languageManager->getLanguages() as $langcode => $language) {
      $response = $this->storage->getQuery()
        ->accessCheck(false)
        ->condition('moderation_state', 'in_review')
        ->condition('langcode', $langcode)
        ->latestRevision()
        ->count()
        ->execute();

      $count += $response;

      $response = $this->storage->getQuery()
        ->accessCheck(false)
        ->condition('moderation_state', 'sent_for_assesment')
        ->condition('langcode', $langcode)
        ->latestRevision()
        ->count()
        ->execute();

      $sent_for_assesment += $response;
    }

    if ($sent_for_assesment > 0) {
      $count .= ' + ' . $sent_for_assesment;
    }

    return $this->t('Content waiting for approval (@count)', ['@count' => $count]);
  }

}
