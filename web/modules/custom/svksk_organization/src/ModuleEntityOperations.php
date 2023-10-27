<?php

namespace Drupal\svksk_organization;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\svksk_content\ReferencesService;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Defines custom operations triggered in entity hooks.
 *
 * @internal
 */
class ModuleEntityOperations implements ContainerInjectionInterface {

  use StringTranslationTrait;

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\svksk_content\ReferencesService
   */
  protected $contentReferences;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, ReferencesService $svksk_content_references) {
    $this->entityTypeManager = $entity_type_manager;
    $this->contentReferences = $svksk_content_references;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
      $container->get('svksk_content.references'),
    );
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   */
  public function entityPhysicalAddressPresave(EntityInterface $entity) : void {
    $formatted_address = [];

    $formatted_address[] = sprintf("%s %s",
      $entity->get('street_name')->value ?: '',
      $entity->get('building_number')->value ?: '');

    $formatted_address[] = sprintf("%s %s",
      $entity->get('zip_code')->value ?: '',
      !$entity->get('municipality_id')->isEmpty() ? $entity->get('municipality_id')->referencedEntities()[0]->label() : '');

    $entity->set('formatted_address', implode("\n", $formatted_address));
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function entityTimeIntervalPresave(EntityInterface $entity) : void {
    if ($entity->isNew()) {
      return;
    }
    $service_hours_entities = $this->entityTypeManager
      ->getStorage('service_hours')
      ->loadByProperties(['time_intervals' => $entity->id()]);
    $service_hours = reset($service_hours_entities);
    if (!$service_hours) {
      return;
    }

    $organizational_units = $this->getOrganizationalUnitsByServiceHours($service_hours);
    foreach ($organizational_units as $organizational_unit) {
      $this->contentReferences
        ->revalidateEntityReferences($organizational_unit);
    }
  }

  /**
   * @param \Drupal\Core\Entity\EntityInterface $entity
   *
   * @return void
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function entityServiceHoursPresave(EntityInterface $entity) : void {
    $organizational_units = $this->getOrganizationalUnitsByServiceHours($entity);
    foreach ($organizational_units as $organizational_unit) {
      $this->contentReferences
        ->revalidateEntityReferences($organizational_unit);
    }
  }

  /**
   * Get Orgnizational Unit entity based on provided Service Hours entity.
   * @param \Drupal\Core\Entity\EntityInterface $service_hours
   *
   * @return array
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  protected function getOrganizationalUnitsByServiceHours(EntityInterface $service_hours) : array {
    $categories = array_map(function($item) {
      return $item['target_id'];
    }, $service_hours->get('service_hours_category_id')->getValue());
    $category = reset($categories);
    if (!$category) {
      return [];
    }

    $organizational_units = $this->entityTypeManager
      ->getStorage('organizational_unit')
      ->loadByProperties(['service_hours_categories' => $category]);
    return $organizational_units;
  }

}
