<?php

namespace Drupal\svksk_content\Plugin\Field\FieldWidget;

use Drupal\Component\Utility\Html;
use Drupal\Core\Entity\EntityInterface;

/**
 * Plugin implementation of the 'entity_reference_browser_table_widget' widget.
 *
 * @FieldWidget(
 *   id = "entity_reference_browser_table_ext_widget",
 *   label = @Translation("Entity Browser - Table Extended"),
 *   multiple_values = TRUE,
 *   field_types = {
 *     "entity_reference"
 *   }
 * )
 */
class EntityReferenceBrowserTableWidget extends \Drupal\entity_browser_table\Plugin\Field\FieldWidget\EntityReferenceBrowserTableWidget {

  /**
   * {@inheritdoc}
   */
  protected function displayCurrentSelection($details_id, array $field_parents, array $entities) {
    $table = parent::displayCurrentSelection($details_id, $field_parents, $entities);

    if (isset($table['#attributes'])) {
      $table['#attributes']['class'] = ['table--widget-entity_reference_browser_table_widget'];
    }

    return $table;
  }

  /**
   * {@inheritdoc}
   */
  public function buildTableHeaders() {
    return array_filter(
      [
        '',
        $this->getFirstColumnHeader(),
        $this->t('Author'),
        $this->t('Type'),
        $this->t('Updated'),
        $this->getActionColumnHeader(),
      ],
      function ($header) {
        return $header !== NULL;
      }
    );
  }

  /**
   * {@inheritdoc}
   */
  public function buildTableRows(array $entities, $details_id, $field_parents) {
    $field_widget_display = $this->fieldDisplayManager->createInstance(
      $this->getSetting('field_widget_display'),
      $this->getSetting('field_widget_display_settings') + [
        'entity_type' => $this->fieldDefinition->getFieldStorageDefinition()
          ->getSetting('target_type'),
      ]
    );


    // The "Replace" button will only be shown if this setting is enabled in
    // the widget, and there is only one entity in the current selection.
    $replace_button_access = $this->getSetting('field_widget_replace') && (count($entities) === 1);

    $entities = array_filter($entities, function ($entity) {
      return $entity instanceof EntityInterface;
    });
    $rowData = [];
    $bundle_info = \Drupal::service('entity_type.bundle.info')
      ->getAllBundleInfo();

    /** @var  EntityInterface $entity */
    foreach ($entities as $row_id => $entity) {
      if ($entity->hasTranslation($this->currentLanguage) == TRUE) {
        $entity = $entity->getTranslation($this->currentLanguage);
      }

      $rowData[] = array_filter([
        'handle' => $this->buildSortableHandle(),
        'title' => [
          'data' => $this->getFirstColumn($entity),
          '#wrapper_attributes' => ['class' => ['title']],
        ],
        'author' => [
          'data' => ['#markup' => $entity->getOwner()->getDisplayName()],
          '#wrapper_attributes' => ['class' => ['author']],
        ],
        'type' => [
          'data' => ['#markup' => $bundle_info[$entity->getEntityTypeId()][$entity->bundle()]['label']],
          '#wrapper_attributes' => ['class' => ['type']],
        ],
        'updated' => [
          'data' => ['#markup' => \Drupal::service('date.formatter')->format($entity->getChangedTime(), 'short')],
          '#wrapper_attributes' => ['class' => ['date']],
        ],
        'actions' => [
          'edit_button' => $this->buildEditButton($entity, $details_id, $row_id, $field_parents),
          'replace_button' => $this->buildReplaceButton($entity, $entities, $details_id, $row_id, $field_parents),
          'remove_button' => $this->buildRemoveButton($entity, $details_id, $row_id, $field_parents),
        ],
        '#attributes' => [
          'class' => [
            'item-container',
            Html::getClass($field_widget_display->getPluginId()),
          ],
          'data-entity-id' => $entity->getEntityTypeId() . ':' . $entity->id(),
          'data-row-id' => $row_id,
        ],
      ]);
    }

    return $rowData;
  }

}
