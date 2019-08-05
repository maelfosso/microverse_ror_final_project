$(document).on 'turbolinks:load',  ->
  modal = $('#modal')
  modal.on 'click', (e) ->
      if e.target == $('.close i')[0] ||
         !($(e.target).closest('.post-form').length || $(e.target).closest('.likes').length)
        modal.removeClass('show')
        modal.html('')
