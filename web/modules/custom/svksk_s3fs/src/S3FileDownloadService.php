<?php

namespace Drupal\svksk_s3fs;

use Drupal\Core\Extension\ModuleHandlerInterface;
use Drupal\Core\StreamWrapper\StreamWrapperManagerInterface;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Symfony\Component\HttpKernel\Exception\AccessDeniedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class S3FileDownloadService implements S3FileDownloadServiceInterface {

  /**
   * The stream wrapper manager.
   *
   * @var \Drupal\Core\StreamWrapper\StreamWrapperManagerInterface
   */
  protected $streamWrapperManager;

  /**
   * @var \Drupal\Core\Extension\ModuleHandlerInterface
   */
  protected $moduleHandler;

  /**
   * @param \Drupal\Core\StreamWrapper\StreamWrapperManagerInterface $streamWrapperManager
   */
  public function __construct(ModuleHandlerInterface $moduleHandler, StreamWrapperManagerInterface $streamWrapperManager) {
    $this->moduleHandler = $moduleHandler;
    $this->streamWrapperManager = $streamWrapperManager;
  }

  /**
   * {@inheritdoc}
   */
  public function download(String $downloadUri) : BinaryFileResponse {
    $scheme = $this->streamWrapperManager->getScheme($downloadUri);

    if (!$scheme) {
      throw new NotFoundHttpException();
    }

    // Merge remaining path arguments into relative file path.
    $uri = $this->streamWrapperManager->normalizeUri($downloadUri);

    if ($this->streamWrapperManager->isValidScheme($scheme) && is_file($uri)) {
      // Let other modules provide headers and controls access to the file.
      $headers = $this->moduleHandler->invokeAll('file_download', [$uri]);

      foreach ($headers as $result) {
        if ($result == -1) {
          throw new AccessDeniedHttpException();
        }
      }

      if (count($headers)) {
        // \Drupal\Core\EventSubscriber\FinishResponseSubscriber::onRespond()
        // sets response as not cacheable if the Cache-Control header is not
        // already modified. We pass in FALSE for non-private schemes for the
        // $public parameter to make sure we don't change the headers.
        return new BinaryFileResponse($uri, 200, $headers, $scheme !== 'private');
      }

      throw new AccessDeniedHttpException();
    }

    throw new NotFoundHttpException();
  }

}
