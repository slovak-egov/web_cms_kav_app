<?php

namespace Drupal\svksk_api\Resource;

use Drupal\Core\Cache\CacheableMetadata;
use Drupal\Core\Cache\CacheBackendInterface;
use Drupal\Core\Config\ConfigFactory;
use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\File\FileSystemInterface;
use Drupal\Core\File\FileUrlGeneratorInterface;
use Drupal\jsonapi\JsonApiResource\LinkCollection;
use Drupal\jsonapi\JsonApiResource\ResourceObject;
use Drupal\jsonapi\JsonApiResource\ResourceObjectData;
use Drupal\jsonapi\ResourceType\ResourceType;
use Drupal\jsonapi\ResourceType\ResourceTypeAttribute;
use Drupal\jsonapi_resources\Resource\ResourceBase;
use Drupal\svksk_cmdb\ApiClient\ApiClientCmdbInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Route;

/**
 * Processes a request for general settings..
 *
 * @internal
 */
class GeneralConfig extends ResourceBase implements ContainerInjectionInterface {

  const UPVS_CMS_MAX_MINUTES_USER_INACTIVITY = '6f787e76-e5cb-3048-bcd0-34b01c209b91';

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\Core\Config\ConfigFactory
   */
  protected $configFactory;

  /**
   * @var \Drupal\Core\File\FileUrlGeneratorInterface
   */
  protected $fileUrlGenerator;

  protected $fileSystem;

  /**
   * @var \Drupal\svksk_cmdb\ApiClient\ApiClientCmdbInterface
   */
  protected $apiClient;

  /**
   * @var \Drupal\Core\Cache\CacheBackendInterface
   */
  protected $cache;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   * @param \Drupal\Core\Config\ConfigFactory $config_factory
   * @param \Drupal\Core\File\FileUrlGeneratorInterface $file_url_generator
   * @param \Drupal\svksk_cmdb\ApiClient\ApiClientCmdbInterface $api_client
   * @param \Drupal\Core\Cache\CacheBackendInterface $cache
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, ConfigFactory $config_factory, FileUrlGeneratorInterface $file_url_generator, FileSystemInterface $file_system, ApiClientCmdbInterface $api_client, CacheBackendInterface $cache) {
    $this->entityTypeManager = $entity_type_manager;
    $this->configFactory = $config_factory;
    $this->fileUrlGenerator = $file_url_generator;
    $this->fileSystem = $file_system;
    $this->apiClient = $api_client;
    $this->cache = $cache;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
      $container->get('config.factory'),
      $container->get('file_url_generator'),
      $container->get('file_system'),
      $container->get('cmdb_api_client'),
      $container->get('cache.default'),
    );
  }

  /**
   * Process the resource request.
   *
   * @param \Symfony\Component\HttpFoundation\Request $request
   *   The request.
   * @param \Drupal\jsonapi\ResourceType\ResourceType[] $resource_types
   *   The route resource types.
   *
   * @return \Drupal\jsonapi\ResourceResponse
   *   The response.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function process(Request $request, array $resource_types) {
    $site_config = $this->configFactory->get('system.site');
    $config = $this->configFactory->get('svksk_base.general_settings');
    $resource_type = reset($resource_types);

    if (!empty($config->get('front_page_node'))) {
      preg_match_all('/\(([^)]*)\)[^(]*$/', $config->get('front_page_node'), $front_page_node);
    }

    if (!empty($config->get('cookies_settings_node'))) {
      preg_match_all('/\(([^)]*)\)[^(]*$/', $config->get('cookies_settings_node'), $cookies_settings_node);
    }

    $front_page_image_fid = $config->get('front_page_image') ? $config->get('front_page_image')[0] : NULL;
    $fields = [
      'version' => getenv('CMS_VERSION') ?: NULL,
      'frontPageNode' => isset($front_page_node[1][0]) ? $front_page_node[1][0] : NULL,
      'frontPageImage' => $this->getFileUrlFromFid($front_page_image_fid),
      'frontPageImageBlur' => $this->getBase64FileFromFid($front_page_image_fid, 'blurry_nano'),
      'egovHeaderTriggerLink1' => $config->get('egov_header_trigger_link_1'),
      'egovHeaderTriggerLink2' => $config->get('egov_header_trigger_link_2'),
      'egovHeaderTriggerLink1Short' => $config->get('egov_header_trigger_link_1_short'),
      'egovHeaderTriggerLink2Short' => $config->get('egov_header_trigger_link_2_short'),
      'egovHeaderTitle1' => $config->get('egov_header_title_1'),
      'egovHeaderText1' => $config->get('egov_header_text_1'),
      'egovHeaderTitle2' => $config->get('egov_header_title_2'),
      'egovHeaderText2' => $config->get('egov_header_text_2'),
      'headerLogo' => $this->getFileUrlFromFid($config->get('header_logo') ? $config->get('header_logo')[0] : NULL),
      'headerLogoTitle' => $config->get('header_logo_title'),
      'headerLogoSubtitle' => $config->get('header_logo_subtitle'),
      'headerLogoTitleShort' => $config->get('header_logo_title_short'),
      'headerLogoSubtitleShort' => $config->get('header_logo_subtitle_short'),
      'footerClaim' => $config->get('footer_claim'),
      'footerLogo' => $this->getFileUrlFromFid($config->get('footer_logo') ? $config->get('footer_logo')[0] : NULL),
      'footerLogoAlt' => $config->get('footer_logo_alt'),
      'cookiesSettingsNode' => isset($cookies_settings_node[1][0]) ? $cookies_settings_node[1][0] : NULL,
      'cookiesLifespan' => $config->get('cookies_lifespan') ?? 1,
      'userInactivityLimit' => $this->getUserInactivityLimit(),
      'feedbackFormReportUUID' => $config->get('feedback_form_report_uuid'),
    ];

    $primary_data = new ResourceObject($config, $resource_type, $site_config->get('uuid'), NULL, $fields, new LinkCollection([]));
    $top_level_data = new ResourceObjectData([$primary_data], 1);
    $response = $this->createJsonapiResponse($top_level_data, $request);
    $response->addCacheableDependency((new CacheableMetadata())->addCacheTags(['config:svksk_base.general_settings']));

    return $response;
  }

  /**
   * {@inheritdoc}
   */
  public function getRouteResourceTypes(Route $route, string $route_name): array {
    $fields = [
      'version' => new ResourceTypeAttribute('version'),
      'frontPageNode' => new ResourceTypeAttribute('frontPageNode'),
      'frontPageImage' => new ResourceTypeAttribute('frontPageImage'),
      'egovHeaderTriggerLink1' => new ResourceTypeAttribute('egovHeaderTriggerLink1'),
      'egovHeaderTriggerLink2' => new ResourceTypeAttribute('egovHeaderTriggerLink2'),
      'egovHeaderTriggerLink1Short' => new ResourceTypeAttribute('egovHeaderTriggerLink1Short'),
      'egovHeaderTriggerLink2Short' => new ResourceTypeAttribute('egovHeaderTriggerLink2Short'),
      'egovHeaderTitle1' => new ResourceTypeAttribute('egovHeaderTitle1'),
      'egovHeaderText1' => new ResourceTypeAttribute('egovHeaderText1'),
      'egovHeaderTitle2' => new ResourceTypeAttribute('egovHeaderTitle2'),
      'egovHeaderText2' => new ResourceTypeAttribute('egovHeaderText2'),
      'headerLogo' => new ResourceTypeAttribute('headerLogo'),
      'headerLogoTitle' => new ResourceTypeAttribute('headerLogoTitle'),
      'headerLogoSubtitle' => new ResourceTypeAttribute('headerLogoSubtitle'),
      'headerLogoTitleShort' => new ResourceTypeAttribute('headerLogoTitleShort'),
      'headerLogoSubtitleShort' => new ResourceTypeAttribute('headerLogoSubtitleShort'),
      'footerClaim' => new ResourceTypeAttribute('footerClaim'),
      'footerLogo' => new ResourceTypeAttribute('footerLogo'),
      'footerLogoAlt' => new ResourceTypeAttribute('footerLogoAlt'),
      'cookiesSettingsNode' => new ResourceTypeAttribute('cookiesSettingsNode'),
      'cookiesLifespan' => new ResourceTypeAttribute('cookiesLifespan'),
      'userInactivityLimit' => new ResourceTypeAttribute('userInactivityLimit'),
      'feedbackFormReportUUID' => new ResourceTypeAttribute('feedbackFormReportUUID'),
    ];

    $resource_type = new ResourceType('config', 'general', NULL, FALSE, TRUE, TRUE, FALSE, $fields);
    $resource_type->setRelatableResourceTypes([]);

    return [$resource_type];
  }

  /**
   * Function to return file url for fid param
   *
   * @param $fid
   *
   * @return string|null
   */
  private function getFileUrlFromFid($fid) {
    if (!$fid) {
      return NULL;
    }

    /** @var \Drupal\file\FileInterface $file */
    $image = $this->entityTypeManager->getStorage('file')->load($fid);
    return $image ? $this->fileUrlGenerator->generateAbsoluteString($image->getFileUri()) : NULL;
  }

  private function getImageStyleUrlFromFid($fid, $image_style) {
    if (!$fid) {
      return NULL;
    }

    /** @var \Drupal\file\FileInterface $file */
    $file = $this->entityTypeManager->getStorage('file')->load($fid);

    if (!$file) {
      return NULL;
    }

    $image_style = $this->entityTypeManager->getStorage('image_style')->load($image_style);
    $image_uri = $file->getFileUri();
    $derivative_uri = $image_style->buildUri($image_uri);
    if (!file_exists($derivative_uri)) {
      $image_style->createDerivative($image_uri, $derivative_uri);
    }
    return $this->fileUrlGenerator->generateAbsoluteString($derivative_uri);
  }

  private function getBase64FileFromFid($fid, $image_style = NULL) {
    if ($image_style) {
      $absolute_url = $this->getImageStyleUrlFromFid($fid, $image_style);
    } else {
      $absolute_url = $this->getFileUrlFromFid($fid);
    }

    if (!$absolute_url) {
      return NULL;
    }

    /** @var \Drupal\file\FileInterface $file */
    $image = $this->entityTypeManager->getStorage('file')->load($fid);
    $image_type = $image->getMimeType();

    // Encode image in base64 format.
    $image_file = file_get_contents($absolute_url);
    $base_64_image = base64_encode($image_file);
    return "data:{$image_type};base64,{$base_64_image}";
  }

  /**
   * Function to fetch user inactivity limit from CMDB endpoint
   *
   * @return string|null
   */
  private function getUserInactivityLimit() {
    $limit = NULL;
    $cache_id = 'svksk_api:user_inactivity_limit';

    if ($cache = $this->cache->get($cache_id)) {
      return $cache->data['value'];
    }

    try {
      $response = $this->apiClient->get('system-parameters/' . self::UPVS_CMS_MAX_MINUTES_USER_INACTIVITY);
      $limit = $response['value'];
      $this->cache->set($cache_id, $response, \Drupal::time()->getRequestTime() + 3600);
    } catch (\Exception $e) {

    }

    return $limit;
  }

}
