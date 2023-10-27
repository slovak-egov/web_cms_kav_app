<?php

namespace Drupal\svksk_term;

use Drupal\Core\Entity\ContentEntityForm;
use Drupal\Core\Form\FormStateInterface;

/**
 * Form handler for the custom block edit forms.
 *
 * @internal
 */
class TermEntityForm extends ContentEntityForm {

  /**
   * The block content entity.
   *
   * @var \Drupal\block_content\BlockContentInterface
   */
  protected $entity;

  /**
   * {@inheritdoc}
   */
  public function save(array $form, FormStateInterface $form_state) {
    $term = $this->entity;

    $insert = $term->isNew();
    $term->save();
    $context = ['@type' => $this->t(ucfirst($term->bundle())), '%info' => $term->label()];
    $logger = $this->logger('svkvk_term');
    $t_args = [
      '@type' => $this->t(ucfirst($term->getEntityTypeId())),
      '%info' => $term->label(),
    ];

    if ($insert) {
      $logger->notice('@type: added %info.', $context);
      $this->messenger()
        ->addStatus($this->t('@type %info has been created.', $t_args));
    }
    else {
      $logger->notice('@type: updated %info.', $context);
      $this->messenger()
        ->addStatus($this->t('@type %info has been updated.', $t_args));
    }

    if ($term->id()) {
      $form_state->setRedirectUrl($term->toUrl('collection'));
    }
    else {
      $this->messenger()->addError($this->t('The term could not be saved.'));
      $form_state->setRebuild();
    }
  }

}
