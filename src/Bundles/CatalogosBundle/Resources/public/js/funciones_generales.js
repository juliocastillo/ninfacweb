//FUNCIÓN QUE SE UTILIZA PARA PERMITIR SOLO LETRAS Y UN SOLO ESPACIO.
//QUITANDO TODA TILDE, DIERESIS,ETC
function limpiar_nombres(text) {
    var text = text.toLowerCase(); // a minusculas
    text = text.replace(/[áàäâå]/, 'a');
    text = text.replace(/[éèëê]/, 'e');
    text = text.replace(/[íìïî]/, 'i');
    text = text.replace(/[óòöô]/, 'o');
    text = text.replace(/[úùüû]/, 'u');
    text = text.replace(/[ýÿ]/, 'y');
    text = text.replace(/[^a-zA-ZñÑ\s]/g, '');
    text = text.replace(/\s{2,}/, ' ');
    text = text.toUpperCase();
    return text;
}

/* Convertir Hora segun formato de 12 o 24 Horas */
function formatTime_12_24(convertFormat, strTime) {
    var time  = false;
    var regex = null;

    if(convertFormat == "12") {
        regex   = /^([0-1]?\d|2[0-3]):([0-5]\d):([0-5]\d)$/i;
    } else {
        if(convertFormat == "24") {
            regex   = /^([0]\d|[1][0-2]):([0-5]\d):([0-5]\d)\s?(?:AM|PM)$/i;
        }
    }

    if (regex != null && regex.test(strTime)) {
        if(convertFormat == "24") {
            var arrayTime = strTime.split(":");
            var restTime  = arrayTime[2].split(" ");
            var hours     = Number(arrayTime[0]);
            var minutes   = Number(arrayTime[1]);
            var seconds   = Number(restTime[0]);
            var meridian  = restTime[1];

            if (meridian == "PM" && hours < 12)
                hours = hours + 12;

            if(meridian == "AM" && hours == 12)
                hours = hours - 12;

            if (hours < 10)
                hours = "0" + hours.toString();

            if (minutes < 10)
                minutes = "0" + minutes.toString();

            if (seconds < 10)
                seconds = "0" + seconds.toString();

            time = hours + ":" + minutes + ":" + seconds;
        } else {
            var arrayTime = strTime.split(":");
            var hours     = Number(arrayTime[0]);
            var minutes   = Number(arrayTime[1]);
            var seconds   = Number(arrayTime[2]);
            var meridian  = "AM";

            if (hours >= 12) {
                hours = hours - 12;
                meridian = "PM";
            }

            if (hours == 0) {
                hours = 12;
            }

            if (hours < 10)
                hours = "0" + hours.toString();

            if (minutes < 10)
                minutes = "0" + minutes.toString();

            if (seconds < 10)
                seconds = "0" + seconds.toString();

            time = hours + ":" + minutes + ":" + seconds + " " + meridian;
        }
    }

    return time;
}

/*
 * Funcion que retorna la fecha actual en un formato determinado
 * Parametro:
 *      parameter: String que contiene el formato de la fecha
 *
 * Formatos Soportados:
 *      'dd/mm/yyyy', (Valor por defecto)
 *      'dd-mm-yyyy',
 *      'yyyy/mm/dd',
 *      'yyyy-mm-dd'
 */
function getCurrentDate(format) {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; //January is 0!
    var yyyy = today.getFullYear();

    if(dd<10) {
        dd='0'+dd
    }

    if(mm<10) {
        mm='0'+mm
    }

    switch (format) {
        case 'dd/mm/yyyy':
            today = dd+'/'+mm+'/'+yyyy;
            break;
        case 'dd-mm-yyyy':
            today = dd+'-'+mm+'-'+yyyy;
            break;
        case 'yyyy/mm/dd':
            today = yyyy+'/'+mm+'/'+dd;
            break;
        case 'yyyy-mm-dd':
            today = yyyy+'-'+mm+'-'+dd;
            break;
        default:
            today = dd+'/'+mm+'/'+yyyy;
            break;
    }

    return today;
}

//  discuss at: http://phpjs.org/functions/time/
// original by: GeekFG (http://geekfg.blogspot.com)
// improved by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
// improved by: metjay
// improved by: HKM
//   example 1: timeStamp = time();
//   example 1: timeStamp > 1000000000 && timeStamp < 2000000000
//   returns 1: true
function time() {
  return Math.floor(new Date().getTime() / 1000);
}

function defalutlModalBodyMessage(e) {

    e = typeof e !== 'undefined' ? e : '';

    var html = '<div class="alert alert-block alert-error">\
                <h4>Error al cargar el elemento</h4>\
                Lo sentimos, hubo un problema al cargar la vista, \
                por favor intente nuevamente.<br /> \
                Si el problema persiste por favor contacte al administrador...</div>';

    if(e != '') {
        html = html + '<p><b>Detalle del Error</b><br />' + e + '</p>';
    }
    return html;
}

/*
 * Función que se utiliza para generalizar el uso de los select2
 * Parámetros de entrada:
 *              -element: elemento Jquery a modificar
 *              -removeChildren: true si se desea eliminar los hijos, false si no se desea borrar nada
 *              -placeholder: es el string que muestra al momento de realizar la selección
 *              -allowClear: si se desea el botón de limpiar se coloca true
 * 
 */

function initSelect2(element, removeChildren, placeholder, allowClear){

               if(removeChildren){
                   element.children().remove();
               }

               element.prepend('<option/>').val(function(){
                       return $('[selected]',this).val();
                   });

               element.select2({
                   placeholder: placeholder,
                   allowClear: allowClear,
                   width:'100%'
               });
           };


/*
 * Funcion que facilita mostrar los Message Dialog
 * Parametros:
 *      title: titulo de dialog
 *      msg: mensaje dentro del dialog
 *      dialogClass: [dialog-warning | dialog-error | dialog-info | dialog-success]
 */

function showDialogMsg(title, msg, dialogClass, closeBtnName, arrayBtns, createDefaultBtnClose) {
    if(jQuery('body #dialog-message').length > 0)
        jQuery('body #dialog-message').remove();

    jQuery("body").append('<div id="dialog-message"></div>');
    var element = jQuery('body #dialog-message');

    if (typeof dialogClass === "undefined" || dialogClass === null || dialogClass === '') {
        dialogClass = 'dialog-info'
    }

    if (typeof arrayBtns === "undefined" || arrayBtns === null || arrayBtns === '') {
        arrayBtns = [];
    }

    if (typeof closeBtnName === "undefined" || closeBtnName === null || closeBtnName === '') {
        closeBtnName = 'Cerrar';
    }

    if (typeof createDefaultBtnClose === "undefined" || createDefaultBtnClose === null || createDefaultBtnClose === '') {
        createDefaultBtnClose = true;
    }

    if(createDefaultBtnClose === true || arrayBtns.length === 0) {
        arrayBtns.push({
            text: closeBtnName, click: function() {
                jQuery( this ).dialog( "close" );
            }
        });
    }

    if (typeof title === "undefined" || title === null || title === '') {
        switch(dialogClass.replace('dialog-','')) {
            case 'error':
                title = 'Ha ocurrido un Error!';
                break;
            case 'warning':
                title = 'Advertencia!';
                break;
            case 'success':
                title = 'Realizado correctamente!';
                break;
            default:
                title = 'Informaci&oacute;n';
                break;
        }
    }

    if (typeof msg === "undefined" || msg === null || msg === '') {
        switch(dialogClass.replace('dialog-','')) {
            case 'error':
                msg = 'Se ha producido un error inesperado! Por favor, verifique los datos ingresados e intente nuevamente.';
                break;
            case 'warning':
                msg = 'Atenci&oacute;n, verifique la información proporcionada y que los datos esten completos. Estos podría generar un error.';
                break;
            case 'success':
                msg = 'La acci&oacute;n se ha realizado correctamente.';
                break;
            default:
                msg = 'No se ha definido información a mostrar al usuario.';
        }
    }

    var msgWi = '';

    switch(dialogClass.replace('dialog-','')) {
        case 'error':
            msgWi = '<i class="fa fa-fw fa-times-circle"></i>&nbsp;&nbsp;'+msg;
            break;
        case 'warning':
            msgWi = '<i class="fa fa-fw fa-warning"></i>&nbsp;&nbsp;'+msg;
            break;
        case 'success':
            msgWi = '<i class="fa fa-fw fa-check-circle"></i>&nbsp;&nbsp;'+msg;
            break;
        default:
            msgWi = '<i class="fa fa-fw fa-info-circle"></i>&nbsp;&nbsp;'+msg;
    }

    element.append(msgWi);

    element.dialog({
        dialogClass: dialogClass,
        modal: true,
        title: title,
        buttons: arrayBtns
    });
}

/* Parametros que acepta la funcion
 *  method     : metodo a traves del cual se se realizara el envio de la informacion POST o GET
 *  action     : url al cual se enviara la informacion
 *  target     : Nombre de la nueva ventana
 *  parameters : json enconde de los parametros que  seran enviado al nuevo popoup
 */
function openPostPopUpWindows(winParams) {
    var windowObjectReference;
    var params = winParams['parameters'];

    var form = document.createElement("form");
    form.setAttribute("method", winParams['method']);
    form.setAttribute("action", winParams['action']);
    form.setAttribute("target", winParams['target']);

    for (var i in params) {
        if (params.hasOwnProperty(i)) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = i;
            input.value = params[i];
            form.appendChild(input);
        }
    }

    document.body.appendChild(form);

    //note I am using a post.htm page since I did not want to make double request to the page
    //it might have some Page_Load call which might screw things up.
    windowObjectReference = window.open("", winParams['target'], "_blank");
    windowObjectReference.resizeTo(screen.width, screen.height);

    form.submit();

    document.body.removeChild(form);
}

    

/* Funcion que determina si un determinado valor es un numero valido */
function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

jQuery(document).ready(function($) {

    $( "*.fd_parent_ident" ).parent().addClass( "fd_options_ident" );

    /***** Mosrtrar Mensajes de Error de Sonata y Esconderlos Automaticamente ******/

    $('i[class="ui-icon ui-icon-alert"]').attr("data-placement", "top");
    $('i[class="ui-icon ui-icon-alert"][data-title="error"]').attr("data-title", '<spam style="color: #b94a48;">Se ha producido un error:</spam>');
    $('i[class="ui-icon ui-icon-alert"]').popover('show');
    var popOverShow = true;
    var popOverClicked = false;
    var lastPopOverClicked = null;

    $('body').on('click', function(event) {


        if (popOverShow == true && popOverClicked == false) {
            $('i[class="ui-icon ui-icon-alert"]').popover('hide');
            popOverShow = false;
            lastPopOverClicked = null;
        }
        else {
            if (popOverShow == true && popOverClicked == true) {
                popOverShow = false;
                popOverClicked = false;
            }
            else {
                if (popOverShow == false && popOverClicked == true) {
                    popOverShow = true;
                    popOverClicked = false;
                }
                else {
                    popOverShow = false;
                    popOverClicked = false;
                    lastPopOverClicked = null;
                }
            }
        }

        lasElementClicked = event.target;

    });

    $('i[class="ui-icon ui-icon-alert"]').on('click', function(event) {

        if (lastPopOverClicked != null) { //Determina si hay un PopUp abierto y se ha dado click en otro diferente.
            if ($(this) != lastPopOverClicked && popOverShow == true) {
                lastPopOverClicked.popover('hide');       //Se cierra el PopUp ya abierto.
                popOverShow = false;
            }
        }

        popOverClicked = true;
        lastPopOverClicked = $(this);

    });
    /*********************************************/

	//Estandarización del uso de modal dentro del proyecto
    $('body').append('\
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">\
            <div class="modal-dialog">\
                <div class="modal-content">\
                    <div class="modal-header">\
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>\
                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>\
                    </div>\
                    <div class="modal-body">\
                    </div>\
                    <div class="modal-footer">\
                        <button type="button" class="btn btn-default" data-dismiss="modal" style="color: #636363;font-weight: bold;">Cerrar</button>\
                    </div>\
                </div>\
            </div>\
        </div>');

    $("body").on('click', 'a[custom-modal="true"]', function(e){
        var currentIDM = $(this).attr("id");
        if (!(typeof modal_elements === 'undefined') && modal_elements.length != 0) {
            for (var i = 0; i < modal_elements.length; i++) {
                if (currentIDM == modal_elements[i].id) {
                    if (modal_elements[i].empty != true) {
                        /*Limpiando los elementos del modal*/
                        $('#myModal div.modal-header h4#myModalLabel').empty();
                        $('#myModal div.modal-body').empty();
                        $('#myModal div.modal-footer').empty();

                        /*Verificando el contendio a mostrar*/
                        if (typeof modal_elements[i].header === 'undefined' || modal_elements[i].header == '') {
                            modal_elements[i].header = 'Detalle';
                        }

                        if (typeof modal_elements[i].func === 'undefined' || modal_elements[i].func == '') {
                            modal_elements[i].func = 'defalutlModalBodyMessage';
                        }

                        if (typeof modal_elements[i].parameters === 'undefined' || modal_elements[i].func == '') {
                            var modalBody = window[modal_elements[i].func]();
                        } else {
                            var modalBody = window[modal_elements[i].func](modal_elements[i].parameters);
                        }

                        /*Estableciendo los nuevos valores del modal*/
                        $('#myModal div.modal-header h4#myModalLabel').append(modal_elements[i].header);
                        if (modalBody != '') {
                            $('#myModal div.modal-body').append(modalBody);
                            if (typeof modal_elements[i].closeBtnName === 'undefined' || modal_elements[i].closeBtnName == '') {
                                $('#myModal div.modal-footer').append(modal_elements[i].footer + '<button type="button" class="btn btn-default" data-dismiss="modal" style="color: #636363;font-weight: bold;">Cerrar</button>');
                            } else {
                                $('#myModal div.modal-footer').append(modal_elements[i].footer + '<button type="button" class="btn btn-default" data-dismiss="modal" style="color: #636363;font-weight: bold;">'+modal_elements[i].closeBtnName+'</button>');
                            }
                        } else {
                            $('#myModal div.modal-body').append(window['defalutlModalBodyMessage']());
                            $('#myModal div.modal-footer').append('<button type="button" class="btn btn-default" data-dismiss="modal" style="color: #636363;font-weight: bold;">Cerrar</button>');
                        }

                        if (typeof modal_elements[i].afterLoadCallFunction !== 'undefined' && modal_elements[i].afterLoadCallFunction != '') {
                            window[modal_elements[i].afterLoadCallFunction]();
                        }

                        if (typeof modal_elements[i].widthModal !== 'undefined' && modal_elements[i].widthModal != '') {
                            /*$('div#myModal').css({ 'width': modal_elements[i].widthModal+'px', 'margin-left': '-'+(modal_elements[i].widthModal/2)+'px' });*/
                            $('div#myModal div.modal-dialog').css({ 'width': modal_elements[i].widthModal+'px' });
                        }

                    } else {
                        if (typeof modal_elements[i].emptyMessage === 'undefined') {
                            var mBody = '<i class="icon-exclamation-sign" style="margin-right:7px;"></i>\
                                         No se ha seleccionado ningun elemento del cual se puedan mostrar los detalles,\
                                         por favor seleccione uno e intente nuevamente.';

                            modal_elements[i].emptyMessage = [ {emptyMTitle: 'Elemento no seleccionado', emptyMBody: mBody } ];
                        } else  {

                            if (typeof modal_elements[i].emptyMessage[0].emptyMTitle === 'undefined' || modal_elements[i].emptyMessage[0].emptyMTitle == '') {
                                modal_elements[i].emptyMessage[0].emptyMTitle = 'Elemento no seleccionado';
                            }

                            if (typeof modal_elements[i].emptyMessage[0].emptyMBody === 'undefined' || modal_elements[i].emptyMessage[0].emptyMBody == '') {
                                modal_elements[i].emptyMessage[0].emptyMBody = '<i class="icon-exclamation-sign" style="margin-right:7px;"></i>\
                                         No se ha seleccionado ningun elemento del cual se puedan mostrar los detalles,\
                                         por favor seleccione uno e intente nuevamente.';
                            }
                        }

                        $('#myModal div.modal-header h4#myModalLabel').empty();
                        $('#myModal div.modal-body').empty();
                        $('#myModal div.modal-footer').empty();

                        $('#myModal div.modal-header h4#myModalLabel').append(modal_elements[i].emptyMessage[0].emptyMTitle);
                        $('#myModal div.modal-body').append(modal_elements[i].emptyMessage[0].emptyMBody);
                        $('#myModal div.modal-footer').append('<button class="action" data-dismiss="modal" aria-hidden="true"><span class="label">Cerrar</span></button>');
                    }
                }
            }
        } else {
            $('#myModal div.modal-header h4#myModalLabel').empty();
            $('#myModal div.modal-body').empty();
            $('#myModal div.modal-footer').empty();

            $('#myModal div.modal-header h4#myModalLabel').append('Error!!!');
            $('#myModal div.modal-body').append('<div class="alert alert-error">\
                                                     <h4>Ops! ha ocurrido un error</h4>\
                                                     Lo sentimos pero ha ocurrido un error, por favor intente nuevamente, si el problema persiste por favor contacte con el administrador\
                                                 </div>');
            $('#myModal div.modal-footer').append('<button class="action" data-dismiss="modal" aria-hidden="true"><span class="label">Cerrar</span></button>');

        }
    });

    setDateRangePicker();
    setBootstrapDatePicker()

});

/*** Variable de Configuracion Global para el Plugin DateRangePicker y Metodo para setear dicho Plugin.
 **  Ver Documentacion Sitio Oficial: https://github.com/dangrossman/bootstrap-daterangepicker
 ***/
var daterangepickerOptions = {
                                format: "DD/MM/YYYY",
                                singleDatePicker: true,
                                showDropdowns: true,
                                locale: {
                                        applyLabel: 'Seleccionar',
                                        cancelLabel: 'Cancelar',
                                        fromLabel: 'Desde',
                                        toLabel: 'Hasta',
                                        customRangeLabel: 'Personalizado',
                                        daysOfWeek: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi','Sa'],
                                        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                                        firstDay: 1
                                    }
                            };

var bootstrapDatePickerOptions = {
    format: "dd/mm/yyyy",
    weekStart: 0,
    clearBtn: true,
    language: "es",
    autoclose: true
}

function setBootstrapDatePicker() {
    jQuery('body .bootstrap-datepicker').each(function() {
        jQuery(this).datepicker(bootstrapDatePickerOptions);
    });

    jQuery('body .bootstrap-datepicker.now').each(function() {
        if(jQuery(this).datepicker('remove')) {
            jQuery(this).datepicker(jQuery.extend(bootstrapDatePickerOptions, { 'endDate' : moment().format('DD/MM/YYYY') }));
        }
    });
}

function setDateRangePicker(){

    jQuery('body .bootstrap-daterangepicker').each(function() {
        jQuery(this).daterangepicker(daterangepickerOptions);
    });

    jQuery('body .bootstrap-daterangepicker.now').each(function() {
        if(jQuery(this).data('daterangepicker')) {
            jQuery(this).data('daterangepicker').setOptions(jQuery.extend(daterangepickerOptions, { 'maxDate' : moment() }));
        }
    });
}


/* Funcion que retorna el Navegador y Versión utilizada actualmente */
function getCurrentBrowser(){
    var ua= navigator.userAgent, tem,
    M= ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
    if(/trident/i.test(M[1])){
        tem=  /\brv[ :]+(\d+)/g.exec(ua) || [];
        return 'IE '+(tem[1] || '');
    }
    if(M[1]=== 'Chrome'){
        tem= ua.match(/\b(OPR|Edge)\/(\d+)/);
        if(tem!= null) return tem.slice(1).join(' ').replace('OPR', 'Opera');
    }
    M= M[2]? [M[1], M[2]]: [navigator.appName, navigator.appVersion, '-?'];
    if((tem= ua.match(/version\/(\d+)/i))!= null) M.splice(1, 1, tem[1]);
    return M.join(' ');
}

/*
 *
 * Copyright (c) 2006-2010 Sam Collett (http://www.texotela.co.uk)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * Version 1.2
 * Demo: http://www.texotela.co.uk/code/jquery/numeric/
 *
 */
(function($) {
/*
 * Allows only valid characters to be entered into input boxes.
 * Note: does not validate that the final text is a valid number
 * (that could be done by another script, or server-side)
 *
 * @name     numeric
 * @param    decimal      Decimal separator (e.g. '.' or ',' - default is '.'). Pass false for integers
 * @param    callback     A function that runs if the number is not valid (fires onblur)
 * @author   Sam Collett (http://www.texotela.co.uk)
 * @example  $(".numeric").numeric();
 * @example  $(".numeric").numeric(",");
 * @example  $(".numeric").numeric(null, callback);
 *
 */
$.fn.numeric = function(decimal, callback)
{
	decimal = (decimal === false) ? "" : decimal || ".";
	callback = typeof callback == "function" ? callback : function(){};
	return this.data("numeric.decimal", decimal).data("numeric.callback", callback).keypress($.fn.numeric.keypress).blur($.fn.numeric.blur);
}

$.fn.numeric.keypress = function(e)
{
	var decimal = $.data(this, "numeric.decimal");
	var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
	// allow enter/return key (only when in an input box)
	if(key == 13 && this.nodeName.toLowerCase() == "input")
	{
		return true;
	}
	else if(key == 13)
	{
		return false;
	}
	var allow = false;
	// allow Ctrl+A
	if((e.ctrlKey && key == 97 /* firefox */) || (e.ctrlKey && key == 65) /* opera */) return true;
	// allow Ctrl+X (cut)
	if((e.ctrlKey && key == 120 /* firefox */) || (e.ctrlKey && key == 88) /* opera */) return true;
	// allow Ctrl+C (copy)
	if((e.ctrlKey && key == 99 /* firefox */) || (e.ctrlKey && key == 67) /* opera */) return true;
	// allow Ctrl+Z (undo)
	if((e.ctrlKey && key == 122 /* firefox */) || (e.ctrlKey && key == 90) /* opera */) return true;
	// allow or deny Ctrl+V (paste), Shift+Ins
	if((e.ctrlKey && key == 118 /* firefox */) || (e.ctrlKey && key == 86) /* opera */
	|| (e.shiftKey && key == 45)) return true;
	// if a number was not pressed
	if(key < 48 || key > 57)
	{
		/* '-' only allowed at start */
		if(key == 45 && this.value.length == 0) return true;
		/* only one decimal separator allowed */
		if(decimal && key == decimal.charCodeAt(0) && this.value.indexOf(decimal) != -1)
		{
			allow = false;
		}
		// check for other keys that have special purposes
		if(
			key != 8 /* backspace */ &&
			key != 9 /* tab */ &&
			key != 13 /* enter */ &&
			key != 35 /* end */ &&
			key != 36 /* home */ &&
			key != 37 /* left */ &&
			key != 39 /* right */ &&
			key != 46 /* del */
		)
		{
			allow = false;
		}
		else
		{
			// for detecting special keys (listed above)
			// IE does not support 'charCode' and ignores them in keypress anyway
			if(typeof e.charCode != "undefined")
			{
				// special keys have 'keyCode' and 'which' the same (e.g. backspace)
				if(e.keyCode == e.which && e.which != 0)
				{
					allow = true;
					// . and delete share the same code, don't allow . (will be set to true later if it is the decimal point)
					if(e.which == 46) allow = false;
				}
				// or keyCode != 0 and 'charCode'/'which' = 0
				else if(e.keyCode != 0 && e.charCode == 0 && e.which == 0)
				{
					allow = true;
				}
			}
		}
		// if key pressed is the decimal and it is not already in the field
		if(decimal && key == decimal.charCodeAt(0))
		{
			if(this.value.indexOf(decimal) == -1)
			{
				allow = true;
			}
			else
			{
				allow = false;
			}
		}
	}
	else
	{
		allow = true;
	}
	return allow;
}

$.fn.numeric.blur = function()
{
	var decimal = $.data(this, "numeric.decimal");
	var callback = $.data(this, "numeric.callback");
	var val = $(this).val();
	if(val != "")
	{
		var re = new RegExp("^\\d+$|\\d*" + decimal + "\\d+");
		if(!re.exec(val))
		{
			callback.apply(this);
		}
	}
}

$.fn.removeNumeric = function()
{
	return this.data("numeric.decimal", null).data("numeric.callback", null).unbind("keypress", $.fn.numeric.keypress).unbind("blur", $.fn.numeric.blur);
}

})(jQuery);

/******     Funcion que permite campturar los eventos show y hide por ejemplo: $('#input').on('show',function(){ ... }); ******/
jQuery(document).ready(function($) {
    (function ($) {
      $.each(['show', 'hide'], function (i, ev) {
        var el = $.fn[ev];
        $.fn[ev] = function () {
          this.trigger(ev);
          return el.apply(this, arguments);
        };
      });
    })(jQuery);
});


jQuery(document).ready(function($) {
    
    function addButtonToInput(){
        $('.addButtonInput').each(function(){
           $(this).after('<a id="addDesc_'+$(this).attr('id')+'" onClick="showInput(\''+($(this).attr('id'))+'\');" style="cursor: pointer;" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a>');
        });
    }
    
    addButtonToInput();
});

function showInput(id){
    jQuery('#'+id).show();
}