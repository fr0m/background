$(function(){
	var div = ""
	for(var i = 200; i--;){
		div = div + '<div style="float : left; margin : 10px; width : 170px; height : 170px; background-color : #f9' + Math.floor(Math.random() * 10) + ';"></div>';
	}
	$(".wrap").prepend(div);
	tic_sli.slide();
	tic_sli.ticker({
		url : "test.json"
	})
});