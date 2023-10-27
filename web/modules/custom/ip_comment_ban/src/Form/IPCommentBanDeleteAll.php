<?php

namespace Drupal\ip_comment_ban\Form;

use Drupal\Core\Form\FormBase;
use Drupal\ip_comment_ban\IPCommentBanIpManagerInterface;
use Drupal\Core\Form\FormStateInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Provides a form to unban IP addresses.
 */
class IPCommentBanDeleteAll extends FormBase {

  /**
   * The IP manager.
   *
   * @var \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface
   */
  protected $ipManager;

  /**
   * Constructs a new BanDelete object.
   *
   * @param \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface $ip_manager
   *   The IP manager.
   */
  public function __construct(IPCommentBanIpManagerInterface $ip_manager) {
    $this->ipManager = $ip_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('ip_comment_ban.ip_manager')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function getFormId() {
    return 'ip_comment_ban_ip_delete_all_form';
  }

  /**
   * {@inheritdoc}
   */
  public function buildForm(array $form, FormStateInterface $form_state) {
    $form = [];

    $form['ip_comment_ban_delete_range'] = [
      '#title' => $this->t('Delete all simple/range IP'),
      '#options' => [
        'all' => $this->t('Delete all'),
        'simple' => $this->t('Delete all simple IP only'),
        'range' => $this->t('Delete all range IP only'),
      ],
      '#type' => 'radios',
      '#required' => TRUE,
    ];

    $form['ip_comment_ban_delete_expire'] = [
      '#title' => $this->t('Delete all expired IP'),
      '#options' => [
        'all' => $this->t('Delete all'),
        'expired' => $this->t('Delete expired IP only'),
        'not_expired' => $this->t('Delete not expired IP only'),
      ],
      '#type' => 'radios',
      '#required' => TRUE,
    ];

    $form['actions'] = ['#type' => 'actions'];
    $form['actions']['submit'] = [
      '#type' => 'submit',
      '#value' => $this->t('Delete'),
    ];

    return $form;
  }

  /**
   * {@inheritdoc}
   */
  public function submitForm(array &$form, FormStateInterface $form_state) {
    $params = [
      'range' => $form_state->getValue('ip_comment_ban_delete_range'),
      'expire' => $form_state->getValue('ip_comment_ban_delete_expire'),
    ];

    $deleted = $this->ipManager->unbanIpAll($params);
    if ($deleted > 0) {
      $this->logger('advanced ban')->notice('Deleted all IP');
      $this->messenger()->addMessage($this->t('Checked IP addresses groups were deleted.'));
    }
    else {
      $this->messenger()->addMessage($this->t('No IP addresses for delete.'));
    }
  }

}
