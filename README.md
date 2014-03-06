# Ticker Slide

* the Slide will make the background-image of website slide as the page scroll up & down.
* the Ticker will change the background-image of webstie as the time tick by.

## Requirements

* CoffeeScript ~> 1.7.1
* jQuery ~> 1.11.0

##Usage

just
```javascript 
	tic_sli.slide();
```
more specific:
```javascript 
	tic_sli.slide({
		x : "background-position" //background-position horizontal percentage, default set:"50%",
		et : "easetype" //animation ease type , default set:"ease-out",
		d : "duration" //animation duration, default set:"1s"
	});
```

for ticker u should prepare a json file like this:

```json
{"backgrounds":[{"started":"3","ended":"5","image":"http://urimg.net/this.jpg","color":"#fff"}]}
```

and
```javascript 
	tic_sli.ticker({
		url : "jsonURL",
		d : ["backgroundImageURL", "backgroundColor"] //default set for background-image and background-color
	});
```

## Demonstration Effect

Please visit [ihaveu.com/home](http://www.ihaveu.com/home)

## Contributors

Special thanks to

* http://www.ihaveu.com/home team
* http://www.shuhai.org/ team

## License

Copyright © 2014 He Liu <gilbert.fr0m@gmail.com> under The [MIT License](http://opensource.org/licenses/MIT).
