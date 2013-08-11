$ ->
  $("#datetimepicker1").datetimepicker language: "pt-BR"

  $('#booking_customer_price').change ->
    total_price = $('#booking_customer_price').val() *  $('#booking_seat').text()
    $('#total_price').text(total_price )

  $("#print-ticket").click ->
#    alert()
    $('#print-area').show().printElement();
