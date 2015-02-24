isIE = () ->
	myNav = navigator.userAgent.toLowerCase()
	if myNav.indexOf('msie') != -1
		parseInt(myNav.split('msie')[1])
	else
		false

isIE9 = () ->
	isIE() == 9

isIE10OrLess = () ->
	isIE() == 10

isiOS = () ->
	/(iPad|iPhone|iPod)/g.test( navigator.userAgent );

isChrome = () ->
	window.chrome

isAndroid = () ->
	ua = navigator.userAgent.toLowerCase();
	ua.indexOf('Android') > -1 && ua.indexOf('Mozilla/5.0') > -1 && ua.indexOf('AppleWebKit') > -1


productScroll = () ->
	products = $(".products .product")
	products.each (i, el) ->
		el = $(el)
		if (isAndroid() != -1 || isiOS() == true)
			el.addClass('already-visible')
			
	if (isAndroid() == -1 && isiOS() == false)
		$(window).scroll () ->
			products.each (i, el) ->
				el = $(el)
				if (el.visible(true))
					el.addClass('bounce-in')

vimeoVideo = () ->
	headerContainer = $('.header-container')
	if headerContainer.hasClass 'home'
		$('#vimeo').click (e) ->
			e.preventDefault()
			$.fancybox {width:"852px",height:"480px",autoSize:!1,closeClick:!1,openEffect:"none",closeEffect:"none",type:"iframe",content:"<iframe src=\"//player.vimeo.com/video/60354100?title=0&amp;byline=0&amp;portrait=0&amp;color=00cae8&amp;autoplay=1\" width=\"852\" height=\"480\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>" }

headerVideo = () ->
	headerContainer = $('.header-container')
	if isiOS() == false && isIE10OrLess() == false
		if headerContainer.hasClass 'home'
			bigheader = new $.BigVideo {container: headerContainer}
			bigheader.init()
			$('#big-video-wrap').hide()
			if isChrome()
				bigheader.show '//assets.robocatapps.com/thermodo/header.webm', {ambient: true}
			else
				bigheader.show '//assets.robocatapps.com/thermodo/header.mp4', {ambient: true}
			
			bigheader.getPlayer().on 'loadedmetadata', () ->
				$('#big-video-wrap').fadeIn 1000

		setTimeout (() -> $('.hand').addClass 'appear'), 1400

	else
		$('.header-container.home').css({'background-image': "url('http://cdn.getforge.com/thermodo.com/1400158800/assets/images/header-bg-winter.jpg')"})
		$('.hand').addClass 'appear'			

jQuery(document).ready ->
	productScroll()
	vimeoVideo()
	headerVideo()

	if isiOS() == true
		$("body").removeClass 'not-ios'
		$("body").addClass 'is-ios'

	$('#signup_form').on 'submit', (e) ->
		e.preventDefault()
		email_field = $('#email')
		email_field.attr('disabled', 'disabled')
		$('#signup_form .after').attr('display','block')
		url = 'http://newsletters.robocatapps.com/signup'
		post_data  = {email: email_field.val(), list: "thermodo"}
		$.post url, post_data, (data, status, xhr) ->
			$('#email').val('Thank you')
			console.log(data)