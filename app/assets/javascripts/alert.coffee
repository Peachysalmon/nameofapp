$(document).on 'turbolinks:load', ->
  $('.alert').delay(2500).fadeOut 500, ->
    $('.alert').alert 'close'
