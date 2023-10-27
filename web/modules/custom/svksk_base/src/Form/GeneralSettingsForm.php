<?php

/**
 * @file
 * Contains \Drupal\svksk_base\Form\BaseSettingsForm.
 */

namespace Drupal\svksk_base\Form;

use Drupal\Core\Database\Connection;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Url;
use Drupal\file\FileUsage\FileUsageInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Configure general settings.
 */
class GeneralSettingsForm extends ConfigFormBase {

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @var \Drupal\file\FileUsage\FileUsageInterface
   */
  protected $fileUsage;

  /**
   * @var \Drupal\Core\Database\Connection
   */
  protected $connection;

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'svksk_base_general_settings_form';
  }

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return [
      'svksk_base.general_settings',
    ];
  }

  /**
   * Constructs a CropWidgetForm object.
   *
   * @param \Drupal\Core\Config\ConfigFactoryInterface $config_factory
   *   The factory for configuration objects.
   */
  public function __construct(ConfigFactoryInterface $config_factory, EntityTypeManagerInterface $entity_type_manager, FileUsageInterface $file_usage, Connection $connection) {
    $this->entityTypeManager = $entity_type_manager;
    $this->fileUsage = $file_usage;
    $this->connection = $connection;
    parent::__construct($config_factory);
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('config.factory'),
      $container->get('entity_type.manager'),
      $container->get('file.usage'),
      $container->get('database'),
    );
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $config = $this->config('svksk_base.general_settings');

    $form['front_page'] = [
      '#type' => 'details',
      '#title' => $this->t('Front page settings'),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $form['front_page']['front_page_node'] = [
      '#type' => 'textfield',
      '#autocomplete_route_name' => 'svksk_base.autocomplete.nodes',
      '#title' => $this->t('Select front page'),
      '#default_value' => $config->get('front_page_node'),
    ];

    $front_page_image = $config->get('front_page_image');
    $form['front_page']['front_page_image'] = [
      '#type' => 'managed_file',
      '#title' => $this->t('Front page image'),
      '#description' => $this->t('Image at the top of the front page.'),
      '#default_value' => $front_page_image,
      '#upload_location' => 'public://images/',
      '#upload_validators'  => [
        'file_validate_extensions' => ['gif png jpg jpeg webp'],
      ],
    ];

    $form['egov_header'] = [
      '#type' => 'details',
      '#title' => $this->t('E-gov header'),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $form['egov_header']['egov_header_trigger_link_1'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Trigger link (:num)', [':num' => 1]),
      '#default_value' => $config->get('egov_header_trigger_link_1'),
    ];

    $form['egov_header']['egov_header_trigger_link_2'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Trigger link (:num)', [':num' => 2]),
      '#default_value' => $config->get('egov_header_trigger_link_2'),
    ];

    $form['egov_header']['egov_header_trigger_link_1_short'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Trigger link (:num) - short', [':num' => 1]),
      '#default_value' => $config->get('egov_header_trigger_link_1_short'),
    ];

    $form['egov_header']['egov_header_trigger_link_2_short'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Trigger link (:num) - short', [':num' => 2]),
      '#default_value' => $config->get('egov_header_trigger_link_2_short'),
    ];

    $form['egov_header']['egov_header_title_1'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Title (:num)', [':num' => 1]),
      '#default_value' => $config->get('egov_header_title_1'),
    ];

    $egov_header_text_1 = $config->get('egov_header_text_1');
    $form['egov_header']['egov_header_text_1'] = [
      '#type' => 'text_format',
      '#title' => $this->t('Text (:num)', [':num' => 1]),
      '#default_value' => is_array($egov_header_text_1) ? $egov_header_text_1['value'] : $egov_header_text_1,
      '#format' => is_array($egov_header_text_1) ? $egov_header_text_1['format'] : 'basic_html',
    ];

    $form['egov_header']['egov_header_title_2'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Title (:num)', [':num' => 2]),
      '#default_value' => $config->get('egov_header_title_2'),
    ];

    $egov_header_text_2 = $config->get('egov_header_text_2');
    $form['egov_header']['egov_header_text_2'] = [
      '#type' => 'text_format',
      '#title' => $this->t('Text (:num)', [':num' => 2]),
      '#default_value' => is_array($egov_header_text_2) ? $egov_header_text_2['value'] : $egov_header_text_2,
      '#format' => is_array($egov_header_text_2) ? $egov_header_text_2['format'] : 'basic_html',
    ];

    $form['header'] = [
      '#type' => 'details',
      '#title' => $this->t('Header'),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $header_logo = $config->get('header_logo');
    $form['header']['header_logo'] = [
      '#type' => 'managed_file',
      '#title' => $this->t('Header logo'),
      '#description' => $this->t('Default logo image in site header. Recommended image size is 40x40px.'),
      '#default_value' => $header_logo,
      '#upload_location' => 'public://images/',
      '#upload_validators'  => [
        'file_validate_extensions' => ['gif png jpg jpeg webp svg'],
      ],
    ];

    $form['header']['header_logo_title'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Header logo - Title'),
      '#default_value' => $config->get('header_logo_title'),
    ];

    $form['header']['header_logo_subtitle'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Header logo - Subtitle'),
      '#default_value' => $config->get('header_logo_subtitle'),
    ];

    $form['header']['header_logo_title_short'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Header logo - Title short'),
      '#default_value' => $config->get('header_logo_title_short'),
    ];

    $form['header']['header_logo_subtitle_short'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Header logo - Subtitle short'),
      '#default_value' => $config->get('header_logo_subtitle_short'),
    ];

    $form['footer'] = [
      '#type' => 'details',
      '#title' => $this->t('Footer'),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $footer_logo = $config->get('footer_logo');
    $form['footer']['footer_logo'] = [
      '#type' => 'managed_file',
      '#title' => $this->t('Footer logo'),
      '#description' => $this->t('Default logo image in site footer.'),
      '#default_value' => $footer_logo,
      '#upload_location' => 'public://images/',
      '#upload_validators'  => [
        'file_validate_extensions' => ['gif png jpg jpeg webp svg'],
      ],
    ];

    $form['footer']['footer_logo_alt'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Footer logo alternative text'),
      '#description' => $this->t('Alternative text for logo image in site footer.'),
      '#default_value' => $config->get('footer_logo_alt'),
    ];

    $footer_claim = $config->get('footer_claim');
    $form['footer']['footer_claim'] = [
      '#type' => 'text_format',
      '#title' => $this->t('Footer Claim'),
      '#default_value' => is_array($footer_claim) ? $footer_claim['value'] : $footer_claim,
      '#format' => is_array($footer_claim) ? $footer_claim['format'] : 'basic_html',
    ];

    $form['cookies'] = [
      '#type' => 'details',
      '#title' => $this->t("Cookies"),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $form['cookies']['cookies_settings_node'] = [
      '#type' => 'textfield',
      '#autocomplete_route_name' => 'svksk_base.autocomplete.nodes',
      '#title' => $this->t('Select cookies settings page'),
      '#default_value' => $config->get('cookies_settings_node'),
    ];

    $form['cookies']['cookies_lifespan'] = [
      '#type' => 'number',
      '#title' =>  $this->t("Lifespan [days]"),
      '#min' => 1,
      '#max' => 365,
      '#default_value' => $config->get('cookies_lifespan') ?? 1,
    ];

    $form['egov_feedback_forms'] = [
      '#type' => 'details',
      '#title' => $this->t('Feedback forms'),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $form['egov_feedback_forms']['feedback_form_report_uuid'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Feedback Form Report'),
      '#default_value' => $config->get('feedback_form_report_uuid'),
    ];

    $form['egov_requests_forms'] = [
      '#type' => 'details',
      '#title' => $this->t('Requests forms'),
      '#open' => TRUE,
      '#tree' => FALSE,
    ];

    $form['egov_requests_forms']['requests_notification_email'] = [
      '#type' => 'textfield',
      '#title' => $this->t('Requests notification e-mail'),
      '#default_value' => $config->get('requests_notification_email'),
    ];


    return parent::buildForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    parent::submitForm($form, $form_state);
    $config = $this->config('svksk_base.general_settings');

    // Header Logo
    $header_logo = $form_state->getValue('header_logo');
    if (($header_logo_stored = $config->get('header_logo')) && $header_logo_stored[0] != $header_logo[0]) {
      $this->deleteFileUsage($header_logo_stored[0] ?? NULL, 'header_logo');
      $this->addFileUsage($header_logo[0] ?? NULL, 'header_logo');
    }
    $config->set('header_logo', $header_logo);

    // Footer Logo
    $footer_logo = $form_state->getValue('footer_logo');
    if (($footer_logo_stored = $config->get('footer_logo')) && $footer_logo_stored[0] != $footer_logo[0]) {
      $this->deleteFileUsage($footer_logo_stored[0] ?? NULL, 'header_logo');
      $this->addFileUsage($footer_logo[0] ?? NULL, 'footer_logo');
    }
    $config->set('footer_logo', $footer_logo);

    // Front Page Image
    $front_page_image = $form_state->getValue('front_page_image');
    if (($front_page_image_stored = $config->get('front_page_image')) && $front_page_image_stored[0] != $front_page_image[0]) {
      $this->deleteFileUsage($front_page_image_stored[0] ?? NULL, 'header_logo');
      $this->addFileUsage($front_page_image[0] ?? NULL, 'front_page_image');
    }
    $config->set('front_page_image', $front_page_image);

    $config->set('front_page_node', $form_state->getValue('front_page_node'));
    $config->set('egov_header_trigger_link_1', $form_state->getValue('egov_header_trigger_link_1'));
    $config->set('egov_header_trigger_link_2', $form_state->getValue('egov_header_trigger_link_2'));
    $config->set('egov_header_trigger_link_1_short', $form_state->getValue('egov_header_trigger_link_1_short'));
    $config->set('egov_header_trigger_link_2_short', $form_state->getValue('egov_header_trigger_link_2_short'));
    $config->set('egov_header_title_1', $form_state->getValue('egov_header_title_1'));
    $config->set('egov_header_text_1', $form_state->getValue('egov_header_text_1'));
    $config->set('egov_header_title_2', $form_state->getValue('egov_header_title_2'));
    $config->set('egov_header_text_2', $form_state->getValue('egov_header_text_2'));
    $config->set('header_logo_title', $form_state->getValue('header_logo_title'));
    $config->set('header_logo_subtitle', $form_state->getValue('header_logo_subtitle'));
    $config->set('header_logo_title_short', $form_state->getValue('header_logo_title_short'));
    $config->set('header_logo_subtitle_short', $form_state->getValue('header_logo_subtitle_short'));
    $config->set('footer_logo_alt', $form_state->getValue('footer_logo_alt'));
    $config->set('footer_claim', $form_state->getValue('footer_claim'));
    $config->set('cookies_settings_node', $form_state->getValue('cookies_settings_node'));
    $config->set('cookies_lifespan', $form_state->getValue('cookies_lifespan'));
    $config->set('feedback_form_report_uuid', $form_state->getValue('feedback_form_report_uuid'));
    $config->set('requests_notification_email', $form_state->getValue('requests_notification_email'));

    $config->save();

    $this->messenger()
      ->addWarning($this->t(
        'In order for the modifications of this configuration to be reflected on the website, it is necessary to start the <a href=":url">Frontend rebuild</a> manually.',
        [':url' => Url::fromRoute('svksk_base.frontend_rebuild')->toString()]
      ));
  }

  /**
   * Update file_usage record.
   *
   * @param int $fid
   * @param string $type
   *
   * @return int|null
   */
  private function addFileUsage(?int $fid, string $type) : ?int {
    if (empty($fid)) {
      return NULL;
    }
    try {
      /** @var \Drupal\file\FileInterface $file */
      $file = $this->entityTypeManager
        ->getStorage('file')
        ->load($fid);
      $this->fileUsage->add($file, 'svksk_base', $type, 'general_settings');
      $file->setPermanent();
      $file->save();
      return $file->id();
    } catch (\Exception $exception) {
      $this->messenger()
        ->addError($this->t('There was an error during file upload.'));
    }
    return NULL;
  }

  /**
   * Delete file_usage record.
   *
   * @param int|null $fid
   * @param string $type
   *
   * @return void|null
   */
  private function deleteFileUsage(?int $fid, string $type) {
    if (empty($fid)) {
      return NULL;
    }
    try {
      /** @var \Drupal\file\FileInterface $file */
      $file = $this->entityTypeManager
        ->getStorage('file')
        ->load($fid);
      if(NULL !== $file) {
        $this->fileUsage->delete($file, 'svksk_base');
      }
    } catch (\Exception $exception) {
      // do nothing
    }
  }

}
