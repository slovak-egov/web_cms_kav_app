<?php

namespace Drupal\skit_time_field\Plugin\Validation\Constraint;

use Symfony\Component\Validator\Constraint;

/**
 * Checks that the submitted value is a unique integer.
 *
 * @Constraint(
 *   id = "time",
 *   label = @Translation("Time", context = "Validation"),
 *   type = "string"
 * )
 */
class TimeConstraint extends Constraint {

  /**
   * The default violation message.
   *
   * @var string
   */
  public static $message = 'This value is not a valid time.';

}
