( function( api ) {

	// Extends our custom "lz-real-blog" section.
	api.sectionConstructor['lz-real-blog'] = api.Section.extend( {

		// No events for this type of section.
		attachEvents: function () {},

		// Always make the section active.
		isContextuallyActive: function () {
			return true;
		}
	} );

} )( wp.customize );