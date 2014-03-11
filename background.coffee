window.background = 
	
	internal:
		$d : $(document)
		$w : $(window)
		$b : $('body')
	
	slide:(option)->
		p = this.internal
		constructor = # Default Set
			 horizontal : "center"
			 duration : "1s"
			 easeType : "ease-out"
			 callback : ()->
		if typeof option is "string"
			option = 
				horizontal : arguments[0]
				duration : arguments[1]
				easeType : arguments[2]
				callback : arguments[3]
		op = $.extend constructor, option
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
	
	tick:(option)->
		p = this.internal
		constructor =
			json : "" # for where u get ur json file
			backgroundImage : "" #default background-image
			backgroundColor : ""
		if typeof option is "string"
			option = 
				json : arguments[0]
				backgroundImage : arguments[1]
				backgroundColor : arguments[2]
		op = $.extend constructor,option
		reg_http = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
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
				else if op.backgroundImage then p.$b.css("background-image","url(#{op.backgroundImage})")
				if this_moment.color then p.$b.css("background-color",this_moment.color) 
				else if op.backgroundColor then p.$b.css("background-color",op.backgroundColor)
			else
				if op.backgroundImage then p.$b.css("background-image","url(#{op.backgroundImage})")
				if op.backgroundColor then p.$b.css("background-color",op.backgroundColor)

		if typeof op.json is "string"
			if reg_http.test(op.json)
				$.ajax({
					url : op.json
					data : {}
					success : (value)->
						c value
					error : ()->
						if op.backgroundImage then p.$b.css("background-image","url(#{op.backgroundImage})")
						if op.backgroundColor then p.$b.css("background-color",op.backgroundColor)
				})
			else c op.json
		else c op.json
				