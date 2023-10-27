<?php

namespace Drupal\svksk_api\Controller;

use Drupal\Core\Language\LanguageInterface;
use Drupal\next_jsonapi\Controller\EntityResource as NextJsonApiEntityResource;
use Symfony\Component\HttpFoundation\Request;
use Drupal\jsonapi\ResourceType\ResourceType;

/**
 * Process all entity requests.
 */
class EntityResource extends NextJsonApiEntityResource {

  /**
   * {@inheritdoc}
   */
  protected function getJsonApiParams(Request $request, ResourceType $resource_type) {
    $filters = $request->query->all('filter');
    // Replace filter value keyword 'CURRENT_LANGCODE' with current request langcode
    if (isset($filters['langcode']) && $filters['langcode'] === 'CURRENT_LANGCODE') {
      $filters['langcode'] = \Drupal::languageManager()->getCurrentLanguage(LanguageInterface::TYPE_CONTENT)->getId();
    }
    if (!empty($filters)) {
      $request->query->set('filter', $filters);
    }
    $params = parent::getJsonApiParams($request, $resource_type);
    return $params;
  }

}
