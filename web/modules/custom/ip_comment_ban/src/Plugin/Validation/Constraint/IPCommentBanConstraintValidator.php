<?php

namespace Drupal\ip_comment_ban\Plugin\Validation\Constraint;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;

use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;
use Drupal\Core\Session\AccountProxyInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;

/**
 * Validates the current user is not banned from the comments.
 */
class IPCommentBanConstraintValidator extends ConstraintValidator implements ContainerInjectionInterface {


    protected $banIpManager;
//   /**
//    * The current user.
//    *
//    * @var \Drupal\Core\Entity\EntityInterface
//    */
//   protected $currentUser;

  /**
   * The entity type manager service.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * Construct for CommentsBanConstraintValidator.
   *
   * @param Drupal\Core\Session\AccountProxyInterface $current_user
   *   The current user service.
   * @param Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   *   The entity type manager service.
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager) {
    $this->entityTypeManager = $entity_type_manager;
    $this->banIpManager = \Drupal::service('ip_comment_ban.ip_manager');
    // $this->currentUser = $this->entityTypeManager->getStorage('user')->load($current_user->id());
  }

  /**
   * {@inheritDoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
    //   $container->get('current_user'),
      $container->get('entity_type.manager')
    );
  }

  /**
   * {@inheritdoc}
   */
  public function validate($item, Constraint $constraint) {
    $ip =  \Drupal::request()->getClientIp();
    $ban_result = $this->banIpManager->isBanned($ip, [
      'expiry_check' => TRUE,
      'info_output' => TRUE,
    ]);
    if ($ban_result['is_banned']) {
        $this->context->addViolation($constraint->userCommentBanned,[]);
    }
  }

}
