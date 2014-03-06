switcher = 
	
	#background image slides when the scroll bar moves
	slider:(option)->
		constructor =	# , , 
			 x : ""	# x for horizontal
			 et : "" # et for ease type
			 d : "" # d for duration
		op = $.extend constructor, option
		$doc = $(document)
		[doc_hei, win_hei] = [$doc.height(), $(this).height()]
		$(this).on 'resize', (event)->
			win_hei = $(this).height()
		$(this).on 'scroll', (event)->
			doc_hei = if doc_hei is $doc.height() then doc_hei else $doc.height()
			scroll_hei = $doc.scrollTop()
			img_scroll = scroll_hei/(doc_hei - win_hei)*100.toFixed 7
			$body = $('body')
			ani_style = "background-position #{op.d} #{op.et}" 
			$body.css({'transition':ani_style, 'moz-transition':ani_style, '-webkit-transition':ani_style, '-o-transition':ani_style, '-ms-transition':ani_style})
			$body.css("background-position",op.x+" #{img_scroll}%")
	
	
	# background image & color change with time tick by
	tickby:(option)->
		constructor =
			url : "" # for where u get ur json file
			link : "" # for the wrap u wanna bind with a link
			d : [] #default set for background-image & background-color if u need
			strc : [] #set backgrounds, start, end, image, color, url key name in order
		op = $.extend constructor,option
		$body = $('body')
		$.ajax({
			url : op.url
			data : {}
			success : (day)->
				if typeof day is "string" then day = $.parseJSON(day)
				now = new Date().getHours()
				this_moment = moment for moment in day when parseInt(moment[op.strc[0]]) <= now <= parseInt(moment[op.strc[1]])
				if this_moment
					if this_moment[strc[2]] then $body.css("background-image","url(#{this_moment[strc[2]]})") else $body.css("background-image","url(#{op.d[0]})")
					if this_moment[strc[3]] then $body.css("background-color",this_moment[strc[3]]) else $body.css("background-color",op.d[1])
					if this_moment[strc[4]]
						$body.on 'mouseover',(event)->
							e = event or window.event
							t = e.target || e.srcElement
							if $(t).hasClass(op.link) then $(t).css("cursor","pointer")
							else $(".#{op.link}").css("cursor","")
						$body.on 'click',(event)->
							e = event or window.event
							t = e.target || e.srcElement
							if $(t).hasClass(op.link) then window.open(this_moment.url)
				else
					$body.css("background-image","url(#{op.error_deal[0]})")
					$body.css("background-color",op.error_deal[1])
			error : ()->
				$body.css("background-image","url(#{op.error_deal[0]})")
				$body.css("background-color",op.error_deal[1])
		})
	