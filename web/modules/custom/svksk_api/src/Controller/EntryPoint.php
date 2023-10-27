<?php

namespace Drupal\svksk_api\Controller;

use Drupal\Core\Cache\CacheableMetadata;
use Drupal\Core\Serialization\Yaml;
use Drupal\Core\Url;
use Drupal\jsonapi\CacheableResourceResponse;
use Drupal\jsonapi\JsonApiResource\JsonApiDocumentTopLevel;
use Drupal\jsonapi\JsonApiResource\LinkCollection;
use Drupal\jsonapi\JsonApiResource\NullIncludedData;
use Drupal\jsonapi\JsonApiResource\Link;
use Drupal\jsonapi\JsonApiResource\ResourceObjectData;
use Drupal\jsonapi\ResourceType\ResourceType;
use Drupal\jsonapi_resources\Resource\ResourceBase;
use Drupal\views\Views;
use Symfony\Component\Routing\Exception\RouteNotFoundException;

/**
 * Controller for the API entry point.
 *
 * @see https://www.drupal.org/project/drupal/issues/3032787
 * @see jsonapi.api.php
 * @internal JSON:API maintains no PHP API. The API is the HTTP API. This class
 *   may change at any time and could break any dependencies on it.
 *
 */
class EntryPoint extends \Drupal\jsonapi\Controller\EntryPoint {

  /**
   * Controller to list all the resources.
   *
   * @return \Drupal\jsonapi\ResourceResponse
   *   The response object.
   */
  public function index() {
    $cacheability = (new CacheableMetadata())
      ->addCacheContexts(['user.roles:authenticated'])
      ->addCacheTags(['jsonapi_resource_types']);

    $resources = array_filter($this->resourceTypeRepository->all(), function ($resource) {
      return !$resource->isInternal();
    });

    $self_link = new Link(new CacheableMetadata(), Url::fromRoute('jsonapi.resource_list'), 'self');
    $urls = array_reduce($resources, function (LinkCollection $carry, ResourceType $resource_type) {
      if ($resource_type->isLocatable() || $resource_type->isMutable()) {
        $route_suffix = $resource_type->isLocatable() ? 'collection' : 'collection.post';
        $url = Url::fromRoute(sprintf('jsonapi.%s.%s', $resource_type->getTypeName(), $route_suffix))
          ->setAbsolute();
        $link_relation_type = $resource_type->getTypeName();

        return $carry->withLink($resource_type->getTypeName(), new Link(new CacheableMetadata(), $url, $link_relation_type));
      }
      return $carry;
    }, new LinkCollection(['self' => $self_link]));

    $meta = [];
    if ($this->user->isAuthenticated()) {
      $current_user_uuid = $this->entityTypeManager()
        ->getStorage('user')
        ->load($this->user->id())
        ->uuid();
      $meta['links']['me'] = ['meta' => ['id' => $current_user_uuid]];
      $cacheability->addCacheContexts(['user']);
      try {
        $me_url = Url::fromRoute(
          'jsonapi.user--user.individual',
          ['entity' => $current_user_uuid]
        )
          ->setAbsolute()
          ->toString(TRUE);
        $meta['links']['me']['href'] = $me_url->getGeneratedUrl();
        // The cacheability of the `me` URL is the cacheability of that URL
        // itself and the currently authenticated user.
        $cacheability = $cacheability->merge($me_url);
      } catch (RouteNotFoundException $e) {
        // Do not add the link if the route is disabled or marked as internal.
      }
    }

    /** @var \Drupal\Core\Extension\ModuleHandler $module_handler */
    $module_handler = \Drupal::service('module_handler');

    // Check svksk_api routing file to include custom jsonapi endpoints
    $this->indexJsonApiCustom($urls);

    if ($module_handler->moduleExists('jsonapi_views')) {
      // Check jsonapi_views routing file to include views jsonapi endpoints
      $this->indexJsonApiViews($urls);
    }

    if ($module_handler->moduleExists('jsonapi_search_api')) {
      // Include search_api jsonapi endpoints
      $this->indexJsonApiSearchIndex($urls);
    }

    $response = new CacheableResourceResponse(new JsonApiDocumentTopLevel(new ResourceObjectData([]), new NullIncludedData(), $urls, $meta));
    return $response->addCacheableDependency($cacheability);
  }

  /**
   * Helper function to index svksk custom jsonapi routes.
   *
   * @return array
   *   List of url
   */
  private function indexJsonApiCustom(&$urls) {
    $routing_yaml_file = \Drupal::service('extension.list.module')
        ->getPath('svksk_api') . '/svksk_api.routing.yml';
    $definitions = Yaml::decode(file_get_contents($routing_yaml_file));

    foreach ($definitions as $id => $definition) {
      if (strpos($id, 'svksk_api.jsonapi.') === 0) {
        /** @var \Symfony\Component\Routing\Route $route */
        if ($route = \Drupal::service('router.route_provider')
          ->getRouteByName($id)) {
          $defaults = $route->getDefaults();

          /** @var ResourceBase $resource */
          $resource = \Drupal::service('class_resolver')
            ->getInstanceFromDefinition($defaults['_jsonapi_resource']);
          assert($resource instanceof ResourceBase);
          $resource_type = $resource->getRouteResourceTypes($route, '');
          $label = $resource_type[0]->getTypeName();
          $url = Url::fromRoute($id)->setAbsolute();
          $urls = $urls->withLink($label, new Link(new CacheableMetadata(), $url, $label));
        }
      }
    }
  }

  /**
   * Helper function to index views jsonapi routes.
   *
   * @return array
   *   List of url
   */
  private function indexJsonApiViews(&$urls) {
    $views = Views::getEnabledViews();

    /** @var \Drupal\views\Entity\View $view */
    foreach ($views as $view) {
      foreach ($view->get('display') as $display) {
        if (isset($display['display_options']['display_extenders']['jsonapi_views'])) {
          if ($display['display_options']['display_extenders']['jsonapi_views']['enabled']) {
            $url = Url::fromRoute('jsonapi_views.' . $view->id() . '.' . $display['id'])
              ->setAbsolute();
            $label = 'views--' . $view->id() . '--' . $display['id'];
            $urls = $urls->withLink($label, new Link(new CacheableMetadata(), $url, $label));
          }
        }
      }
    }
  }

  /**
   * Helper function to index search api index routes.
   *
   * @return array
   *   List of url
   */
  private function indexJsonApiSearchIndex(&$urls) {
    $indexes = \Drupal::entityTypeManager()
      ->getStorage('search_api_index')
      ->loadMultiple();

    /** @var \Drupal\search_api\Entity\Index $index */
    foreach ($indexes as $index) {
      if ($index->status()) {
        $url = Url::fromRoute('jsonapi_search_api.index_' . $index->id())
          ->setAbsolute();
        $label = 'search-api--index--' . $index->id();
        $urls = $urls->withLink($label, new Link(new CacheableMetadata(), $url, $label));
      }
    }
  }

}
