<?php

/**
 * @file
 * Contains \Drupal\svksk_base\Controller\DashboardController.
 */

namespace Drupal\svksk_base\Controller;

use Drupal\Core\Controller\ControllerBase;
use Symfony\Component\HttpFoundation\RedirectResponse;

/**
 * Controller routines for dashboard.
 */
class DashboardController extends ControllerBase {

  public function dashboard() {
    $build = [];

    if ($this->currentUser()->hasPermission('access content overview')) {
      return new RedirectResponse("admin/content");
    }
    elseif ($this->currentUser()->hasPermission('administer users')) {
      return $this->redirect('entity.user.collection');
    }

    return $build;
  }

}
