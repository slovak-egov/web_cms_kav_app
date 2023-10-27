<?php

namespace Drupal\ip_comment_ban;

use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Database\Connection;
use Drupal\Component\Render\FormattableMarkup;
use Drupal\Core\Config\ConfigFactory;
use Drupal\Component\Datetime\Time;
use Drupal\ip_comment_ban\IPCommentBanHelper;

/**
 * Ban IP manager.
 */
class IPCommentBanIpManager extends ControllerBase implements IPCommentBanIpManagerInterface {

  /**
   * The database connection used to check the IP against.
   *
   * @var \Drupal\Core\Database\Connection
   */
  protected $connection;

  /**
   * The configuration factory service.
   *
   * @var \Drupal\Core\Config\ConfigFactory
   */
  protected $config;

  /**
   * The time service.
   *
   * @var \Drupal\Component\Datetime\Time
   */
  protected $time;

  /**
   * @param \Drupal\Core\Database\Connection $connection
   *   The database connection which will be used to check the IP against.
   * @param \Drupal\Core\Config\ConfigFactory $config
   *   The configuration factory service.
   * @param \Drupal\Component\Datetime\Time $time
   *   The time service.
   */
  public function __construct(Connection $connection, ConfigFactory $config, Time $time) {
    $this->connection = $connection;
    $this->config = $config;
    $this->time = $time;
  }

  /**
   * {@inheritdoc}
   */
  public function isBanned($ip, array $options = []) {
    // Merge in defaults.
    $options += [
      'expiry_check' => TRUE,
      'info_output' => FALSE,
      'no_limit' => FALSE,
    ];

    // Collect result info.
    if ($options['info_output']) {
      $result_info = ['iid' => '', 'expiry_date' => ''];
    }

    if (!$options['expiry_check']) {
      $ban_info = $this->connection->query("SELECT iid FROM {ip_comment_ban_ip} WHERE ip = :ip", [':ip' => $ip])->fetchField();
      $is_banned = (bool) $ban_info;
      if ($is_banned && $options['info_output']) {
        $result_info['iid'] = $ban_info;
      }
    }
    else {
      $ban_info = $this->connection->query("SELECT iid, expiry_date FROM {ip_comment_ban_ip} WHERE ip = :ip", [':ip' => $ip])->fetchAll();
      $is_banned = count($ban_info) && (empty($ban_info[0]->expiry_date) || $ban_info[0]->expiry_date > $this->time->getRequestTime());
      if ($is_banned && $options['info_output']) {
        $result_info['iid'] = $ban_info[0]->iid;
        $result_info['expiry_date'] = $ban_info[0]->expiry_date;
      }
    }

    if (!$is_banned) {
      // Check for a range ban.
      $ip_long = ip2long($ip);
      if ($ip_long) {
        $limit = $options['no_limit'] ? NULL : 1;
        if (!$options['expiry_check']) {
          if (!$limit) {
            $ban_info = $this->connection->query("SELECT iid FROM {ip_comment_ban_ip} WHERE ip_end <> '' AND ip::bigint <= $ip_long AND ip_end::biginy >= $ip_long")->fetchAll();
            $is_banned = count($ban_info);
            if ($is_banned && $options['info_output']) {
              $result_info['iid'] = [];
              foreach ($ban_info as $item) {
                $result_info['iid'][] = $item->iid;
              }
            }
          }
          else {
            $ban_info = $this->connection->queryRange("SELECT iid FROM {ip_comment_ban_ip} WHERE ip_end <> '' AND ip::bigint <= $ip_long AND ip_end::bigint >= $ip_long", 0, $limit)->fetchField();
            $is_banned = (bool) $ban_info;
            if ($is_banned && $options['info_output']) {
              $result_info['iid'] = $ban_info;
            }
          }
        }
        else {
          if ($limit) {
            $query = $this->connection->queryRange("SELECT iid, expiry_date FROM {ip_comment_ban_ip} WHERE ip_end <> '' AND ip::bigint <= $ip_long AND ip_end::bigint >= $ip_long", 0, $limit);
          }
          else {
            $query = $this->connection->query("SELECT iid, expiry_date FROM {ip_comment_ban_ip} WHERE ip_end <> '' AND ip::bigint <= $ip_long AND ip_end::bigint >= $ip_long");
          }
          $ban_info = $query->fetchAll();
          $is_banned = count($ban_info) && (empty($ban_info[0]->expiry_date) || $ban_info[0]->expiry_date > $this->time->getRequestTime());
          if ($is_banned && $options['info_output']) {
            $result_info['iid'] = [];
            foreach ($ban_info as $item) {
              $result_info['iid'][] = $item->iid;
            }
            $result_info['expiry_date'] = $ban_info[0]->expiry_date;
          }
        }
      }
    }

    if ($options['info_output']) {
      $result_info['is_banned'] = $is_banned;
      return $result_info;
    }
    else {
      return $is_banned;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function findAll() {
    return $this->connection->query('SELECT * FROM {ip_comment_ban_ip}');
  }

  /**
   * {@inheritdoc}
   */
  public function banIp($ip, $ip_end = '', $expiry_date = NULL) {
    if (!empty($ip_end)) {
      if (!is_numeric($ip)) {
        $ip = sprintf("%u", ip2long($ip));
      }

      if (!is_numeric($ip_end)) {
        $ip_end = sprintf("%u", ip2long($ip_end));
      }

      $fields = ['ip' => $ip, 'ip_end' => $ip_end];
    }
    else {
      $fields = ['ip' => $ip];
    }

    // Set expiry date using defaut expiry durations.
    if (!$expiry_date) {
      $expiry_duration = $this->config->get('ip_comment_ban.settings')->get('default_expiry_duration');
      if ($expiry_duration && $expiry_duration != IPCommentBanHelper::IP_COMMENT_BAN_NEVER) {
        $expiry_date = strtotime($expiry_duration);
        if (!$expiry_date) {
          $this->messenger()->addMessage($this->t('Wrong expiry date for duration %expiry_duration', ['%expiry_duration' => $expiry_duration]),
            'error');
          return;
        }
      }
    }

    $fields['expiry_date'] = $expiry_date ?: 0;

    $this->connection->merge('ip_comment_ban_ip')
      ->key(['ip' => $ip])
      ->fields($fields)
      ->execute();
  }

  /**
   * {@inheritdoc}
   */
  public function unbanIp($ip, $ip_end = '') {
    $query = $this->connection->delete('ip_comment_ban_ip');
    if (!empty($ip_end)) {
      $query->condition('ip', $ip);
      $query->condition('ip_end', $ip_end);
    }
    else {
      $query->condition('ip', $ip);
    }
    $query->execute();
  }

  /**
   * {@inheritdoc}
   */
  public function unbanIpAll(array $params = []) {
    $query = $this->connection->delete('ip_comment_ban_ip');
    if (!empty($params)) {
      // Range parameters.
      if (!empty($params['range']) && $params['range'] != 'all') {
        switch ($params['range']) {
          case 'simple':
            $query->condition('ip_end', '');
            break;

          case 'range':
            $query->condition('ip_end', '', '<>');
            break;

        }
      }

      // Expire parameters.
      if (!empty($params['expire']) && $params['expire'] != 'all') {
        switch ($params['expire']) {
          case 'expired':
            $query->condition('expiry_date', 0, '<>');
            break;

          case 'not_expired':
            $query->condition('expiry_date', 0);
            break;
        }
      }
    }
    return $query->execute();
  }

  /**
   * {@inheritdoc}
   */
  public function findById($ban_id) {
    return $this->connection->query("SELECT * FROM {ip_comment_ban_ip} WHERE iid = :iid", [':iid' => $ban_id])->fetchAll();
  }

  /**
   * {@inheritdoc}
   */
  public function formatIp($ip, $ip_end = '') {
    if (!empty($ip_end)) {
      if (is_numeric($ip)) {
        $ip = long2ip($ip);
      }
      if (is_numeric($ip_end)) {
        $ip_end = long2ip($ip_end);
      }

      $format_text = $this->config->get('ip_comment_ban.settings')
        ->get('range_ip_format') ?: '@ip_start ... @ip_end';
      $text = new FormattableMarkup($format_text, [
        '@ip_start' => $ip,
        '@ip_end' => $ip_end,
      ]);
      return $text;
    }
    else {
      return $ip;
    }
  }

  /**
   * {@inheritdoc}
   */
  public function expiryDurations($index = NULL) {
    $expiry_durations = $this->config->get('ip_comment_ban.settings')->get('expiry_durations');

    if (empty($expiry_durations)) {
      $expiry_durations = "+1 hour\n+1 day\n+1 week\n+1 month\n+1 year";

      $this->config->getEditable('ip_comment_ban.settings')
        ->set('expiry_durations', $expiry_durations)
        ->save();
    }

    $list = explode("\n", $expiry_durations);
    if ($index != NULL) {
      $list[] = IPCommentBanHelper::IP_COMMENT_BAN_NEVER;
      return $list[$index] ?? IPCommentBanHelper::IP_COMMENT_BAN_NEVER;
    }

    return $list;
  }

  /**
   * {@inheritdoc}
   */
  public function expiryDurationIndex(array $expiry_durations, $default_expiry_duration) {
    if (!$default_expiry_duration || $default_expiry_duration == IPCommentBanHelper::IP_COMMENT_BAN_NEVER) {
      $expiry_durations_index = IPCommentBanHelper::IP_COMMENT_BAN_NEVER;
    }
    else {
      $expiry_durations_index = array_search($default_expiry_duration, $expiry_durations);
      if ($expiry_durations_index === FALSE) {
        $expiry_durations_index = IPCommentBanHelper::IP_COMMENT_BAN_NEVER;
      }
    }

    return $expiry_durations_index;
  }

  /**
   * {@inheritdoc}
   */
  public function unblockExpiredIp() {
    $query = $this->connection->delete('ip_comment_ban_ip');
    $query->condition('expiry_date', 0, '>');
    $query->condition('expiry_date', strtotime('now'), '<');
    return $query->execute();
  }

  /**
   * {@inheritdoc}
   */
  public function banText(array $variables) {
    $ban_text = $this->config->get('ip_comment_ban.settings')->get('ip_comment_ban_ban_text') ?: '@ip has been banned';
    $ban_text_params = ['@ip' => $variables['ip']];
    $expiry_date = $variables['expiry_date'];
    if (!empty($expiry_date)) {
      $ban_text = $this->config->get('ip_comment_ban.settings')->get('ip_comment_ban_ban_expire_text') ?: '@ip has been banned up to @expiry_date';
      $ban_text_params['@expiry_date'] = date('r', $expiry_date);
    }
    return new FormattableMarkup($ban_text, $ban_text_params);
  }

  /**
   * {@inheritdoc}
   */
  public function getEntryStatus($expiry_date) {
    $now = $this->time->getRequestTime();
    return !empty($expiry_date) && $expiry_date < $now
      ? $this->t('Expired') : $this->t('Active');
  }

}
