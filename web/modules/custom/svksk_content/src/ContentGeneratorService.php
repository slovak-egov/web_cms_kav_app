<?php

namespace Drupal\svksk_content;

use Drupal;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\menu_link_content\Entity\MenuLinkContent;
use Drupal\node\Entity\Node;
use Drupal\path_alias\Entity\PathAlias;

/**
 * Interface for SVKSk Content.
 */
class ContentGeneratorService {

  /**
   * The config factory.
   *
   * @var \Drupal\Core\Config\ConfigFactoryInterface
   */
  protected $breadcrumbsConfig;

  /**
   * ContentService interface constructor.
   *
   * @param \Drupal\Core\Config\ConfigFactoryInterface $config_factory
   *   The configuration factory.
   */
  public function __construct(ConfigFactoryInterface $config_factory) {
    $this->breadcrumbsConfig = $config_factory->getEditable('svksk_breadcrumbs.settings');
  }

  /**
   * Creates an instance of the SVKSk content.
   *
   * @param \Symfony\Component\DependencyInjection\ContainerInterface $container
   *   The service container.
   *
   * @return self
   */
  public static function create(ContainerInterface $container): self {
    return new static(
      $container->get('config.factory')
    );
  }

  /**
   * Create new article.
   *
   * @param array $options
   *   Data for the new content.
   *
   * @return \Drupal\node\Entity\Node
   *   The created node.
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function createArticle(array $options): Node {
    $requestTime = Drupal::time()->getRequestTime();
    $mainLangCode = array_key_first($options);

    $nodeArticle = Node::create([
      'type' => 'article',
      'created' => $requestTime,
      'changed' => $requestTime,
      'uid' => 1,
      'status' => 1,
      'langcode' => $mainLangCode,
    ]);

    foreach ($options as $langCode => $data) {
      if ($mainLangCode !== $langCode) {
        $nodeArticle = $nodeArticle->addTranslation($langCode, $nodeArticle->toArray());
      }

      $nodeArticle->setTitle($data['title']);
      $nodeArticle->moderation_state->value = 'published';
      $nodeArticle->save();

      $pathAlias = PathAlias::create([
        'path' => '/node/' . $nodeArticle->id(),
        'alias' => $data['alias'],
        'langcode' => $langCode,
      ]);

      $pathAlias->save();

      if ($mainLangCode === $langCode) {
        $options[$mainLangCode]['menu']['uri'] = 'internal:' . $pathAlias->getAlias();
      }
    }

    $menuLink = $this->addMenuLink($mainLangCode, $options[$mainLangCode]['menu']);

    foreach ($options as $langCode => $data) {
      if ($mainLangCode !== $langCode) {
        $menuLink->addTranslation($langCode, [
          'title' => $data['menu']['title'],
        ])->save();
      }
    }

    return $nodeArticle;
  }

  /**
   * Add new link into menu.
   *
   * @param $langCode
   *   The language code.
   * @param array $data
   *   Data for the menu.
   *
   * @throws \Drupal\Core\Entity\EntityStorageException
   */
  public function addMenuLink(string $langCode, array $data): MenuLinkContent {
    $menuLink = MenuLinkContent::create([
      'title' => $data['title'],
      'langcode' => $langCode,
      'link' => ['uri' => $data['uri'] ?? 'route:<nolink>'],
      'menu_name' => $data['name'],
      'weight' => $data['weight'] ?? 0,
    ]);
    $menuLink->save();

    return $menuLink;
  }

  /**
   * Sets the parent entity in breadcrumb for defined node type.
   *
   * @param string $type
   *   The type of node.
   * @param string $id
   *   The entity ID.
   */
  public function addMainBreadcrumbForNodeType(string $type, string $id): void {
    $mainNodes = $this->breadcrumbsConfig->get('main_nodes');
    $mainNodes[$type] = $id;
    $this->breadcrumbsConfig->set('main_nodes', $mainNodes);
    $this->breadcrumbsConfig->save();
  }

}
