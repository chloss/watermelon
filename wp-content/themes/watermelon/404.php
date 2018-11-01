<?php get_header(); ?>

<div class="error">
    <article id="post-0"<?php post_class( 'et_pb_post not_found' ); ?>>
        <img src="404error.png"/>
       <h1> <?php esc_html_e('Page Not Found','WP Loop'); ?> </h1>
        <p> <?php esc_html_e('Oh No! The page you opened does not exist. Please use the links below to navigate to a safer place.', 'WP Loop'); ?></p>
    </article> <!-- .et_pb_post -->
</div>

<?php get_footer(); ?>