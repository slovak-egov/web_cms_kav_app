<?php

namespace Drupal\svksk_content;

use Drupal\Core\DependencyInjection\ContainerInjectionInterface;
use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\Core\Form\FormStateInterface;
use Drupal\Core\StringTranslation\StringTranslationTrait;
use Symfony\Component\DependencyInjection\ContainerInterface;

/**
 * Defines form hook alters used in svksk_content.module file.
 *
 * @internal
 */
class ModuleFormAlters implements ContainerInjectionInterface {

  use StringTranslationTrait;

  /**
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   */
  public function __construct(EntityTypeManagerInterface $entity_type_manager) {
    $this->entityTypeManager = $entity_type_manager;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('entity_type.manager'),
    );
  }

  /**
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return void
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function viewsExposedFormContentAdminAlter(array &$form, FormStateInterface $form_state): void {
    $input = $form_state->getUserInput();
    $query = \Drupal::request()->query->all();

    unset($query['check_logged_in']);

    /** @var \Drupal\user\Entity\User $user */
    $current_user = $this->entityTypeManager->getStorage('user')
      ->load(\Drupal::currentUser()->id());

    $form['#attached']['library'][] = 'svksk_content/content_admin_datepicker';
    $form['#attached']['library'][] = 'svksk_content/content_admin_view';
    $empty = $this->t('- Any -');

    // Switch select elements to select2
    $select_names = [
      'type',
      'status',
      'langcode',
      'organizational_unit',
      'tags',
      'uid',
      'life_event_category',
      'service_category',
      'faq_category',
    ];

    foreach ($select_names as $el_name) {
      $element = &$form[$el_name];

      if (!isset($element)) {
        continue;
      }
      $element['#size'] = 1;
      $element['#type'] = 'select2';
      $element['#select2']['minimumResultsForSearch'] = 15;
      $element['#select2']['width'] = 230;

      if (isset($element['#options']['All'])) {
        $element['#empty_value'] = 'All';
      }

      $element['#empty_option'] = $empty;
    }

    if (isset($form['life_event_category'])) {
      $form['life_event_category']['#states'] = [
        'visible' => [
          [':input[name="type"]' => ['value' => 'life_event']],
          'or',
          [':input[name="life_event_category"]' => ['!value' => 'All']],
        ],
      ];
    }

    $form['status']['#select2']['width'] = 200;
    $form['langcode']['#select2']['width'] = 200;
    $form['tags']['#select2']['width'] = 300;

    if (isset($form['faq_category']) && $form['#id'] !== 'views-exposed-form-content-entity-browser-faq') {
      $form['faq_category']['#states'] = [
        'visible' => [
          [':input[name="type"]' => ['value' => 'faq']],
          'or',
          [':input[name="faq_category"]' => ['!value' => 'All']],
        ],
      ];
    }

    if (isset($form['service_category'])) {
      $form['service_category']['#states'] = [
        'visible' => [
          [':input[name="type"]' => ['value' => 'service']],
          'or',
          [':input[name="service_category"]' => ['!value' => 'All']],
        ],
      ];
    }

    // Break filters visually before Status filter
    if (isset($form['status'])) {
      $form['status']['#prefix'] = '<br />';
    }

    if (isset($form['published_from'])) {
      $form['published_from']['#size'] = 10;
    }

    if (isset($form['published_to'])) {
      $form['published_to']['#size'] = 10;
    }

    if (isset($form['organizational_unit'])) {
      //$form['organizational_unit']['#options'] = ['' => $empty];

      $units = $this->entityTypeManager->getStorage('organizational_unit')
        ->loadMultiple();

      /** @var \Drupal\svksk_organization\Entity\OrganizationalUnit $unit */
      foreach ($units as $unit) {
        $form['organizational_unit']['#options'][$unit->id()] = $unit->label();
      }

      if (in_array('organization_editor', $current_user->getRoles()) && empty($query)) {
        if (!$current_user->get('field_organizational_unit')->isEmpty()) {
          $input['organizational_unit'] = $current_user->get('field_organizational_unit')->target_id;
        }
      }
    }

    if (isset($form['uid'])) {
      $ids = $this->entityTypeManager->getStorage('user')->getQuery()
        ->accessCheck(true)
        ->condition('status', 1)
        ->condition('roles', [
          'content_editor',
          'organization_editor',
          'content_admin',
          'administrator',
        ], 'IN')
        ->execute();
      $users = $this->entityTypeManager->getStorage('user')->loadMultiple($ids);
      /** @var \Drupal\user\Entity\User $user */
      foreach ($users as $user) {
        $form['uid']['#options'][$user->id()] = $user->getDisplayName();
      }

      if (in_array('content_editor', $current_user->getRoles()) && empty($query)) {
        $input['uid'] = $current_user->id();
      }
    }

    $form_state->setUserInput($input);
  }

  /**
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return void
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function viewsExposedFormModeratedContentAlter(array &$form, FormStateInterface $form_state): void {
    if (isset($form['moderation_state'])) {
      foreach ($form['moderation_state']['#options'] as $key => $optgroup) {
        if (is_array($optgroup)) {
          unset($form['moderation_state']['#options'][$key]['editorial-published']);
        }
      }
    }
  }

  /**
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return void
   * @throws \Drupal\Component\Plugin\Exception\InvalidPluginDefinitionException
   * @throws \Drupal\Component\Plugin\Exception\PluginNotFoundException
   */
  public function viewsExposedFormMediaAlter(array &$form, FormStateInterface $form_state): void {
    // Switch select elements to select2
    $select_names = [
      'type',
      'status',
      'field_media_category_target_id',
      'sort_by'
    ];

    foreach ($select_names as $el_name) {
      $element = &$form[$el_name];
      if (!isset($element)) {
        continue;
      }

      $input = $form_state->getUserInput();

      $element['#size'] = 1;
      $element['#type'] = 'select2';
      $element['#select2']['minimumResultsForSearch'] = 50;
      $element['#select2']['width'] = 230;

      if (isset($element['#options']['All'])) {
        $element['#empty_value'] = 'All';
      }
      else {
        $element['#required'] = TRUE;
        $element['#default_value'] = empty($input['sort_by']) ? array_keys($element['#options'])[0] : $input['sort_by'];
      }

      $element['#empty_option'] = $this->t('- Any -');

      unset($element['#context']);
      unset($element['#process']);
      unset($element['#pre_render']);
      unset($element['#description']);

      unset($form['type']['#options']['audio']);
    }
  }

  /**
   * @param string $bundle
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return void
   */
  public function paragraphFormAlter(string $bundle, array &$form, FormStateInterface $form_state): void {
    if (!in_array($bundle, [
      'signpost',
      'link',
      'info_banner',
      'faq',
      'image',
    ])) {
      return;
    }

    $field_link_type_name = isset($form['field_link_type']['widget']) ?
      $this->getInputNameFromParents($form['field_link_type']['widget']['#parents']) : 'field_link_type';

    if (isset($form['field_external_link'])) {
      if (!is_array($form['field_external_link']['#states']['visible'])) {
        $form['field_external_link']['#states']['visible'] = [];
      }

      $form['field_external_link']['#states']['visible'] += [
        ':input[name="' . $field_link_type_name . '"]' => ['value' => 'external'],
      ];

      if ($form['#type'] === 'form') {
        $form['#validate'][] = [self::class, 'paragraphFormValidate'];
      }
      else {
        $form['#element_validate'][] = [self::class, 'paragraphFormValidate'];
      }
    }

    if (isset($form['field_content_reference'])) {
      if (!is_array($form['field_content_reference']['#states']['visible'])) {
        $form['field_content_reference']['#states']['visible'] = [];
      }

      $form['field_content_reference']['#states']['visible'] += [
        ':input[name="' . $field_link_type_name . '"]' => ['value' => 'internal'],
      ];
    }

    if ($bundle === 'signpost') {
      $field_signpost_append_name = isset($form['field_signpost_append']['widget']) ?
        $this->getInputNameFromParents($form['field_signpost_append']['widget']['#parents']) : 'field_signpost_append';
      if (isset($form['field_icon'])) {
        if (!is_array($form['field_icon']['#states']['visible'])) {
          $form['field_icon']['#states']['visible'] = [];
        }

        $form['field_icon']['#states']['visible'] += [
          ':input[name="' . $field_signpost_append_name . '"]' => ['value' => 'icon'],
        ];
      }

      if (isset($form['field_image'])) {
        if (!is_array($form['field_image']['#states']['visible'])) {
          $form['field_image']['#states']['visible'] = [];
        }

        $form['field_image']['#states']['visible'] += [
          ':input[name="' . $field_signpost_append_name . '"]' => ['value' => 'image'],
        ];
      }
    }

    if ($bundle === 'link') {
      $field_link_style_name = isset($form['field_link_style']['widget']) ?
        $this->getInputNameFromParents($form['field_link_style']['widget']['#parents']) : 'field_link_style';
      if (isset($form['field_font_size'])) {
        if (!is_array($form['field_font_size']['#states']['visible'])) {
          $form['field_font_size']['#states']['visible'] = [];
        }

        $form['field_font_size']['#states']['visible'] += [
          ':input[name="' . $field_link_style_name . '"]' => ['value' => 'default'],
        ];
      }

      if (isset($form['field_button_size'])) {
        if (!is_array($form['field_button_size']['#states']['visible'])) {
          $form['field_button_size']['#states']['visible'] = [];
        }

        $form['field_button_size']['#states']['visible'] += [
          ':input[name="' . $field_link_style_name . '"]' => ['value' => 'button'],
        ];
      }
    }

    if ($bundle === 'faq') {
      $field_selection_type_name = isset($form['field_selection_type']['widget']) ?
        $this->getInputNameFromParents($form['field_selection_type']['widget']['#parents']) : 'field_category';

      if (isset($form['field_category'])) {
        $states = &$form['field_category']['widget']['#states'];
        $condition = [
          ':input[name="' . $field_selection_type_name . '"]' => ['value' => 'category'],
        ];

        $states['visible'] = $condition;
        $states['required'] = $condition;
      }

      if (isset($form['field_faq_reference'])) {
        $states = &$form['field_faq_reference']['widget']['#states'];
        $condition = [
          ':input[name="' . $field_selection_type_name . '"]' => ['value' => 'reference'],
        ];

        $states['visible'] = $condition;
      }
    }
  }

  /**
   * @param array $form
   * @param \Drupal\Core\Form\FormStateInterface $form_state
   *
   * @return void
   */
  static function paragraphFormValidate(array &$form, FormStateInterface $form_state) {
    $link_type = $form_state->getValue(array_merge($form['#parents'], [
      'field_link_type',
      0,
      'value',
    ]));
    if ($link_type === 'external' && empty($form_state->getValue(array_merge($form['#parents'], [
        'field_external_link',
        0,
        'uri',
      ])))) {
      $form_state->setErrorByName('field_external_link', t('Enter external link.'));
    }

    if ($link_type === 'internal' && empty($form_state->getValue(array_merge($form['#parents'], [
        'field_content_reference',
        'target_id',
      ])))) {
      $form_state->setErrorByName('field_content_reference', t('Select content that should be linked.'));
    }
  }

  /**
   * Return form element name based on their parents to be used in #states.
   *
   * @param array $parents
   *
   * @return string
   */
  protected function getInputNameFromParents(array $parents): string {
    $name = array_shift($parents);

    $childs = array_map(function ($child) {
      return "[$child]";
    }, $parents);

    if (!empty($childs)) {
      $name .= implode('', $childs);
    }

    return $name;
  }

}
