jQuery(document).ready(function($){
    
    $('.header-top .main-navigation').meanmenu({
    	meanScreenWidth: 767,
    	meanRevealPosition: "left"
    });
    
    /** Variables from Customizer for Slider settings */
    if( kalon_data.auto == '1' ){
        var slider_auto = true;
    }else{
        var slider_auto = false;
    }
    
    if( kalon_data.loop == '1' ){
        var slider_loop = true;
    }else{
        var slider_loop = false;
    }
    
    if( kalon_data.control == '1' ){
        var slider_control = true;
    }else{
        var slider_control = false;
    }

    if( kalon_data.mode == 'slide' ){
        var slider_animation = '';
    }else{
        var slider_animation = 'fadeOut';
    }

    if( kalon_data.rtl == '1' ){
        var rtl = true;
        var mrtl = false;
    }else{
        var rtl = false;
        var mrtl = true;
    }

    /** Home Page Slider */

    $("#lightSlider").owlCarousel({
        items           : 1,
        margin          : 0,
        loop            : slider_loop,
        autoplay        : slider_auto,
        nav             : false,
        dots            : slider_control,
        animateOut      : slider_animation,
        lazyLoad        : true,
        mouseDrag       : false,
        rtl             : rtl,
        autoplaySpeed   : kalon_data.speed,
    });
        
});