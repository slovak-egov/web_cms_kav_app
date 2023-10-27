<?php

namespace Drupal\svksk_content\Plugin\views\field;

use Drupal\views\Plugin\views\display\DisplayPluginBase;
use Drupal\views\Plugin\views\field\Date;
use Drupal\views\ResultRow;
use Drupal\views\ViewExecutable;

/**
 * Display published at date and time.
 *
 * @ViewsField("svksk_content_published_at")
 */
class PublishedAt extends Date {

  /**
   * {@inheritdoc}
   */
  public function init(ViewExecutable $view, DisplayPluginBase $display, array &$options = NULL) {
    parent::init($view, $display, $options);

    $this->additional_fields['status'] = 'status';
  }

  /**
   * {@inheritdoc}
   */
  public function render(ResultRow $values) {
    $node_status = $this->getValue($values, 'status');
    if ($node_status) {
      return parent::render($values);
    }
    else {
      return NULL;
    }
  }

}
