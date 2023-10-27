<?php

namespace Drupal\svksk_term\Plugin\views\filter;

use Drupal\Core\Form\FormStateInterface;

/**
 * Filter by term id.
 *
 * @ingroup views_filter_handlers
 *
 * @ViewsFilter("svksk_taxonomy_index_tid")
 */
class TaxonomyIndexTid extends \Drupal\taxonomy\Plugin\views\filter\TaxonomyIndexTid {

  const SVKSK_TERM_CATEGORY_NONE = 'None';

  /**
   * {@inheritdoc}
   */
  protected function valueForm(&$form, FormStateInterface $form_state) {
    parent::valueForm($form, $form_state);

    $form['value']['#options'][self::SVKSK_TERM_CATEGORY_NONE] = '- ' . t('Without category') . ' -';

    ksort($form['value']['#options']);
  }

  /**
   * {@inheritdoc}
   */
  protected function valueValidate($form, FormStateInterface $form_state) {
    parent::valueForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function query() {
    if ($this->value[0] == self::SVKSK_TERM_CATEGORY_NONE) {
      $this->operator = 'empty';
      $this->opEmpty();
    }
    else {
      parent::query();
    }
  }

}
