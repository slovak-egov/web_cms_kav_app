<?php
/**
 * @file
 * Template for settings.local.php file
 */

// Disable render caches, necessary for twig files to be reloaded on every page view
$settings['cache']['bins']['render'] = 'cache.backend.null';
$settings['cache']['bins']['dynamic_page_cache'] = 'cache.backend.null';

$config['system.logging']['error_level'] = 'verbose';

// Disable CSS and JS aggregation.
$config['system.performance']['css']['preprocess'] = FALSE;
$config['system.performance']['js']['preprocess'] = FALSE;

// For development skip sites dir locking
$settings['skip_permissions_hardening'] = TRUE;

// Skip certain modules in config export
$settings['config_exclude_modules'][] = 'dblog';
$settings['config_exclude_modules'][] = 'update';

// Store local files in this folder on S3
$config['s3fs.settings']['root_folder'] = 'local-dev';

// Enable error reporting.
$config['system.logging']['error_level'] = 'verbose';

// Display errors on the screen.
$settings['error_level'] = 'verbose';
$config['system.logging']['error_level'] = 'verbose';
ini_set('display_errors', TRUE);
ini_set('display_startup_errors', TRUE);
