// (({ behaviors }, settings, $) => {
//   behaviors.FrontendRebuildForm = {
//     attach(context) {
//       $('form.svsk-base-frontend-rebuild').once('form-refresh').each(function() {
//         var $form = $(this);
//         // Hit hidden refresh button each 15s
//         setInterval(function() {
//           $form
//             .find('input[data-drupal-selector="edit-refresh"]')
//             .trigger('click');
//         }, 15000);
//       });
//     }
//   };
// })(Drupal, drupalSettings, jQuery);
(({ behaviors }, settings, $) => {
  behaviors.FrontendRebuildForm = {
    attach(context) {
      $("form.svsk-base-frontend-rebuild", context).each(function () {
        var $form = $(this);

        // Check if the form has already been processed
        if ($form.data("form-refresh-processed")) {
          return;
        }

        // Mark the form as processed
        $form.data("form-refresh-processed", true);

        // Hit hidden refresh button every 15 seconds
        setInterval(function () {
          $form
            .find('input[data-drupal-selector="edit-refresh"]')
            .trigger("click");
        }, 15000);
      });
    },
  };
})(Drupal, drupalSettings, jQuery);
