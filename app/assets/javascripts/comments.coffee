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
    if !e.shiftKey && (e.key == 'Enter' || e.which == 13)
      e.preventDefault()
      textarea = this
      textarea.readOnly = true
      $(textarea.form).find("input[type='submit']").click()
      $(textarea.form).on 'ajax:error', ->
        textarea.readOnly = false

  $('body').on 'click', '.hide-comments', ->
    $parent = $(this.parentNode.parentNode)
    $parent.hide()
    $prev = $parent.prev()
    $prev.show() if $prev.hasClass('show-replies')

  $('body').on 'click', '.post button.comment', ->
    $(this.parentNode.parentNode).find('textarea').focus()

  $('body').on 'click', '.post', (e) ->
    if $(e.target).hasClass('reply')
      $(this).find('.comment-list .comment-form').addClass('hide')
      $form = $(e.target.parentNode).next().find('>.comment-form')
      $form.removeClass('hide')
      $form.find('textarea').focus()

