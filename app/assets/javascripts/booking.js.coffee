$ ->
  $("#datetimepicker1").datetimepicker language: "pt-BR"

#  q[route_type_cont]
#  $("#q_route_type_cont").change ->
#    data = $("#listing_amphur_id").val()
#    $.ajax
#      type: "POST"
#      url: "/dynamic_districts/" + data
#      data: data
#      success: (response) ->
#        $("#listing_district_id").html

#  $(':radio').click ->
#    alert($("input:checked").val())
#    data = $("input:checked").val()
