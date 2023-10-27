<?php

namespace Drupal\svksk_api\Plugin\LanguageNegotiation;

use Drupal\language\LanguageNegotiationMethodBase;
use Drupal\language\Plugin\LanguageNegotiation\LanguageNegotiationUrl;
use Symfony\Component\HttpFoundation\Request;

/**
 * Class for identifying language via JSON:API URL prefix or domain.
 *
 * @LanguageNegotiation(
 *   id = \Drupal\svksk_api\Plugin\LanguageNegotiation\LanguageNegotiationJsonapiUrl::METHOD_ID,
 *   types = {\Drupal\Core\Language\LanguageInterface::TYPE_INTERFACE,
 *   \Drupal\Core\Language\LanguageInterface::TYPE_CONTENT,
 *   \Drupal\Core\Language\LanguageInterface::TYPE_URL},
 *   weight = -7,
 *   name = @Translation("JSON:API URL"),
 *   description = @Translation("Language from the JSON:API URL (Path prefix or domain)."),
 * )
 */
class LanguageNegotiationJsonapiUrl extends LanguageNegotiationMethodBase {

  /**
   * The language negotiation method id.
   */
  const METHOD_ID = 'language-jsonapi-url';

  /**
   * JSON:API site path prefix
   *
   * @var string
   */
  private $jsonapiPathPrefix;

  public function __construct() {
    $this->jsonapiPathPrefix = getenv('DRUPAL_API_PATH_PREFIX') ?? '';
  }

  /**
   * {@inheritdoc}
   */
  public function getLangcode(Request $request = NULL) {
    $langcode = NULL;

    if (empty($this->jsonapiPathPrefix)) {
      return $langcode;
    }

    if ($request && $this->languageManager) {
      $languages = $this->languageManager->getLanguages();
      $config = $this->config->get('language.negotiation')->get('url');

      switch ($config['source']) {
        case LanguageNegotiationUrl::CONFIG_PATH_PREFIX:
          $request_path = urldecode(trim($request->getPathInfo(), '/'));
          $path_args = explode('/', $request_path);
          $prefix = array_shift($path_args);

          if ($prefix !== $this->jsonapiPathPrefix) {
            return $langcode;
          }

          $prefix = array_shift($path_args);

          // Search prefix within added languages.
          $negotiated_language = FALSE;
          foreach ($languages as $language) {
            if (isset($config['prefixes'][$language->getId()]) && $config['prefixes'][$language->getId()] == $prefix) {
              $negotiated_language = $language;
              break;
            }
          }

          if ($negotiated_language) {
            $langcode = $negotiated_language->getId();
          }
          break;
      }
    }

    return $langcode;
  }

}
