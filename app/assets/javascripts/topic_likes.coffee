ready = undefined

ready = ->	

	$('.topic-like').on('ajax:send', ->
	  $(this).addClass 'loading'
	  return
	).on('ajax:complete', ->
	  $(this).removeClass 'loading'
	  return
	).on('ajax:error', ->
	  $(this).after '<div class="error">There was an issue.</div>'
	  return
	).on 'ajax:success', (e, data, status, xhr) ->
	  $(this).find('.heart').addClass 'rainbow'
	  $('#topic-likes-' + data.id).html data.count
	  return

$(document).ready ready
$(document).on 'page:fetch', ready
$(document).on 'page:load', ready
$(document).on 'turbolinks:load', ready
