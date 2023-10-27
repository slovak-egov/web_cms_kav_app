<?php

namespace Drupal\svksk_s3fs;

use Drupal\Core\Extension\ModuleHandlerInterface;
use Drupal\Core\StreamWrapper\StreamWrapperManagerInterface;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

interface S3FileDownloadServiceInterface {

  /**
   * @param String $downloadUri
   *
   * @return \Symfony\Component\HttpFoundation\BinaryFileResponse
   */
  public function download(String $downloadUri) : BinaryFileResponse;

}
