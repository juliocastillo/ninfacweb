var bootstrapDatePickerOptions = {
    format: "dd/mm/yyyy",
    weekStart: 0,
    clearBtn: true,
    language: "es",
    autoclose: true
}


/*
 *  setBootstrapDatePicker
 *      FunciÃ³n que inicializa los calendarios que tengan la classe bootstrap-datepicker
 *      con el plugin bootstrap-datepicker
 *
 *  DocumentaciÃ³n:
 *      http://eternicode.github.io/bootstrap-datepicker/
 */
function setBootstrapDatePicker() {
    jQuery('body .bootstrap-datepicker').each(function () {
        jQuery(this).datepicker(bootstrapDatePickerOptions);
    });

    jQuery('body .bootstrap-datepicker.now').each(function () {
        if (jQuery(this).datepicker('remove')) {
            jQuery(this).datepicker(jQuery.extend(bootstrapDatePickerOptions, {'endDate': moment().format('DD/MM/YYYY')}));
        }
    });
}


jQuery(document).ready(function ($) {
    /*
     *  InicializaciÃ³n de Funciones.
     */
    setBootstrapDatePicker();
});
