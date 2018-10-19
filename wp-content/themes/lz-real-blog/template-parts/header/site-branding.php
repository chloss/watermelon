<?php
/**
 * Displays header site branding
 *
 * @package WordPress
 * @subpackage lz-real-blog
 * @since 1.0
 * @version 1.4
 */

?>
<div class="site-branding">
	<div class="container">
		<?php if ( ( lz_real_blog_is_frontpage() || ( is_home() && is_front_page() ) ) && ! has_nav_menu( 'top' ) ) : ?>
	<?php endif; ?>
	</div>
</div>