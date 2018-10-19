<?php
/**
 * Custom template tags for this theme.
 *
 * Eventually, some of the functionality here could be replaced by core features.
 *
 * @package Kalon
 */

if ( ! function_exists( 'kalon_posted_on' ) ) :
/**
 * Prints HTML with meta information for the current post-date/time, author and comment.
 */
function kalon_posted_on() {
	$time_string = '<time class="entry-date published updated" datetime="%1$s">%2$s</time>';
	if ( get_the_time( 'U' ) !== get_the_modified_time( 'U' ) ) {
		$time_string = '<time class="entry-date published" datetime="%1$s">%2$s</time><time class="updated" datetime="%3$s">%4$s</time>';
	}

	$time_string = sprintf( $time_string,
		esc_attr( get_the_date( 'c' ) ),
		esc_html( get_the_date() ),
		esc_attr( get_the_modified_date( 'c' ) ),
		esc_html( get_the_modified_date() )
	);

	$posted_on = sprintf(
		esc_html_x( '%s', 'post date', 'kalon' ),
		'<a href="' . esc_url( get_permalink() ) . '" rel="bookmark">' . $time_string . '</a>'
	);

	$byline = sprintf(
		esc_html_x( '%s ', 'post author', 'kalon' ),
		'<span class="author vcard"><a class="url fn n" href="' . esc_url( get_author_posts_url( get_the_author_meta( 'ID' ) ) ) . '">' . esc_html( get_the_author() ) . '</a></span>'
	);

	 $kalon_comment_count = sprintf( _nx( '1 Comment', '%1$s Comments', get_comments_number(), 'comments title', 'kalon' ), number_format_i18n( get_comments_number() ) ); 
	
    $kalon_comment = sprintf(
		esc_html_x( '%s', 'post comment', 'kalon' ),
		'<a href="' . esc_url( get_permalink() ) . '" rel="bookmark">' . $kalon_comment_count . '</a>'
	);

    echo '<div class="entry-meta"><span>' . $posted_on . esc_html__( ' / ', 'kalon' ) . $byline . esc_html__( '/ ', 'kalon' );

    if ( ! post_password_required() && ( comments_open() || get_comments_number() ) ) {
		echo '<span class="comments-link">';
		comments_popup_link( esc_html__( 'Leave a comment', 'kalon' ), esc_html__( '1 Comment', 'kalon' ), esc_html__( '% Comments', 'kalon' ) );
		echo '</span>';
    }
    
    echo  '</span></div>'; // WPCS: XSS OK.


}
endif;

if ( ! function_exists( 'kalon_category_list' ) ) :
/**
 * Prints Categories lists
*/
function kalon_category_list(){
    // Hide category and tag text for pages.
	if ( 'post' === get_post_type() ) {
		/* translators: used between list items, there is a space after the comma */
		$categories_list = get_the_category_list( esc_html__( ', ', 'kalon' ) );
		if ( $categories_list && kalon_categorized_blog() ) {
			printf( '<span class="category">' . esc_html__( '%1$s', 'kalon' ) . '</span>', $categories_list ); // WPCS: XSS OK.
		}		
	}
}
endif;

if ( ! function_exists( 'kalon_tag_list' ) ) :
/**
 * Prints Tag lists
*/
function kalon_tag_list(){
    // Hide category and tag text for pages.
	if ( 'post' === get_post_type() ) {
		/* translators: used between list items, there is a space after the comma */
		$tags_list = get_the_tag_list( '', esc_html__( ', ', 'kalon' ) );
		if ( $tags_list ) {
			printf( '<span class="tags">' . esc_html__( 'Tags: %1$s ', 'kalon' ) . '</span>', $tags_list ); // WPCS: XSS OK.
		}
	}
}
endif;

if ( ! function_exists( 'kalon_entry_footer' ) ) :
/**
 * post edit links
*/
function kalon_entry_footer() {
	edit_post_link(
		sprintf(
			/* translators: %s: Name of current post */
			esc_html__( ' Edit %s', 'kalon' ),
			the_title( '<span class="screen-reader-text">"', '"</span>', false )
		),
		'<span class="edit-link">',
		'</span>'
	);
}
endif;

/**
 * Returns true if a blog has more than 1 category.
 *
 * @return bool
 */
function kalon_categorized_blog() {
	if ( false === ( $all_the_cool_cats = get_transient( 'kalon_categories' ) ) ) {
		// Create an array of all the categories that are attached to posts.
		$all_the_cool_cats = get_categories( array(
			'fields'     => 'ids',
			'hide_empty' => 1,
			// We only need to know if there is more than one category.
			'number'     => 2,
		) );

		// Count the number of categories that are attached to the posts.
		$all_the_cool_cats = count( $all_the_cool_cats );

		set_transient( 'kalon_categories', $all_the_cool_cats );
	}

	if ( $all_the_cool_cats > 1 ) {
		// This blog has more than 1 category so kalon_categorized_blog should return true.
		return true;
	} else {
		// This blog has only 1 category so kalon_categorized_blog should return false.
		return false;
	}
}

/**
 * Flush out the transients used in kalon_categorized_blog.
 */
function kalon_category_transient_flusher() {
	if ( defined( 'DOING_AUTOSAVE' ) && DOING_AUTOSAVE ) {
		return;
	}
	// Like, beat it. Dig?
	delete_transient( 'kalon_categories' );
}
add_action( 'edit_category', 'kalon_category_transient_flusher' );
add_action( 'save_post',     'kalon_category_transient_flusher' );
