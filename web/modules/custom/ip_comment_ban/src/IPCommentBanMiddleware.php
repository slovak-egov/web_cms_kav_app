<?php

namespace Drupal\ip_comment_ban;

use Drupal\ip_comment_ban\IPCommentBanIpManagerInterface;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\HttpKernelInterface;

/**
 * Provides a HTTP middleware to implement IP based banning.
 */
class IPCommentBanMiddleware implements HttpKernelInterface {

  /**
   * The decorated kernel.
   *
   * @var \Symfony\Component\HttpKernel\HttpKernelInterface
   */
  protected $httpKernel;

  /**
   * The ban IP manager.
   *
   * @var \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface
   */
  protected $banIpManager;

  /**
   *
   * @param \Symfony\Component\HttpKernel\HttpKernelInterface $http_kernel
   *   The decorated kernel.
   * @param \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface $manager
   *   The ban IP manager.
   */
  public function __construct(HttpKernelInterface $http_kernel, IPCommentBanIpManagerInterface $manager) {
    $this->httpKernel = $http_kernel;
    $this->banIpManager = $manager;
  }

  /**
   * {@inheritdoc}
   */
  public function handle(Request $request, $type = self::MAIN_REQUEST, $catch = TRUE): Response {
    $ip = $request->getClientIp();
    $ban_result = $this->banIpManager->isBanned($ip, [
      'expiry_check' => TRUE,
      'info_output' => TRUE,
    ]);
    if ($ban_result['is_banned']) {
      $ban_text = $this->banIpManager->banText([
        'ip' => $ip,
        'expiry_date' => $ban_result['expiry_date'],
      ]);
      return new Response($ban_text, 403);
    }
    return $this->httpKernel->handle($request, $type, $catch);
  }

}
