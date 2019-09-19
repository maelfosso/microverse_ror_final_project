# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load',  ->
  $('.post-wrapper textarea').val('')

  $('body').on 'input', '.post-form textarea', ->
    $this = $(this)
    $parent = $(this.parentNode)
    $submit = $(this.form).find("input[type='submit']")
    $(this.previousElementSibling).html(this.value)
    $this.height($(this.previousElementSibling).height())
    if $this.height() < this.scrollHeight
      $this.height(this.scrollHeight - 10) if $parent.hasClass('title')
      $this.height(this.scrollHeight - 30) if $parent.hasClass('content')
    show = false
    for node in $(this.form).find('textarea')
      show = node.value != ''
      break if show == false
    if show
      $submit.show()
    else
      $submit.hide()
