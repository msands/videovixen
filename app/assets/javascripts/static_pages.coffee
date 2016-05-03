# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Bootstrap/Devise flash messages
$ ->
  flashCallback = undefined

  flashCallback = ->
    $('.alert').fadeOut()

  $('.alert').bind 'click', ((_this) ->
    (ev) ->
      $('.alert').fadeOut()
  )(this)
  setTimeout flashCallback, 2500
