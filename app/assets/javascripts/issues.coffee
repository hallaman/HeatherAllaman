# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	nav = $('#guide_navigation')
	window.onscroll = ->
		scrollTop = $(window).scrollTop()
		console.log scrollTop
		if scrollTop > 360
			nav.addClass 'fix-nav'
		else
			nav.removeClass 'fix-nav'
		return
	return

# ---
# generated by js2coffee 2.2.0
