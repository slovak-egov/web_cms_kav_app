<?php

namespace Drupal\svksk_base;

use Drupal\Component\Serialization\Json;
use Drupal\Core\Entity\EntityTypeManager;
use Drupal\Core\KeyValueStore\KeyValueFactory;
use Drupal\Core\Session\AccountInterface;
use Drupal\Core\Url;
use Drupal\next\Entity\NextSiteInterface;
use mysql_xdevapi\Exception;
use Symfony\Component\Translation\Exception\NotFoundResourceException;
use GuzzleHttp\Client;

/**
 * References service to build and maintain index of content references used
 * to invalidate related content.
 */
class FrontendRebuildManager {

  /**
   * Allowed data keys from frontend rebuild status.
   */
  const DATA_KEY_VALUE_ALLOWED = [
    'state',
    'last_started_timestamp',
    'last_started_by',
    'last_started_count',
    'last_started_progress',
    'finished_timestamp',
    'finished_by'
  ];

  /**
   * Minimum time allowed to refetch status again.
   */
  const REFETCH_INTERVAL = 15;

  const REBUILD_RESPONSE_FAILED = 500;
  const REBUILD_RESPONSE_INVALID_SECRET = 401;
  const REBUILD_RESPONSE_REBUILD_STARTED = 200;
  const REBUILD_RESPONSE_REBUILD_ALREADY_RUNNING = 201;

  /**
   * The entity manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManager
   */
  protected $entityTypeManager;

  /**
   * @var \GuzzleHttp\Client
   */
  protected $httpClient;

  /**
   * @var \Drupal\Core\Session\AccountInterface
   */
  protected $currentUser;

  /**
   * @var \Drupal\Core\KeyValueStore\KeyValueStoreInterface
   */
  protected $keyValueStorage;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManager $entity_manager
   * @param \GuzzleHttp\Client $http_client
   * @param \Drupal\Core\Session\AccountInterface $current_user
   * @param \Drupal\svksk_base\KeyValueFactory $key_value
   */
  public function __construct(EntityTypeManager $entity_manager, Client $http_client, AccountInterface $current_user, KeyValueFactory $key_value) {
    $this->entityTypeManager = $entity_manager;
    $this->httpClient = $http_client;
    $this->currentUser = $current_user;
    $this->keyValueStorage = $key_value->get('skvsk_frontend_rebuild_status');
  }

  /**
   * @return array|null
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function startRebuild(): ?int
  {
    $next_site = $this->getNextSite();
    $rebuild_secret = getenv('NEXT_REBUILD_SECRET');

    // Check if the rebuild secret is available
    if (!$rebuild_secret) {
      // Log an error or throw an exception if needed
      \Drupal::logger('your_module')->error('NEXT_REBUILD_SECRET is not set');
      return self::REBUILD_RESPONSE_INVALID_SECRET;
    }

    $url = Url::fromUri("{$next_site->getBaseUrl()}/api/rebuild", [
      'query' => [
        'secret' => $rebuild_secret,
        'uid' => $this->currentUser->id(),
      ],
    ])->toString();

    try {
      $response = $this->httpClient->get($url);

      // Log the response status code for debugging
      \Drupal::logger('your_module')->info('Rebuild request response status: ' . $response->getStatusCode());

      if (in_array($response->getStatusCode(), [
        self::REBUILD_RESPONSE_REBUILD_STARTED,
        self::REBUILD_RESPONSE_REBUILD_ALREADY_RUNNING,
      ])) {
        $data = Json::decode($response->getBody());
        $status = $data['rebuild_status'] ?? NULL;
        if ($status) {
          $this->storeRebuildStatus($status);
        }
        $this->keyValueStorage->set('last_fetch', time());
      }

      return $response->getStatusCode();
    } catch (\Exception $e) {
      // Log the exception for debugging
      \Drupal::logger('your_module')->error('Rebuild request failed: ' . $e->getMessage());

      // Handle the exception as needed, e.g., rethrow it if required
      // throw $e;

      return NULL;
    }
  }

  /**
   * @return array|null
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function fetchRebuildStatus() : ?array {
    if ($this->keyValueStorage->get('last_fetch', 0) > (time() - self::REFETCH_INTERVAL)) {
      return $this->getStoredRebuildStatus();
    }
    $next_site = $this->getNextSite();
    $rebuild_secret = getenv('NEXT_REBUILD_SECRET');
    $url = Url::fromUri("{$next_site->getBaseUrl()}/api/rebuild-status", [
      'query' => [
        'secret' => $rebuild_secret,
      ],
    ])->toString();

    try {
      $response = $this->httpClient->get($url);
      if ($response->getStatusCode() != 200) {
        throw new \Exception('Error response');
      }
      $data = Json::decode($response->getBody());
      $status = $data['rebuild_status'] ?? NULL;
      if ($status) {
        $this->storeRebuildStatus($status);
      }
      $this->keyValueStorage->set('last_fetch', time());
      return $status;
    } catch (\Exception $e) {
      // Log nothing and return NULL
    }
    return NULL;
  }

  /**
   * Store rebuild state in the key_value storage.
   *
   * @param array $data
   *
   * @return array
   * @throws \Exception
   */
  protected function storeRebuildStatus(array $data) : array {
    foreach (self::DATA_KEY_VALUE_ALLOWED as $key) {
      if (!array_key_exists($key, $data)) {
        $this->keyValueStorage->delete($key);
      }
      $this->keyValueStorage->set($key, $data[$key]);
    }
    return $data;
  }

  protected function getStoredRebuildStatus() : array {
    $data = [];
    foreach (self::DATA_KEY_VALUE_ALLOWED as $key) {
      $data[$key] = $this->keyValueStorage->get($key);
    }
    return $data;
  }

  /**
   * @return \Drupal\next\Entity\NextSiteInterface
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  protected function getNextSite() : NextSiteInterface {
    $next_site = $this->entityTypeManager
      ->getStorage('next_site')
      ->load(Defaults::NEXT_SITE_ID);
    if (!$next_site) {
      throw new NotFoundResourceException('No Next site config found.');
    }
    return $next_site;
  }

}
