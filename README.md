# Background JS
[![Build Status](https://travis-ci.org/fr0m/background.js.png?branch=master)](https://travis-ci.org/fr0m/background.js)

## Requirements

* jQuery ~> 1.11.0

## Installation

- Bower ```
			bower install background.js
		```
- Gem ```
			gem install background.js
	
	  ```

## Usage

```javascript 
	background.slide();
```
<br />more specific:
```javascript 
	background.slide([horizontal, easeType, duration])
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
<br />for tick u should prepare a JSON like this:
```json
{"backgrounds":[{"started":"11:30:00","ended":"13:30:00","image":"./ihaveu.jpg","color":"#fff"}]}
```
<br />then
```javascript
	background.tick(JSON[, backgroundImage, backgroundColor]);
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

## Demonstration Effect

Please visit [ihaveu.com/home](http://www.ihaveu.com/home)

## Contributors

Special thanks to

* http://www.ihaveu.com/home team
* http://www.shuhai.org/ team

## License

Copyright © 2014 He Liu <gilbert.fr0m@gmail.com> under The [MIT License](http://opensource.org/licenses/MIT).
