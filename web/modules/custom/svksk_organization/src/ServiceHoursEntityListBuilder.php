<?php

namespace Drupal\svksk_organization;

use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityListBuilder;
use Drupal\Core\Entity\EntityStorageInterface;
use Drupal\Core\Entity\EntityTypeInterface;
use Drupal\Core\Link;

/**
 * Defines a class to build a listing of Corporate Body entities.
 *
 * @ingroup svksk_organization
 */
class ServiceHoursEntityListBuilder extends EntityListBuilder {

  /**
   * @var \Drupal\Core\Entity\EntityInterface
   */
  protected $organizationalUnitEntity;

  /**
   * Constructs a new EntityListBuilder object.
   *
   * @param \Drupal\Core\Entity\EntityTypeInterface $entity_type
   *   The entity type definition.
   * @param \Drupal\Core\Entity\EntityStorageInterface $storage
   *   The entity storage class.
   * @param \Drupal\Core\Entity\EntityInterface|null $organizational_unit
   */
  public function __construct(EntityTypeInterface $entity_type, EntityStorageInterface $storage, EntityInterface $organizational_unit = NULL) {
    parent::__construct($entity_type, $storage);
    if ($organizational_unit) {
      $this->organizationalUnitEntity = $organizational_unit;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function buildHeader() {
    $header['category'] = $this->t('Category');
    $header['day_of_week'] = $this->t('Day of Week');
    $header['label'] = $this->t('Name');
    $header['description'] = $this->t('Description');
    return $header + parent::buildHeader();
  }

  /**
   * {@inheritdoc}
   */
  public function buildRow(EntityInterface $entity) {
    $row['category'] = $entity->getServiceHoursCategory()->label();
    $row['day_of_week'] = $entity->getDayOfWeekValue();
    $row['label'] = Link::fromTextAndUrl(
      $entity->label(),
      $entity->toUrl()
    );
    $row['description'] = $entity->get('description')->value;
    return $row + parent::buildRow($entity);
  }

  /**
   * {@inheritdoc}
   */
  protected function getEntityIds() {
    $query = $this->getStorage()->getQuery()
      ->accessCheck(TRUE)
      ->sort('day_of_week');

    if ($this->organizationalUnitEntity) {
      $service_hour_category_ids = array_map(function($item) {
        return $item['target_id'];
      }, $this->organizationalUnitEntity->get('service_hours_categories')->getValue());
      if (empty($service_hour_category_ids)) {
        return [];
      }
      $query->condition('service_hours_category_id', $service_hour_category_ids, 'IN');
      $query->sort('service_hours_category_id');
    }

    // Only add the pager if a limit is specified.
    if ($this->limit) {
      $query->pager($this->limit);
    }
    return $query->execute();
  }

}
