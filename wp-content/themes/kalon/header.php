<?php
/**
 * The header for our theme.
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package Kalon
 */

?><!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head itemscope itemtype="http://schema.org/WebSite">
<meta charset="<?php bloginfo( 'charset' ); ?>">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="profile" href="http://gmpg.org/xfn/11">
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">

<?php wp_head(); ?>
</head>

<body <?php body_class(); ?> itemscope itemtype="http://schema.org/WebPage">
<div id="page" class="site">
	
	<header id="masthead" class="site-header" role="banner" itemscope itemtype="http://schema.org/WPHeader">
		    
        <div class="header-top">
			<div class="container">
				<nav id="site-navigation" class="main-navigation" role="navigation" itemscope itemtype="http://schema.org/SiteNavigationElement">
					<div class="menu">
						 <?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_id' => '', 'menu_class' => '' ) ); ?>
					</div>
				</nav>
			<?php if( get_theme_mod('kalon_ed_social') ) do_action( 'kalon_social' ); ?>
			</div>
		</div>
        
	    <div class="header-bottom">
			<div class="container">
				<div class="site-branding" itemscope itemtype="http://schema.org/Organization">
				    <?php 
				        if( function_exists( 'has_custom_logo' ) && has_custom_logo() ){
                            the_custom_logo();
                        } 
	                    if ( is_front_page() && is_home() ) : ?>
		                    <h1 class="site-title" itemprop="name"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home" itemprop="url"><?php bloginfo( 'name' ); ?></a></h1>
		                <?php
		                else : ?>
		                    <p class="site-title" itemprop="name"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home" itemprop="url"><?php bloginfo( 'name' ); ?></a></p>
		                <?php
		                endif;
					    $description = get_bloginfo( 'description', 'display' );
					    if ( $description || is_customize_preview() ) : ?>
					       <p class="site-description" itemprop="description"><?php echo $description; /* WPCS: xss ok. */ ?></p>
					<?php
					   endif; 
                    ?>
				</div><!-- .site-branding -->
			</div>
        </div>

	</header><!-- #masthead -->

	<?php 
        if( is_front_page() ){
            if( get_theme_mod( 'kalon_ed_slider' ) ) do_action( 'kalon_slider' );
        }    
    ?>

	<div id="content" class="site-content">
	   	<div class="container">
        
            <?php do_action( 'kalon_header' ); // Intro header for Archive and Search page ?>
		
               <div class="row">