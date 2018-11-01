<?php get_header(); ?>

<!-- Featured events -->
<div class="featuredevents">
    <div class="slideshow-container">

        <!-- Full-width images with number and caption text -->
        <div class="mySlides fade">
            <div class="numbertext">1 / 3</div>
            <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/hraff-logo.png' ); ?>" style="width:100%">
            <div class="text">Caption Text</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">2 / 3</div>
            <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/hraff-logo.png' ); ?>" style="width:100%">
            <div class="text">Caption Two</div>
        </div>

        <div class="mySlides fade">
            <div class="numbertext">3 / 3</div>
            <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/hraff-logo.png' ); ?>" style="width:100%">
            <div class="text">Caption Three</div>
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
        <h1 style="margin-top: 8px;">Most Recent News</h1>
    </div>
    <div class="recentnews1">
        <article>
            <h1>HRAFF has been named the top festival</h1>
            <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/recentnews1.jpg' ); ?>" style="width: 30%; height: 30%">
            <br>
            <a href="" class="readmorenews">Read more →</a>
        </article>
    </div>
    <div class="recentnews2">
        <article>
            <h1>GUILTY: The last 72 hours of Suhumaran's Life</h1>
            <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/recentnews2.jpg' ); ?>" style="width: 30%; height: 30%">
            <br>
            <a href="" class="readmorenews">Read more →</a>
        </article>
    </div>
    <div class="recentnews3">
        <article>
            <h1>Opening Night Wrap Up</h1>
            <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/recentnews3.jpg' ); ?>" style="width: 30%; height: 30%">
            <br>
            <a href="" class="readmorenews">Read more →</a>
        </article>
    </div>
</div>

<div class="sponsors-grid">
    <div class="sponsorHeader">
        <h1 style="margin-top: 8px;">Sponsors</h1>
    </div>
    <div class="sponsors1">
        <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/bankaustralia.png' ); ?>">
    </div>
    <div class="sponsors2">
        <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/lush.png' ); ?>">
    </div>
    <div class="sponsors3">
        <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/theguardian.png' ); ?>">
    </div>
    <div class="sponsors4">
        <img src="<?php echo esc_url( get_template_directory_uri() . '/Images/thesaturdaypaper.png' ); ?>">
    </div>
</div>

<div class="ads">
    <h1>test</h1>
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
</script>

<?php get_footer(); ?>