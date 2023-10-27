<?php

namespace Drupal\svksk_breadcrumbs\Breadcrumb;

use Drupal\Core\Breadcrumb\Breadcrumb;
use Drupal\Core\Breadcrumb\BreadcrumbBuilderInterface;
use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\Core\Entity\EntityRepositoryInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\Core\Link;
use Drupal\Core\Menu\MenuLinkManagerInterface;
use Drupal\Core\Routing\AdminContext;
use Drupal\Core\Routing\RouteMatchInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\node\Entity\Node;
use Drupal\node\NodeInterface;
use Drupal\Core\Entity\ContentEntityInterface;
use Drupal\path_alias\AliasManagerInterface;
use Drupal\Core\Menu\MenuLinkInterface;
use Drupal\taxonomy\Entity\Term;
use Drupal\taxonomy\TermInterface;

/**
 * Provides a breadcrumb builder for nodes.
 */
class BreadcrumbBuilder implements BreadcrumbBuilderInterface {

  use StringTranslationTrait;

  /**
   * Configuration object for this builder.
   *
   * @var \Drupal\Core\Config\Config
   */
  protected $config;

  /**
   * The language manager.
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface
   */
  protected $languageManager;

  /**
   * The entity type manager service.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * The alias manager.
   *
   * @var \Drupal\path_alias\AliasManagerInterface
   */
  protected $aliasManager;

  /**
   * The language code.
   *
   * @var string
   */
  protected $langcode;

  /**
   * The menu link plugin manager.
   *
   * @var \Drupal\Core\Menu\MenuLinkManagerInterface
   */
  protected $menuLinkManager;

  /**
   * Protected entityRepository.
   *
   * @var \Drupal\Core\Entity\EntityRepositoryInterface
   */
  protected $entityRepository;

  /**
   * @var \Drupal\Core\Routing\AdminContext
   */
  protected $adminContext;

  /**
   * Constructs a forum breadcrumb builder object.
   *
   * @param \Drupal\Core\Config\ConfigFactoryInterface $config_factory
   *   The configuration factory.
   * @param \Drupal\Core\Language\LanguageManagerInterface $language_manager
   *   The language manager.
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   *   Entity type manager service.
   * @param \Drupal\path_alias\AliasManagerInterface $alias_manager
   *   The path alias manager.
   * @param \Drupal\Core\Menu\MenuLinkManagerInterface $menu_link_manager
   *   The menu link plugin manager.
   * @param \Drupal\Core\Entity\EntityRepositoryInterface|null $entity_repository
   *   The entity repository service.
   * @param \Drupal\Core\Routing\AdminContext $admin_context
   *   The router admin context service
   */
  public function __construct(ConfigFactoryInterface $config_factory, LanguageManagerInterface $language_manager, EntityTypeManagerInterface $entity_type_manager, AliasManagerInterface $alias_manager, MenuLinkManagerInterface $menu_link_manager, EntityRepositoryInterface $entity_repository, AdminContext $admin_context) {
    $this->config = $config_factory->get('svksk_breadcrumbs.settings');
    $this->languageManager = $language_manager;
    $this->entityTypeManager = $entity_type_manager;
    $this->aliasManager = $alias_manager;
    $this->langcode = $this->languageManager->getCurrentLanguage()->getId();
    $this->menuLinkManager = $menu_link_manager;
    $this->entityRepository = $entity_repository;
    $this->entityRepository = $entity_repository;
    $this->adminContext = $admin_context;
  }

  /**
   * Set the language code.
   *
   * @param string $langcode
   *   The language code.
   *
   * @return self
   *   The BreadcrumbBuilder object.
   */
  public function setLangcode(string $langcode): self {
    $this->langcode = $langcode;

    return $this;
  }

  /**
   * {@inheritdoc}
   */
  public function applies(RouteMatchInterface $route_match) {
    $node = $route_match->getParameter('node');
    if ($node) {
      return TRUE;
    }

    return FALSE;
  }

  /**
   * Loads the node translation for the specified language.
   *
   * @param $entity
   *   A entity.
   * @param $entityType
   *   A entity type.
   *
   * @return \Drupal\Core\Entity\ContentEntityInterface
   *   The node translation object.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  protected function loadTranslation($entity, $entityType): ContentEntityInterface {
    /** @var \Drupal\node\NodeStorageInterface $storage */
    $storage = $this->entityTypeManager->getStorage($entityType);
    $storage->resetCache([$entity->id()]);
    $entity = $storage->loadRevision($storage->getLatestRevisionId($entity->id()));

    return $entity->hasTranslation($this->langcode) ? $entity->getTranslation($this->langcode) : $entity;
  }

  /**
   * Returns the translated link of a menu title.
   *
   * @param \Drupal\Core\Menu\MenuLinkInterface $menu_link
   *   The menu link.
   *
   * @return string
   *   The menu link title.
   */
  function getMenuLinkTranslatedTitle(MenuLinkInterface $menu_link): string {
    $metadata = $menu_link->getMetaData();
    if (isset($metadata['entity_id']) && $menu_link->getProvider() == 'menu_link_content') {
      /** @var \Drupal\menu_link_content\MenuLinkContentInterface $entity */
      $entity = $this->entityTypeManager->getStorage('menu_link_content')->load($metadata['entity_id']);
      if (!empty($entity)) {
        $entity = $this->entityRepository->getTranslationFromContext($entity, $this->langcode);
        return $entity->getTitle();
      }
    }

    return $menu_link->getTitle();
  }

  /**
   * Returns node label.
   *
   * @param \Drupal\node\NodeInterface $node
   *   A node object.
   *
   * @return string
   *   The label.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  protected function getNodeLabel(NodeInterface $node): string {
    $menuLinks = $this->menuLinkManager->loadLinksByRoute('entity.node.canonical', ['node' => $node->id()]);

    if ($menuLinks) {
      $label = $this->getMenuLinkTranslatedTitle(current($menuLinks));
    }
    else {
      if ($node->hasTranslation($this->langcode)
        && $node->language()->getId() !== $this->langcode) {
        $node = $this->loadTranslation($node, 'node');
      }

      $label = $node->getTitle();
    }

    return $label;
  }

  /**
   * Returns term label.
   *
   * @param \Drupal\node\TermInterface $term
   *   A node object.
   *
   * @return string
   *   The label.
   *
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  protected function getTermLabel(TermInterface $term): string {
    if ($term->hasTranslation($this->langcode)
      && $term->language()->getId() !== $this->langcode) {
      $term = $this->loadTranslation($term, 'taxonomy_term');
    }

    return $term->label();
  }

  /**
   * {@inheritdoc}
   */
  public function build(RouteMatchInterface $route_match) {
    $entity = NULL;
    $type = '';
    $breadcrumb = new Breadcrumb();

    $node = $route_match->getParameter('node');
    $term = $route_match->getParameter('taxonomy_term');

    if ($node) {
      $type = 'node';

      if (!$node instanceof NodeInterface) {
        $node = Node::load($node);
      }

      $entity = $node;
    }
    elseif ($term) {

      $type = 'taxonomy_term';

      if (!$term instanceof TermInterface) {
        $term = Term::load($term);
      }

      $entity = $term;
    }

    if (!empty($entity)) {
      $url = $entity->toUrl();
      $alias = $this->aliasManager->getAliasByPath('/' . $url->getInternalPath(), $this->langcode);

      $arr = array_filter(explode('/', $alias));
      $links = [];
      while ((array_pop($arr) and !empty($arr))) {
        $links[] = '/' . implode('/', $arr);
      };

      krsort($links);

      foreach ($links as $link) {
        $path = $this->aliasManager->getPathByAlias($link, $this->langcode);

        if (preg_match('/node\/(\d+)/', $path, $matches)) {
          if ($mainNode = Node::load($matches[1])) {
            if ($mainNode->isPublished()) {
              $breadcrumb->addLink(Link::fromTextAndUrl($this->getNodeLabel($mainNode), $mainNode->toUrl()));
            }
          }
        }
        elseif (preg_match('/taxonomy\/term\/(\d+)/', $path, $matches)) {
          if ($taxonomyTerm = Term::load($matches[1])) {
            if ($taxonomyTerm->isPublished()) {
              $taxonomyTermName = $this->getTermLabel($taxonomyTerm);

              $breadcrumb->addLink($taxonomyTerm->get('vid')
                ->getString() === 'life_event_categories' ? Link::fromTextAndUrl($taxonomyTermName, $taxonomyTerm->toUrl()) :
                Link::createFromRoute($taxonomyTermName, '<nolink>'));
            }
          }
        }
      }

      if ($type == 'node') {
        $name = $this->getNodeLabel($entity);
      } else {
        $name = $this->getTermLabel($entity);
      }

      $breadcrumb->addLink(Link::createFromRoute($name, '<nolink>'));
      $breadcrumb->addCacheableDependency($entity)->addCacheContexts(['url']);
    }

    return $breadcrumb;
  }

}
