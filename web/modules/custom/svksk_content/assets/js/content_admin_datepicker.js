(function ($, Drupal) {
  Drupal.behaviors.contentAdminDatePicker = {
    attach: function (context, settings) {
      $('input[name="published_from"], input[name="published_to"]', context).daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        autoUpdateInput: false,
        autoApply: true,
        minYear: 1990,
        maxYear: parseInt(moment().format('YYYY'), 10),
        locale: {
          format: "D.M.YYYY",
          separator: " - ",
          "applyLabel": "Nastaviť",
          "cancelLabel": "Zrušiť",
          "fromLabel": "Od",
          "toLabel": "Do",
          "customRangeLabel": "Vlastné",
          "weekLabel": "T",
          "daysOfWeek": [
            "Ne",
            "Po",
            "Ut",
            "St",
            "Št",
            "Pia",
            "So"
          ],
          "monthNames": [
            "Január",
            "Február",
            "Marec",
            "Apríl",
            "Máj",
            "Jún",
            "Júl",
            "August",
            "September",
            "Október",
            "November",
            "December"
          ],
          "firstDay": 1
        }
      })
        .on('apply.daterangepicker', function (ev, picker) {
          $(this).val(picker.startDate.format('D.M.YYYY'));
        });
    }
  };
})(jQuery, Drupal);
