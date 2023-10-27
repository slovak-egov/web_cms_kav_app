<?php

namespace Drupal\svksk_ui_translations;

use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityListBuilder;
use Drupal\Core\Link;

/**
 * Defines a class to build a listing of Translated string entities.
 *
 * @ingroup svksk_ui_translations
 */
class TranslationEntityListBuilder extends EntityListBuilder {

  /**
   * {@inheritdoc}
   */
  public function buildHeader() {
    $header['label'] = $this->t('Key');
    return $header + parent::buildHeader();
  }

  /**
   * {@inheritdoc}
   */
  public function buildRow(EntityInterface $entity) {
    /* @var \Drupal\svksk_ui_translations\Entity\TranslationEntity $entity */
    $row['label'] = Link::createFromRoute(
      $entity->get('machine_name')->value,
      'entity.svksk_ui_translation.edit_form',
      ['svksk_ui_translation' => $entity->id()]
    );
    return $row + parent::buildRow($entity);
  }

}
