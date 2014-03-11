window.Background = 
	
	internal:
		$d : $(document)
		$w : $(window)
		$b : $('body')
	
	tick:(option)->
		p = this.internal
		constructor = # Default Set
			data : ""
			horizontal : "center"
			duration : "1s"
			easeType : "ease-out"
			callback : ()->
		if arguments.length
			if typeof option is "string" or option.backgrounds
				option = 
					data : arguments[0]
					horizontal : arguments[1]
					duration : arguments[2]
					easeType : arguments[3]
					callback : arguments[4]
		op = $.extend constructor, option
		
		c = (value)->
			if typeof value is "string" then value = $.parseJSON(value)
			day = value.backgrounds
			now = new Date()
			for moment in day
				start = moment.started.split(":")
				end = moment.ended.split(':')
				if start[0] is end[0]
					if now.getHours() is parseInt(start[0]) and start[1]<=now.getMinutes()<=end[1] then yes
					else continue
				else
					if parseInt(start[0])<now.getHours()<parseInt(end[0]) then yes
					else if now.getHours() is parseInt(start[0]) and now.getMinutes() >= parseInt(start[1]) then yes
					else if now.getHours() is parseInt(end[0]) and now.getMinutes() <= parseInt(end[1]) then yes
					else continue
				this_moment = moment
			if this_moment
				if this_moment.image then p.$b.css("background-image","url(#{this_moment.image})")
				if this_moment.color then p.$b.css("background-color",this_moment.color)
		
		r_http_img = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?(?:\.(jpg|jpeg|bmp|png|gif|psd|eps|pif|psf|cdr|tga|pcd|mpt))$/i
		r_http = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
		
		if typeof op.data is "string"
			if r_http_img.test(op.data)
				p.$b.css("background-image","url(#{op.data})")
			else if r_http.test(op.data)
				$.ajax({
					url : op.data
					data : {}
					success : (value)->
						c value
				})
			else if op.data then c op.data
		else if op.data then c op.data
		ani_style = "background-position #{op.duration} #{op.easeType}"
		p.$b.css({'transition':ani_style, 'moz-transition':ani_style, '-webkit-transition':ani_style, '-o-transition':ani_style, '-ms-transition':ani_style})
		[doc_hei, win_hei] = [p.$d.height(), p.$w.height()]
		p.$b.on 'transitionend webkitTransitionEnd oTransitionEnd otransitionend',(event)->
			op.callback()
		p.$w.on 'resize', (event)->
			win_hei = $(this).height()
		p.$w.on 'scroll', (event)->
			doc_hei = if doc_hei is p.$d.height() then doc_hei else p.$d.height()
			scroll_hei = p.$d.scrollTop()
			img_scroll = scroll_hei/(doc_hei - win_hei)*100.toFixed 7
			p.$b.css("background-position",op.horizontal+" #{img_scroll}%")
				