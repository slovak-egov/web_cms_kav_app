<?php

namespace Drupal\svksk_breadcrumbs\Form;

use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Drupal\node\Entity\NodeType;

/**
 * Configure svksk_breadcrumbs settings for this site.
 */
class SettingsForm extends ConfigFormBase {

  /**
   * Name of the configuration object containing the setting used by this class.
   */
  const CONFIG_OBJECT_NAME = 'svksk_breadcrumbs.settings';

  /**
   * An array of keyvalue node types.
   *
   * @var array
   */
  protected $nodeTypes = [];

  /**
   * Constructs a new SettingsForm.
   *
   * @param \Drupal\Core\Config\ConfigFactoryInterface $config_factory
   *   The factory for configuration objects.
   */
  public function __construct(ConfigFactoryInterface $config_factory) {
    parent::__construct($config_factory);

    $this->nodeTypes = array_keys(NodeType::loadMultiple());
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('config.factory'),
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'svksk_breadcrumbs_settings';
  }

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return [self::CONFIG_OBJECT_NAME];
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $config = $this->configFactory()
      ->get(self::CONFIG_OBJECT_NAME);

    $form['nodes'] = [
      '#type' => 'fieldset',
      '#title' => $this->t('Nodes'),
    ];

    $nodes = $config->get('main_nodes');

    foreach ($this->nodeTypes as $nodeType) {
      $form['nodes'][$nodeType] = [
        '#type' => 'textfield',
        '#title' => $nodeType,
        '#default_value' => $nodes[$nodeType] ?? '',
      ];
    }

    return parent::buildForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $config = $this->configFactory()->getEditable(self::CONFIG_OBJECT_NAME);

    $nodes = [];
    foreach ($this->nodeTypes as $nodeType) {
      $nodes[$nodeType] = $form_state->getValue($nodeType);
    }

    $config->set('main_nodes', $nodes);
    $config->save();

    parent::submitForm($form, $form_state);
  }

}
