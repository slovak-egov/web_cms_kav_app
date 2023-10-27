<?php

namespace Drupal\svksk_content;

use Drupal\next\Entity\NextSiteInterface;
use GuzzleHttp\Exception\RequestException;
use Symfony\Component\HttpFoundation\Response;

/**
 * Invalidates Next.js ISR caches.
 */
class NextCacheInvalidator extends \Drupal\next_extras\NextCacheInvalidator {

  /**
   * Invalidates a path.
   *
   * @param string $path
   *   The path.
   * @param \Drupal\next\Entity\NextSiteInterface $site
   *   The site for which to revalidate.
   */
  public function invalidateSitePath(string $path, NextSiteInterface $site): bool {
    $revalidate_url = $site->getRevalidateUrlForPath($path);

    // If no revalidate URL is available, we cannot revalidate.
    if (!$revalidate_url) {
      return FALSE;
    }

    $url = $revalidate_url->toString();
    try {
      $this->logger->notice('Revalidating page at %url', [
        '%url' => $url,
      ]);

      $response = $this->httpClient->get($url);
      if ($response->getStatusCode() === Response::HTTP_OK) {
        $this->logger->notice('Successfully revalidated page at %url', [
          '%url' => $url,
        ]);

        return TRUE;
      }
    } catch (RequestException $exception) {
      $this->logger->error($exception->getMessage());
    }

    return FALSE;
  }

}
