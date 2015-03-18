#= require jquery
#= require bootstrap-sprockets
#= require jquery_ujs
#= require moment
#= require moment/ru
#= require bootstrap-datetimepicker
#= require moment/ru
#= require pickers
#= require active_form
#= require js-routes
#= require i18n_setup
#= require froala_editor.min.js
#= require langs/ru.js
#= require tabs
#= require localities

$ ->
  $('.link').click ->
    location.href = $(this).attr('data-href')

  $('#news_body').editable
    inlineMode: false
  $('#news_published_at').datetimepicker()

  $('a.btn-xs span.glyphicon').each ->
    klass = $(this).attr('class').split(' ')[1]
    glyphicon_titles = {
      pencil: 'edit',
      remove: 'destroy',
      ok: 'approve',
      'triangle-bottom': 'actoins'
    }
    action = glyphicon_titles[klass.replace('glyphicon-', '')]
    $(this).closest('a.btn-xs').prop('title', I18n.t("helpers.links.#{action}"))
    return
  return
