$ ->
	$('.cancel-volunteer').on 'click', (e) ->
		e.preventDefault()
		alert 'hey'

	video = document.getElementById("video") # assuming "video" is your videos' id
	$("video").prop('muted', true)

	$(window).scroll ->
	  top = (if ($(window).scrollTop() > 0) then $(window).scrollTop() else 1)
	  $("#banner-content").stop(true, true).fadeTo 0, 60 / top
	  $("video").stop(true, true).fadeTo 0, 150 / top

	# minimum video width allowed
	# original video dimensions
	# runs after DOM has loaded
	resizeToCover = ->
	  # set the video viewport to the window size
	  jQuery("#video-viewport").width jQuery(window).width()
	  jQuery("#video-viewport").height jQuery(window).height()
	  
	  # use largest scale factor of horizontal/vertical
	  scale_h = jQuery(window).width() / vid_w_orig
	  scale_v = jQuery(window).height() / vid_h_orig
	  scale = (if scale_h > scale_v then scale_h else scale_v)
	  
	  # don't allow scaled width < minimum video width
	  scale = min_w / vid_w_orig  if scale * vid_w_orig < min_w
	  
	  # now scale the video
	  jQuery("video").width scale * vid_w_orig
	  jQuery("video").height scale * vid_h_orig
	  
	  # and center it by scrolling the video viewport
	  jQuery("#video-viewport").scrollLeft (jQuery("video").width() - jQuery(window).width()) / 2
	  jQuery("#video-viewport").scrollTop (jQuery("video").height() - jQuery(window).height()) / 2
	  
	min_w = 300
	vid_w_orig = undefined
	vid_h_orig = undefined
	jQuery ->
	  vid_w_orig = parseInt(jQuery("video").attr("width"))
	  vid_h_orig = parseInt(jQuery("video").attr("height"))
	  jQuery(window).resize ->
	    resizeToCover()
	  jQuery(window).trigger "resize"

  # $('#event_date_time').datepicker()

	$(".hover-login").hover (->
	  $("#login-form").stop(true, true).delay(200).slideDown(500)
	), ->
	  $("#login-form").slideUp(500)



	# OSName = "Unknown OS"
	# OSName = "Windows"  unless navigator.appVersion.indexOf("Win") is -1
	# OSName = "MacOS"  unless navigator.appVersion.indexOf("Mac") is -1
	# if OSName == "MacOS"
	# 	$('.pc').remove()
	# else
	# 	$('.mac').remove()

	# isAndroid = /android/i.test(navigator.userAgent.toLowerCase())
	# if isAndroid
	# 	alert 'Android'
	# else
	# 	alert 'not an Android'

	# isiDevice = /ipad|iphone|ipod/i.test(navigator.userAgent.toLowerCase())
	# if isiDevice
	#   alert "iphon"
	# else
	#   alert "not idevice"
