<?php

namespace Drupal\svksk_base;

use Drupal\Component\Utility\NestedArray;
use Drupal\Core\Language\LanguageInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\Core\Path\PathMatcherInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\Core\Url;

/**
 * Class LanguageSwitcher.
 */
class LanguageSwitcher {

  use StringTranslationTrait;

  /**
   * Language manager.
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  protected $languageManager;

  /**
   * Path matcher service.
   *
   * @var \Drupal\Core\Path\PathMatcherInterface
   */
  protected $pathMatcher;

  /**
   * Id of the current language.
   *
   * @var \Drupal\Core\Language\LanguageInterface
   */
  protected $currentLanguage;

  /**
   * List of the available languages.
   *
   * @var \Drupal\Core\Language\LanguageInterface[]
   */
  protected $languages;

  /**
   * Current route name.
   *
   * @var string
   */
  protected $route;

  /**
   * RenderBuilder constructor.
   *
   * @param \Drupal\Core\Language\LanguageManagerInterface $language_manager
   *   Language manager.
   * @param \Drupal\Core\Path\PathMatcherInterface $path_matcher
   *   Path builder.
   */
  public function __construct(LanguageManagerInterface $language_manager, PathMatcherInterface $path_matcher) {
    $this->languageManager = $language_manager;
    $this->pathMatcher = $path_matcher;
    // Get languages, get current route.
    $this->currentLanguage = $this->languageManager->getCurrentLanguage(LanguageInterface::TYPE_CONTENT);
    $this->route = $this->pathMatcher->isFrontPage() ? '<front>' : '<current>';
  }

  /**
   * Main build method.
   *
   * @return array
   *   Render array for the toolbar items.
   */
  public function build() {
    $links = $this->languageManager->getLanguageSwitchLinks(LanguageInterface::TYPE_INTERFACE, new Url($this->route));
    $urls = $links->links ?? [];

    if (count($urls) < 2) {
      return [];
    }

    $current_language_id = $this->currentLanguage->getId();
    $current_language_name = $urls[$current_language_id]['title'];

    // Build toolbar item and tray.
    $items['admin_toolbar_langswitch'] = [
      '#cache' => ['contexts' => ['languages:language_interface', 'url']],
      '#type' => 'toolbar_item',
      '#weight' => 999,
      'tab' => [
        '#type' => 'html_tag',
        '#tag' => 'a',
        '#value' => $current_language_name,
        '#attributes' => [
          'href' => '#',
          'class' => ['toolbar-icon', 'toolbar-icon-language'],
        ],
      ],
    ];

    return $items;
  }

}
