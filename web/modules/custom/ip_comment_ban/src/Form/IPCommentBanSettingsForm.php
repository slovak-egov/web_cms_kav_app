<?php

namespace Drupal\ip_comment_ban\Form;

use Drupal\Core\Form\ConfigFormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Config\ConfigFactoryInterface;
use Drupal\ip_comment_ban\IPCommentBanHelper;
use Drupal\ip_comment_ban\IPCommentBanIpManagerInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Drupal\ip_comment_ban\ip_comment_banHelper;

/**
 * Configure ip_comment_ban settings for this site.
 */
class IPCommentBanSettingsForm extends ConfigFormBase {

  /**
   * IP Manager variable.
   *
   * @var \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface
   */
  protected $ipManager;

  /**
   * Constructs a \Drupal\system\ConfigFormBase object.
   *
   * @param \Drupal\Core\Config\ConfigFactoryInterface $config_factory
   *   The factory for configuration objects.
   * @param \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface $ip_manager
   *   Store IPCommentBanIpManagerInterface manager.
   */
  public function __construct(ConfigFactoryInterface $config_factory,
    IPCommentBanIpManagerInterface $ip_manager) {
    parent::__construct($config_factory);
    $this->ipManager = $ip_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('config.factory'),
      $container->get('ip_comment_ban.ip_manager')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'ip_comment_ban_admin_settings';
  }

  /**
   * {@inheritdoc}
   */
  protected function getEditableConfigNames() {
    return [
      'ip_comment_ban.settings',
    ];
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $config = $this->config('ip_comment_ban.settings');

    $expiry_durations = $this->ipManager->expiryDurations();

    $form['ip_comment_ban_expiry_durations'] = [
      '#type' => 'textarea',
      '#title' => $this->t('Expiry durations'),
      '#default_value' => $config->get('expiry_durations'),
      '#description' => $this->t("Must be in a format that <a href='@strtotime'>PHP's strtotime function</a> can interpret.", [
        '@strtotime' => 'https://php.net/manual/function.strtotime.php',
      ]),
      '#required' => TRUE,
    ];

    $default_expiry_duration = $config->get('default_expiry_duration');
    $expiry_durations_index = $this->ipManager->expiryDurationIndex($expiry_durations, $default_expiry_duration);

    $form['ip_comment_ban_default_expiry_duration'] = [
      '#title' => $this->t('Default IP ban expiry duration'),
      '#type' => 'select',
      '#options' => [IPCommentBanHelper::IP_COMMENT_BAN_NEVER => $this->t('Never')] + $expiry_durations,
      '#default_value' => $expiry_durations_index,
      '#description' => $this->t('Select default expiration duration for ban.'),
    ];

    $form['ip_comment_ban_save_last_expiry_duration'] = [
      '#title' => $this->t('Save last IP ban expiry duration'),
      '#type' => 'checkbox',
      '#default_value' => $config->get('save_last_expiry_duration'),
      '#description' => $this->t('Change default expiry duration after each IP ban.'),
    ];

    $form['ip_comment_ban_range_ip_format'] = [
      '#title' => $this->t('Range IP format'),
      '#type' => 'textfield',
      '#default_value' => $config->get('range_ip_format') ?: '@ip_start ... @ip_end',
      '#description' => $this->t('Range IP format for IP list. Use @ip_start, @ip_end variables.'),
    ];

    $form['ip_comment_ban_ban_text'] = [
      '#title' => $this->t('Ban text'),
      '#type' => 'textarea',
      '#default_value' => $config->get('ip_comment_ban_ban_text') ?: '@ip has been banned',
      '#description' => $this->t('Format ban text. Use @ip variable.'),
    ];

    $form['ip_comment_ban_ban_expire_text'] = [
      '#title' => $this->t('Ban text with expire'),
      '#type' => 'textarea',
      '#default_value' => $config->get('ip_comment_ban_ban_expire_text') ?: '@ip has been banned up to @expiry_date',
      '#description' => $this->t('Format ban text with expire date. Use @ip, @expiry_date variables.'),
    ];

    return parent::buildForm($form, $form_state);
  }

  /**
   * {@inheritdoc}
   */
  public function validateForm(array &$form, FormStateInterface $form_state) {
    // Expiry durations validate.
    $arr_ip_comment_ban_expiry_durations = explode("\n", $form_state->getValue('ip_comment_ban_expiry_durations'));

    // Check for wrong time formats.
    foreach ($arr_ip_comment_ban_expiry_durations as $key => $duration) {
      if (!strtotime($duration)) {
        $form_state->setErrorByName('ip_comment_b_expiry_durations', $this->t('Expiry time formats has wrong expiry time %duration.', ['%duration' => $duration]));
      }
      $arr_ip_comment_ban_expiry_durations[$key] = trim($arr_ip_comment_ban_expiry_durations[$key]);
    }

    // Check for expiry durations doubles.
    if (count($arr_ip_comment_ban_expiry_durations) != count(array_flip($arr_ip_comment_ban_expiry_durations))) {
      $form_state->setErrorByName('ip_comment_ban_expiry_durations', $this->t('Expiry durations has dublicated items'));
    }
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $this->config('ip_comment_ban.settings')
      ->set('expiry_durations', $form_state->getValue('ip_comment_ban_expiry_durations'))
      ->set('default_expiry_duration', $this->ipManager->expiryDurations($form_state->getValue('ip_comment_ban_default_expiry_duration')))
      ->set('save_last_expiry_duration', $form_state->getValue('ip_comment_ban_save_last_expiry_duration'))
      ->set('range_ip_format', $form_state->getValue('ip_comment_ban_range_ip_format'))
      ->set('ip_comment_ban_ban_text', $form_state->getValue('ip_comment_ban_ban_text'))
      ->set('ip_comment_ban_ban_expire_text', $form_state->getValue('ip_comment_ban_ban_expire_text'))
      ->save();

    parent::submitForm($form, $form_state);
  }

}
