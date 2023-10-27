<?php

namespace Drupal\skit_services_env_parameter;

use Symfony\Component\DependencyInjection\Compiler\CompilerPassInterface;
use Symfony\Component\DependencyInjection\ContainerBuilder;

/**
 * Replaces env var placeholders in a parameter bag by their current values.
 */
class ContainerParameterEnvVarResolvePass implements CompilerPassInterface {

  /**
   * {@inheritdoc}
   */
  public function process(ContainerBuilder $container) {
    $processed_values = $this->processValue($container->getParameterBag()->all());

    foreach ($processed_values as $parameter_name => $parameter_value) {
      $container->setParameter($parameter_name, $parameter_value);
    }
  }

  /**
   * Processes a value found in a parameter bag.
   *
   * @param mixed $value
   *   The value to be processed.
   *
   * @return mixed
   *   The processed value
   */
  protected function processValue($value) {
    if (\is_array($value)) {
      $result = [];
      foreach ($value as $k => $v) {
        $result[$k] = $this->processValue($v);
      }

      return $result;
    }

    if (\is_string($value) && 0 === strpos($value, '%env(') && ')%' === substr($value, -2)) {
      $env_var_name = substr($value, 5, -2);
      return SkitEnvUtils::getEnv($env_var_name);
    }

    return $value;
  }

}
