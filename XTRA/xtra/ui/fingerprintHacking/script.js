$('document').ready(function(){
  $gif = $('img').first();
});

window.addEventListener("message", (event) => {
  if (event.data.type === "intro") {
    intro();
  } else if (event.data.type === "success") {
    success();
  } else if (event.data.type == "fail") {
    fail();
  }
});

function intro() {
  $gif.attr("src", "https://cdn.discordapp.com/attachments/1111316733937066055/1159113658752831548/intro.gif?ex=651eb437&is=651d62b7&hm=4e2de5795c6ec562918c09217005576e8419ee1c7fb425dcd0f442969d41e476&");
  setTimeout(function() {
    $gif.attr('src', "fingerprintHacking/blank.png");
  }, 3500)
};

function success() {
  $gif.attr("src", "https://cdn.discordapp.com/attachments/1111316733937066055/1159113913254821978/success.gif?ex=651eb474&is=651d62f4&hm=49ad023be423470b4b7627741878f360840dd489edb3b496a3069eda49850343&");
  setTimeout(function() {
    $gif.attr('src', "fingerprintHacking/blank.png");
  }, 3000)
};

function fail() {
  $gif.attr("src", "https://cdn.discordapp.com/attachments/1111316733937066055/1159113683457294437/fail.gif?ex=651eb43d&is=651d62bd&hm=5aae4779421f27a491a8145935ef8f241c6a3f550010560e8df5bf2e66a12073&");
  setTimeout(function() {
    $gif.attr('src', "fingerprintHacking/blank.png");
  }, 3000)
};