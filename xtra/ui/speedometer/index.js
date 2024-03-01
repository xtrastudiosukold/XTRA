$(document).ready(function(){
    window.addEventListener("message", function(event){
      if(event.data.showSpeed == true){
        $('.speed-huds').fadeIn();
        setProgressSpeed(event.data.speed,'.progress-speed');
      }
      if(event.data.showSpeed == false){
        $('.speed-huds').fadeOut();
      }

      if(event.data.showFuel == true){
        setProgressFuel(event.data.fuel,'.progress-fuel');
        $('.progress-fuel').removeClass('greenStroke');
        $('.progress-fuel').removeClass('orangeStroke');
        $('.progress-fuel').removeClass('redStroke');
        if(event.data.fuel <= 20){
            $('.progress-fuel').addClass('redStroke');
        }
        else if(event.data.fuel <= 50){
            $('.progress-fuel').addClass('orangeStroke');
        }
        else {
            $('.progress-fuel').addClass('greenStroke');
        }
      }
});

    function setProgressFuel(percent, element){
      var circle = document.querySelector(element);
      var radius = circle.r.baseVal.value;
      var circumference = radius * 2 * Math.PI;
      var html = $(element).parent().parent().find('span');

      circle.style.strokeDasharray = `${circumference} ${circumference}`;
      circle.style.strokeDashoffset = `${circumference}`;

      const offset = circumference - ((-percent*73)/100) / 100 * circumference;
      circle.style.strokeDashoffset = -offset;

      html.text(Math.round(percent));
    }

    function setProgressSpeed(value, element){
      var circle = document.querySelector(element);
      var radius = circle.r.baseVal.value;
      var circumference = radius * 2 * Math.PI;
      var html = $(element).parent().parent().find('span');
      var percent = value*100/310;

      circle.style.strokeDasharray = `${circumference} ${circumference}`;
      circle.style.strokeDashoffset = `${circumference}`;

      const offset = circumference - ((-percent*73)/100) / 100 * circumference;
      circle.style.strokeDashoffset = -offset;

      html.text(value);
    }
});
