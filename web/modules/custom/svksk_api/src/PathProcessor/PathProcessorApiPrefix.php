<?php

namespace Drupal\svksk_api\PathProcessor;

use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\Core\Language\LanguageInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\Core\PathProcessor\InboundPathProcessorInterface;
use Drupal\Core\PathProcessor\OutboundPathProcessorInterface;
use Drupal\Core\Render\BubbleableMetadata;
use Symfony\Component\HttpFoundation\Request;

/**
 * Processes JSON:API paths by adding or removing site JSON:API prefix.
 */
class PathProcessorApiPrefix implements OutboundPathProcessorInterface, InboundPathProcessorInterface {

  /**
   * JSON:API core path prefix
   *
   * @var string
   */
  private string $coreJsonApiPathPrefix;

  /**
   * JSON:API site path prefix
   *
   * @var string
   */
  private string $pathPrefix;

  /**
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  private LanguageManagerInterface $languageManager;

  public function __construct(ConfigFactoryInterface $config, LanguageManagerInterface $languageManager) {
    $this->languageManager = $languageManager;
    $this->coreJsonApiPathPrefix = '/' . $config->get('jsonapi_extras.settings')->get('path_prefix') ?? 'jsonapi';
    $this->pathPrefix = getenv('DRUPAL_API_PATH_PREFIX') ?? '';
  }

  /**
   * {@inheritdoc}
   */
  public function processOutbound($path, &$options = [], Request $request = NULL, BubbleableMetadata $bubbleable_metadata = NULL) {
    if (empty($this->pathPrefix)) {
      return $path;
    }

    if (str_starts_with($path, $this->coreJsonApiPathPrefix)) {
      $options['prefix'] = $this->pathPrefix . '/' . $options['prefix'];
    } else  if ($request && str_starts_with(trim($request->getRequestUri(), '/'), $this->pathPrefix) && !isset($options['language'])) {
      // Add language to url options if not present
      $language_url = $this->languageManager->getCurrentLanguage(LanguageInterface::TYPE_CONTENT);
      $options['language'] = $language_url;
    }

    return $path;
  }

  /**
   * {@inheritdoc}
   */
  public function processInbound($path, Request $request) {
    if (empty($this->pathPrefix)) {
      return $path;
    }

    $prefix = '/' . $this->pathPrefix;

    if (str_starts_with($path, $prefix)) {
      return substr($path, strlen($prefix));
    }

    return $path;
  }

}
