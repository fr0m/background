# Background JS
[![Build Status](https://travis-ci.org/fr0m/background.js.png?branch=master)](https://travis-ci.org/fr0m/background.js)

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
[Screen Shot](http://fr0m.github.io/background.js/screenshot.png)

## Usage

### Example

first, load [jQuery](http://jquery.com/) and the plugin, Zepto.js can also support this plugin.<br />
```html
<script src="http://code.jquery.com/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="http://fr0m.github.io/background.js/background.min.js" type="text/javascript"></script>
```
then, all u need is an image url.<br />
```javascript
Background.tick({image_url:"http://i1.ihaveu.net/image/auction/picture/000/053/564/path/16dd7c4e.jpg"});
```
string in format of json is also acceptable.<br />
```javascript
var json = {
  "backgrounds" : [
    {
      "started_at":"00:00:00",
      "ended_at":"24:00:00",
      "image":"http://i1.ihaveu.net/image/auction/picture/000/053/564/path/16dd7c4e.jpg",
      "color":"#fff"
    }
  ] 
};
Background.tick({json:json});
```
an url return in format of json is acceptable as well.<br />
```javascript
Background.tick({json_url:"http://fr0m.github.io/background.js/test/test.json"});
```
and a callback function is supported
```javascript
Background.tick({json_url:"http://fr0m.github.io/background.js/test/test.json"},function(){
  alert("done!");
});
```

### [Documentation](https://github.com/fr0m/background.js/wiki/API-Documents)

## Credits

* fr0m @[ihaveu](http://www.ihaveu.com/home)

## License

Copyright © 2014 He Liu <gilbert.fr0m@gmail.com> under The [MIT License](http://opensource.org/licenses/MIT).
