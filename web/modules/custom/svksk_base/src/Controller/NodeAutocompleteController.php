<?php

namespace Drupal\svksk_base\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Drupal\Component\Utility\Xss;

/**
 * Defines a route controller for watches autocomplete form elements.
 */
class NodeAutoCompleteController extends ControllerBase {

  /**
   * The node storage.
   *
   * @var \Drupal\node\NodeStorage
   */
  protected $nodeStorage;

  /**
   * {@inheritdoc}
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager) {
    $this->nodeStorage = $entity_type_manager->getStorage('node');
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager')
    );
  }

  /**
   * Handler for autocomplete request.
   */
  public function handleAutocomplete(Request $request) {
    $results = [];
    $input = $request->query->get('q');

    // Get the typed string from the URL, if it exists.
    if (!$input) {
      return new JsonResponse($results);
    }

    $input = Xss::filter($input);
    $query = $this->nodeStorage->getQuery()
      ->condition('type', 'page')
      ->condition('title', $input, 'CONTAINS')
      ->condition('status', '0', '<>')
      ->groupBy('nid')
      ->sort('created', 'DESC')
    ->range(0, 10)
      ->accessCheck(true);
    $ids = $query->execute();
    $nodes = $ids ? $this->nodeStorage->loadMultiple($ids) : [];

    foreach ($nodes as $node) {
      $label = [
        $node->getTitle(),
        '<small>(' . $node->uuid() . ')</small>',
      ];

      $value = $node->getTitle().' ('.$node->uuid().')';

      $results[] = [
        'value' => $value,
        'label' => implode(' ', $label),
      ];
    }

    return new JsonResponse($results);
  }
}