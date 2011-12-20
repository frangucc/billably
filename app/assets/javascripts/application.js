// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//
$(document).ready(function(){
  //  Video Lightbox
  $("a[rel^='prettyPhoto']").prettyPhoto();

  // Tabs
  $('.tab a').click(function(e){
    switch_tab($(this));
    e.preventDefault();
  });
  switch_tab($('.defaulttab'));

  // Switchs
  $.fn.changelabel = function(text){
    $(this).children('.label').html(text);
  }
  $('.button').toggle(function(){
    $(this).delay(200).animate({"marginLeft" : "49px"}, 30).changelabel("On");
  }, function(){
    $(this).delay(200).animate({"marginLeft" : "-1px"}, 30).changelabel("Off");
  });
});

// Tabs
function switch_tab(obj){
  $('.tab-content').hide();
  $('.tab a').removeClass("active");
  var id = obj.attr("rel");

  $('#'+id).show();
  obj.addClass("active"); 
}
