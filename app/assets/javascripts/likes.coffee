# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load",  ->
  $('body').on 'click', '.post .likes-loader', ->
    $('#modal').addClass('show')

  $('body').on 'mouseenter', '.like-form', (e) ->
    $(this).find('.kinds').show()

  $('body').on 'mouseleave', '.like-form', (e) ->
    $(this).find('.kinds').hide()
    $('body').on 'mouseenter', '.like-form', (e) ->
      $(this).find('.kinds').show()

  $('body').on 'click', '.like-form', (e) ->
    $('body').off 'mouseenter', '.like-form'
    $(this).find('.kinds').hide()
