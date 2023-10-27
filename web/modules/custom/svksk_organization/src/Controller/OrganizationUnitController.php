<?php

namespace Drupal\svksk_organization\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Form\FormBuilder;
use Drupal\Core\Url;
use Drupal\svksk_organization\Entity\OrganizationalUnit;
use Drupal\svksk_organization\ServiceHoursEntityListBuilder;
use Symfony\Component\DependencyInjection\ContainerInterface;

class OrganizationUnitController extends ControllerBase {

  /**
   * The form builder.
   *
   * @var FormBuilder
   */
  protected $formBuilder;

  /**
   * The MbController constructor.
   *
   * @param FormBuilder $formBuilder
   *   The form builder.
   */
  public function __construct(FormBuilder $formBuilder) {
    $this->formBuilder = $formBuilder;
  }

  /**
   * {@inheritdoc}
   *
   * @param ContainerInterface $container
   *   The Drupal service container.
   *
   * @return static
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('form_builder')
    );
  }

  public function serviceHours(OrganizationalUnit $organizational_unit) {
    $list = new ServiceHoursEntityListBuilder(
      $this->entityTypeManager()->getDefinition('service_hours'),
      $this->entityTypeManager()->getStorage('service_hours'),
      $organizational_unit
    );

    $build = [
      'list' => $list->render(),
      'buttons' => [
        '#type' => 'container',
        'add_service_hours' => [
          '#type' => 'link',
          '#title' => $this->t('Add new Service Hours'),
          '#url' => Url::fromRoute('entity.service_hours.add_form', [
            'organizational_unit' => $organizational_unit->id()
          ], ['query' => \Drupal::service('redirect.destination')->getAsArray()]),
          '#options' => [
            'attributes' => [
              'class' => [
                'button',
                'button--action',
                'button--primary',
              ],
            ],
          ],
        ]
      ]
    ];

    return $build;
  }

}
