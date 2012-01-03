// Billably js
//
//= require jquery
//= require jquery_ujs
//= require_directory
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

  // Options
  $(".option").click(function(){
    $(".option").removeClass("active");
    $(this).addClass("active");
  });

  // Switches
  $.fn.changelabel = function(text){
    $(this).children('.label').html(text);
  }
  $(".button").click(function(){
    var container = $(this).parent(".buttontrack");
    if (container.hasClass("on")){
      $(this).delay(200).animate({"marginLeft" : "-1px"}, 30).changelabel("Off");
      $(this).parent(".buttontrack").removeClass("on");

    } else {
      $(this).delay(200).animate({"marginLeft" : "37px"}, 30).changelabel("On");
      $(this).parent(".buttontrack").addClass("on");
    }
  });

  // City Select
  $('#city-select').click(function(){
    $(this).children('.available-cities').toggle();
  });
  $('#city-select a').click(function(e){
    $('.current-city').html($(this).text());
    e.preventDefault();
  });

  // Drill-down
  $('.drill-down').click(function(e){
    $(this).toggleClass("expanded");
    var id = $(this).attr("rel");
    $("#"+id).toggle();
    e.preventDefault();
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
