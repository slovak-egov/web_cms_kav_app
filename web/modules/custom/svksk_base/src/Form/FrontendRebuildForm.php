<?php

/**
 * @file
 * Contains \Drupal\svksk_base\Form\FrontendRebuildForm.
 */

namespace Drupal\svksk_base\Form;

use Drupal\Core\Datetime\DateFormatterInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Url;
use Drupal\svksk_base\Defaults;
use Drupal\svksk_base\FrontendRebuildManager;
use Symfony\Component\DependencyInjection\ContainerInterface;
use GuzzleHttp\Client;

/**
 * Checkout form to handle checkout register
 */
class FrontendRebuildForm extends FormBase {

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \GuzzleHttp\Client
   */
  protected $httpClient;

  /**
   * @var \Drupal\svksk_base\FrontendRebuildManager
   */
  protected $frontendRebuildManager;

  /**
   * @var \Drupal\Core\Datetime\DateFormatterInterface
   */
  protected $dateFormatter;

  /**
   * Constructs a new CheckoutCollectForm object.
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager, Client $http_client, DateFormatterInterface $date_formatter, FrontendRebuildManager $rebuild_manager) {
    $this->entityTypeManager = $entity_type_manager;
    $this->httpClient = $http_client;
    $this->dateFormatter = $date_formatter;
    $this->frontendRebuildManager = $rebuild_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
      $container->get('http_client'),
      $container->get('date.formatter'),
      $container->get('svksk_base.frontend_rebuild_manager'),

    );
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'svsk_base_frontend_rebuild';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form['wrapper'] = [
      '#type' => 'container',
      '#attributes' => ['id' => ['form-wrapper']],
    ];

    $form['wrapper']['submit'] = [
      '#type' => 'submit',
      '#value' => $this->t('Rebuild frontend'),
      '#button_type' => 'primary',
      '#ajax' => [
        'callback' => '::ajaxCallback',
        'wrapper' => 'form-wrapper',
      ]
    ];

    $form['wrapper']['result'] = [
      '#type' => 'container',
      '#attributes' => ['id' => ['result-wrapper']],
      '#weight' => 99,
    ];

    $form['wrapper']['result']['status'] = [
      '#type' => 'html_tag',
      '#tag' => 'div',
      '#value' => '',
      '#attributes' => ['class' => ['rebuild-status']]
    ];
    $this->updateStatus($form);

    $form['wrapper']['result']['refresh'] = [
      '#type' => 'submit',
      '#value' => $this->t('Refresh'),
      '#submit' => ['::submitRefreshForm'],
      '#attributes' => [
        'style' => 'display: none',
      ],
      '#ajax' => [
        'callback' => '::ajaxCallback',
        'wrapper' => 'form-wrapper',
        'event' => 'click',
        'progress' => [
          'type' => 'throbber',
          'message' => $this->t('Refreshing status...'),
        ],
      ]
    ];

    $form['#attached']['library'][] = 'svksk_base/frontend_rebuild_form';

    return $form;
  }

  /**
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return mixed
   */
  public function ajaxCallback(array &$form, FormStateInterface $form_state) {
    return $form['wrapper'];
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $status = $this->frontendRebuildManager->startRebuild();
    if ($status == FrontendRebuildManager::REBUILD_RESPONSE_REBUILD_STARTED) {
      $this->messenger()->addStatus($this->t('Rebuild successfully triggered'));
      $this->disableSubmitButton($form);
      $this->updateStatus($form);
    } else if ($status == FrontendRebuildManager::REBUILD_RESPONSE_REBUILD_ALREADY_RUNNING) {
      $this->messenger()->addStatus($this->t('Rebuild already running'));
      $this->disableSubmitButton($form);
      $this->updateStatus($form);
    } else if ($status == FrontendRebuildManager::REBUILD_RESPONSE_INVALID_SECRET) {
      $this->messenger()->addError($this->t('Invalid rebuild secret provided'));
    } else if ($status == FrontendRebuildManager::REBUILD_RESPONSE_FAILED) {
      $this->messenger()->addError($this->t('There was an error response while triggering rebuild'));
    } else if (is_null($status)) {
      $this->messenger()->addError($this->t('There was an error while triggering rebuild webhook.'));
    }
  }

  /**
   * Empty submit handler for refresh
   *
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return void
   */
  public function submitRefreshForm(array &$form, FormStateInterface $form_state) {
    // Do nothing
  }

  protected function updateStatus(array &$form) {
    $status = $this->frontendRebuildManager->fetchRebuildStatus();
    $form['wrapper']['result']['status']['#value'] = '';
    $form['wrapper']['result']['status']['#attributes']['class'] = ['rebuild-status'];
    if ($status && $status['state'] == 'running') {
      $account = $this->entityTypeManager->getStorage('user')
        ->load($status['last_started_by']);
      $progress = ($status['last_started_progress'] ?? 0) . '/' . ($status['last_started_count'] ?? 0);
      $form['wrapper']['result']['status']['#value'] = $this
        ->t('There is a rebuild process currently running since @date by @user',
          [
            '@date' => $this->dateFormatter->format($status['last_started_timestamp'], 'short'),
            '@user' => $account ? $account->getDisplayName() : NULL
          ]) . " ($progress)";
      $form['wrapper']['result']['status']['#attributes']['class'][] = 'rebuild-status--running';
      $this->disableSubmitButton($form);
    } elseif (!empty($status['finished_timestamp'])) {
      $account = $this->entityTypeManager->getStorage('user')
        ->load($status['finished_by']);
      $form['wrapper']['result']['status']['#value'] = $this
        ->t('Last rebuild was completed on @date by @user',
          [
            '@date' => $this->dateFormatter->format($status['finished_timestamp'], 'short'),
            '@user' => $account ? $account->getDisplayName() : NULL
          ]);
      $form['wrapper']['result']['status']['#attributes']['class'][] = 'rebuild-status--finished';
    }
  }

  protected function disableSubmitButton(array &$form) {
    $form['wrapper']['submit']['#attributes']['disabled']  = 'disabled';
    unset($form['wrapper']['submit']['#button_type']);
  }

}
