#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require moment
#= require moment/ru
#= require bootstrap-datetimepicker
#= require moment/ru
#= require pickers

$ ->
  $('.link').click ->
    location.href = $(this).attr('data-href')
