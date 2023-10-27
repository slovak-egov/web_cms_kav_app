<?php

namespace Drupal\svksk_api\Resource;

use Drupal\Core\Cache\CacheableMetadata;
use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityRepositoryInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Language\LanguageInterface;
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
 * Processes a request for list of UI translation strings.
 *
 * @internal
 */
class Translations extends ResourceBase implements ContainerInjectionInterface {

  /**
   * The entity repository.
   *
   * @var \Drupal\Core\Entity\EntityRepositoryInterface
   */
  protected $entityRepository;

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @param \Drupal\Core\Config\ConfigFactory $config_factory
   */
  public function __construct(EntityRepositoryInterface $entity_repository, EntityTypeManagerInterface $entity_type_manager) {
    $this->entityRepository = $entity_repository;
    $this->entityTypeManager = $entity_type_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity.repository'),
      $container->get('entity_type.manager'),
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
    $entity_type_id = 'svksk_ui_translation';
    $resource_type = reset($resource_types);

    $data = [];
    $tags = [$entity_type_id . '_list'];
    $links = new LinkCollection([]);
    $entities = $this->entityTypeManager->getStorage($entity_type_id)
      ->loadMultiple();

    if (empty($entities)) {
      return [];
    }

    $langcode = \Drupal::languageManager()->getCurrentLanguage()->getId();

    /** @var \Drupal\Core\Entity\ContentEntityInterface $translation */
    foreach ($entities as $translation) {
      if ($translation->hasTranslation($langcode)) {
        $translation = $this->entityRepository->getTranslationFromContext($translation);
      }

      if ($translation->get('status')->value) {
        $values = [
          'key' => $translation->get('machine_name')->value,
          'value' => $translation->get('string')->value,
        ];

        if (!$translation->get('string_plural')->isEmpty()) {
          $values['value_plural'] = $translation->get('string_plural')->value;
        }

        $tags[] = $entity_type_id . ':' . $translation->id();
        $data[] = new ResourceObject(
          $translation,
          $resource_type,
          $translation->id(),
          NULL,
          $values,
          $links
        );
      }
    }

    $response = $this->createJsonapiResponse(new ResourceObjectData($data, count($data)), $request);
    $response->addCacheableDependency((new CacheableMetadata())->addCacheContexts([
      'languages:' . LanguageInterface::TYPE_CONTENT,
      'url.path',
    ])->addCacheTags($tags));

    return $response;
  }

  /**
   * {@inheritdoc}
   */
  public function getRouteResourceTypes(Route $route, string $route_name): array {
    $fields = [
      'key' => new ResourceTypeAttribute('key'),
      'value' => new ResourceTypeAttribute('value'),
      'key_plural' => new ResourceTypeAttribute('key_plural'),
      'value_plural' => new ResourceTypeAttribute('value_plural'),
    ];
    $resource_type = new ResourceType('svksk_ui_translation', 'default', NULL, FALSE, TRUE, TRUE, FALSE, $fields);
    $resource_type->setRelatableResourceTypes([]);

    return [$resource_type];
  }

}
