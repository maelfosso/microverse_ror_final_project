$(document).on 'turbolinks:load',  ->
  $modal = $('#modal')
  $modal.on 'click', (e) ->
    if e.target == $('.close i')[0] ||
       !($(e.target).closest('.post-form').length || $(e.target).closest('.likes').length)
      $modal.removeClass('show')
      $modal.html('')

  $('#preload').hide()

  $('body').on 'ajax:send', -> $('#preload').show()
  $("boy").on 'submit', -> $('#preload').show()
  $("a[href]:not([href*='#'])").on 'click', -> $('#preload').show()
