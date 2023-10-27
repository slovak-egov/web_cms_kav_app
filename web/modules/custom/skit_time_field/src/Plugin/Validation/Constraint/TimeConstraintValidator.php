<?php

namespace Drupal\skit_time_field\Plugin\Validation\Constraint;

use Drupal\skit_time_field\Time;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

/**
 * TimeConstraintValidator.
 *
 * @package Drupal\skit_time_field\Plugin\Validation\Constraint
 */
class TimeConstraintValidator extends ConstraintValidator {

  /**
   * {@inheritdoc}
   */
  public function validate($value, Constraint $constraint) {
    try {
      Time::createFromTimestamp($value);
    }
    catch (\InvalidArgumentException $e) {
      $this->context->addViolation(TimeConstraint::$message, []);
    }
  }

}
