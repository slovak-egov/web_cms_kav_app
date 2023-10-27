<?php

namespace Drupal\svksk_base\Plugin\Block;

use Drupal\Core\Block\BlockBase;

/**
 * Provides a block to show CMS version.
 *
 * @Block(
 *   id = "cms_version",
 *   admin_label = @Translation("Version")
 * )
 */
class CmsVersion extends BlockBase {

  /**
   * {@inheritdoc}
   */
  public function build() {
    $build = [];
    $version = getenv('CMS_VERSION');

    if (!empty($version)) {
      $build['version'] = [
        '#markup' => '<p><span class="label">' . $this->t('Version') . '</span><span class="version">' . $version . '</span>',
      ];
    }

    return $build;
  }

}
