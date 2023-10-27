/**
 * @file
 * Defines Javascript behaviors for the Content disable.
 */

(function ($, Drupal, drupalSettings) {

  /**
   * Behaviors for tabs in the node edit form.
   *
   * @type {Drupal~behavior}
   *
   * @prop {Drupal~behaviorAttach} attach
   *   Attaches automatic submission behavior for content disable.
   */
  Drupal.behaviors.contentDisabled = {
    attach: function attach(context, drupalSettings) {
      if (!drupalSettings.content_disabled) {
        return;
      }

      if (drupalSettings.content_disabled.is_disabled) {
        $('form.' + drupalSettings.content_disabled.form_id, context)
          .once('content-disabled')
          .each(function () {
            const $form = $(this);
            $form.prop('disabled', true).addClass('is-disabled');
            $form.find('input, textarea, select').prop('disabled', true).addClass('is-disabled');
          })
      }
    }
  };

}(jQuery, Drupal, drupalSettings));
