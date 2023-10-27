<?php

namespace Drupal\svksk_content\Plugin\Validation\Constraint;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

/**
 * Validates the ReservedPathAliasConstraintValidator constraint.
 */
class ReservedPathAliasConstraintValidator extends ConstraintValidator {

  /**
   * Reserved paths.
   *
   * @var array
   */
  private static $reservedPaths = [
    '/home'
  ];

  /**
   * {@inheritdoc}
   */
  public function validate($entity, Constraint $constraint) {
    /** @var \Drupal\path_alias\PathAliasInterface $entity */
    $alias = $entity->getAlias();
    if (in_array($alias, self::$reservedPaths)) {
      $this->context->addViolation($constraint->message, ['%alias' => $alias]);
    }
  }

}
