//set div middle by harry

function setmiddle(node){
$(document).ready(function(){
 $(node).css({
  position:'absolute',
  left: ($(window).width() - $(node).outerWidth())/2,
   top: ($(window).height() - $(node).outerHeight())/2
 });
});

$(window).bind('resize',function(){
    // window.location.href = window.location.href;
	$(node).css({
  position:'absolute',
  left: ($(window).width() - $(node).outerWidth())/2,
   top: ($(window).height() - $(node).outerHeight())/2
 });
});
}