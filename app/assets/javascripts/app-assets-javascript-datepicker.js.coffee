# install and make run basic bootstrap date-picker functionality described here http://www.eyecon.ro/bootstrap-datepicker/

# app/assets/javascript/datepicker.js.coffee
#$(document).on 'pageChanged', ->
$ ->

  # datepicker for simple_form & Ransack
  $(".custom_datepicker_selector").datepicker().on 'changeDate', (en) ->
    correct_format = en.date.getFullYear() + '-' + ('0' + (en.date.getMonth() + 1)).slice(-2) + '-' + ('0' + en.date.getDate()).slice(-2) # date format yyyy-mm-dd
    $(this).parent().find("input[type=hidden]").val(correct_format)

#Note if you refactor a bit it will work with jOuery date-picker

