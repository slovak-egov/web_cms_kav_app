<?php

namespace Drupal\svksk_content\Commands;

use Drupal\svksk_content\ContentGeneratorService;
use Drush\Commands\DrushCommands;

/**
 * Drush command file.
 */
class ContentCommands extends DrushCommands {

  /**
   * @var \Drupal\svksk_content\ContentGeneratorService
   */
  protected $contentGeneratorService;

  /**
   * Constructs a ERRCommands object.
   *
   * @param \Drupal\svksk_content\ContentGeneratorService $content_service
   */
  public function __construct(ContentGeneratorService $content_generator_service) {
    $this->contentGeneratorService = $content_generator_service;
  }

  /**
   * A custom Drush command to set content.
   *
   * @command svksk-content:add
   *
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function add() {

    $menuLink = $this->contentGeneratorService->addMenuLink('sk', [
      'uri' => 'route:<front>',
      'title' => 'Domov',
      'name' => 'main',
      'weight' => '0',
    ]);

    $menuLink->addTranslation('en', [
      'title' => 'Home',
    ])->save();

    $article = $this->contentGeneratorService->createArticle([
      'sk' => [
        'title' => 'Riešenie životných udalostí',
        'alias' => '/zivotne-udalosti',
        'menu' => [
          'title' => 'Životné udalosti',
          'name' => 'main',
          'weight' => '1',
        ],
      ],
      'en' => [
        'title' => 'Dealing with life events',
        'alias' => '/life-events',
        'menu' => [
          'title' => 'Life events',
          'name' => 'main',
        ],
      ],
    ]);

    $this->contentGeneratorService->addMainBreadcrumbForNodeType('life_event', $article->id());

    $this->contentGeneratorService->createArticle([
      'sk' => [
        'title' => 'Elektronické služby',
        'alias' => '/elektronicke-sluzby',
        'menu' => [
          'title' => 'Elektronické služby',
          'name' => 'main',
          'weight' => '2',
        ],
      ],
      'en' => [
        'title' => 'Electronic services',
        'alias' => '/electronic-services',
        'menu' => [
          'title' => 'Electronic services',
          'name' => 'main',
        ],
      ],
    ]);

    $this->contentGeneratorService->createArticle([
      'sk' => [
        'title' => 'Úrady a inštitúcie',
        'alias' => '/urady-institucie',
        'menu' => [
          'title' => 'Úrady a inštitúcie',
          'name' => 'main',
          'weight' => '3',
        ],
      ],
      'en' => [
        'title' => 'Offices and institutions',
        'alias' => '/offices-institutions',
        'menu' => [
          'title' => 'Offices and institutions',
          'name' => 'main',
        ],
      ],
    ]);

    $this->contentGeneratorService->createArticle([
      'sk' => [
        'title' => 'Nápoveda',
        'alias' => '/napoveda',
        'menu' => [
          'title' => 'Nápoveda',
          'name' => 'main',
          'weight' => '4',
        ],
      ],
      'en' => [
        'title' => 'Help',
        'alias' => '/Help',
        'menu' => [
          'title' => 'Help',
          'name' => 'main',
        ],
      ],
    ]);

    //Footer
    $footerMenuLink1 = $this->contentGeneratorService->addMenuLink('sk', [
      'title' => 'Slovensko.sk',
      'name' => 'footer',
      'weight' => '0',
    ]);
    $footerMenuLink1->addTranslation('en', [
      'title' => 'Slovensko.sk',
    ])->save();

    $footerMenuLink2 = $this->contentGeneratorService->addMenuLink('sk', [
      'title' => 'Rýchle odkazy',
      'name' => 'footer',
      'weight' => '1',
    ]);
    $footerMenuLink2->addTranslation('en', [
      'title' => 'Quick Links',
    ])->save();

    $footerMenuLink3 = $this->contentGeneratorService->addMenuLink('sk', [
      'title' => 'Podpora',
      'name' => 'footer',
      'weight' => '2',
    ]);
    $footerMenuLink3->addTranslation('en', [
      'title' => 'Support',
    ])->save();

  }

}
