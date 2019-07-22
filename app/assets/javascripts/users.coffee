# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.addEventListener 'load', ->
  for node in document.querySelectorAll('.post textarea')
    do ->
      r = 0
      lf = []
      node.value = ''
      b = node.clientHeight - 10

      node.oninput = (e) ->
        e.preventDefault()
        r = e.target.rows

        if lf[lf.length - 1] == e.target.value.length + 1
          e.target.rows--
          lf.pop()

        e.target.rows = parseInt((e.target.scrollHeight - 10) / b)
        e.target.rows++ if e.shiftKey && e.key == 'Enter'

        if e.target.rows > r
          lf.push(e.target.value.length)

      node.onkeydown = (e) ->
        if !e.shiftKey && e.key == 'Enter'
          e.preventDefault();
          e.target.form.submit()

  for node in document.querySelectorAll('.post button.comment')
    node.onclick = (e) ->
      e.preventDefault()
      e.target.parentNode.nextElementSibling.querySelector('textarea').focus()

