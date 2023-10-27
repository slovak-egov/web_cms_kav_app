<?php

namespace Drupal\svksk_service;

/**
 * Interface ServiceSyncManagerInterface.
 *
 * @package Drupal\svksk_service
 */
interface ServiceSyncManagerInterface {

  const DEFAULT_LANGCODE = 'sk';

  /**
   * Sync service from eGov API.
   *
   * @param string $serviceId
   * @param array $serviceData
   *
   * @return void
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function syncService(string $serviceId, array $serviceData) : void;

  /**
   * Create or reuse existing service categrory term.
   *
   * @param string $serviceCategoryId
   * @param string $name
   *
   * @return int
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function ensureServiceCategory(string $serviceCategoryId, string $name) : int;

}
