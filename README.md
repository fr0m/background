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
<script src="https://github.com/fr0m/background/blob/master/background.min.js" type="text/javascript"></script>
```
then, let's do this<br />
```javascript
var json = {
				"backgrounds": [
					{
						"started":"00:00:00",
						"ended":"24:00:00",
						"image":"http://i1.ihaveu.net/image/auction/picture/000/053/564/path/16dd7c4e.jpg",
						"color":"#fff"
					}
				]	
			};
Background.tick(json)
```

### API DOCS

##### Background.tick()

```javascript
Background.tick([options]);
```
```javascript
Background.tick([data, horizontal, duration, easeType, callback]);
```
- **options**<br />
	Type : [PlainObject](http://api.jquery.com/Types/#PlainObject)
	- **data**
		- Type : [String](http://api.jquery.com/Types/#String) or [PlainObject](http://api.jquery.com/Types/#PlainObject)
		- Default : None
		- Values : URL of an image or URL return in JSON format or string in JSON format
		- define the background and how it will change by time, it's not required if background-image is set in stylesheet
	- **horizontal**
		- Type : [String](http://api.jquery.com/Types/#String)
		- Default : "50%"
		- Values : "xx%"
		- define the horizontal position of the background
	- **duration**
		- Type : [String](http://api.jquery.com/Types/#String)
		- Default : "1s"
		- Values : "xs"
		- define the duration of the animation
	- **easeType**
		- Type : [String](http://api.jquery.com/Types/#String)
		- Default : "ease-out"
		- Values : "ease", "ease-in", "ease-out", "ease-in-out", "linear", "step-start", "step-end"
		- define the ease type of the animation
	- **callback**
		- Type : [Function](http://api.jquery.com/Types/#Function)
		- Default : None
		- Values : a function run after the background slide animation ended
		- define the callback function of the animation

## Contributors

Special thanks to

* http://www.ihaveu.com/home team
* http://www.shuhai.org/ team

## License

Copyright © 2014 He Liu <gilbert.fr0m@gmail.com> under The [MIT License](http://opensource.org/licenses/MIT).
