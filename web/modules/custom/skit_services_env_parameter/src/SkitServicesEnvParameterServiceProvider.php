<?php

namespace Drupal\skit_services_env_parameter;

use Drupal\Core\DependencyInjection\ContainerBuilder;
use Drupal\Core\DependencyInjection\ServiceProviderBase;
use Symfony\Component\DependencyInjection\Compiler\PassConfig;

/**
 * Add env var resolver compiler pass.
 */
class SkitServicesEnvParameterServiceProvider extends ServiceProviderBase {

  /**
   * {@inheritdoc}
   */
  public function register(ContainerBuilder $container) {
    $container->addCompilerPass(new ContainerParameterEnvVarResolvePass(), PassConfig::TYPE_BEFORE_OPTIMIZATION, -500);
    parent::register($container);
  }

}
