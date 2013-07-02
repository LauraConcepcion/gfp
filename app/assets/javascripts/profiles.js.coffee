# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.calculatePercentageColumn = (input) ->
  total = 0.0
  tlresult_id = input.className.split("tlresult_").pop()
  $.map($("input.tlresult_"+ tlresult_id), (v, k) ->
     total += parseFloat($(v).val())
  )
  total
  $("#total_tlresult_"+tlresult_id).html(total + '%')
  if total > 100.0
    $("#total_tlresult_"+tlresult_id).css('color', 'red')
  else
    $("#total_tlresult_"+tlresult_id).css('color', 'black')


$(document).ready ->
  # edit_tlresults initializations
  $.map($('table').find("th"), (v, k) ->
    tlresult_id = v.className.split("tlresult_").pop()
    total = 0.0
    $.map($("input.tlresult_"+ tlresult_id), (v, k) ->
      total += parseFloat($(v).val())
    )
    $("#total_tlresult_"+tlresult_id).html(total + '%')
    if total > 100
      $("#total_tlresult_"+tlresult_id).css('color', 'red')
  )

  # edit_scores initializations

