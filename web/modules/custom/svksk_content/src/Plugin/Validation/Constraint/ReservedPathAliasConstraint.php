<?php

namespace Drupal\svksk_content\Plugin\Validation\Constraint;

use Symfony\Component\Validator\Constraint;

/**
 * Validates path alias agains list of reserved paths.
 *
 * @Constraint(
 *   id = "ReservedPathAlias",
 *   label = @Translation("Validate reserved path alias.", context = "Validation"),
 * )
 */
class ReservedPathAliasConstraint extends Constraint {

  // The message that will be shown when reserved path is used in path alias.
  public $message = 'The path you have used (%alias) is an internally reserved path. Please use another path.';

}
