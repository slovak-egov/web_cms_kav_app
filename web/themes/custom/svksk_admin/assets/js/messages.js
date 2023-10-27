/**
 * @file
 *   Main JavaScript file for Dismiss module
 */

/* eslint-disable func-names, no-mutable-exports, comma-dangle, strict */

"use strict";

(($, Drupal, drupalSettings) => {
  Drupal.behaviors.svkskAdminMessagesDismiss = {
    attach: function (context) {
      // Event delegation to handle click events on .js-message-close elements.
      $(context).on("click", ".js-message-close", function (event) {
        event.preventDefault();
        const $closeButton = $(this);
        const $message = $closeButton.closest(".messages-list__item");

        // Check if the message has already been processed
        if ($message.data("messages-dismiss-processed")) {
          return;
        }

        $message.css("opacity", 0);
        $message.bind("transitionend", function () {
          $(this).addClass("visually-hidden");
          $(this).css("opacity", 1);
        });

        // Mark the message as processed
        $message.data("messages-dismiss-processed", true);
      });
    },
  };

  /**
   * Overrides message theme function.
   *
   * @param {object} message
   *   The message object.
   * @param {string} message.text
   *   The message text.
   * @param {object} options
   *   The message context.
   * @param {string} options.type
   *   The message type.
   * @param {string} options.id
   *   ID of the message, for reference.
   *
   * @return {HTMLElement}
   *   A DOM Node.
   */
  Drupal.theme.message = ({ text }, { type, id }) => {
    const messagesTypes = Drupal.Message.getMessageTypeLabels();
    const messageWrapper = document.createElement("div");

    messageWrapper.setAttribute("class", `messages messages--${type}`);
    messageWrapper.setAttribute(
      "role",
      type === "error" || type === "warning" ? "alert" : "status"
    );
    messageWrapper.setAttribute("aria-labelledby", `${id}-title`);
    messageWrapper.setAttribute("data-drupal-message-id", id);
    messageWrapper.setAttribute("data-drupal-message-type", type);

    messageWrapper.innerHTML = `
      <div class="messages__header">
        <h2 id="${id}-title" class="messages__title">
          <div class="button button--dismiss js-message-close" title="${Drupal.t(
            "Dismiss"
          )}">
            <span class="icon-close"></span>${Drupal.t("Close")}
          </div>
          ${messagesTypes[type]}
        </h2>
      </div>
      <div class="messages__content">
        ${text}
      </div>
    `;

    Drupal.behaviors.svkskAdminMessagesDismiss.attach(messageWrapper);

    return messageWrapper;
  };
})(jQuery, Drupal, drupalSettings);
