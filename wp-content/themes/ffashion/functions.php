<?php
/**
 * fFashion functions and definitions
 *
 * Set up the theme and provides some helper functions, which are used in the
 * theme as custom template tags. Others are attached to action and filter
 * hooks in WordPress to change core functionality.
 *
 * When using a child theme you can override certain functions (those wrapped
 * in a function_exists() call) by defining them first in your child theme's
 * functions.php file. The child theme's functions.php file is included before
 * the parent theme's file, so the child theme functions would be used.
 *
 * @link https://codex.wordpress.org/Theme_Development
 * @link https://codex.wordpress.org/Child_Themes
 *
 * Functions that are not pluggable (not wrapped in function_exists()) are
 * instead attached to a filter or action hook.
 *
 * For more information on hooks, actions, and filters,
 * {@link https://codex.wordpress.org/Plugin_API}
 *
 * @subpackage fFashion
 * @author tishonator
 * @since fFashion 1.0.3
 *
 */

require_once( trailingslashit( get_template_directory() ) . 'customize-pro/class-customize.php' );

if ( ! function_exists( 'ffashion_setup' ) ) :
/**
 * fFashion setup.
 *
 * Set up theme defaults and registers support for various WordPress features.
 *
 * Note that this function is hooked into the after_setup_theme hook, which
 * runs before the init hook. The init hook is too late for some features, such
 * as indicating support post thumbnails.
 *
 */
function ffashion_setup() {

	load_theme_textdomain( 'ffashion', get_template_directory() . '/languages' );

	add_theme_support( "title-tag" );

	// add the visual editor to resemble the theme style
	add_editor_style( array( 'css/editor-style.css', get_template_directory_uri() . '/style.css' ) );

	// This theme uses wp_nav_menu() in two locations.
	register_nav_menus( array(
		'primary'   => __( 'Primary Menu', 'ffashion' ),
		'footer'    => __( 'Footer Menu', 'ffashion' ),
	) );

	// add Custom background				 
	add_theme_support( 'custom-background', 
				   array ('default-color'  => '#FFFFFF')
				 );


	add_theme_support( 'post-thumbnails' );
	set_post_thumbnail_size( 1200, 0, true );

	global $content_width;
	if ( ! isset( $content_width ) )
		$content_width = 900;

	add_theme_support( 'automatic-feed-links' );

	/*
	 * Switch default core markup for search form, comment form, and comments
	 * to output valid HTML5.
	 */
	add_theme_support( 'html5', array(
		'comment-form', 'comment-list',
	) );

	// add custom header
    add_theme_support( 'custom-header', array (
                       'default-image'          => '',
                       'random-default'         => '',
                       'flex-height'            => true,
                       'flex-width'             => true,
                       'uploads'                => true,
                       'width'                  => 900,
                       'height'                 => 100,
                       'default-text-color'     => '#000000',
                       'wp-head-callback'       => 'ffashion_header_style',
                    ) );

    // add custom logo
    add_theme_support( 'custom-logo', array (
                       'width'                  => 145,
                       'height'                 => 36,
                       'flex-height'            => true,
                       'flex-width'             => true,
                    ) );
}
endif; // ffashion_setup
add_action( 'after_setup_theme', 'ffashion_setup' );

/**
 * the main function to load scripts in the fFashion theme
 * if you add a new load of script, style, etc. you can use that function
 * instead of adding a new wp_enqueue_scripts action for it.
 */
function ffashion_load_scripts() {

	// load main stylesheet.
	wp_enqueue_style( 'font-awesome', get_template_directory_uri() . '/css/font-awesome.min.css', array( ) );
	wp_enqueue_style( 'animate-css', get_template_directory_uri() . '/css/animate.css', array( ) );
	wp_enqueue_style( 'ffashion-style', get_stylesheet_uri(), array( ) );
	
	wp_enqueue_style( 'ffashion-fonts', ffashion_fonts_url(), array(), null );
	
	// Load thread comments reply script
	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
        wp_enqueue_script( 'comment-reply' );
    }
	
	// Load Utilities JS Script
	wp_enqueue_script( 'viewportchecker', get_template_directory_uri() . '/js/viewportchecker.js',
			array( 'jquery' ) );
			
	wp_enqueue_script( 'ffashion-js', get_template_directory_uri() . '/js/utilities.js',
			array( 'jquery', 'viewportchecker' ) );
			
	$data = array(
		'loading_effect' => ( get_theme_mod('ffashion_animations_display', 1) == 1 ),
	);
	wp_localize_script('ffashion-js', 'ffashion_options', $data);

	wp_enqueue_script( 'jquery.sequence', get_template_directory_uri() . '/js/jquery.sequence-min.js', array( 'jquery' ) );
}

add_action( 'wp_enqueue_scripts', 'ffashion_load_scripts' );

/**
 *	Load google font url used in the fFashion theme
 */
function ffashion_fonts_url() {

    $fonts_url = '';
 
    /* Translators: If there are characters in your language that are not
    * supported by PT Sans, translate this to 'off'. Do not translate
    * into your own language.
    */
    $cantarell = _x( 'on', 'Lato font: on or off', 'ffashion' );

    if ( 'off' !== $cantarell ) {
        $font_families = array();
 
        $font_families[] = 'Lato';
 
        $query_args = array(
            'family' => urlencode( implode( '|', $font_families ) ),
            'subset' => urlencode( 'latin,latin-ext' ),
        );
 
        $fonts_url = add_query_arg( $query_args, '//fonts.googleapis.com/css' );
    }
 
    return $fonts_url;
}

/**
 * Display html code of all social sites
 */
function ffashion_display_social_sites() {

	echo '<ul class="header-social-widget">';

	$socialURL = get_theme_mod('ffashion_social_facebook');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Facebook', 'ffashion') . '" class="facebook16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_google');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Google+', 'ffashion') . '" class="google16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_twitter');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Twitter', 'ffashion') . '" class="twitter16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_linkedin');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on LinkeIn', 'ffashion') . '" class="linkedin16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_instagram');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Instagram', 'ffashion') . '" class="instagram16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_rss');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow our RSS Feeds', 'ffashion') . '" class="rss16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_tumblr');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Tumblr', 'ffashion') . '" class="tumblr16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_youtube');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Youtube', 'ffashion') . '" class="youtube16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_pinterest');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Pinterest', 'ffashion') . '" class="pinterest16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_vk');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on VK', 'ffashion') . '" class="vk16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_flickr');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Flickr', 'ffashion') . '" class="flickr16"></a>';
	}

	$socialURL = get_theme_mod('ffashion_social_vine');
	if ( !empty($socialURL) ) {

		echo '<li><a href="' . esc_url( $socialURL ) . '" title="' . __('Follow us on Vine', 'ffashion') . '" class="vine16"></a>';
	}

	echo '</ul>';
}

/**
 *	Used to load the content for posts and pages.
 */
function ffashion_the_content() {

	// Display Thumbnails if thumbnail is set for the post
	if ( has_post_thumbnail() ) {
?>

		<a href="<?php echo esc_url( get_permalink() ); ?>" title="<?php the_title_attribute(); ?>">
			<?php the_post_thumbnail(); ?>
		</a>
								
<?php
	}
	the_content( __( 'Read More', 'ffashion') );
}

/**
 * Display website's logo image
 */
function ffashion_show_website_logo_image_and_title() {

	if ( has_custom_logo() ) {

        the_custom_logo();
    }

    $header_text_color = get_header_textcolor();

    if ( 'blank' !== $header_text_color ) {
    
        echo '<div id="site-identity">';
        echo '<a href="' . esc_url( home_url('/') ) . '" title="' . esc_attr( get_bloginfo('name') ) . '">';
        echo '<h1 class="entry-title">' . esc_html( get_bloginfo('name') ) . '</h1>';
        echo '</a>';
        echo '<strong>' . esc_html( get_bloginfo('description') ) . '</strong>';
        echo '</div>';
    }
}

/**
 *	Displays the copyright text.
 */
function ffashion_show_copyright_text() {

	$footerText = get_theme_mod('ffashion_footer_copyright', null);

	if ( !empty( $footerText ) ) {

		echo esc_html( $footerText ) . ' | ';		
	}
}

/**
 *	widgets-init action handler. Used to register widgets and register widget areas
 */
function ffashion_widgets_init() {
	
	// Register Sidebar Widget.
	register_sidebar( array (
						'name'	 		 =>	 __( 'Sidebar Widget Area', 'ffashion'),
						'id'		 	 =>	 'sidebar-widget-area',
						'description'	 =>  __( 'The sidebar widget area', 'ffashion'),
						'before_widget'	 =>  '',
						'after_widget'	 =>  '',
						'before_title'	 =>  '<div class="sidebar-before-title"></div><h3 class="sidebar-title">',
						'after_title'	 =>  '</h3><div class="sidebar-after-title"></div>',
					) );

	// Register Homepage Column #1
	register_sidebar( array (
							'name'			 =>  __( 'Homepage Column #1', 'ffashion' ),
							'id' 			 =>  'homepage-column-1-widget-area',
							'description'	 =>  __( 'The Homepage Column #1 widget area', 'ffashion' ),
							'before_widget'  =>  '',
							'after_widget'	 =>  '',
							'before_title'	 =>  '<h2 class="sidebar-title">',
							'after_title'	 =>  '</h2><div class="sidebar-after-title"></div>',
						) );
	
	// Register Homepage Column #2
	register_sidebar( array (
							'name'			 =>  __( 'Homepage Column #2', 'ffashion' ),
							'id' 			 =>  'homepage-column-2-widget-area',
							'description'	 =>  __( 'The Homepage Column #2 widget area', 'ffashion' ),
							'before_widget'  =>  '',
							'after_widget'	 =>  '',
							'before_title'	 =>  '<h2 class="sidebar-title">',
							'after_title'	 =>  '</h2><div class="sidebar-after-title"></div>',
						) );
	
	// Register Homepage Column #3
	register_sidebar( array (
							'name'			 =>  __( 'Homepage Column #3', 'ffashion' ),
							'id' 			 =>  'homepage-column-3-widget-area',
							'description'	 =>  __( 'The Homepage Column #3 widget area', 'ffashion' ),
							'before_widget'  =>  '',
							'after_widget'	 =>  '',
							'before_title'	 =>  '<h2 class="sidebar-title">',
							'after_title'	 =>  '</h2><div class="sidebar-after-title"></div>',
						) );

	// Register Footer Column #1
	register_sidebar( array (
							'name'			 =>  __( 'Footer Column #1', 'ffashion' ),
							'id' 			 =>  'footer-column-1-widget-area',
							'description'	 =>  __( 'The Footer Column #1 widget area', 'ffashion' ),
							'before_widget'  =>  '',
							'after_widget'	 =>  '',
							'before_title'	 =>  '<h2 class="footer-title">',
							'after_title'	 =>  '</h2><div class="footer-after-title"></div>',
						) );
	
	// Register Footer Column #2
	register_sidebar( array (
							'name'			 =>  __( 'Footer Column #2', 'ffashion' ),
							'id' 			 =>  'footer-column-2-widget-area',
							'description'	 =>  __( 'The Footer Column #2 widget area', 'ffashion' ),
							'before_widget'  =>  '',
							'after_widget'	 =>  '',
							'before_title'	 =>  '<h2 class="footer-title">',
							'after_title'	 =>  '</h2><div class="footer-after-title"></div>',
						) );
	
	// Register Footer Column #3
	register_sidebar( array (
							'name'			 =>  __( 'Footer Column #3', 'ffashion' ),
							'id' 			 =>  'footer-column-3-widget-area',
							'description'	 =>  __( 'The Footer Column #3 widget area', 'ffashion' ),
							'before_widget'  =>  '',
							'after_widget'	 =>  '',
							'before_title'	 =>  '<h2 class="footer-title">',
							'after_title'	 =>  '</h2><div class="footer-after-title"></div>',
						) );
}

add_action( 'widgets_init', 'ffashion_widgets_init' );

/**
 * Displays the slider
 */
function ffashion_display_slider() { ?>

	<div class="sequence-theme">
		<div id="sequence">
			<img class="sequence-prev" src="<?php echo get_template_directory_uri(); ?>/images/slider/bt-prev.png" alt="<?php esc_html_e( 'Previous Frame', 'ffashion' ); ?>" />
			<img class="sequence-next" src="<?php echo get_template_directory_uri(); ?>/images/slider/bt-next.png" alt="<?php esc_html_e( 'Next Frame', 'ffashion' ); ?>" />

			<ul class="sequence-canvas">	
				<?php
					// display slides
					for ( $i = 1; $i <= 3; ++$i ) {
					
						$defaultSlideImage = get_template_directory_uri().'/images/slider/' . $i .'.png';

						$slideContent = get_theme_mod( 'ffashion_slide'.$i.'_content' );
						$slideImage = get_theme_mod( 'ffashion_slide'.$i.'_image', $defaultSlideImage ); 
				?>

						<li <?php if ( $i == 1 ) : ?>
									class="animate-in"
							<?php endif; ?>>

							<?php if ( $slideContent ) : ?>
									<div class="subtitle">
										<?php echo $slideContent; ?>
									</div>
							<?php endif; ?>
							<img class="model" src="<?php echo esc_url( $slideImage ); ?>" alt="<?php echo $i; ?>" />
						</li>
						<?php
					} ?>
			</ul>

			<ul class="sequence-pagination">
				<?php for ( $i = 1; $i <= 3; ++$i ) { 

						$defaultSlideImage = get_template_directory_uri().'/images/slider/' . $i .'.png';

						$slideImage = get_theme_mod( 'ffashion_slide'.$i.'_image', $defaultSlideImage );
				?>

						<li><img src="<?php echo esc_url( $slideImage ); ?>" alt="Model 1" /></li>

				<?php } ?>
			</ul>
		</div>
	</div>
<?php  
}

/**
 *	Displays the single content.
 */
function ffashion_the_content_single() {

	// Display Thumbnails if thumbnail is set for the post
	if ( has_post_thumbnail() ) {

		the_post_thumbnail();
	}
	the_content( __( 'Read More...', 'ffashion') );
}

function ffashion_sanitize_checkbox( $checked ) {
	// Boolean check.
	return ( ( isset( $checked ) && true == $checked ) ? true : false );
}

/**
 * Register theme settings in the customizer
 */
function ffashion_customize_register( $wp_customize ) {

	$premiumThemeUrl = 'https://tishonator.com/product/tfashion';

	/**
	 * Add Header Logo Section
	 */
    $wp_customize->add_section(
		'ffashion_header_logo_section',
		array(
			'title'       => __( 'Header Logo', 'ffashion' ),
			'capability'  => 'edit_theme_options',
		)
	);

    // Add logo image
    $wp_customize->add_setting( 'ffashion_header_logo',
		array(
			'default' => '',
    		'sanitize_callback' => 'esc_url_raw'
		)
	);

    $wp_customize->add_control( new WP_Customize_Image_Control( $wp_customize, 'ffashion_header_logo',
			array(
				'label'   	 => __( 'Logo Image', 'ffashion' ),
				'section' 	 => 'ffashion_header_logo_section',
				'settings'   => 'ffashion_header_logo',
			) 
		)
	);

    /**
	 * Add Social Sites Section
	 */
	$wp_customize->add_section(
		'ffashion_social_section',
		array(
			'title'       => __( 'Social Sites', 'ffashion' ),
			'capability'  => 'edit_theme_options',
		)
	);
	
	// Add facebook url
	$wp_customize->add_setting(
		'ffashion_social_facebook',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_facebook',
        array(
            'label'          => __( 'Facebook Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_facebook',
            'type'           => 'text',
            )
        )
	);

	// Add google+ url
	$wp_customize->add_setting(
		'ffashion_social_google',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_google',
        array(
            'label'          => __( 'Google+ Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_google',
            'type'           => 'text',
            )
        )
	);

	// Add twitter url
	$wp_customize->add_setting(
		'ffashion_social_twitter',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_twitter',
        array(
            'label'          => __( 'Twitter Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_twitter',
            'type'           => 'text',
            )
        )
	);

	// Add LinkedIn url
	$wp_customize->add_setting(
		'ffashion_social_linkedin',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_linkedin',
        array(
            'label'          => __( 'LinkedIn Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_linkedin',
            'type'           => 'text',
            )
        )
	);

	// Add Instagram url
	$wp_customize->add_setting(
		'ffashion_social_instagram',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_instagram',
        array(
            'label'          => __( 'instagram Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_instagram',
            'type'           => 'text',
            )
        )
	);

	// Add RSS Feeds url
	$wp_customize->add_setting(
		'ffashion_social_rss',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_rss',
        array(
            'label'          => __( 'RSS Feeds URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_rss',
            'type'           => 'text',
            )
        )
	);

	// Add Tumblr url
	$wp_customize->add_setting(
		'ffashion_social_tumblr',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_tumblr',
        array(
            'label'          => __( 'Tumblr Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_tumblr',
            'type'           => 'text',
            )
        )
	);

	// Add YouTube channel url
	$wp_customize->add_setting(
		'ffashion_social_youtube',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_youtube',
        array(
            'label'          => __( 'YouTube channel URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_youtube',
            'type'           => 'text',
            )
        )
	);

	// Add Pinterest page url
	$wp_customize->add_setting(
		'ffashion_social_pinterest',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_pinterest',
        array(
            'label'          => __( 'Pinterest Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_pinterest',
            'type'           => 'text',
            )
        )
	);

	// Add VK page url
	$wp_customize->add_setting(
		'ffashion_social_vk',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_vk',
        array(
            'label'          => __( 'VK Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_vk',
            'type'           => 'text',
            )
        )
	);

	// Add Flickr page url
	$wp_customize->add_setting(
		'ffashion_social_flickr',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_flickr',
        array(
            'label'          => __( 'Flickr Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_flickr',
            'type'           => 'text',
            )
        )
	);

	// Add Vine page url
	$wp_customize->add_setting(
		'ffashion_social_vine',
		array(
		    'sanitize_callback' => 'esc_url_raw',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_social_vine',
        array(
            'label'          => __( 'Vine Page URL', 'ffashion' ),
            'section'        => 'ffashion_social_section',
            'settings'       => 'ffashion_social_vine',
            'type'           => 'text',
            )
        )
	);
	
	/**
	 * Add Slider Section
	 */
	$wp_customize->add_section(
		'ffashion_slider_section',
		array(
			'title'       => __( 'Slider', 'ffashion' ),
			'capability'  => 'edit_theme_options',
		)
	);

	// Add display slider option
	$wp_customize->add_setting(
			'ffashion_slider_display',
			array(
					'default'           => 0,
					'sanitize_callback' => 'ffashion_sanitize_checkbox',
			)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_slider_display',
							array(
								'label'          => __( 'Display Slider', 'ffashion' ),
								'section'        => 'ffashion_slider_section',
								'settings'       => 'ffashion_slider_display',
								'type'           => 'checkbox',
							)
						)
	);
	
	// Add slide 1 content
	$wp_customize->add_setting(
		'ffashion_slide1_content',
		array(
		    'sanitize_callback' => 'force_balance_tags',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_slide1_content',
        array(
            'label'          => __( 'Slide #1 Content', 'ffashion' ),
            'section'        => 'ffashion_slider_section',
            'settings'       => 'ffashion_slide1_content',
            'type'           => 'textarea',
            )
        )
	);
	
	// Add slide 1 background image
	$wp_customize->add_setting( 'ffashion_slide1_image',
		array(
			'default' => get_template_directory_uri().'/images/slider/' . '1.png',
    		'sanitize_callback' => 'esc_url_raw'
		)
	);

    $wp_customize->add_control( new WP_Customize_Image_Control( $wp_customize, 'ffashion_slide1_image',
			array(
				'label'   	 => __( 'Slide 1 Image', 'ffashion' ),
				'section' 	 => 'ffashion_slider_section',
				'settings'   => 'ffashion_slide1_image',
			) 
		)
	);
	
	// Add slide 2 content
	$wp_customize->add_setting(
		'ffashion_slide2_content',
		array(
		    'sanitize_callback' => 'force_balance_tags',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_slide2_content',
        array(
            'label'          => __( 'Slide #2 Content', 'ffashion' ),
            'section'        => 'ffashion_slider_section',
            'settings'       => 'ffashion_slide2_content',
            'type'           => 'textarea',
            )
        )
	);
	
	// Add slide 2 background image
	$wp_customize->add_setting( 'ffashion_slide2_image',
		array(
			'default' => get_template_directory_uri().'/images/slider/' . '2.png',
    		'sanitize_callback' => 'esc_url_raw'
		)
	);

    $wp_customize->add_control( new WP_Customize_Image_Control( $wp_customize, 'ffashion_slide2_image',
			array(
				'label'   	 => __( 'Slide 2 Image', 'ffashion' ),
				'section' 	 => 'ffashion_slider_section',
				'settings'   => 'ffashion_slide2_image',
			) 
		)
	);
	
	// Add slide 3 content
	$wp_customize->add_setting(
		'ffashion_slide3_content',
		array(
		    'sanitize_callback' => 'force_balance_tags',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_slide3_content',
        array(
            'label'          => __( 'Slide #3 Content', 'ffashion' ),
            'section'        => 'ffashion_slider_section',
            'settings'       => 'ffashion_slide3_content',
            'type'           => 'textarea',
            )
        )
	);
	
	// Add slide 3 background image
	$wp_customize->add_setting( 'ffashion_slide3_image',
		array(
			'default' => get_template_directory_uri().'/images/slider/' . '3.png',
    		'sanitize_callback' => 'esc_url_raw'
		)
	);

    $wp_customize->add_control( new WP_Customize_Image_Control( $wp_customize, 'ffashion_slide3_image',
			array(
				'label'   	 => __( 'Slide 3 Image', 'ffashion' ),
				'section' 	 => 'ffashion_slider_section',
				'settings'   => 'ffashion_slide3_image',
			) 
		)
	);

	/**
	 * Add Footer Section
	 */
	$wp_customize->add_section(
		'ffashion_footer_section',
		array(
			'title'       => __( 'Footer', 'ffashion' ),
			'capability'  => 'edit_theme_options',
		)
	);
	
	// Add footer copyright text
	$wp_customize->add_setting(
		'ffashion_footer_copyright',
		array(
		    'default'           => '',
		    'sanitize_callback' => 'sanitize_text_field',
		)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize, 'ffashion_footer_copyright',
        array(
            'label'          => __( 'Copyright Text', 'ffashion' ),
            'section'        => 'ffashion_footer_section',
            'settings'       => 'ffashion_footer_copyright',
            'type'           => 'text',
            )
        )
	);
	
	/**
	 * Add Animations Section
	 */
	$wp_customize->add_section(
		'ffashion_animations_display',
		array(
			'title'       => __( 'Animations', 'ffashion' ),
			'capability'  => 'edit_theme_options',
		)
	);

	// Add display Animations option
	$wp_customize->add_setting(
			'ffashion_animations_display',
			array(
					'default'           => 1,
					'sanitize_callback' => 'esc_attr',
			)
	);

	$wp_customize->add_control( new WP_Customize_Control( $wp_customize,
						'ffashion_animations_display',
							array(
								'label'          => __( 'Enable Animations', 'ffashion' ),
								'section'        => 'ffashion_animations_display',
								'settings'       => 'ffashion_animations_display',
								'type'           => 'checkbox',
							)
						)
	);
}

add_action('customize_register', 'ffashion_customize_register');

function ffashion_header_style() {

    $header_text_color = get_header_textcolor();

    if ( ! has_header_image()
        && ( get_theme_support( 'custom-header', 'default-text-color' ) === $header_text_color
             || 'blank' === $header_text_color ) ) {

        return;
    }

    $headerImage = get_header_image();
?>
    <style type="text/css">
        <?php if ( has_header_image() ) : ?>

                #header-main-fixed {background-image: url("<?php echo esc_url( $headerImage ); ?>");}

        <?php endif; ?>

        <?php if ( get_theme_support( 'custom-header', 'default-text-color' ) !== $header_text_color
                    && 'blank' !== $header_text_color ) : ?>

                #header-main-fixed, #header-main-fixed h1.entry-title {color: #<?php echo sanitize_hex_color_no_hash( $header_text_color ); ?>;}

        <?php endif; ?>
    </style>
<?php
}

?>
