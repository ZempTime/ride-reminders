$(document).on 'turbolinks:load', ->
  window.setTimeout (->
    $('.alert').fadeTo(500, 0).slideUp 500, ->
      $(this).remove()
      return
    return
  ), 3000
