$(document).on 'page:load', (event) ->
	$('.like').on('ajax:send', ->
	  $(this).addClass 'loading'
	  console.log 'like'
	  return
	).on('ajax:complete', ->
	  $(this).removeClass 'loading'
	  return
	).on('ajax:error', ->
	  $(this).after '<div class="error">There was an issue.</div>'
	  return
	).on 'ajax:success', (e, data, status, xhr) ->
	  $(this).find('.heart').addClass 'rainbow'
	  $('#likes_' + data.id).html data.count
	  return

	$('.post-like').on('ajax:send', ->
	  $(this).addClass 'loading'
	  console.log 'like'
	  return
	).on('ajax:complete', ->
	  $(this).removeClass 'loading'
	  return
	).on('ajax:error', ->
	  $(this).after '<div class="error">There was an issue.</div>'
	  return
	).on 'ajax:success', (e, data, status, xhr) ->
	  $(this).find('.heart').addClass 'random'
	  $('#post-likes').html data.count
	  return
	return