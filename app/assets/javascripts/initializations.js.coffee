window.initialize = (scope) ->
  # Inicializamos datepickers
  $.datepicker.regional['es'] = {
      closeText: 'Cerrar',
      prevText: '&#x3c;Ant',
      nextText: 'Sig&#x3e;',
      currentText: 'Hoy',
      monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
      'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
      monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
      'Jul','Ago','Sep','Oct','Nov','Dic'],
      dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
      dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
      dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
      weekHeader: 'Sm',
      dateFormat: 'dd/mm/yy',
      firstDay: 1,
      isRTL: false,
      showMonthAfterYear: false,
      yearSuffix: ''};
  $.datepicker.setDefaults $.datepicker.regional["es"]

  scope.find(".datepicker").datepicker({ changeYear: true, yearRange: '-100+0' })

  # Inicializamos los autocompletar con chosen.
  scope.find(".chzn-select").chosen()

  # También después de insertar un cocoon.
  scope.find(".cocoon_with_chzn").bind "cocoon:after-insert", ->
    $(this).find(".chzn-select").chosen()

  #popovers
  scope.find(".pop-over").popover()
  scope.find(".tool-tip").tooltip()
