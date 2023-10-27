<?php

namespace Drupal\svksk_api\StackMiddleware;

use Drupal\Core\Site\Settings;
use Drupal\skit_services_env_parameter\SkitEnvUtils;
use Symfony\Component\DependencyInjection\Exception\EnvNotFoundException;
use Symfony\Component\DependencyInjection\Exception\RuntimeException;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\HttpKernelInterface;

/**
 * Provides support for API gateway.
 */
class ApiGatewayMiddleware implements HttpKernelInterface {

  /**
   * The decorated kernel.
   *
   * @var \Symfony\Component\HttpKernel\HttpKernelInterface
   */
  protected $httpKernel;

  /**
   * The site settings.
   *
   * @var \Drupal\Core\Site\Settings
   */
  protected $settings;

  /**
   * Constructs a ReverseProxyMiddleware object.
   *
   * @param \Symfony\Component\HttpKernel\HttpKernelInterface $http_kernel
   *   The decorated kernel.
   * @param \Drupal\Core\Site\Settings $settings
   *   The site settings.
   */
  public function __construct(HttpKernelInterface $http_kernel, Settings $settings) {
    $this->httpKernel = $http_kernel;
    $this->settings = $settings;
  }

  /**
   * {@inheritdoc}
   */
  public function handle(Request $request, $type = self::MASTER_REQUEST, $catch = TRUE): Response {
    static::setSettingsOnRequest($request, $this->settings);
    return $this->httpKernel->handle($request, $type, $catch);
  }

  /**
   * Sets API gateway settings on Request object.
   *
   * @param \Symfony\Component\HttpFoundation\Request $request
   *   A Request instance.
   * @param \Drupal\Core\Site\Settings $settings
   *   The site settings.
   */
  public static function setSettingsOnRequest(Request $request, Settings $settings) {
    if (!$settings->get('reverse_proxy', FALSE)) {
      return;
    }

    try {
      $api_gateway = SkitEnvUtils::getEnv('DRUPAL_API_GATEWAY');
    } catch (EnvNotFoundException $e) {
      // This variable is optional.
    }

    if (empty($api_gateway)) {
      return;
    }

    $url_parts = parse_url($api_gateway);

    if (!isset($url_parts['host'], $url_parts['scheme'])) {
      throw new RuntimeException(sprintf('Malformed API gateway URL in environment variable DRUPAL_API_GATEWAY: "%s".', SkitEnvUtils::getEnv('DRUPAL_API_GATEWAY')));
    }

    $request->headers->set('X_FORWARDED_HOST', $url_parts['host']);
    $request->headers->set('X_FORWARDED_PROTO', $url_parts['scheme']);
    $request->headers->set('X_FORWARDED_PORT', $url_parts['port'] ?? '');
  }

}
