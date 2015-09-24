$(document).ready(function(){

	var toMouse = function(p, e) {
	  		var left = p.width() / 2
		left -= e.pageX < left ? left - e.pageX : 0;
	  p.css({
	     left:  e.pageX - left,
	     top:   e.pageY,
	     display: 'block'
	  });
	}


	$(document).on('click', function(e) {
		window.setTimeout(function(){
	    		toMouse($('.phrasepicker'),e);
	    		toMouse($('.popup-gloss'),e);
			  }, 0);
	})
});