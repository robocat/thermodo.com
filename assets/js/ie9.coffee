jQuery(document).ready ->
	highlights = $(".highlight")

	highlights.each (i, el) ->
		el = $(el)
		el.addClass('already-visible')