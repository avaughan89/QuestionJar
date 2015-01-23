$(document).ready(function() {
  $('.checker').hide();
  $('.tagline').hide();
  $('.action-maker').hover(function(){
    $('.checker').show();
    $('.tagline').show();
    $('html').css('background-image', 'none');
    $('html').css('background-color', 'black');
    $('#maybeforms').hide();
    $('.spacer').hide();

  })
});


