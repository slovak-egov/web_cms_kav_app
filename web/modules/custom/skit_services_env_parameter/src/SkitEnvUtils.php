<?php

namespace Drupal\skit_services_env_parameter;

use Symfony\Component\DependencyInjection\Exception\RuntimeException;
use Symfony\Component\DependencyInjection\Exception\EnvNotFoundException;

/**
 * Helper utilities to work with env vars.
 */
class SkitEnvUtils {

  /**
   * Returns the value of the given variable as managed by the current instance.
   *
   * @param string $name
   *   The name of the variable within the namespace.
   *
   * @return false|string
   *   Returns the value of the given env variable or FALSE on error.
   *
   * @throws \RuntimeException
   *   Throws RuntimeException on error.
   */
  public static function getEnv(string $name) {
    $i = strpos($name, ':');

    if ($i === FALSE) {
      $prefix = 'string';
    }
    else {
      $prefix = substr($name, 0, $i);
      $name = substr($name, $i + 1);
    }

    if ('file' === $prefix) {
      if (!is_scalar($file = getenv($name))) {
        throw new RuntimeException(sprintf('Invalid file name: env var "%s" is non-scalar.', $name));
      }
      if (!file_exists($file)) {
        throw new RuntimeException(sprintf('File "%s" not found (resolved from "%s").', $file, $name));
      }

      return file_get_contents($file);
    }

    $value = getenv($name);

    if (FALSE === $value) {
      throw new EnvNotFoundException(sprintf('Environment variable not found: "%s".', $name));
    }

    if ('bool' === $prefix) {
      return (bool) (filter_var($value, \FILTER_VALIDATE_BOOLEAN) ?: filter_var($value, \FILTER_VALIDATE_INT) ?: filter_var($value, \FILTER_VALIDATE_FLOAT));
    }

    if ('string' === $prefix) {
      return (string) $value;
    }

    throw new RuntimeException(sprintf('Unsupported env var prefix "%s".', $prefix));
  }

}
