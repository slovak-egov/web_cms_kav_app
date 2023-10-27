<?php

namespace Drupal\ip_comment_ban\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\Datetime\DateFormatter;
use Drupal\ip_comment_ban\IPCommentBanIpManagerInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Drupal\Core\Datetime\DrupalDateTime;
use Drupal\ip_comment_ban\IPCommentBanHelper;

/**
 * Edit a banned IP form.
 */
class IPCommentBanEdit extends FormBase {

  /**
   * IP Manager variable.
   *
   * @var \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface
   */
  protected $ipManager;

  /**
   * Date formatter variable.
   *
   * @var \Drupal\Core\Datetime\DateFormatter
   */
  protected $dateFormatter;

  /**
   * Constructs a new IPCommentBanEdit object.
   *
   * @param \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface $ip_manager
   *   Store IPCommentBanIpManagerInterface manager.
   * @param \Drupal\Core\Datetime\DateFormatter $dateFormatter
   *   Store DateFormatter manager.
   */
  public function __construct(IPCommentBanIpManagerInterface $ip_manager, DateFormatter $dateFormatter) {
    $this->ipManager = $ip_manager;
    $this->dateFormatter = $dateFormatter;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('ip_comment_ban.ip_manager'),
      $container->get('date.formatter')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'ip_comment_ban_ip_edit_form';
  }

  /**
   * {@inheritdoc}
   *
   * @param array $form
   *   Form variable.
   * @param Drupal\Core\Form\FormStateInterface $form_state
   *   FormState variable.
   * @param int $ban_id
   *   ID of the ban entry.
   */
  public function buildForm(array $form, FormStateInterface $form_state, int $ban_id = NULL) {
    $ban_data = $this->ipManager->findById($ban_id);

    // Do a basic validation if the ban item exists in db.
    if (!empty($ban_data)) {
      /** @var object $ban_data */
      $ban_data = reset($ban_data);
    }
    else {
      // Just show a message for the user once there is no such id.
      return ['#markup' => $this->t('There is no such id.')];
    }

    $form['preview'] = [
      '#type' => 'fieldset',
      '#title' => $this->t('View current IP ban'),
    ];

    $expiry_duration = $this->t('Never');
    if (!empty($ban_data->expiry_date)) {
      $expiry_duration = $this->dateFormatter->format($ban_data->expiry_date);
    }

    // Draw the IP ban preview.
    $form['preview']['ip_ban'] = [
      '#theme' => 'ip_ban_view',
      '#ip' => is_numeric($ban_data->ip) ? long2ip($ban_data->ip) : $ban_data->ip,
      '#status' => $this->ipManager->getEntryStatus($ban_data->expiry_date),
    ];

    if (!empty($ban_data->ip_end)) {
      $form['preview']['ip_ban']['#ip_end'] = is_numeric($ban_data->ip_end) ? long2ip($ban_data->ip_end) : $ban_data->ip_end;
    }

    if (!empty($expiry_duration)) {
      $form['preview']['ip_ban']['#expiry_duration'] = $expiry_duration;
    }

    $expiry_durations = [
      IPCommentBanHelper::IP_COMMENT_BAN_NEVER => $this->t('Never'),
    ] + $this->ipManager->expiryDurations();

    // Allow editing the expiry duration.
    $form['expiry_duration'] = [
      '#title' => $this->t('Set new IP ban expiry duration'),
      '#type' => 'select',
      '#options' => $expiry_durations,
    ];

    $form['ip'] = [
      '#type' => 'hidden',
      '#value' => $ban_data->ip,
    ];
    $form['ip_end'] = [
      '#type' => 'hidden',
      '#value' => $ban_data->ip_end,
    ];

    $form['save'] = [
      '#type' => 'submit',
      '#name' => 'save',
      '#value' => $this->t('Save'),
    ];
    $form['cancel'] = [
      '#type' => 'submit',
      '#name' => 'cancel',
      '#value' => $this->t('Cancel'),
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $button_clicked = $form_state->getTriggeringElement()['#name'];

    // Triggering the save button.
    if ($button_clicked == 'save') {
      // Get both ip and ip_end from the hidden form fields.
      $ip = trim($form_state->getValue('ip'));
      $ip_end = trim($form_state->getValue('ip_end'));
      $expiry_duration_index = $form_state->getValue('expiry_duration');

      // Process the new expire value.
      if ($expiry_duration_index == IPCommentBanHelper::IP_COMMENT_BAN_NEVER) {
        $expiry_date = NULL;
      }
      else {
        $expiry_duration = $this->ipManager->expiryDurations($expiry_duration_index);
        $expiry_date = (new DrupalDateTime($expiry_duration))->getTimestamp();
      }

      // Set new values for the IP ban iem.
      $this->ipManager->banIp($ip, $ip_end, $expiry_date);

      // Update the IP ban data.
      $formatIp = $this->ipManager->formatIp($ip, $ip_end);

      // Display a system message after saving.
      $this->messenger()->addMessage(!$expiry_date ?
        $this->t('The IP address(es) %ip has been banned.', ['%ip' => $formatIp]) :
        $this->t('The IP address(es) %ip has been banned until %expiry', [
          '%ip' => $formatIp,
          '%expiry' => $this->dateFormatter->format($expiry_date),
        ])
      );
    }

    // Go back to the IP ban list.
    $form_state->setRedirect('ip_comment_ban.admin_page');
  }

}
