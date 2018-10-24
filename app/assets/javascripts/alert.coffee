$(document).on 'turbolinks:load', ->
  $('.alert').delay(2500).fadeout 500, ->
    $('.alert').alert 'close'
