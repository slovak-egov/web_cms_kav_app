'use strict';

(($) => {
  const $logout = $(document).find('ul.toolbar-menu > li.logout > a')

  if (typeof $logout !== 'undefined') {
    $logout.on('click', () => {
      localStorage.removeItem('Drupal.toolbar.activeTabID');
    });
  }

  $.fn.select2.amd.require(['select2/selection/search'], function (Search) {
    var oldRemoveChoice = Search.prototype.searchRemoveChoice;

    Search.prototype.searchRemoveChoice = function () {
      oldRemoveChoice.apply(this, arguments);
      this.$search.val('');
    };
  });

  $(window).on({
    'dialog:aftercreate': function (event, dialog, $element, settings) {
      setTimeout(function () {
        $(window).trigger('resize');
      }, 50);
    }
  });

  $(window).on('click', function (e) {
    if ($(e.target).hasClass('ui-widget-overlay')) {
      $('.ui-dialog-titlebar-close').trigger('click');
    }
  });
})(jQuery);
