<?php

namespace Drupal\svksk_s3fs\Controller;

use Drupal\Core\Controller\ControllerBase;
use Drupal\svksk_s3fs\S3FileDownloadServiceInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpFoundation\Request;

/**
 * System file controller.
 */
class S3FileDownloadController extends ControllerBase {

  /**
   * @var \Drupal\svksk_s3fs\S3FileDownloadServiceInterface
   */
  protected $S3FileDownloadService;

  /**
   * @param \Drupal\svksk_s3fs\S3FileDownloadServiceInterface $s3_file_download_service
   */
  public function __construct(S3FileDownloadServiceInterface $s3_file_download_service) {
    $this->S3FileDownloadService = $s3_file_download_service;
  }

  /**
   * {@inheritdoc}
   */
  public static function create(ContainerInterface $container) {
    return new static(
      $container->get('svksk_s3fs.file_download_service')
    );
  }

  /**
   * @param \Symfony\Component\HttpFoundation\Request $request
   * @param $scheme
   *
   * @return \Symfony\Component\HttpFoundation\BinaryFileResponse
   */
  public function download(Request $request, $scheme = 'private') : BinaryFileResponse {
    $target = $request->query->get('file');

    if (strpos($target, 'public/') === 0) {
      $scheme = 'public';
      $target = substr($target, 7);
    }

    return $this->S3FileDownloadService->download($scheme . '://' . $target);
  }

}
