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

  but = $('input[type="submit"]')
  if total > 100.0
    $("#total_tlresult_"+tlresult_id).css('color', 'red')
    but.attr('disabled', 'disabled')
    but.next('span.msg').show()
  else
    $("#total_tlresult_"+tlresult_id).css('color', 'black')
    but.attr('disabled', null)
    but.next('span.msg').hide()


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
      but = $('input[type="submit"]')
      but.attr('disabled', 'disabled')
      but.next('span.msg').show()
  )

  # Profile linked inputs
  # Ahora mismo los ciclos formativos no están por instituto
  # $("#profile_institute_id").change(function() {
  #   var provenance = $('#profile_institute_id');
  #     $.getJSON('/institutes/update_trainercycle/' + provenance.val() || "0", function(trainercycles) {
  #       var options = '';
  #       for(var i = 0; i < trainercycles.length; i++)
  #         options += '<option value="' + trainercycles[i][1] +'">' + trainercycles[i][0]+ '</option>';
  #       $("select#profile_trainercycle_id").html(options);
  #     });
  #     return false;
  # });

  $("#profile_trainercycle_id").change ->
    provenance = $("#profile_trainercycle_id")
    $.getJSON "/trainercycles/" + (provenance.val() or 0) + "/update_matter/", (matters) ->
      options = "<option value=''></option>"
      i = 0

      while i < matters.length
        options += "<option value=\"" + matters[i][1] + "\">" + matters[i][0] + "</option>"
        i++
      destination = $("select#profile_matter_id")
      destination.html options
      destination.select2()

    false

