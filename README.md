# Background JS
[![Build Status](https://travis-ci.org/fr0m/background.png?branch=master)](https://travis-ci.org/fr0m/background)

## Requirements

* jQuery ~> 1.7

## Installation

### Bower 

    bower install background.js

### Gem

   	gem install rails-assets-background.js --source https://rails-assets.org

## Demonstration Effect

Please visit

[ihaveu.com/home](http://www.ihaveu.com/home)

## Usage

### Example

first, load [jQuery](http://jquery.com/) and the plugin<br />
```html
	<script src="http://code.jquery.com/jquery-1.11.0.min.js" type="text/javascript"></script>
	<script src="background.js" type="text/javascript"></script>
```
then, let's do this<br />
```javascript
	var json = {
					"backgrounds": [
						{
							"started":"11:30:00",
							"ended":"13:30:00",
							"image":"./ihaveu.jpg",
							"color":"#fff"
						},
						{
							"started":"14:00:00",
							"ended":"17:30:00",
							"image":"./ihaveu.jpg",
							"color":"#000"
						}
					]	
				};
    Background.tick(json)
```

### API DOCS

##### Background.tick()

```javascript
	Background.tick(data[, horizontal, duration, easeType, callback]);
```
- **data**
	- Type : [String](http://api.jquery.com/Types/#String) or [PlainObject](http://api.jquery.com/Types/#PlainObject)
	- Initial Value : None
	- Values : URL of an image or URL return in JSON format or string in JSON format
	- define the background and how it will change by time
- **horizontal**
	- Type : [String](http://api.jquery.com/Types/#String)
	- Initial Value : "50%"
	- Values : "xx%"
	- define the horizontal position of the background
- **duration**
	- Type : [String](http://api.jquery.com/Types/#String)
	- Initial Value : "1s"
	- Values : "xs"
	- define the duration of the animation
- **easeType**
	- Type : [String](http://api.jquery.com/Types/#String)
	- Initial Value : "ease-out"
	- Values : "ease", "ease-in", "ease-out", "ease-in-out", "linear", "step-start", "step-end"
	- define the ease type of the animation
- **callback**
	- Type : [Function](http://api.jquery.com/Types/#Function)
	- Initial Value : None
	- Values : a function run after the background slide animation ended
	- define the callback function of the animation

```javascript
	Background.tick(options);
```
-**options**<br />
Type : [PlainObject](http://api.jquery.com/Types/#PlainObject)
	- **data**
		- Type : [String](http://api.jquery.com/Types/#String) or [PlainObject](http://api.jquery.com/Types/#PlainObject)
		- Initial Value : None
		- Values : URL of an image or URL return in JSON format or string in JSON format
		- define the background and how it will change by time
	- **horizontal**
		- Type : [String](http://api.jquery.com/Types/#String)
		- Initial Value : "50%"
		- Values : "xx%"
		- define the horizontal position of the background
	- **duration**
		- Type : [String](http://api.jquery.com/Types/#String)
		- Initial Value : "1s"
		- Values : "xs"
		- define the duration of the animation
	- **easeType**
		- Type : [String](http://api.jquery.com/Types/#String)
		- Initial Value : "ease-out"
		- Values : "ease", "ease-in", "ease-out", "ease-in-out", "linear", "step-start", "step-end"
		- define the ease type of the animation
	- **callback**
		- Type : [Function](http://api.jquery.com/Types/#Function)
		- Initial Value : None
		- Values : a function run after the background slide animation ended
		- define the callback function of the animation

## Contributors

Special thanks to

* http://www.ihaveu.com/home team
* http://www.shuhai.org/ team

## License

Copyright © 2014 He Liu <gilbert.fr0m@gmail.com> under The [MIT License](http://opensource.org/licenses/MIT).
