<?php get_header(); ?>

<?php 
   // the query
   $the_query = new WP_Query( array(
	   'category_name'=> 'Events',
   'posts_per_page'   => -1,
   )); 
?>


<?php
$postImage = array();
$postTitle = array();
$postLink = array();
$postExcerpt = array();
?>

<?php if ( $the_query->have_posts() ) : ?>
  <?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>
	<?php
 		  array_push($postImage, get_the_post_thumbnail());
 	      array_push($postLink, get_permalink());
 	      array_push($postTitle, get_the_title());
 	      array_push($postExcerpt, get_the_excerpt());

?>
  <?php endwhile; ?>
  <?php wp_reset_postdata(); ?>

<?php else : ?>
  <p><?php __('No News'); ?></p>
<?php endif; ?>


<div class="info" style="width:76vw;height:90vh;border:1px solid #000;">
	<div class= "infobox" style="overflow: auto">
			
 		 <table>
 		 <tr>
			 <td class="postTitle"><?php echo $postTitle[0]?></td>
  		 </tr>
			 <tr><td><img class = "infoboxImage"<?php echo $postImage[0]?></td></tr>
			 <tr ><br><td class = "excerpt"><?php echo $postExcerpt[0]?></td></tr>
			 <tr><td>		 
 		 <a href= "<?php echo $postLink[0]?>"><button class = "moreinfobutton"  type="button">More Info</button></a> </td></tr>

  		</table>
	</div>
	<div class= "infolist">
	<div class="dropdown">
	</div>
		<div style="overflow-y: hidden;">
 		 <table>
 		 <?php foreach($postTitle as $key=>$a) { ?>
		<tr> <td class="click"><a  href="<?php echo $postLink[$key]?>"><?php echo $postTitle[$key] ?><br><img class = "infolistImage"<?php echo $postImage[$key] ?></a></td><?php } ?></tr>
 		 
  		</table>
</div>
</div>
</div>


<?php get_sidebar(); ?>
<?php get_footer(); ?>