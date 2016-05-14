# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $("input[type='radio'][name='talent_profile[gender]']").change ->
    $('#Female').css 'display', 'none'
    $('#Male').css 'display', 'none'
    console.log $(this).val()
    fieldToShow = $(this).val()
    $('#' + fieldToShow).css 'display', 'block'
    return
