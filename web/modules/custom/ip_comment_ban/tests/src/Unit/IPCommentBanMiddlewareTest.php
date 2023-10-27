<?php

namespace Drupal\Tests\ip_comment_ban\Unit;

use Drupal\ip_comment_ban\IPCommentBanMiddleware;
use Drupal\Tests\UnitTestCase;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\HttpKernelInterface;

/**
 * @coversDefaultClass \Drupal\ip_comment_ban\IPCommentBanMiddleware
 * @group IPCommentBan
 */
class IPCommentBanMiddlewareTest extends UnitTestCase {

  /**
   * The mocked wrapped kernel.
   *
   * @var \Symfony\Component\HttpKernel\HttpKernelInterface|\PHPUnit\Framework\MockObject\MockObject
   */
  protected $kernel;

  /**
   * The mocked ban IP manager.
   *
   * @var \Drupal\ip_comment_ban\IPCommentBanIpManagerInterface|\PHPUnit\Framework\MockObject\MockObject
   */
  protected $banManager;

  /**
   * The tested ban middleware.
   *
   * @var \Drupal\ip_comment_ban\IPCommentBanMiddleware
   */
  protected $banMiddleware;

  /**
   * {@inheritdoc}
   */
  protected function setUp(): void {
    parent::setUp();

    $this->kernel = $this->createMock('Symfony\Component\HttpKernel\HttpKernelInterface');
    $this->banManager = $this->createMock('Drupal\ip_comment_ban\IPCommentBanIpManagerInterface');
    $this->banMiddleware = new IPCommentBanMiddleware($this->kernel, $this->banManager);
  }

  /**
   * Tests a banned IP.
   */
  public function testBannedIp() {
    $banned_ip = '17.0.0.2';
    $this->banManager->expects($this->once())
      ->method('isBanned')
      ->with($banned_ip)
      ->willReturn([
        'is_banned' => TRUE,
        'expiry_date' => 0,
      ]);

    $request = Request::create('/test-path');
    $request->server->set('REMOTE_ADDR', $banned_ip);

    $response = $this->banMiddleware->handle($request);

    $this->assertEquals(403, $response->getStatusCode());
  }

  /**
   * Tests an unbanned IP.
   */
  public function testUnbannedIp() {
    $unbanned_ip = '18.0.0.2';
    $this->banManager->expects($this->once())
      ->method('isBanned')
      ->with($unbanned_ip)
      ->willReturn([
        'is_banned' => FALSE,
        'expiry_date' => 0,
      ]);

    $request = Request::create('/test-path');
    $request->server->set('REMOTE_ADDR', $unbanned_ip);
    $expected_response = new Response(200);
    $this->kernel->expects($this->once())
      ->method('handle')
      ->with($request, HttpKernelInterface::MASTER_REQUEST, TRUE)
      ->willReturn($expected_response);

    $response = $this->banMiddleware->handle($request);

    $this->assertSame($expected_response, $response);
  }

}
