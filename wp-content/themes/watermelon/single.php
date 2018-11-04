<?php
 
get_header(); ?>
<?php while ( have_posts() ) : the_post(); //Open the loop ?>

	<article id="post-<?php the_ID(); ?>" <?php post_class(); ?> style="grid-area: 2/1/span 2/span 8; align-content: center; text-align: center; background-color:rgba(212,212,212,0.68);margin-left: 10vw; margin-right: 10vw; border:solid; overflow-y: scroll">
		
		<h2 class="entry-title" style="text-align: center"><?php the_title(); ?></h2>

		<section class="entry-meta" style="font: Cambria, 'Hoefler Text', 'Liberation Serif', Times, 'Times New Roman', 'serif'; font-size: 2vw; font:bold">
			<?php echo get_the_date(); ?>
		</section><!-- .entry-meta -->
		
		<section class="entry-content" style="margin-top: 5vh">
			<?php the_content(); ?>
		</section><!-- .entry-content -->	
		
	</article>

	<section class="entry-utility" style="grid-area: 4/1/span 1/span 8; align-content: center; text-align: center; border-bottom-style: solid ; border-color: thick; "
			<?php comments_template(); ?> 
		</section><!-- .entry-utility -->
<?php endwhile; // End the loop. 
get_footer();
?>

