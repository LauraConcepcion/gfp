build_dialog = (selector, content, dialog_title) ->
  but = undefined
  close_dialog selector
  $("body").append "<div id=\"" + selector + "\">\n" + content + "</div>"
  unless $("#" + selector + " form").size() is 0
    but = Aceptar: ->

      # FIXME: Desactiva todos los botones del formulario
      $("div.ui-dialog-buttonset button").attr "disabled", "true"
      $("#" + selector + " form").submit()
  else
    but = new Object
  but.Cancelar = ->
    $(this).dialog "close"

  $("#" + selector).dialog
    buttons: but
    modal: true
    title: dialog_title
    height: "auto"
    width: "auto"

close_dialog = (selector) ->
  $("#" + selector).dialog "close"
  $("#" + selector).remove()
