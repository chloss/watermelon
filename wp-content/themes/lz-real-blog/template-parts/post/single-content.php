<?php
/**
 * Template part for displaying posts
 * @package WordPress
 * @subpackage lz-real-blog
 * @since 1.0
 * @version 1.4
 */

?>
<div id="post-<?php the_ID(); ?>" <?php post_class('inner-service'); ?>>
  <div class="article_content">      
      <img src="<?php the_post_thumbnail_url('full'); ?>"/>
        <div class="article-text">
            <h4><a href="<?php echo esc_url( get_permalink() );?>"><?php the_title();?></a></h4>
            <div class="metabox">
              <i class="far fa-calendar-alt"></i><span class="entry-date"><?php the_time( get_option( 'date_format' ) ); ?></span>
              <i class="fas fa-user"></i><span class="entry-author"><?php the_author(); ?></span>
              <i class="fas fa-comments"></i><span class="entry-comments"><?php comments_number( __('0 Comments','lz-real-blog'), __('0 Comments','lz-real-blog'), __('% Comments','lz-real-blog') ); ?></span>
        	</div>
            <?php the_content(); ?>
          	<hr class="horizontal">
          </div>      
      <div class="clearfix"></div> 
  </div>
</div>