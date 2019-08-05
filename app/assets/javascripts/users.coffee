# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('body').on 'click', '> header .account > i', ->
    $('body > header .account > ul').toggleClass('show')
  $('body').on 'click', (e) ->
    if !$(e.target).closest('body > header .account').length
      $('body > header .account > ul').removeClass('show')
  $main = $('body > main')
  if (diff = $main[0].offsetWidth - $main[0].clientWidth) > 0
    $('.home .news').css('left', "calc(70% - #{diff}px")
    $('.show .friends').css('left', "calc(70% - #{diff}px")
  $(window).on 'resize', ->
    if (diff = $main[0].offsetWidth - $main[0].clientWidth) > 0
      $('.home .news').css('left', "calc(70% - #{diff}px")
      $('.show .friends').css('left', "calc(70% - #{diff}px")
    else
      $('.home .news').css('left', "calc(70% + #{diff}px")
      $('.show .friends').css('left', "calc(70% + #{diff}px")
