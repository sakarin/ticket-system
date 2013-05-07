# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->
  $('#print-ticket').bind 'click', (event) =>
    doPrint()

#  $([name="btn_next"]).bind 'click', (event) =>
#    if

#  $('booking_price').change ->
#     $('total_price')