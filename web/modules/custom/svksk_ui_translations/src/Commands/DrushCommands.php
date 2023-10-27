<?php

namespace Drupal\svksk_ui_translations\Commands;

use Drupal\Core\Serialization\Yaml;
use Drush\Exceptions\UserAbortException;

/**
 * A drush command file.
 *
 * @package Drupal\svksk_ui_translations\Commands
 */
class DrushCommands extends \Drush\Commands\DrushCommands {

  /**
   * Drush command that export UI Translations.
   *
   * @command svksk-ui-translations:export
   * @aliases svksk-uite
   * @usage svksk-uite
   */
  public function export() {
    $data = [];
    $entity_type_id = 'svksk_ui_translation';

    /** @var \Drupal\Core\Entity\EntityTypeManager $entity_manager */
    $entity_manager = \Drupal::entityTypeManager();
    /** @var \Drupal\Core\Language\LanguageManager $language_manager */
    $language_manager = \Drupal::languageManager();

    $entities = $entity_manager->getStorage($entity_type_id)->loadMultiple();

    if (empty($entities)) {
      $this->output()->writeln(dt('Nothing to export.'));

      return;
    }

    if (!$this->io()
      ->confirm(dt('There are @count translations to export. Do you wish to continue?', ['@count' => count($entities)]))) {
      throw new UserAbortException();
    }

    $languages = $language_manager->getLanguages();

    /** @var \Drupal\Core\Language\Language $language */
    foreach ($languages as $language) {
      $langcode = $language->getId();
      /** @var \Drupal\Core\Entity\ContentEntityInterface $translation */
      foreach ($entities as $translation) {
        if ($translation->hasTranslation($langcode)) {
          $translation = $translation->getTranslation($langcode);
          $data[$translation->get('machine_name')->value][$langcode][] = $translation->get('string')->value;

          if (!$translation->get('string_plural')->isEmpty()) {
            $data[$translation->get('machine_name')->value][$langcode][] = $translation->get('string_plural')->value;
          }
        }
      }
    }

    ksort($data);

    $translations_yaml_file = \Drupal::service('extension.list.module')
        ->getPath('svksk_ui_translations') . '/config/translations/translations.' . $entity_type_id . '.yml';

    $file = fopen(realpath($translations_yaml_file), 'w');
    fwrite($file, Yaml::encode($data));
    fclose($file);

    $this->output()
      ->writeln(dt('Exported @count translations', ['@count' => count($data)]));
  }

  /**
   * Drush command that import UI Translations.
   *
   * @command svksk-ui-translations:import
   * @aliases svksk-uiti
   * @usage svksk-uiti
   *
   * @param array $options
   *   Array of options as described below.
   *
   * @option override Override existing translation.
   */
  public function import(array $options = ['override' => FALSE]) {
    $counter = 0;
    $entity_type_id = 'svksk_ui_translation';
    $translations_yaml_file = \Drupal::service('extension.list.module')
        ->getPath('svksk_ui_translations') . '/config/translations/translations.' . $entity_type_id . '.yml';

    $data = Yaml::decode(file_get_contents($translations_yaml_file));

    if (empty($data)) {
      $this->output()->writeln(dt('Nothing to import.'));

      return;
    }

    if (!$this->io()
      ->confirm(dt('There are @count translations in config file to process. Do you wish to continue?', ['@count' => count($data)]))) {
      throw new UserAbortException();
    }

    /** @var \Drupal\Core\Entity\EntityTypeManager $entity_manager */
    $entity_manager = \Drupal::entityTypeManager();
    /** @var \Drupal\Core\Language\LanguageManager $language_manager */
    $language_manager = \Drupal::languageManager();

    $default_langcode = $language_manager->getDefaultLanguage()->getId();
    $storage = $entity_manager->getStorage($entity_type_id);

    foreach ($data as $key => $translations) {
      // Check if entity exist by machine_name - import only new translations (do not modify existing)
      $entities = $storage->loadByProperties(['machine_name' => $key]);

      if (empty($entities) || $options['override']) {
        $entity = !empty($entities) ? reset($entities) : $storage->create();

        // Build default language values
        $entity->set('machine_name', $key);
        $entity->set('string', $translations[$default_langcode][0]);

        if (isset($translations[$default_langcode][1])) {
          $entity->set('string_plural', $translations[$default_langcode][1]);
        }

        // Build and add translations
        foreach ($translations as $langcode => $strings) {
          if ($langcode != $default_langcode) {
            $entity_translation = $entity->hasTranslation($langcode) ? $entity->getTranslation($langcode) : $entity->addTranslation($langcode);
            $entity_translation->set('string', $translations[$langcode][0]);
            if (isset($translations[$langcode][1])) {
              $entity_translation->set('string_plural', $translations[$langcode][1]);
            }
          }
        }

        $entity->save();
        $counter++;
      }
    }

    $this->output()
      ->writeln(dt('Imported @count new translations', ['@count' => $counter]));
  }

}
