# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load',  ->
  $('body').on 'input', '.post textarea', ->
    $(this.previousElementSibling).html(this.value)
    $(this).height($(this.previousElementSibling).height())
    if $(this).height() < this.scrollHeight
      $(this).height(this.scrollHeight - 10)

  $('body').on 'keydown', '.post textarea', (e) ->
    if !e.shiftKey && e.key == 'Enter'
      e.preventDefault()
      textarea = this
      textarea.readOnly = true
      $(textarea.form).find("input[type='submit']").click()
      $(textarea.form).on 'ajax:error', ->
        textarea.readOnly = false

  $('body').on 'click', '.comment-list .hide', ->
    $(this.parentNode.parentNode).hide()

  $('body').on 'click', '.post button.comment', (e) ->
    $(this.parentNode.parentNode).find('textarea').focus()
