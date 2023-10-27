(function ($, Drupal) {
  Drupal.behaviors.contentAdminView = {
    attach: function (context, settings) {
      var $form = $('form.views-exposed-form[data-drupal-selector="views-exposed-form-content-page-1"]');
      $form.once('exposed-form-process').each(function(){
        $('select[name="type"]', $form).bind('change', function(){
          var value = $(this).val();
          if (value !== 'life_event') {
            $('select[name="life_event_category"]', $form).val('All').trigger('change');
          }
          if (value !== 'faq') {
            $('select[name="faq_category"]', $form).val('All').trigger('change');
          }
          if (!['article', 'news', 'notice', 'faq'].includes(value)) {
            $('select[name="tags[]"]', $form).val(null).trigger('change');
          }
        });
      });
    }
  };
})(jQuery, Drupal);
