jQuery( document ).ready( function($) {
	
	function ffashion_init_loading_effects() {

		$('#header-logo').addClass("hidden").viewportChecker({
				classToAdd: 'animated bounce',
				offset: 1
			  });

		$('#navmain a').addClass("hidden").viewportChecker({
				classToAdd: 'animated rubberBand',
				offset: 1
			  });

		$('#page-header').addClass("hidden").viewportChecker({
				classToAdd: 'animated bounceInUp',
				offset: 1
			  });

		$('#main-content-wrapper h2, #main-content-wrapper h3')
				.addClass("hidden").viewportChecker({
				classToAdd: 'animated bounceInUp',
				offset: 1
			  });

		$('img:not(.model)').addClass("hidden").viewportChecker({
				classToAdd: 'animated zoomIn',
				offset: 1
			  });

		$('#sidebar, .col3a, .col3b, .col3c').addClass("hidden").viewportChecker({
				classToAdd: 'animated zoomIn',
				offset: 1
			  });

		$('.before-content, .after-content').addClass("hidden").viewportChecker({
				classToAdd: 'animated bounce',
				offset: 1
			  });

		$('.header-social-widget')
			.addClass("hidden").viewportChecker({
				classToAdd: 'animated bounceInLeft',
				offset: 1
			  });

		$('article, article p, article li')
			.addClass("hidden").viewportChecker({
				classToAdd: 'animated zoomIn',
				offset: 1
			  });

		$('#footer-main h1, #footer-main h2, #footer-main h3')
			.addClass("hidden").viewportChecker({
				classToAdd: 'animated bounceInUp',
				offset: 1
			  });

		$('#footer-main p, #footer-main ul, #footer-main li, .footer-title, .col3a, .col3b, .col3c')
			.addClass("hidden").viewportChecker({
				classToAdd: 'animated zoomIn',
				offset: 1
			  });

		$('.footer-social-widget')
			.addClass("hidden").viewportChecker({
				classToAdd: 'animated rubberBand',
				offset: 1
			  });

		$('#footer-menu')
			.addClass("hidden").viewportChecker({
				classToAdd: 'animated bounceInDown',
				offset: 1
			  });
	}
	
	if (ffashion_options && ffashion_options.loading_effect) {
	   ffashion_init_loading_effects();
  	}

	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			  $('.scrollup').fadeIn();
		} else {
			  $('.scrollup').fadeOut();
		}
	});

	$('.scrollup').click(function () {
		  $("html, body").animate({
			  scrollTop: 0
		  }, 600);
		  return false;
	});

	// add submenu icons class in main menu (only for large resolution)
	if ( $(window).width() >= 800 ) {
	
		$('#navmain > div > ul > li:has("ul")').addClass('level-one-sub-menu');
		$('#navmain > div > ul li ul li:has("ul")').addClass('level-two-sub-menu');										
	}

	$('#navmain > div').on('click', function(e) {

		e.stopPropagation();

		// toggle main menu
		if ( $(window).width() < 800 ) {

			var parentOffset = $(this).parent().offset(); 
			
			var relY = e.pageY - parentOffset.top;
		
			if (relY < 36) {
			
				$('ul:first-child', this).toggle(400);
			}
		}
	});

	$("#navmain > div > ul li").mouseleave( function() {
		if ( $(window).width() >= 800 ) {
			$(this).children("ul").stop(true, true).css('display', 'block').slideUp(300);
		}
	});
	
	$("#navmain > div > ul li").mouseenter( function() {
		if ( $(window).width() >= 800 ) {

			var curMenuLi = $(this);
			$("#navmain > div > ul > ul:not(:contains('#" + curMenuLi.attr('id') + "')) ul").hide();
		
			$(this).children("ul").stop(true, true).css('display','none').slideDown(400);
		}
	});
	
	if (typeof $("#sequence").sequence == 'function') {

        var options = {
            nextButton: true,
            prevButton: true,
            pagination: true,
            animateStartingFrameIn: true,
            autoPlay: true,
            autoPlayDelay: 3000,
            preloader: true,
            preloadTheseFrames: [1]
        };

        var mySequence = $("#sequence").sequence(options).data("sequence");
	}
});


