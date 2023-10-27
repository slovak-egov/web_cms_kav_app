<?php

namespace Drupal\svksk_content;

use Drupal\Component\Render\FormattableMarkup;
use Drupal\content_moderation\ModerationInformationInterface;
use Drupal\Core\Datetime\DateFormatterInterface;
use Drupal\Core\Entity\EntityTypeManager;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Drupal\node\NodeInterface;
use Drupal\scheduler\SchedulerManager;

/**
 * Helper services for customer functionality build on Scheduler module.
 */
class SchedulerService {

  use StringTranslationTrait;

  /**
   *
   * @var \Drupal\Core\Entity\EntityTypeManager
   */
  protected $entityTypeManager;

  /**
   *
   * @var \Drupal\scheduler\SchedulerManager
   */
  protected $schedulerManager;

  /**
   * @var \Drupal\content_moderation\ModerationInformationInterface
   */
  protected $moderationInformation;

  /**
   * @var \Drupal\Core\Datetime\DateFormatterInterface
   */
  protected $dateFormatter;


  public function __construct(EntityTypeManager $entity_manager, SchedulerManager $scheduler_manager, ModerationInformationInterface $moderation_information, DateFormatterInterface $date_formatter) {
    $this->entityTypeManager = $entity_manager;
    $this->schedulerManager = $scheduler_manager;
    $this->moderationInformation = $moderation_information;
    $this->dateFormatter = $date_formatter;
  }

  /**
   * Scheduler info bar in node detail.
   *
   * @param \Drupal\node\NodeInterface $node
   *
   * @return array|string[]
   */
  public function nodeInfoBar(NodeInterface $node) : array {
    $build = [];
    $scheduler_manager = \Drupal::service('scheduler.manager');
    if ($scheduler_manager->isAllowed($node, 'publish') || $scheduler_manager->isAllowed($node, 'unpublish')) {
      $messages = [];
      $is_moderated = $this->moderationInformation->isModeratedEntity($node);
      $moderation_state = $node->hasField('moderation_state') ? $node->get('moderation_state')->value : NULL;
      if (!$node->get('publish_on')->isEmpty()) {
        $publish_on_formatted = $this->dateFormatter->format($node->get('publish_on')->value, 'short');
        if ($is_moderated && $moderation_state !== 'approved') {
          $messages[] = [
            'type' => 'warning',
            'text' => $this->t('This content is scheduled for publishing on @date but it\'s not approved for publishing therefore publish action will not be executed', [
              '@date' => new FormattableMarkup('<strong>' . $publish_on_formatted . '</strong>', [])
            ])
          ];
        } else {
          $messages[] = [
            'type' => 'info',
            'text' => $this->t('This content is scheduled for publishing on @date', [
              '@date' => new FormattableMarkup('<strong>' . $publish_on_formatted . '</strong>', [])
            ])
          ];
        }
      }
      if (!$node->get('unpublish_on')->isEmpty()) {
        $unpublish_on_formatted = $this->dateFormatter->format($node->get('unpublish_on')->value, 'short');
        if ($is_moderated && $moderation_state !== 'published' && $node->get('publish_on')->isEmpty()) {
          $messages[] = [
            'type' => 'warning',
            'text' => $this->t('This content is scheduled for unpublishing on @date but it\'s not published therefore unpublish action will not be executed', [
              '@date' => new FormattableMarkup('<strong>' . $unpublish_on_formatted . '</strong>', [])
            ])
          ];
        } else {
          $messages[] = [
            'type' => 'info',
            'text' => $this->t('This content is scheduled for unpublishing on @date', [
              '@date' => new FormattableMarkup('<strong>' . $unpublish_on_formatted . '</strong>', [])
            ])
          ];
        }
      }

      if (!empty($messages)) {
        $build = [
          '#type' => 'container',
        ];
        foreach ($messages as $message) {
          $build[] = [
            '#type' => 'html_tag',
            '#tag' => 'div',
            '#attributes' => [
              'class' => [
                'scheduler-message',
                'scheduler-message--' . $message['type']
              ]
            ],
            '#value' => $message['text'],
          ];
        }
      }
    }
    return $build;
  }

}
