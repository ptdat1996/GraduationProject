jQuery(document).ready(function($){
	new WOW().init();
	$('.loader_overlay').addClass('loaded');

	/*Back to top*/
	$('.back-to-top').click(function() {
		$('html, body').animate({
			scrollTop: 0
		}, 600);
		return false;
	});
	$("#owl-slider").owlCarousel({
		navigation : true, // Show next and prev buttons
		paginationSpeed : 400,
		pagination : true,
		singleItem:true,
		stopOnHover: true,
		transitionStyle : "fade",
		autoPlay: 5000,
		navigationText : ["<span class='fa fa-arrow-left'></span>", "<span class='fa fa-arrow-right'></span>"]
	});
	$("#blog_index_list").owlCarousel({
		items : 4,
		lazyLoad : true,
		pagination : false,
		navigation : false,
		itemsDesktop: [1199, 4],
		itemsDesktopSmall: [979, 3],
		itemsTablet: [768,2],
		itemsTabletSmall: [480, 1],
		itemsMobile: [360, 1],
		paginationSpeed : 400,
		stopOnHover: true,
		transitionStyle : "fade",
		loop: true,
		autoPlay: 4000,
		navigationText : ["<span class='fa fa-arrow-left'></span>", "<span class='fa fa-arrow-right'></span>"]
	});
	$("#brand_owl").owlCarousel({
		items : 6,
		lazyLoad : true,
		pagination : false,
		navigation : false,
		itemsDesktop: [1199, 6],
		itemsDesktopSmall: [979, 4],
		itemsTablet: [768,3],
		itemsTabletSmall: [480, 2],
		itemsMobile: [360, 1],
		paginationSpeed : 400,
		stopOnHover: true,
		transitionStyle : "fade",
		loop: true,
		autoPlay: 4000,
		navigationText : ["<span class='fa fa-arrow-left'></span>", "<span class='fa fa-arrow-right'></span>"]
	});
	/*contact_email change*/
	$('.newsletter_wrap #contact_email').change(function(){
        $(this).toggleClass("not-empty", "" !== $(this).val());
	});
	
	/*Menu mobile*/
	$("#trigger_click_mobile").click(function(e){
		e.preventDefault();
		$("#mobile_wrap_menu").toggleClass("show");
		$('#opacity').addClass("opacity_body");
		$('body').addClass("overflow_hidden");
	});
	$('#opacity, .close_menu').click(function(){
		$("#mobile_wrap_menu").removeClass("show");
		$('#opacity').removeClass("opacity_body");
		$('body').removeClass("overflow_hidden");
	});
	$(".more").on("click", function() {
		$("i", this).toggleClass("fa-plus fa-minus");
	});
	$('.ajax_qty .btn_plus').click(function(){
		var variant_id = $(this).data('id');
		plus_quantity($(this),variant_id);
	});
	$('.ajax_qty .btn_minus').click(function(){
		var variant_id = $(this).data('id');
		minus_quantity($(this),variant_id);
	});
});

jQuery(window).scroll(function() {
	if (jQuery(this).scrollTop() > 200) {
		jQuery('.back-to-top').fadeIn();
	} else {
		jQuery('.back-to-top').fadeOut();
	}
	if (jQuery(this).scrollTop() > $('#header').height()) {
		$('#header').addClass('header_fixed');
	} else {
		$('#header').removeClass('header_fixed');
	}
});

OnTakecareBegin = () => {
    $("button[type='submit']").attr("disabled", "disabled");
    $("#adviceSunnyHour").empty();
    $("#adviceWater").empty();
    $("#adviceFertilizer").empty();
    $("#adviceTemperature").empty();
};

OnTakecareSuccess = (response) => {
    $("button[type='submit']").removeAttr("disabled");
    $("#recommend").css("display", "block");

    var imgTick = '<img src="/Assets/client/images/green_tick.png" />';
    var imgCross = '<img src="/Assets/client/images/red_cross.png" />';

    //SunnyHour
    if (response.IsEnoughSunnyHour) {
        $("#adviceSunnyHour").append(imgTick);
        $("#adviceSunnyHour").append('<span>' + response.AdviceSunnyHour + '</span>');
    }
    else {
        $("#adviceSunnyHour").append(imgCross);
        $("#adviceSunnyHour").append('<span>' + response.AdviceSunnyHour + '</span>');
    }

    //Water
    if (response.IsEnoughWater) {
        $("#adviceWater").append(imgTick);
        $("#adviceWater").append('<span>' + response.AdviceWater + '</span>');
    }
    else {
        $("#adviceWater").append(imgCross);
        $("#adviceWater").append('<span>' + response.AdviceWater + '</span>');
    }

    //Fertilizer
    if (response.IsEnoughFertilizer) {
        $("#adviceFertilizer").append(imgTick);
        $("#adviceFertilizer").append('<span>' + response.AdviceFertilizer + '</span>');
    }
    else {
        $("#adviceFertilizer").append(imgCross);
        $("#adviceFertilizer").append('<span>' + response.AdviceFertilizer + '</span>');
    }

    //Fertilizer
    if (response.IsEnoughTemperature) {
        $("#adviceTemperature").append(imgTick);
        $("#adviceTemperature").append('<span>' + response.AdviceTemperature + '</span>');
    }
    else {
        $("#adviceTemperature").append(imgCross);
        $("#adviceTemperature").append('<span>' + response.AdviceTemperature + '</span>');
    }
};

