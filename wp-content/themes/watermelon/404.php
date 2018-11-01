<?php get_header(); ?>

<div class="error">
    <article class="errortext" id="post-0" <?php post_class( 'et_pb_post not_found' ); ?>>
        <img class="imgerror" src="<?php echo esc_url( get_template_directory_uri() . '/Images/404error.png' ); ?>" alt="404error"/>
        <h1> <?php esc_html_e('Opps! 404 Error!','WP Loop'); ?> </h1>
        <h2> <?php esc_html_e('The page you are looking for does not exist!', 'WP Loop'); ?></h2>
        <p> <?php esc_html_e('Please use either the back button or the navigation bar to guide you back', 'WP Loop'); ?></p>
    </article> <!-- .et_pb_post -->
</div>

<?php get_footer(); ?>