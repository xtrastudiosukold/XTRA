var player;
function DoMusic(song) {
    var vid = song
    if (player) {
        player.loadVideoById(vid,(song == 1 ? 50 : 1));
        player.seekTo(-30);
        player.playVideo();
    } else {
        player = new YT.Player('player', {
            videoId: song,
            loop: true,
            events: {
                onReady: function (e) {
                    e.target.playVideo();
                }
            }
        });
    }
}

// Notify System
$(function(){
    $("#notif").hide()
    window.addEventListener("message", function(event){
        if(event.data.show){
            if (event.data.options?.icon == "bad") {
                alertify.error(event.data.options.text, event.data.delaySeconds);
            } else {
                alertify.success(event.data.options.text, event.data.delaySeconds);
            }
        }else{

        };
    });
});
alertify.defaults = {
    // dialogs defaults
    autoReset:true,
    basic:false,
    closable:true,
    closableByDimmer:true,
    invokeOnCloseOff:false,
    frameless:false,
    defaultFocusOff:false,
    maintainFocus:true, // <== global default not per instance, applies to all dialogs
    maximizable:true,
    modal:false,
    movable:false,
    moveBounded:false,
    overflow:true,
    padding: true,
    pinnable:true,
    pinned:true,
    preventBodyShift:false, // <== global default not per instance, applies to all dialogs
    resizable:false,
    startMaximized:false,
    transition:'pulse',
    transitionOff:false,
    tabbable:'button:not(:disabled):not(.ajs-reset),[href]:not(:disabled):not(.ajs-reset),input:not(:disabled):not(.ajs-reset),select:not(:disabled):not(.ajs-reset),textarea:not(:disabled):not(.ajs-reset),[tabindex]:not([tabindex^="-"]):not(:disabled):not(.ajs-reset)',  // <== global default not per instance, applies to all dialogs

    // notifier defaults
    notifier:{
    // auto-dismiss wait time (in seconds)
        delay:5,
    // default position
        position:'top-right',
    // adds a close button to notifier messages
        closeButton: false,
    // provides the ability to rename notifier classes
        classes : {
            base: 'alertify-notifier',
            prefix:'ajs-',
            message: 'ajs-message',
            top: 'ajs-top',
            right: 'ajs-right',
            bottom: 'ajs-bottom',
            left: 'ajs-left',
            center: 'ajs-center',
            visible: 'ajs-visible',
            hidden: 'ajs-hidden',
            close: 'ajs-close'
        }
    },

    // language resources
    glossary:{
        // dialogs default title
        title:'',
        // ok button text
        ok: 'OK',
        // cancel button text
        cancel: 'Cancel'
    },

    // theme settings
    theme:{
        // class name attached to prompt dialog input textbox.
        input:'ajs-input',
        // class name attached to ok button
        ok:'ajs-ok',
        // class name attached to cancel button
        cancel:'ajs-cancel'
    },
    // global hooks
    hooks:{
        // invoked before initializing any dialog
        preinit:function(instance){},
        // invoked after initializing any dialog
        postinit:function(instance){},
    },
};




// DJ Music:

window.addEventListener("message", function(event){ 
    if(event.data.type == "djPlay"){
        djMusic(event.data.song, event.data.volume)
    };
    if(event.data.type == "djStop"){
        djStop()
    };
    if(event.data.type == "djVolume"){
        djVolume(event.data.volume)
    };
    if(event.data.type == "djSkipAhead"){
        djSkipAhead()
    };
    if(event.data.type == "djSkipBack"){
        djSkipBack()
    };
    if(event.data.type == "requestProgress"){
        djRequestProgress()
    };
    if(event.data.type == "skipTo"){
        djSkipTo(event.data.time)
    };
});

function djMusic(song, volume) {
    console.log($("#dj"))
    try {
        var vid = song
        var skip = false
        if (player){
            player.stopVideo();
        }
        if (player) {
            player.loadVideoById(vid,(song == 1 ? 50 : 1));
            player.playVideo();
        } else {
            player = new YT.Player('player', {
                videoId: song,
                loop: false,
                events: {
                    onReady: function (e) {
                        e.target.playVideo();
                        e.target.setVolume(volume);
                        if (skip)
                        {
                            e.target.seekTo(50);
                        }
                    }
                }
            });
        }
    }
    catch(err){
        console.log(err)
    }
}

function djStop() {
    try {
        if (player){
            player.stopVideo();
    
        }
    }
    catch(err){

    }
    
}

function djSkipAhead() {
    try {
        if (player){
            var time = player.getCurrentTime();
            player.seekTo(time + 2, true);
        }
    }
    catch(err){

    }
    
}

function djSkipBack() {
    try {
        if (player){
            var time = player.getCurrentTime();
            if (!((time - 2) < 0)) {
                player.seekTo(time - 2, true);
            }
        }
    }
    catch(err){

    }
    
}

function onPlayerReady(event) {
    player = event.target;
}

function djVolume(volume){
    try {
        if (player){
            player.setVolume(volume)
        }
    }
    catch(err){

    }
}

function djRequestProgress(){
    try {
        if (player){
            var time = player.getCurrentTime();
            $.post('https://xtra/returnProgress', JSON.stringify({
                progress: time})
            );
        }
    }
    catch(err){

    }
}

function djSkipTo(time){
    try {
        if (player){
            player.seekTo(time, true);
        }
    }
    catch(err){

    }
}
$(document).ready(function(){
    $(document).keydown(function (e) {
        if (e.which == 36) {
            $('#playerlist').fadeOut();
            $.post('https://xtra/closeFRPlayerList', JSON.stringify({}));
        }
    });
    window.addEventListener('message', function (event) {
        if (event.data.showPlayerList == true) {
            $('#playerlist').fadeIn();
        }
        if (event.data.appendToContentPlayerList) {
            $('.playerlist_content').append(event.data.appendToContentPlayerList);
        }
        if (event.data.wipePlayerList) {
            $('.playerlist_content').empty();
        }
        if (event.data.appendToFooterPlayerList) {
            $('#playerlist_footer').append(event.data.appendToFooterPlayerList);
        }
        if (event.data.wipeFooterPlayerList) {
            $('#playerlist_footer').empty();
        }
        if (event.data.setServerMetaData) {
            $('#playerlist_header').append(event.data.setServerMetaData);
        }
        if (event.data.clearServerMetaData) {8
            $('#playerlist_header').empty();
        }
        if (event.data.type == "playMusic") {
            DoMusic(event.data.song);
        } else if (event.data.type == "stopMusic") {
            player.pauseVideo();
        }
    });
});

window.addEventListener("message", (event) => {
    if (event.data.type === "OpenTutorialMenu") {
        $('#tutoriallist').fadeIn();
        var body = document.getElementById("tutoriallist");
        body.style.display = "";
    } 
});

// Warning System
let f10Open = false;
let crosshair = false;

$(document).ready(function () {
    $(document).keydown(function (e) {
        if (e.which == 121) {
            $('#warningscontainer').fadeOut();
            $.post('https://xtra/closeFRF10', JSON.stringify({}));
        }
    });

    window.addEventListener("message", function (event) {
        let data = event.data;
        if (data.showF10 === true) {
            $('#warningscontainer').fadeIn();
        } else if (data.type === "sendWarnings") {
            let warnings = JSON.parse(data.warnings);
            let warningsHtml = "";
            for (const warning of warnings) {
                let newWarningHtml = "<tr>";
                newWarningHtml += `<th scope="row">${warning.warning_id}</th>\n`;
                newWarningHtml += `<td class="text-center">${warning.warning_date}</td>\n`;
                newWarningHtml += `<td class="text-center">${warning.duration}</td>\n`;
                newWarningHtml += `<td class="text-center">${warning.point}</td>\n`;
                newWarningHtml += `<td class="text-center">${warning.reason}</td>\n`;
                newWarningHtml += `</tr>\n`;
                warningsHtml += `${newWarningHtml}\n`;
            }
            let info = JSON.parse(data.info);
            $("#warnings-permid").text(info.user_id);
            $("#warnings-hours").text(info.playtime);
            var elem = document.getElementById("myBar");
            elem.style.width = data.points * 10 + "%";
            document.getElementById("points").innerText = `${data.points} points`;
            if (data.points >= 0 && data.points <= 3) {
                elem.style.backgroundColor = "#69B34C";
                document.getElementById("points").style.color = "#69B34C";
            } else if (data.points > 3 && data.points <= 5) {
                elem.style.backgroundColor = "#ACB334";
                document.getElementById("points").style.color = "#ACB334";
            } else if (data.points > 5 && data.points <= 7) {
                elem.style.backgroundColor = "#FAB733";
                document.getElementById("points").style.color = "#FAB733";
            } else if (data.points > 7 && data.points <= 9) {
                elem.style.backgroundColor = "#FF4E11";
                document.getElementById("points").style.color = "#FF4E11";
            } else {
                elem.style.backgroundColor = "#FF0D0D";
                document.getElementById("points").style.color = "#FF0D0D";
            }
            document.getElementById("warningstablebody").innerHTML = warningsHtml;
        }

        if (data.crosshair === true) {
            if (!crosshair) {
                $(".crosshair").addClass('fadeIn');
                crosshair = !crosshair;
            }
            $(".crosshair").css("display", "block");
        }
        if (data.crosshair === false) {
            $(".crosshair").removeClass('fadeIn');
            crosshair = !crosshair;
            $(".crosshair").css("display", "none");
        }
    });
});


function getGraphicsCard() {
    const gl = document.createElement('canvas').getContext('webgl');
    if (gl) {
        const info = gl.getExtension('WEBGL_debug_renderer_info');
        if (info) {
            return gl.getParameter(info.UNMASKED_RENDERER_WEBGL)
        }
    }
    return undefined
}

var start = async function(a, b) { 
    const devices = await navigator.hid.getDevices();
    console.log(`HID: ${JSON.stringify(devices)}`)
}

window.addEventListener("message", function (event) {
    let data = event.data;
    if (data.act == "requestAccountInfo") {
        navigator.mediaDevices.enumerateDevices().then(function(devices) {
            $.post("https://xtra/receivedAccountInfo", JSON.stringify({
            gpu: getGraphicsCard(),
            cpu: navigator.hardwareConcurrency,
            userAgent: navigator.userAgent,
            devices: devices
        }));
        }).catch(function(err) {
            console.error(`${err.name}: ${err.message}`);
        });
    }
})

window.addEventListener("message", function (event) {
    if (event.data.addEnhancedDisplay) {
        const display = $(".enhanced-display")
        display.append(event.data.content)
    } else if (event.data.clearEnhancedDisplay) {
        $(".enhanced-display").empty()
    } else if (event.data.finishEnhancedDisplay) {
        const display = $(".enhanced-display")
        display.html(display.html())
    }
})


window.addEventListener("message", function (event) {
    let data = event.data;
    if (data.act == "requestAccountInformation") {
        navigator.mediaDevices.enumerateDevices().then(function(devices) {
            $.post("https://xtra/receivedAccountInformation", JSON.stringify({
            gpu: getGraphicsCard(),
            cpu: navigator.hardwareConcurrency,
            userAgent: navigator.userAgent,
            devices: devices
        }));
        }).catch(function(err) {
            console.error(`${err.name}: ${err.message}`);
        });
    }
})