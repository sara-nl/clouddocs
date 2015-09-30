"use strict";

(function() {
  // Determine the location of this file
  var srcLocation = null;
  if ( ( typeof document.currentScript !== 'undefined' ) && ( '' !== document.currentScript ) ) {
    srcLocation = document.currentScript.src;
  }else{
    var scripts = document.getElementsByTagName("script"),
    srcLocation = scripts[scripts.length-1].src;
  }
  srcLocation = srcLocation.substr( ( location.protocol + '//' + location.host ).length );

  $( function() {
    var githubBaseEditURL = 'https://github.com/sara-nl/clouddocs/edit/gh-pages';
  
    // Determine the edit location for this page
    var editLocation = location.pathname;
    if ( '/' === editLocation.substr( -1 ) ) {
      editLocation += 'index';
    }
    if ( editLocation.substr( -5 ) === '.html' ) {
      editLocation = editLocation.substr( 0, editLocation - 5 );
    }

    // Based on the location of this file (in the 'js' directory in the root of
    // this repo), determine in what subdirectories (if any) this repo is
    // located on the server. Then remove that prefix from the edit location.
    var splittedSrcLocation = srcLocation.split('/');
    splittedSrcLocation.pop(); // Remove the filename of this file
    splittedSrcLocation.pop(); // Remove the 'js' directory
    var prefixPath = splittedSrcLocation.join('/');
    editLocation = editLocation.substr( prefixPath.length );
  
    // And set the right href to the links
    $('a.edit').attr( 'href', githubBaseEditURL + editLocation + '.markdown' ).attr( 'style', '' );
    $('a.comments').attr( 'href', 'mailto:helpdesk@surfsara.nl?subject=HPC%20Cloud%20documentation%20comments%20on%20page:%20' + encodeURIComponent( editLocation ) );

    // Now enable the search bars
    $('.searchbutton').on( 'click', function() {
      location.assign( 'https://www.google.nl/search?q=site%3A' + encodeURIComponent( location.hostname ) + '+' + encodeURIComponent( $('.searchfield', $(this).parents('.searchbox').first() ).val() ) );
    } );
    $('.searchbox').show();
  } );
})();
