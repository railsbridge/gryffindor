
$(document).ready(function(){
  initMenu();
});


function initMenu(){
  $('#menuTrigger').click(function() {
    triggerEffect(this,'toolbarContainer','slide', '/images/rbnDownButton.png', '/images/rbnUpButton.png');
  });
}

function triggerEffect(srcElement,divId, effect, firstImg, secondImg){
  
  $("#" + divId).slideToggle("normal", function(){
  image = srcElement.getElementsByTagName('img')[0];
  var new_image = $(image).attr("src").match(firstImg) ? secondImg : firstImg;
    $(image).attr("src", new_image); 
  });
  return false;
  // Effect.toggle(divId, effect, {
  //    beforeStart:function(){
  //      image = srcElement.getElementsByTagName('img')[0];
  //      image.src = image.src.match(firstImg) ? secondImg : firstImg;
  //    },
  //  duration:0.2
  //  });
  //  return false;
}