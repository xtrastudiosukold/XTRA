$(document).ready(function(){
  // Listen for NUI Events
  window.addEventListener('message', function(event){
    // Open Skin Creator
    if(event.data.openSkinCreator == true){
      $(".skinCreator").css("display","block");
	  $(".rotation").css("display","flex");
    }
    // Close Skin Creator
    if(event.data.openSkinCreator == false){
      $(".skinCreator").fadeOut(400);
	  $(".rotation").css("display","none");
    }
	// Click
    if (event.data.type == "updateMaxVal") {
      $('input.' + event.data.classname).prop('max',event.data.maxVal);
      //console.log("setting div with name " + event.data.classname + " the max value of "+event.data.maxVal)
	    $('div[name=' + event.data.classname + ']').attr('data-legend', '/'+event.data.maxVal);
    }
  });

  // Form update
  $('input').change(function(){
    if (!isSkinWindowOpen()) {
      return
    }
    if ($(this).attr('name') == 'css-tabs') {
      return
    }
    $.post('https://xtra/updateSkin', JSON.stringify({
      value: false,
      // Face
      dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
      mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
      dadmumpercent: $('.morphologie').val(),
      skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
      eyecolor: $('input[name=eyecolor]:checked','#formSkinCreator').val(),
      acne: $('.acne').val(),
      skinproblem: $('.pbpeau').val(),
      freckle: $('.tachesrousseur').val(),
      wrinkle: $('.rides').val(),
      wrinkleopacity: $('.rides').val(),
      lipstick: $('.lipstick').val(),
      lipstickcolour: $('.lipstickcolour').val(),
      eyeshadow: $('.eyeshadow').val(),
      eyeshadowcolour: $('.eyeshadowcolour').val(),
      facepaints: $('.facepaints').val(),
      facepaintscolour: $('.facepaintscolour').val(),
      hair: $('.hair').val(),
      haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
      eyebrow: $('.sourcils').val(),
      eyebrowopacity: $('.epaisseursourcils').val(),
      beard: $('.barbe').val(),
      beardopacity: $('.epaisseurbarbe').val(),
      beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
      // Clothes
      hats: $('input[class=helmet_1]').val(),
	    hats_texture: $('input[class=helmet_2]').val(),
      glasses: $('input[class=glasses_1]').val(),
	    glasses_texture: $('input[class=glasses_2]').val(),
      ears: $('.oreilles .active').attr('data'),
      tops: $('.hauts .active').attr('data'),
      pants: $('.pantalons .active').attr('data'),
      shoes: $('.chaussures .active').attr('data'),
      watches: $('.montre .active').attr('data'),
    }));
  });
  $('.arrow').on('click', function(e){
    if (!isSkinWindowOpen()) {
      return
    }
    e.preventDefault();
    $.post('https://xtra/updateSkin', JSON.stringify({
      value: false,
      // Face
      dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
      mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
      dadmumpercent: $('.morphologie').val(),
      skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
      eyecolor: $('input[name=eyecolor]:checked','#formSkinCreator').val(),
      acne: $('.acne').val(),
      skinproblem: $('.pbpeau').val(),
      freckle: $('.tachesrousseur').val(),
      wrinkle: $('.rides').val(),
      wrinkleopacity: $('.rides').val(),
      lipstick: $('.lipstick').val(),
      lipstickcolour: $('.lipstickcolour').val(),
      eyeshadow: $('.eyeshadow').val(),
      eyeshadowcolour: $('.eyeshadowcolour').val(),
      facepaints: $('.facepaints').val(),
      facepaintscolour: $('.facepaintscolour').val(),
      hair: $('.hair').val(),
      haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
      eyebrow: $('.sourcils').val(),
      eyebrowopacity: $('.epaisseursourcils').val(),
      beard: $('.barbe').val(),
      beardopacity: $('.epaisseurbarbe').val(),
      beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
      // Clothes
      hats: $('input[class=helmet_1]').val(),
	    hats_texture: $('input[class=helmet_2]').val(),
      glasses: $('input[class=glasses_1]').val(),
	    glasses_texture: $('input[class=glasses_2]').val(),
      ears: $('.oreilles .active').attr('data'),
      tops: $('.hauts .active').attr('data'),
      pants: $('.pantalons .active').attr('data'),
      shoes: $('.chaussures .active').attr('data'),
      watches: $('.montre .active').attr('data'),
    }));
  });

  // Form submited
  $('.yes').on('click', function(e){
    if (!isSkinWindowOpen()) {
      return
    }
    e.preventDefault();
    $.post('https://xtra/updateSkin', JSON.stringify({
      value: true,
      // Face
      dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
      mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
      dadmumpercent: $('.morphologie').val(),
      skin: $('input[name=peaucolor]:checked', '#formSkinCreator').val(),
      eyecolor: $('input[name=eyecolor]:checked','#formSkinCreator').val(),
      acne: $('.acne').val(),
      skinproblem: $('.pbpeau').val(),
      freckle: $('.tachesrousseur').val(),
      wrinkle: $('.rides').val(),
      wrinkleopacity: $('.rides').val(),
      lipstick: $('.lipstick').val(),
      lipstickcolour: $('.lipstickcolour').val(),
      eyeshadow: $('.eyeshadow').val(),
      eyeshadowcolour: $('.eyeshadowcolour').val(),
      facepaints: $('.facepaints').val(),
      facepaintscolour: $('.facepaintscolour').val(),
      hair: $('.hair').val(),
      haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
      eyebrow: $('.sourcils').val(),
      eyebrowopacity: $('.epaisseursourcils').val(),
      beard: $('.barbe').val(),
      beardopacity: $('.epaisseurbarbe').val(),
      beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
      // Clothes
      hats: $('input[class=helmet_1]').val(),
	    hats_texture: $('input[class=helmet_2]').val(),
      glasses: $('input[class=glasses_1]').val(),
	    glasses_texture: $('input[class=glasses_2]').val(),
      ears: $('.oreilles .active').attr('data'),
      tops: $('.hauts .active').attr('data'),
      pants: $('.pantalons .active').attr('data'),
      shoes: $('.chaussures .active').attr('data'),
      watches: $('.montre .active').attr('data'),
    }));
  });
  // Rotate player
  $(document).keypress(function(e) {
    if (!isSkinWindowOpen()) {
      return
    }
    if(e.which == 113){ // A pressed
      $.post('https://xtra/rotaterightheading', JSON.stringify({
        value: 10
      }));
    }
    if(e.which == 101){ // E pressed
      $.post('https://xtra/rotateleftheading', JSON.stringify({
        value: 10
      }));
    }
    if(e.which == 119 ){ // W pressed
      $.post('https://xtra/zoomin', JSON.stringify({
        value: 10
      }));
    }
    if(e.which == 115){ // S pressed
      $.post('https://xtra/zoomout', JSON.stringify({
        value: 10
      }));
    }
  });

  // // Zoom out camera for clothes
  $('#skin-tabs skin-label').on('click', function(e){
    if (!isSkinWindowOpen()) {
      return
    }
    $.post('https://xtra/zoom', JSON.stringify({
      zoom: $(this).attr('data-link')
    }));
  });
});


function leftWristComponent() {
    $.post('https://xtra/updateLeftWristComponent', JSON.stringify({
        componentID: $('.montre .active').attr('data'),
    }));
}

function leftWristTexture() {
    // console.log("leftWrist() says textureID is " + $('.leftWristTexture .active').attr('data')),
    $.post('https://xtra/updateLeftWristTexture', JSON.stringify({
        componentID: $('.montre .active').attr('data'),
        textureID:  $('.leftWristTexture .active').attr('data'),
    }));
}

function rightWristComponent() {
    $.post('https://xtra/updateRightWristComponent', JSON.stringify({
        componentID: $('.montre-right .active').attr('data'),
    }));
}

function rightWristTexture() {
    // console.log("rightWrist() says textureID is " + $('.rightWristTexture .active').attr('data')),
    $.post('https://xtra/updateRightWristTexture', JSON.stringify({
        componentID: $('.montre-right .active').attr('data'),
        textureID:  $('.rightWristTexture .active').attr('data'),
    }));
}

function isSkinWindowOpen() {
  return $(".skinCreator").css("display") !== "none"
}