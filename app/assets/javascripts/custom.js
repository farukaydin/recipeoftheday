/* *************************************** */ 
/* Cart Button Drop Down */
/* *************************************** */  

$(document).ready(function() {
	$('.dropdown-toggle').dropdown();
	$('.btn-cart-md .cart-link').click(function(e){
		e.preventDefault();
		var $dd_menu = $('.btn-cart-md .cart-dropdown')
		if ($dd_menu.hasClass('open')) {
			$dd_menu.fadeOut();
			$dd_menu.removeClass('open');
		} else {
			$dd_menu.fadeIn();
			$dd_menu.addClass('open');
		}
	});
});

/* *************************************** */ 
/* Tool Tip JS */
/* *************************************** */  

$('.my-tooltip').tooltip();

/* *************************************** */ 
/* Scroll to Top */
/* *************************************** */  
		
$(document).ready(function() {
	$(".totop").hide();
	
	$(window).scroll(function(){
	if ($(this).scrollTop() > 300) {
		$('.totop').fadeIn();
	} else {
		$('.totop').fadeOut();
	}
	});
	$(".totop a").click(function(e) {
		e.preventDefault();
		$("html, body").animate({ scrollTop: 0 }, "slow");
		return false;
	});
		
});
/* *************************************** */

/* *************************************** */ 
/* Search */
/* *************************************** */  

$(document).ready(function(){
  $('input#big_search, input#small_search').keyup(function(e){
      if(e.keyCode == 13)
      {
          $(this).trigger("enterKey");
      }
  });
});