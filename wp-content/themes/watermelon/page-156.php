<?php get_header(); ?>

<?php 
   // the query
   $the_query = new WP_Query( array(
	   'category_name'=> 'News',
   'posts_per_page'   => -1,
   )); 
?>


<?php
$thisid;
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
			
 		 <table id = "infoTable">
 		 <tr>
			 <td class="postTitle" id = "<?php echo sizeof($postTitle)?>"><?php echo $postTitle[0]?></td>
  		 </tr>
			 <tr><td class = "postImage" id = "postImage"><img class = "infoboxImage"<?php echo $postImage[0]?></td></tr>
			 <tr ><br><td class = "excerpt" id = "excerpt"><?php echo $postExcerpt[0]?></td></tr>
			 <tr><td>		 
 		 <a id = "buttonLink" href= "<?php echo $postLink[0]?>"><button class = "moreinfobutton"  type="button">More Info</button></a> </td></tr>

  		</table>
	</div>
	<div class= "infolist">
	<div class="dropdown">
	</div>
		<div style="overflow-y: hidden;">
 		 <table>
 		 <?php foreach($postTitle as $key=>$a) { ?>
		<tr> <td class="click" ><button id ="<?php echo $key?>" onclick =" loadNewEvent(this.id)"><?php echo $postTitle[$key] ?><br><img class = "infolistImage"<?php echo $postImage[$key] ?></button></td><?php } ?></tr>
 		 
  		</table>
</div>
</div>
</div>

<script>
function loadNewEvent(clicked_id) {
	var id =clicked_id;
	var v = document.getElementsByClassName("postTitle");
   var x=document.getElementById('infoTable').rows[0].cells;
   var y =document.getElementById('infoTable').rows[1].cells;
    var z=document.getElementById('infoTable').rows[2].cells;
	 var a=document.getElementById('buttonLink');
	
	var pImage = <?php echo json_encode($postImage); ?>;
	var pTitle = <?php echo json_encode($postTitle); ?>;
	var pLink = <?php echo json_encode($postLink); ?>;
	var pExercpt = <?php echo json_encode($postExcerpt); ?>;
	
	x[0].innerHTML = pTitle[clicked_id];
	y[0].innerHTML = pImage[clicked_id];
	z[0].innerHTML = pExercpt[clicked_id];
	a.href = pLink[clicked_id];
 
}
</script>

<?php get_sidebar(); ?>
<?php get_footer(); ?>