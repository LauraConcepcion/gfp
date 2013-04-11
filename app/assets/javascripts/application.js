// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  $("#profile_institute_id").change(function() {
      var provenance = $('#profile_institute_id');
      $.getJSON('/institutes/update_trainercycle/' + provenance.val() || "0", function(trainercycles) {
            var options = ''; 
            for(var i = 0; i < trainercycles.length; i++)
            options += '<option value="' + trainercycles[i][1] +'">' +  trainercycles[i][0]+ '</option>';
          $("select#profile_trainercycle_id").html(options);
          });
      return false;
    });

  $("#profile_trainercycle_id").change(function() {
      var provenance = $('#profile_trainercycle_id');
      $.getJSON('/trainercycles/update_matter/' + provenance.val() || "0", function(matters) {
            var options = ''; 
            for(var i = 0; i < matters.length; i++)
            options += '<option value="' + matters[i][1] +'">' +  matters[i][0]+ '</option>';
          $("select#profile_matter_id").html(options);
          });
      return false;
    });

});

