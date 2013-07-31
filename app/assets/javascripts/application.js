// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require select2
//= require twitter/bootstrap
//= require initializations
//= require_tree .
//= require cocoon
//
$(document).ready(function(){
  // Fixed header tables (TODO por ahora lo ponemos aquí para que no lo ejecute en los diálogos)
  $('table#qualifyingentity_tlresults_table').fixedHeaderTable({ fixedColumns: 2, height: 450, altClass: 'odd' })

  window.initialize($(this))

  //Si estamos en inicio sesión se debe mostrar la pizarra

  if ((window.location.pathname == "/teachers/sign_in") || (window.location.pathname =="/")){
      $('div.menu_profiles').show(1000);
      $("div.content").css("width", "65%");
  }

  //mostrar o no la pizarra de los perfiles
  $('.show_hide').click(function(){
    if ($(".menu_profiles").is(':visible')){
      $('div.menu_profiles').hide("fast");
      $("div.content").css("width", "100%");
    }else{
      $('div.menu_profiles').show(1000);
      $("div.content").css("width", "65%");
    }
  });
});
