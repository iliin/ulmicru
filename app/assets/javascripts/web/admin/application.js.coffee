#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require moment
#= require moment/ru
#= require bootstrap-datetimepicker
#= require pickers
#= require active_form
#= require js-routes
#= require i18n_setup
#= require tabs
#= require localities
#= require ckeditor/init
#= require web/admin/tags

$ ->
  $('.input').addClass('form-group')
  $('select').addClass('form-control')
  $('input[type=hidden]').addClass('form-control')
  $('input[type=text]').addClass('form-control')
  $('input[type=submit]').addClass('btn')
  $('.link').click ->
    location.href = $(this).attr('data-href')

  $('a.btn-xs span.glyphicon').each ->
    klass = $(this).attr('class').split(' ')[1]
    glyphicon_titles = {
      pencil: 'edit',
      remove: 'destroy',
      ok: 'approve',
      plus: 'add',
      open: 'restore',
      'triangle-bottom': 'actions'
    }
    action = glyphicon_titles[klass.replace('glyphicon-', '')]
    $(this).closest('a.btn-xs').prop('title', I18n.t("helpers.links.#{action}"))
    return

  init_datetimepickers = ->
    $("input.datetime_picker").datetimepicker()
    $("input.date_picker").datetimepicker()
    return

  init_datetimepickers()
  $('a.add_fields').mouseover ->
    setTimeout init_datetimepickers, 500
    return
  return
