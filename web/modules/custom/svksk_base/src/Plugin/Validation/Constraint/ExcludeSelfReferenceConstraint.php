<?php

namespace Drupal\svksk_base\Plugin\Validation\Constraint;

use Symfony\Component\Validator\Constraint;

/**
 * Checks that the submitted value is ot a self node.
 *
 * @Constraint(
 *   id = "ExcludeSelfReference",
 *   label = @Translation("Entity Reference - Exclude Self", context = "Validation"),
 *   type = { "entity", "entity_reference" }
 * )
 */
class ExcludeSelfReferenceConstraint extends Constraint {
  // The message that will be shown if the value is self reference.

  public $self = 'You cannot use self node (%value) as reference.';

}
