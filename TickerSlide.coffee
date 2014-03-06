window.tic_sli = 
	
	#background image slides when the scroll bar moves
	slide:(option)->
		constructor =	# , , 
			 x : "center"	# x for horizontal
			 et : "ease-out" # et for ease type
			 d : "1s" # d for duration
		op = $.extend constructor, option
		$doc = $(document)
		$win = $(window)
		$body = $('body')
		ani_style = "background-position #{op.d} #{op.et}"
		$body.css({'transition':ani_style, 'moz-transition':ani_style, '-webkit-transition':ani_style, '-o-transition':ani_style, '-ms-transition':ani_style})
		[doc_hei, win_hei] = [$doc.height(), $win.height()]
		$win.on 'resize', (event)->
			win_hei = $(this).height()
		$win.on 'scroll', (event)->
			doc_hei = if doc_hei is $doc.height() then doc_hei else $doc.height()
			scroll_hei = $doc.scrollTop()
			img_scroll = scroll_hei/(doc_hei - win_hei)*100.toFixed 7
			$body.css("background-position",op.x+" #{img_scroll}%")
	
	
	# background image & color change with time tick by
	ticker:(option)->
		constructor =
			url : "" # for where u get ur json file
			d : [] #default set for background-image & background-color if u need
		op = $.extend constructor,option
		$body = $('body')
		$.ajax({
			url : op.url
			data : {}
			success : (value)->
				if typeof value is "string" then value = $.parseJSON(value)
				day = value.backgrounds
				now = new Date().getHours()
				this_moment = moment for moment in day when parseInt(moment.started) <= now <= parseInt(moment.ended)
				if this_moment
					if this_moment.image then $body.css("background-image","url(#{this_moment.image})") 
					else if op.d[0] then $body.css("background-image","url(#{op.d[0]})")
					if this_moment.color then $body.css("background-color",this_moment.color) 
					else if op.d[1] then $body.css("background-color",op.d[1])
				else
					if op.d[0] then $body.css("background-image","url(#{op.d[0]})")
					if op.d[1] then $body.css("background-color",op.d[1])
			error : ()->
				if op.d[0] then $body.css("background-image","url(#{op.d[0]})")
				if op.d[1] then $body.css("background-color",op.d[1])
		})
	