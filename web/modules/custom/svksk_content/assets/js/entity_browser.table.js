/**
 * @file entity_browser.table.js
 *
 * Allows the table rows to be sortable.
 */

(function ($, Drupal, Sortable) {
  'use strict';
  /**
   * Registers behaviours related to entity reference field widget.
   */
  Drupal.behaviors.entityBrowserEntityReferenceTable = {
    attach: function (context) {
      $('.table--widget-entity_reference_browser_table_widget tbody', context).once('ertAddUiSortable').addClass('entities-list sortable ui-sortable');

      var sortableSelector = context.querySelectorAll('.table--widget-entity_reference_browser_table_widget .entities-list.sortable');
      let dataRow;
      let delta;
      sortableSelector.forEach(function (widget) {
        $(widget).find('.item-container .handle').parent().addClass('handle-cell');
        Sortable.create(widget, {
          handle: ".handle",
          draggable: '.item-container',
          onEnd: function onEnd(e) {
            // Set our unsaved drag deltas in storage.
            let items = e.item.parentElement.children;
            Array.from(items).forEach((val, index) => {
              dataRow = val.getAttribute('data-entity-id');
              localStorage.setItem(dataRow, index);
            })

            return Drupal.entityBrowserEntityReferenceTable.entitiesReordered(widget);
          }
        });
      });
      // The AJAX callback will give us a flag when we need to re-open the
      // browser, most likely due to a "Replace" button being clicked.
      if (typeof drupalSettings.entity_browser_reopen_browser !== 'undefined' && drupalSettings.entity_browser_reopen_browser) {
        var data_drupal_selector = '[data-drupal-selector^="edit-' + drupalSettings.entity_browser_reopen_browser.replace(/_/g, '-') + '-entity-browser-entity-browser-' + '"][data-uuid]';
        var $launch_browser_element = $(context).find(data_drupal_selector);
        if ($launch_browser_element.attr('data-uuid') in drupalSettings.entity_browser && !drupalSettings.entity_browser[$launch_browser_element.attr('data-uuid')].auto_open) {
          $launch_browser_element.click();
        }
        // In case this is inside a fieldset closed by default, open it so the
        // user doesn't need to guess the browser is open but hidden there.
        var $fieldset_summary = $launch_browser_element.closest('details').find('summary');
        if ($fieldset_summary.length && $fieldset_summary.attr('aria-expanded') === 'false') {
          $fieldset_summary.click();
        }
      }
      // After ajax ops, reorder per deltas set in storage.
      $(document).ajaxComplete(() => {
        document.querySelectorAll('.item-container').forEach(item => {
          dataRow = $(item).attr('data-entity-id');
          delta = localStorage.getItem(dataRow);
          $(item).attr('data-row-id', delta);
        })
        sortableSelector.forEach(widget => {
          $(widget).find('.item-container').sort((a, b) => {
            return $(a).attr('data-row-id') - $(b).attr('data-row-id');
          }).appendTo($(widget));
        })

      })
    }
  };


  Drupal.entityBrowserEntityReferenceTable = {};

  /**
   * Reacts on sorting of entities for the table widget.
   *
   * @param {object} widget
   *   Object with the sortable area.
   */
  Drupal.entityBrowserEntityReferenceTable.entitiesReordered = function (widget) {
    var items = $(widget).find('.item-container');
    var ids = [];
    for (var i = 0; i < items.length; i++) {
      ids[i] = $(items[i]).attr('data-entity-id');
    }
    let currenItems = $(widget).parent().parent();
    if ($(widget).parents('.field--widget-entity_reference_browser_table_widget').length > 0) {
      currenItems = $(widget).parents('.field--widget-entity_reference_browser_table_widget');
    }
    currenItems.find('input[type*=hidden][name*="[target_id]"]').val(ids.join(' '));
  };
}(jQuery, Drupal, Sortable));


