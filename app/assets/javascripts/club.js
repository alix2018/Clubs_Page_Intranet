$( document ).ready(function(){
	$("#button-top").on("click", function(){
		$("html,body").animate({scrollTop: 0}, "fast");
	});
	$(document).scroll(function() {
		// On récupère la position du scroll
		var posScroll = $(window).scrollTop();
		// On calcule l'endroit à partir duquel on veut faire apparaître le bouton
		var diff = posScroll
		if (diff != 0) {
			// On fait apparaître le bouton en fondu sur 0.5s
			$('#button-top').fadeIn(500);
		} else {
			// On fait disparaitre le bouton en fondu sur 0.5s
			$('#button-top').fadeOut(500);
		}
	});
});
