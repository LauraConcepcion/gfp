window.build_dialog = (selector, content, dialog_title) ->
  but = undefined
  $("body").append "<div id=\"" + selector + "\">\n" + content + "</div>"
  but = new Object

  $("#" + selector).dialog
    buttons: but
    modal: true
    title: dialog_title
    height: "auto"
    width: "auto"


window.close_dialog = (selector) ->
  $("#" + selector).dialog "close"
  $("#" + selector).remove()
