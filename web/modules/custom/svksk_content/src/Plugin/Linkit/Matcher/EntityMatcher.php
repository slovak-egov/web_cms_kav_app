<?php

namespace Drupal\svksk_content\Plugin\Linkit\Matcher;

use Drupal\Core\Entity\EntityInterface;
use Drupal\linkit\MatcherTokensTrait;

/**
 * Provides custom linkit matchers for all entity types.
 *
 * @Matcher(
 *   id = "svksk_entity",
 *   label = @Translation("SVKSK: Entity"),
 *   deriver = "\Drupal\linkit\Plugin\Derivative\EntityMatcherDeriver"
 * )
 */
class EntityMatcher extends \Drupal\linkit\Plugin\Linkit\Matcher\EntityMatcher {

  use MatcherTokensTrait;

  /**
   * {@inheritdoc}
   */
  protected function buildPath(EntityInterface $entity) {
    $path = $entity->toUrl()->toString();

    if ($entity->getEntityTypeId() == 'media') {
      $path = parent::buildPath($entity);
    }

    return $path;
  }

}
