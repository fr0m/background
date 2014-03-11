# Background JS
[![Build Status](https://travis-ci.org/fr0m/background.png?branch=master)](https://travis-ci.org/fr0m/background)

## Requirements

* jQuery ~> 1.7

## Installation

Bower 
	```
		bower install background.js
	```

## Demonstration Effect

Please visit [ihaveu.com/home](http://www.ihaveu.com/home)

## Usage

### Example

first, load [jQuery](http://jquery.com/) and the plugin<br />
```html
	<script src="jquery.min.js" type="text/javascript"></script>
	<script src="background.min.js" type="text/javascript"></script>
```
then, let's slide the background<br />
```javascript
	Background.slide("center", "ease-in-out", "1s"); // or without the params, it's ur call.
```
wanna change the background by time?<br />
```javascript
	var json = {"backgrounds": [
			{"started":"11:30:00","ended":"13:30:00","image":"./ihaveu.jpg","color":"#fff"},
			{"started":"14:00:00","ended":"17:30:00","image":"./ihaveu.jpg","color":"#000"}
			]};
	Background.tick(json);
```
and u can also get a json file via ajax<br />
```javascript
	Background.tick("./test/test.json");
```
### API DOCS

##### Background.slide()

```javascript 
	Background.slide([horizontal, easeType, duration])
```
- **horizontal**
	- Type : String
	- Initial Value : "50%"
	- Values : "xx%"
	- define the horizontal position of the background
- **easeType**
	- Type : String
	- Initial Value : "ease-out"
	- Values : "ease", "ease-in", "ease-out", "ease-in-out", "linear", "step-start", "step-end"
	- define the ease type of the animation
- **duration**
	- Type : String
	- Initial Value : "1s"
	- Values : "xs"
	- define the duration of the animation

##### Background.tick()

```javascript
	Background.tick(JSON[, backgroundImage, backgroundColor]);
```
- **JSON**
	- Type : String
	- Initial Value : None
	- Values : URL return in JSON format or string in JSON format
	- define how the background will change by time
- **backgroundImage**
	- Type : String
	- Initial Value : None
	- Values : URL
	- define the default backgroundImage if u didn't set one
- **backgroundColor**
	- Type : String
	- Initial Value : None
	- Values : "#xxxxxx"
	- define the default backgroundColor if u didn't set one

## Contributors

Special thanks to

* http://www.ihaveu.com/home team
* http://www.shuhai.org/ team

## License

Copyright © 2014 He Liu <gilbert.fr0m@gmail.com> under The [MIT License](http://opensource.org/licenses/MIT).
