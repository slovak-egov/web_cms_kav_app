<?php

namespace Drupal\svksk_api\Resource;

use Drupal\Core\Cache\CacheableMetadata;
use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\jsonapi\JsonApiResource\LinkCollection;
use Drupal\jsonapi\JsonApiResource\ResourceObject;
use Drupal\jsonapi\JsonApiResource\ResourceObjectData;
use Drupal\jsonapi\ResourceType\ResourceType;
use Drupal\jsonapi\ResourceType\ResourceTypeAttribute;
use Drupal\jsonapi_resources\Resource\ResourceBase;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Route;

/**
 * Processes a request for list of enabled site languages.
 *
 * @internal
 */
class EnabledLanguage extends ResourceBase implements ContainerInjectionInterface {

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  protected $languageManager;

  /**
   * @param \Drupal\Core\Config\ConfigFactory $config_factory
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, LanguageManagerInterface $language_manager) {
    $this->entityTypeManager = $entity_type_manager;
    $this->languageManager = $language_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
      $container->get('language_manager'),
    );
  }

  /**
   * Process the resource request.
   *
   * @param \Symfony\Component\HttpFoundation\Request $request
   *   The request.
   * @param \Drupal\jsonapi\ResourceType\ResourceType[] $resource_types
   *   The route resource types.
   *
   * @return \Drupal\jsonapi\ResourceResponse
   *   The response.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function process(Request $request, array $resource_types) {
    $entity_type_id = 'configurable_language';
    $resource_type = reset($resource_types);

    $links = new LinkCollection([]);
    $languages = $this->languageManager->getLanguages();
    $data = [];
    $tags = ['config:' . $entity_type_id . '_list'];

    $native_languages = $this->languageManager->getNativeLanguages();
    /** @var \Drupal\Core\Language\LanguageInterface $language */
    foreach ($languages as $language) {
      $langcode = $language->getId();
      /** @var \Drupal\language\ConfigurableLanguageInterface $language_entity */
      $language_entity = $this->entityTypeManager->getStorage($entity_type_id)
        ->load($langcode);
      $native = $native_languages[$langcode] ?? $language_entity;

      $values = [
        'label' => $native->getName(),
        'direction' => $language->getDirection(),
        'weight' => $language->getWeight(),
      ];

      $tags[] = $entity_type_id . ':' . $langcode;
      $data[] = new ResourceObject(
        $native,
        $resource_type,
        $langcode,
        NULL,
        $values,
        $links
      );
    }

    $top_level_data = new ResourceObjectData($data, count($data));
    $response = $this->createJsonapiResponse($top_level_data, $request);
    $response->addCacheableDependency((new CacheableMetadata())->addCacheTags($tags));
    return $response;
  }

  /**
   * {@inheritdoc}
   */
  public function getRouteResourceTypes(Route $route, string $route_name): array {
    $fields = [
      'label' => new ResourceTypeAttribute('label'),
      'direction' => new ResourceTypeAttribute('direction'),
      'weight' => new ResourceTypeAttribute('weight'),
    ];
    $resource_type = new ResourceType('language', 'enabled', NULL, FALSE, TRUE, TRUE, FALSE, $fields);
    $resource_type->setRelatableResourceTypes([]);
    return [$resource_type];
  }

}
