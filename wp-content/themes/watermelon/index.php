<?php get_header(); ?>

<?php 
   // the query
   $the_query = new WP_Query( array(
	   'category_name' =>'Events',
      'posts_per_page' => 3,
   )); 
?>

<?php 
   // the query
   $news_query = new WP_Query( array(
	   'category_name' =>'News',
      'posts_per_page' => 3,
   )); 
?>

<?php
$content = array();
$links = array();
$titles = array();
$news = array();
$newsTitle = array();
$newsLinks = array();
?>

<?php if ( $the_query->have_posts() ) : ?>
  <?php while ( $the_query->have_posts() ) : $the_query->the_post(); ?>

    <?php array_push($content, get_the_post_thumbnail());
 	      array_push($links, get_permalink());
  		  array_push($titles, get_the_title());
?>

  <?php endwhile; ?>
  <?php wp_reset_postdata(); ?>

<?php else : ?>
  <p><?php __('No News'); ?></p>
<?php endif; ?>

<?php if ( $news_query->have_posts() ) : ?>
  <?php while ( $news_query->have_posts() ) : $news_query->the_post(); ?>

    <?php array_push($news, get_the_post_thumbnail());
 	      array_push($newsLinks, get_permalink());
 		  array_push($newsTitle, get_the_title());
?>

  <?php endwhile; ?>
  <?php wp_reset_postdata(); ?>

<?php else : ?>
  <p><?php __('No News'); ?></p>
<?php endif; ?>


<!-- Featured events -->
<div class="featuredevents">
    <div class="slideshow-container">

        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade">
       
             <a href= "<?php echo $links[0]?> "><img class="slideImage" <?php echo $content[0]; ?></img> </a><br><b class = "slideTitle">
            <?php echo $titles[0]?></b>
            
        </div>

        <div class="mySlides fade">
        
               <a href= "<?php echo $links[1]?> "><img class="slideImage" <?php echo $content[1]; ?></img> </a><br><b class = "slideTitle">
            <?php echo $titles[1]?></b>
            
        </div>

        <div class="mySlides fade">
          
                <a href= "<?php echo $links[2]?> "><img class="slideImage" <?php echo $content[2]; ?></img> </a><br><b class = "slideTitle">
            <?php echo $titles[2]?></b>
          
        </div>

        <!-- Next and previous buttons -->
        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
        <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>
</div>

<!-- About the company -->
<div class="about">
    <article>
        <h1 style="margin-top:4vh">About Us</h1>
        <p style="margin-top:3vh">
            The Human Rights Arts & Flim Festival(HRAFF) is a not-for-profit arts organisation that explores diverse and<br>
            inspiring human stories through the medium of film, art, music and forum. HRAFF inspire and engages <br>
            audiences with audio justice and human rights issues via an annual festival and year-round through our <br>
            CineSeeds program, our online networks and partners. HRAFF is an independent organisation which is not <br>
            aligned or affiliated with any political part or religious group.
        </p>
    </article>
</div>

<!-- Most Recent News -->
<div class="news-grid">
    <div class="newsHeader">
        <h1 style="margin-top: 5px;">Most Recent News</h1>
    </div>
    <div class="recentnews1">
        <article>
            <h2><?php echo $newsTitle[2]?></h2>
         		<img class='newsImage' <?php echo $news[2]?>>
            <br>
           <a href="<?php echo $newsLinks[2]?> " class="readmorenews">Read more →</a>
        </article>
    </div>
    <div class="recentnews2">
        <article>
            <h2><?php echo $newsTitle[1]?></h2>
       		<img class='newsImage' <?php echo $news[1]?>>
            <br>
         <a href="<?php echo $newsLinks[1]?> " class="readmorenews">Read more →</a>
        </article>
    </div>
    <div class="recentnews3">
        <article>
            <h2><?php echo $newsTitle[0]?></h2>
         	<img class='newsImage' <?php echo $news[0]?>>
            <br>
            <a href="<?php echo $newsLinks[0]?> " class="readmorenews">Read more →</a>
        </article>
    </div>
</div>


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
	 
    // Change image every 2 seconds
</script>

<?php get_footer(); ?>