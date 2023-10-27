<?php

namespace Drupal\svksk_cmdb\Commands;

use Drupal\Core\Batch\BatchBuilder;
use Drupal\svksk_cmdb\BatchService;
use Drush\Exceptions\CommandFailedException;

/**
 * A drush command file.
 *
 * @package Drupal\svksk_cmdb\Commands
 */
class DrushCommands extends \Drush\Commands\DrushCommands {

  /**
   * Drush command that update entities CI id on CMDB.
   *
   * @command svksk-cmdb:ensure-ci
   *
   * @param $entity_type
   *    Single entity type to process, e.g. node.
   *
   * @option bundle
   *    Entity bundle to process, e.g. article.
   * @aliases svksk-eci
   * @usage svksk-eci node --bundle=article
   */
  public function ensure(string $entity_type, array $options = ['bundle' => NULL]) {
    /** @var \Drupal\Core\Entity\EntityTypeManager $entity_manager */
    $entity_manager = \Drupal::service('entity_type.manager');

    if (!in_array($entity_type, array_keys($entity_manager->getDefinitions()))) {
      throw new CommandFailedException(t('Entity type "@type" not exists.', ['@type' => $entity_type]));
    }

    /** @var \Drupal\Core\Entity\EntityTypeBundleInfo $bundle_manager */
    $bundle_manager = \Drupal::service('entity_type.bundle.info');
    $bundles = array_keys($bundle_manager->getBundleInfo($entity_type));
    /** @var \Drupal\Core\Entity\EntityTypeInterface $entity_definition */
    $entity_definition = $entity_manager->getDefinition($entity_type);
    $bundle_key = $entity_definition->getKey('bundle');

    $storage = $entity_manager->getStorage($entity_type);

    if (!empty($bundles) && $bundle_key) {
      if (in_array($options['bundle'], $bundles)) {
        $entities = $storage->loadByProperties([$bundle_key => $options['bundle']]);
      }
      else {
        throw new CommandFailedException(t('Bundle "@bundle" not exists for entity "@type".', [
          '@bundle' => $options['bundle'],
          '@type' => $entity_type,
        ]));
      }
    }
    else {
      $entities = $storage->loadMultiple();
    }

    if (!empty($entities)) {
      $total = count($entities);
      $batch_builder = new BatchBuilder();

      foreach ($entities as $entity) {
        $batch_builder->addOperation([BatchService::class, 'process'], [
          $entity,
          $total,
        ]);
      }

      $batch_builder->setFinishCallback([BatchService::class, 'finish']);

      batch_set($batch_builder->toArray());
      drush_backend_batch_process();
    }
  }

}
