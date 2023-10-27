<?php

/**
 * @file
 * Contains \Drupal\svksk_content\Controller\ContentController.
 */

namespace Drupal\svksk_content\Controller;

use Drupal\comment\Controller\CommentController;
use Drupal\Core\Access\AccessResult;
use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Session\AccountInterface;
use Drupal\node\Entity\Node;
use Symfony\Component\HttpFoundation\Request;

/**
 * Controller routines for dashboard.
 */
class ContentController extends ControllerBase {

  /**
   * Comments tabs.
   *
   * @param \Drupal\node\Entity\Node $node
   * @param \Symfony\Component\HttpFoundation\Request $request
   *
   * @return array
   */
  public function comments(Node $node, Request $request) {
    $build = [
      'content' => \Drupal::entityTypeManager()
        ->getViewBuilder('node')
        ->view($node, 'comments'),
    ];

    return $build;
  }

  /**
   * Checks access for a specific request.
   *
   * @param \Drupal\node\Entity\Node $node
   * @param \Drupal\Core\Session\AccountInterface $account
   *
   * @return \Drupal\Core\Access\AccessResultInterface
   */
  public function access(Node $node, AccountInterface $account) {
    return AccessResult::allowedIf($account->hasPermission('create ' . $node->bundle() . ' content') && $node->hasField('comment'));
  }

  /**
   * Get reply form.
   *
   * @param \Symfony\Component\HttpFoundation\Request $request
   * @param \Drupal\Core\Entity\EntityInterface $entity
   * @param $field_name
   * @param $pid
   *
   * @return array
   */
  public function getReplyForm(Request $request, EntityInterface $entity, $field_name, $pid = NULL) {
    $build = \Drupal::service('class_resolver')
      ->getInstanceFromDefinition(CommentController::class)
      ->getReplyForm($request, $entity, $field_name, $pid);
    return [
      '#type' => 'container',
      '#attributes' => [
        'class' => ['node__comments'],
      ],
    ] + $build;
  }

}
