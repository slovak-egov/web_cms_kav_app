<?php

namespace Drupal\svksk_base\Plugin\Validation\Constraint;

use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

/**
 * Validates the EntityReferenceExcludeSelf constraint.
 */
class ExcludeSelfReferenceConstraintValidator extends ConstraintValidator {

  /**
   * {@inheritdoc}
   */
  public function validate($value, Constraint $constraint) {
    foreach ($value as $item) {
      $entity = $item->getEntity();
      if ($entity->getEntityTypeId() === 'paragraph' || method_exists($entity, 'getParentEntity')) {
        $entity = $item->getEntity()->getParentEntity();
      }
      if ($entity) {
        $item_value = $item->getValue();

        if ($entity->id() == $item_value['target_id']) {
          $this->context->addViolation($constraint->self, ['%value' => $entity->label()]);
        }
      }
    }
  }

}
