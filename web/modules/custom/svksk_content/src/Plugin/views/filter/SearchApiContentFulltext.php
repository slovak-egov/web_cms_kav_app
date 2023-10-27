<?php

namespace Drupal\svksk_content\Plugin\views\filter;

use Drupal\Component\Transliteration\TransliterationInterface;
use Drupal\Core\Database\Connection;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Language\LanguageManagerInterface;
use Drupal\search_api\IndexInterface;
use Drupal\search_api\Processor\ProcessorInterface;
use Drupal\views\Plugin\views\filter\FilterPluginBase;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Filter handler for the fulltext search in Admin Content index.
 *
 * @ingroup views_filter_handlers
 *
 * @ViewsFilter("svksk_content_search_api_index_search")
 */
class SearchApiContentFulltext extends FilterPluginBase {

  /**
   * The database connection.
   *
   * @var \Drupal\Core\Database\Connection
   */
  protected $connection;

  /**
   * The transliteration service to use.
   *
   * @var \Drupal\Component\Transliteration\TransliterationInterface
   */
  protected $transliterator;

  /**
   * The language manager.
   *
   * @var \Drupal\Core\Language\LanguageManagerInterface|null
   */
  protected $languageManager;

  /**
   * Exposed filter options.
   *
   * @var bool
   */
  protected $alwaysMultiple = TRUE;

  /**
   * Constructs a new StringFilter object.
   *
   * @param array $configuration
   *   A configuration array containing information about the plugin instance.
   * @param string $plugin_id
   *   The plugin_id for the plugin instance.
   * @param mixed $plugin_definition
   *   The plugin implementation definition.
   * @param \Drupal\Core\Database\Connection $connection
   *   The database connection.
   */
  public function __construct(array $configuration, $plugin_id, $plugin_definition, Connection $connection, TransliterationInterface $transliterator, LanguageManagerInterface $language_manager) {
    parent::__construct($configuration, $plugin_id, $plugin_definition);
    $this->connection = $connection;
    $this->transliterator = $transliterator;
    $this->languageManager = $language_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container, array $configuration, $plugin_id, $plugin_definition) {
    return new static(
      $configuration,
      $plugin_id,
      $plugin_definition,
      $container->get('database'),
      $container->get('transliteration'),
      $container->get('language_manager'),
    );
  }

  protected function defineOptions() {
    $options = parent::defineOptions();

    $options['min_length'] = ['default' => ''];
    $options['expose']['contains']['required'] = ['default' => FALSE];
    $options['expose']['contains']['placeholder'] = ['default' => ''];

    return $options;
  }

  /**
   * {@inheritdoc}
   */
  public function defaultExposeOptions() {
    parent::defaultExposeOptions();
    $this->options['expose']['placeholder'] = NULL;
  }

  public function options() {
    return [];
  }

  /**
   * {@inheritdoc}
   */
  public function buildExposeForm(&$form, FormStateInterface $form_state) {
    parent::buildExposeForm($form, $form_state);
    $form['operator']['#type'] = 'value';
    $form['expose']['placeholder'] = [
      '#type' => 'textfield',
      '#default_value' => $this->options['expose']['placeholder'],
      '#title' => $this->t('Placeholder'),
      '#size' => 40,
      '#description' => $this->t('Hint text that appears inside the field when empty.'),
    ];
  }

  /**
   * {@inheritdoc}
   */
  public function buildOptionsForm(&$form, FormStateInterface $form_state) {
    parent::buildOptionsForm($form, $form_state);

    $form['min_length'] = [
      '#title' => $this->t('Minimum keyword length'),
      '#description' => $this->t('Minimum length of each word in the search keys. Leave empty to allow all words.'),
      '#type' => 'number',
      '#min' => 1,
      '#default_value' => $this->options['min_length'],
    ];
  }

  /**
   * {@inheritdoc}
   */
  protected function exposedTranslate(&$form, $type) {
    parent::exposedTranslate($form, $type);

    // We use custom validation for "required", so don't want the Form API to
    // interfere.
    // @see ::validateExposed()
    $form['#required'] = FALSE;
  }

  /**
   * {@inheritdoc}
   */
  public function validateExposed(&$form, FormStateInterface $form_state) {
    // Only validate exposed input.
    if (empty($this->options['exposed']) || empty($this->options['expose']['identifier'])) {
      return;
    }

    // Skip reset button hits
    if ($form_state->getTriggeringElement()['#parents'][0] == 'reset') {
      return;
    }

    $identifier = $this->options['expose']['identifier'];
    $input = &$form_state->getValue($identifier, '');

    if ($this->options['is_grouped'] && isset($this->options['group_info']['group_items'][$input])) {
      $this->operator = $this->options['group_info']['group_items'][$input]['operator'];
      $input = &$this->options['group_info']['group_items'][$input]['value'];
    }

    // Under some circumstances, input will be an array containing the string
    // value. Not sure why, but just deal with that.
    while (is_array($input)) {
      $input = $input ? reset($input) : '';
    }

    if (trim($input) === '') {
      // No input was given by the user. If the filter was set to "required" and
      // there is a query (not the case when an exposed filter block is
      // displayed stand-alone), abort it.
      if (!empty($this->options['expose']['required']) && $this->getQuery()) {
        $this->getQuery()->abort();
      }
      // If the input is empty, there is nothing to validate: return early.
      return;
    }

    // Only continue if there is a minimum word length set.
    if ($this->options['min_length'] < 2) {
      return;
    }

    $words = preg_split('/\s+/', $input);
    foreach ($words as $i => $word) {
      if (mb_strlen($word) < $this->options['min_length']) {
        unset($words[$i]);
      }
    }

    if (!$words) {
      $form_state->setErrorByName($identifier, $this->t('You must include at least one positive keyword with @count characters or more.', ['@count' => $this->options['min_length']]));
    }
  }

  /**
   * Provide a simple textfield for equality.
   */
  protected function valueForm(&$form, FormStateInterface $form_state) {
    $which = 'all';
    if ($exposed = $form_state->get('exposed')) {
      $identifier = $this->options['expose']['identifier'];
    }

    if ($which == 'all' || $which == 'value') {
      $form['value'] = [
        '#type' => 'textfield',
        '#title' => $this->t('Value'),
        '#size' => 30,
        '#default_value' => $this->value,
      ];
      if (!empty($this->options['expose']['placeholder'])) {
        $form['value']['#attributes']['placeholder'] = $this->options['expose']['placeholder'];
      }
      $user_input = $form_state->getUserInput();
      if ($exposed && !isset($user_input[$identifier])) {
        $user_input[$identifier] = $this->value;
        $form_state->setUserInput($user_input);
      }
    }

    if (!isset($form['value'])) {
      // Ensure there is something in the 'value'.
      $form['value'] = [
        '#type' => 'value',
        '#value' => NULL,
      ];
    }
  }

  /**
   * Add this filter to the query.
   */
  public function query() {
    // Don't filter on empty strings.
    if (empty($this->value)) {
      return;
    }

    // Is quote
    if (substr($this->value, 0, 1) == '"' && substr($this->value, -1) == '"') {
      $words = substr($this->value, 1, -1);
      $this->query->addWhere($this->options['group'], "$this->table.title", '%' . $this->connection->escapeLike($words) . '%', 'LIKE');
    }
    else {
      // Add a subquery to the query that will find the nid.
      $subQuery = \Drupal::database()
        ->select('search_api_db_content_text', 'sapi_index');
      $subQuery->addExpression("SUBSTR(item_id, 13, STRPOS(item_id, RIGHT(item_id, 3)) - 13)::BIGINT", 'nid');
      $subQuery->addExpression("RIGHT(item_id, 2)::VARCHAR", 'langcode');
      $subQuery->addExpression("SUM(score)", 'total_score');
      $subQuery->groupBy('item_id');

      $value = $this->processValue($this->value);
      $words = explode(" ", $value);
      $words = array_filter($words, function ($w) {
        return strlen($w) >= 3;
      });
      $words = array_unique($words);
      if (empty($words)) {
        return;
      }
      $wordsGroup = $subQuery->orConditionGroup();
      foreach ($words as $word) {
        $wordsGroup->condition('word', '%' . $this->connection->escapeLike($word) . '%', 'LIKE');
      }
      $subQuery->condition($wordsGroup);
      $subQuery->having("COUNT(word) >= " . count($words));

      // Add the subquery to as a component of a join.
      $joinDefinition = [
        'type' => 'INNER',
        'table formula' => $subQuery,
        'field' => 'nid',
        'left_table' => 'node_field_data',
        'left_field' => 'nid',
        'adjust' => TRUE,
        'extra' => [
          [
            'field' => 'langcode',
            'left_field' => 'langcode',
          ],
        ],
      ];

      // Create a join object and create a relationship between the main query and the subquery.
      $join = \Drupal::service('plugin.manager.views.join')
        ->createInstance('standard', $joinDefinition);
      $this->query->addRelationship('content_index', $join, 'node_field_data');

      if (!$order = \Drupal::request()->get('order')) {
        $this->query->addOrderBy('content_index', 'total_score', 'DESC');
        $this->query->addGroupBy('content_index_total_score');
        $this->query->addGroupBy('node_field_data.nid');
        $this->query->addGroupBy('node_field_data.langcode');
      }
    }
  }

  /**
   * Apply search index processors.
   *
   * @param $value
   *
   * @return string
   */
  protected function processValue($value) {
    /** @var IndexInterface $search_api_index */
    $search_api_index = \Drupal::entityTypeManager()
      ->getStorage('search_api_index')
      ->load('content');

    $processors = $search_api_index->getProcessorsByStage(ProcessorInterface::STAGE_PREPROCESS_QUERY);
    foreach ($processors as $processor) {
      // Closure class is used to anonymously call a protected function of Processors plugin instance
      // https://stackoverflow.com/a/63758073
      $value = \Closure::bind(
        function ($class) use ($value) {
          $class->process($value);
          return $value;
        }, NULL, get_class($processor)
      )($processor);
    }

    return $value;
  }

}
