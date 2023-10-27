<?php

/**
 * @file
 * WorkflowModalController class.
 */

namespace Drupal\svksk_moderation\Controller;

use Drupal\Core\Ajax\AjaxResponse;
use Drupal\Core\Ajax\OpenModalDialogCommand;
use Drupal\Core\Controller\ControllerBase;
use Drupal\Core\Extension\ExtensionPathResolver;
use Drupal\Core\Url;
use Symfony\Component\DependencyInjection\ContainerInterface;

class WorkflowModalController extends ControllerBase {

  /**
   * @var \Drupal\Core\Extension\ExtensionPathResolver
   */
  protected $extensionPathResolver;

  /**
   * @param \Drupal\Core\Extension\ExtensionPathResolver $extension_path_resolver
   */
  public function __construct(ExtensionPathResolver $extension_path_resolver) {
    $this->extensionPathResolver = $extension_path_resolver;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('extension.path.resolver'),
    );
  }

  /**
   * Ajax callback than opens modal window with static image file.
   *
   * @return \Drupal\Core\Ajax\AjaxResponse
   */
  public function modal() {
    $options = [
      'dialogClass' => 'popup-dialog-class',
      'width' => '50%',
    ];
    $response = new AjaxResponse();

    $workflow_image_uri = [
      $this->extensionPathResolver->getPath('module', 'svksk_moderation'),
      'assets',
      'img',
      'editorial_process.png',
    ];
    $workflow_image = \Drupal::service('file_url_generator')
      ->generateAbsoluteString(implode('/', $workflow_image_uri));
    $workflow_image_url = Url::fromUri($workflow_image);
    $content = [
      'image' => [
        '#type' => 'html_tag',
        '#tag' => 'img',
        '#attributes' => [
          'src' => $workflow_image_url->toString(),
        ],
      ],
    ];

    $response->addCommand(new OpenModalDialogCommand($this->t('Preview of editorial process'), $content, $options));

    return $response;
  }
}
