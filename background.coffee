$ ->
	window.Background = 
		
		internal:
			_document : $(document)
			_window : $(window)
			_body : $('body')
		
		tick:(options)->
			params = this.internal
			constructor = # Default Set
				data : ""
				horizontal : "center"
				duration : "1s"
				easeType : "ease-out"
				callback : ()->
			
			if arguments.length
				if typeof options is "string" or options.backgrounds
					options = 
						data : arguments[0]
						horizontal : arguments[1]
						duration : arguments[2]
						easeType : arguments[3]
						callback : arguments[4]
			options = $.extend constructor, options
			
			change = (value)->
				if typeof value is "string" then value = $.parseJSON(value)
				day = value.backgrounds
				now = new Date()
				for moment in day
					start = moment.started_at.split(":")
					end = moment.ended_at.split(':')
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
					if this_moment.image then params._body.css("background-image","url(#{this_moment.image})")
					if this_moment.color then params._body.css("background-color",this_moment.color)
			
			regExp_image_url = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?(?:\.(jpg|jpeg|bmp|png|gif|psd|eps|pif|psf|cdr|tga|pcd|mpt))$/i
			regExp_url = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
			
			if typeof options.data is "string"
				if regExp_image_url.test(options.data)
					params._body.css("background-image","url(#{options.data})")
				else if regExp_url.test(options.data)
					$.ajax({
						url : options.data
						data : {}
						success : (value)->
							change value
					})
				else if options.data then change options.data
			else if options.data then change options.data
			animation_style = "background-position #{options.duration} #{options.easeType}"
			params._body.css({'transition':animation_style, 'moz-transition':animation_style, '-webkit-transition':animation_style, '-o-transition':animation_style, '-ms-transition':animation_style})
			[document_height, window_height] = [params._document.height(), params._window.height()]
			params._body.on 'transitionend webkitTransitionEnd oTransitionEnd otransitionend',(event)->
				options.callback()
			params._window.on 'resize', (event)->
				window_height = $(this).height()
			params._window.on 'scroll', (event)->
				document_height = if document_height is params._document.height() then document_height else params._document.height()
				scroll_height = params._document.scrollTop()
				image_scroll = scroll_height/(document_height - window_height)*100.toFixed 7
				params._body.css("background-position",options.horizontal+" #{image_scroll}%")
					