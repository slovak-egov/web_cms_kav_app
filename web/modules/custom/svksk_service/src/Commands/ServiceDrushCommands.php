<?php

namespace Drupal\svksk_service\Commands;

use Drupal\Core\Batch\BatchBuilder;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Logger\LoggerChannelFactoryInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\svksk_cmdb\ApiClient\ApiClientCmdbLocatorInterface;
use Drupal\svksk_service\ServiceImportBatchService;
use Drush\Commands\DrushCommands;
use Symfony\Component\Console\Helper\ProgressBar;

/**
 * Drush command service ServiceDrushCommands.
 *
 * @package Drupal\svksk_service\Commands
 */
class ServiceDrushCommands extends DrushCommands {

  use StringTranslationTrait;

  /**
   * Entity type service.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  private $entityTypeManager;

  /**
   * Logger service.
   *
   * @var \Drupal\Core\Logger\LoggerChannelFactoryInterface
   */
  private $loggerChannelFactory;

  /**
   * A logger instance.
   *
   * @var \Psr\Log\LoggerInterface
   */
  protected $logger;

  /**
   * @var \Drupal\svksk_cmdb\ApiClient\ApiClientCmdbLocatorInterface
   */
  protected $locatorApiClient;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   * @param \Drupal\Core\Logger\LoggerChannelFactoryInterface $logger_channel_factory
   * @param \Drupal\svksk_cmdb\ApiClient\ApiClientCmdbLocatorInterface $locator_api_client
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, LoggerChannelFactoryInterface $logger_channel_factory, ApiClientCmdbLocatorInterface $locator_api_client) {
    parent::__construct();
    $this->entityTypeManager = $entity_type_manager;
    $this->loggerChannelFactory = $logger_channel_factory;
    $this->locatorApiClient = $locator_api_client;
  }

  /**
   * Fetch services from eGov Locator.
   *
   * @command svksk-service:fetch-services
   * @aliases fetch-services
   *
   * @usage svksk-service:fetch-services
   *   Fetch current set of services and create a Service content node for each.
   */
  public function fetchServices() {
    $pageSize = 50;
    $page = 1;
    $this->output()->writeln($this->t('Fetching services from CMDB eGov Locator:'));
    $this->loggerChannelFactory->get('svksk_service')->info($this->t('Update nodes batch operations start'));

    $response = $this->fetchCmdbLocatorServices($pageSize);
    if (!$response || empty($response['items'])) {
      $this->logger->warning($this->t('No services to process.'));
      return;
    }

    $batchBuilder = new BatchBuilder();
    $numOperations = 0;
    $batchId = 0;

    // Process the batch.
    $fetchProgressBar = new ProgressBar($this->output(), $response['totalCount'] / $pageSize);
    $fetchProgressBar->advance();
    do {
      foreach ($response['items'] as $item) {
        $fetchProgressBar->setMessage($this->t('Preparing batch: ') . $batchId);
        $batchBuilder->addOperation([ServiceImportBatchService::class, 'process'], [
          $batchId,
          $item
        ]);
        $batchId++;
        $numOperations++;
      }
      // Fetch next page.
      $page++;
      $fetchProgressBar->advance();
      $response = $this->fetchCmdbLocatorServices($pageSize, $page);
    } while ($response && !empty($response['items']));
    $fetchProgressBar->finish();

    $batchBuilder
      ->setTitle($this->t('Updating @num node(s)', ['@num' => $numOperations,]))
      ->setFinishCallback([ServiceImportBatchService::class, 'finish'])
      ->setErrorMessage(t('Batch has encountered an error'));
    batch_set($batchBuilder->toArray());
    drush_backend_batch_process();
    $this->logger->notice($this->t('Batch operations end.'));
    $this->loggerChannelFactory->get('svksk_service')->info($this->t('Update batch operations end.'));
  }

  /**
   * Delete all imported services.
   *
   * @command svksk-service:delete-fetched-services
   * @aliases delete-fetched-services
   *
   * @usage svksk-service:delete-fetched-services
   *   Delete instances of fetched services.
   */
  public function deleteFetchedServices() {
    $storage = $this->entityTypeManager->getStorage('node');
    $query = $storage->getQuery();
    $query->accessCheck(FALSE);
    $query->condition('type', 'service');
    $query->exists('egov_service_id');
    $results = $query->execute();
    $nodes = $storage->loadMultiple($results);

    // Delete nodes.
    $storage->delete($nodes);
    $this->output()->writeln($this->t('Deleted @num services.', ['@num' => count($nodes)]));
  }

  /**
   * Fetch services from CMDB eGovLocator.
   *
   * @param int $pageSize
   * @param int $page
   *
   * @return array|null
   */
  private function fetchCmdbLocatorServices(int $pageSize = 10, int $page = 1) : ?array {
    try {
      $response = $this->locatorApiClient->get('egov-services', [
        'page' => $page,
        'page-size' => $pageSize,
        'filter' => "isServiceInstance==false"
      ]);
    } catch (\Exception $e) {
      $this->output()->writeln($e);
      $this->loggerChannelFactory->get('svksk_service')->warning($this->t('Error found @e', ['@e' => $e,]));
      return NULL;
    }
    return $response ?? NULL;
  }

}
