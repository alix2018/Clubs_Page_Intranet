$( document ).ready(function(){
	$("#button-top").on("click", function(){
		$("html,body").animate({scrollTop: 0}, "fast");
	});
});
