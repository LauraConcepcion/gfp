// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require chosen-jquery
//= require twitter/bootstrap
//= require initializations
//= require_tree .
//= require cocoon
//
$(document).ready(function(){
  window.initialize($(this))

  // Ahora mismo los ciclos formativos no están por instituto
  // $("#profile_institute_id").change(function() {
  //   var provenance = $('#profile_institute_id');
  //     $.getJSON('/institutes/update_trainercycle/' + provenance.val() || "0", function(trainercycles) {
  //       var options = '';
  //       for(var i = 0; i < trainercycles.length; i++)
  //         options += '<option value="' + trainercycles[i][1] +'">' + trainercycles[i][0]+ '</option>';
  //       $("select#profile_trainercycle_id").html(options);
  //     });
  //     return false;
  // });

  $("#profile_trainercycle_id").change(function() {
    var provenance = $('#profile_trainercycle_id');
    $.getJSON('/trainercycles/' + (provenance.val() || 0) + '/update_matter/', function(matters) {
      var options = "<option value=''></option>";
      for(var i = 0; i < matters.length; i++)
        options += '<option value="' + matters[i][1] +'">' + matters[i][0]+ '</option>';
      destination = $("select#profile_matter_id")
      destination.html(options);
      destination.trigger("liszt:updated");
    });
    return false;
  });

  //Si estamos en inicio sesión se debe mostrar la pizarra

  if ((window.location.pathname == "/teachers/sign_in") || (window.location.pathname =="/")){
      $('div.menu_profiles').show(1000);
      $("div.content").css("width", "75%");
  }

  //mostrar o no la pizarra de los perfiles
  $('.show_hide').click(function(){
    if ($(".menu_profiles").is(':visible')){
      $('div.menu_profiles').hide("fast");
      $("div.content").css("width", "100%");
    }else{
      $('div.menu_profiles').show(1000);
      $("div.content").css("width", "75%");
    }
  });
});
