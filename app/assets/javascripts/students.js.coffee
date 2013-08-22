# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.getStudent =  ->
  $("input.dni").blur ->
    dni_name = $(this).attr("name")
    base_name = dni_name.replace(/(classroom\[students_attributes\]\[\d+\])\[.*?\]$/, '$1')

    name = $("[name='" + base_name + "[name]']")
    firstsurname = $("[name='" + base_name + "[firstsurname]']") 
    secondsurname = $("[name='" + base_name + "[secondsurname]']")
    phone= $("[name='" + base_name + "[phone]']")
    student_code = $("[name='" + base_name + "[student_code]']")
    birthdate = $("[name='" + base_name + "[birthdate]']")
    mail = $("[name='" + base_name + "[mail]']")
    record = $("[name='" + base_name + "[record]']")

    $.getJSON "/students/search_by_dni?dni=" + $(this).val(), (student) ->
      name.val(student['name'])
      firstsurname.val(student['firstsurname'])     
      secondsurname.val(student['secondsurname'])
      phone.val(student['phone'])
      student_code.val(student['student_code'])
      mail.val(student['mail'])
      record.val(student['record'])
