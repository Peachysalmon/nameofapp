$(document).on 'turbolinks:load', ->
  $('.alert-sucess').delay(2500).fadeOut 500, ->
    $('.alert').alert 'close'
  $('.alert-danger').delay(2500).fadeOut 500, ->
    $('.alert').alert 'close'
