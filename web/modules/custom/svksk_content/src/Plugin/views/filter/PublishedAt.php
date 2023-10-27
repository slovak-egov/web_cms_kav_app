<?php

namespace Drupal\svksk_content\Plugin\views\filter;

use Drupal\views\Plugin\views\filter\Date;

/**
 * Filter handler for the published at.
 *
 * @ingroup views_filter_handlers
 *
 * @ViewsFilter("svksk_content_published_at")
 */
class PublishedAt extends Date {

  /**
   * @inerhitDoc
   */
  public function query() {
    parent::query();

    $table = $this->ensureMyTable();
    $this->query->addWhereExpression($this->options['group'], "$table.status = 1");
  }

  /**
   * @inerhitDoc
   */
  protected function opSimple($field) {
    $value = (int) strtotime($this->value['value'], 0);

    if ($this->operator === '=') {
      $a = $value;
      $b = $value + (24 * 60 * 60 - 1);
      $this->query->addWhereExpression($this->options['group'], "($field >= $a AND $field <= $b)");
      return;
    }

    if (!empty($this->value['type']) && $this->value['type'] == 'offset') {
      // Keep sign.
      $value = '***CURRENT_TIME***' . sprintf('%+d', $value);
    }

    if ($this->operator === '>') {
      $value += (24 * 60 * 60 - 1);
    }

    // This is safe because we are manually scrubbing the value.
    // It is necessary to do it this way because $value is a formula when using an offset.
    $this->query->addWhereExpression($this->options['group'], "$field $this->operator $value");
  }

}
