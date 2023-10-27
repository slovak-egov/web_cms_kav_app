<?php

namespace Drupal\svksk_list_values;

use Drupal\Core\Entity\EntityTypeManager;
use SimpleXMLElement;

/**
 * ImportManager service.
 */
class ImportManager {

  /**
   * Timeout in seconds to download a publication.
   */
  const DOWNLOAD_TIMEOUT = 86400;

  /**
   * @var \Drupal\Core\Entity\EntityTypeManager
   */
  protected $entityTypeManager;

  /**
   * ImportManager constructor.
   *
   * @param \Drupal\Core\Entity\EntityTypeManager $entity_type_manager
   */
  public function __construct(EntityTypeManager $entity_type_manager) {
    $this->entityTypeManager = $entity_type_manager;
  }

  /**
   * @param string $entity_type_id
   * @param string $src
   *
   * @throws \Exception
   */
  public function importMetaIS($entity_type_id, $src) {
    try {
      $file_source = file_get_contents($src);
      $xml = new SimpleXMLElement($file_source);
    } catch (\Exception $e) {
      throw new \Exception('Error reading source file');
    }
    $code_list_items = $xml->xpath('//CodelistItem');
    $storage = $this->entityTypeManager->getStorage($entity_type_id);
    $storage->delete($storage->loadMultiple($storage->getQuery()->accessCheck(true)->execute()));

    foreach ($code_list_items as $code_list_item) {
      $code = $code_list_item->xpath("ItemCode/text()");
      $name = $code_list_item->xpath("ItemName[@language='sk'][1]");
      $short_name = $code_list_item->xpath("ItemShortenedName[@language='sk'][1]");
      $list_value = $storage->create([
        'code' => (string) $code[0],
        'name' => (string) $name[0],
        'langcode' => 'sk',
      ]);

      if ($list_value->hasField('short_name') && !empty($short_name)) {
        $list_value->set('short_name', (string) $short_name[0]);
      }
      $list_value->save();
    }
  }

  /**
   * @param string $entity_type_id
   * @param string $src
   *
   * @throws \Exception
   */
  public function importCSV($entity_type_id, $src) {
    try {
      $file_source = file_get_contents($src);
      $csv = array_map(function ($line) {
        return str_getcsv($line, ';');
      }, explode("\n", $file_source));
      array_walk($csv, function(&$a) use ($csv) {
        if (count($a) === count($csv[0])) {
          $a = array_combine($csv[0], $a);
        } else {
          unset($a);
        }
      });
      array_shift($csv);
    } catch (\Exception $e) {
      throw new \Exception('Error reading source file');
    }
    $storage = $this->entityTypeManager->getStorage($entity_type_id);
    $storage->delete($storage->loadMultiple($storage->getQuery()->accessCheck(true)->execute()));

    foreach ($csv as $data) {
      $code = $data['code'] ?? NULL;
      $name = $data['name'] ?? NULL;
      $description = $data['description'] ?? NULL;
      $short_name = $data['shortName'] ?? NULL;
      if (empty($code) || empty($name)) {
        continue;
      }
      $list_value = $storage->create([
        'code' => $code,
        'name' => $name,
        'langcode' => 'sk',
      ]);

      if ($list_value->hasField('description') && !empty($description)) {
        $list_value->set('description', $description);
      }

      if ($list_value->hasField('short_name') && !empty($short_name)) {
        $list_value->set('short_name', $short_name);
      }
      $list_value->save();
    }
  }

}
