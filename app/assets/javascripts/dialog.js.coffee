window.build_dialog = (selector, content, dialog_title, modal) ->
  modal = true if modal == null
  but = undefined
  close_dialog selector
  $("body").append "<div id=\"" + selector + "\">\n" + content + "</div>"

  # Esto es por si necesitamos añadir automáticamente los botones, pero mejor en el form
  # unless $("#" + selector + " form").size() is 0
  #   but = Aceptar: ->

  #     # FIXME: Desactiva todos los botones del formulario
  #     $("div.ui-dialog-buttonset button").attr "disabled", "true"
  #     $("#" + selector + " form").submit()
  # else
  #   but = new Object
  # but.Cancelar = ->
  #   $(this).dialog "close"

  $("#" + selector).dialog
    # buttons: but
    modal: modal
    title: dialog_title
    height: "auto"
    width: "auto"

window.close_dialog = (selector) ->
  $("#" + selector).dialog "close"
  $("#" + selector).remove()
