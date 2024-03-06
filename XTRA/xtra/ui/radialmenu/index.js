$(document).ready(function(){
    var vehicleItems = [
        {
            id   : 'lock',
            title: 'Lock Car',
            icon: '#carLock'
        },
        {
            id   : 'openBoot',
            title: 'Open Boot',
            icon: '#openBoot'
        },
        {
            id   : 'cleanCar',
            title: 'Clean Car',
            icon: '#cleanCar'
        },
        {
            id   : 'lockpick',
            title: 'Lockpick',
            icon: '#lockpick'
        },
        {
            id   : 'repair',
            title: 'Repair',
            icon: '#repair'
        },
        {
            id   : 'openHood',
            title: 'Open Hood',
            icon: '#openHood'
        },
        {
            id   : 'searchvehicle',
            title: 'Search Vehicle',
            icon : '#searchVehicle'
        },
    ];
    var vehicleItemsPolice = [
        {
            id   : 'lock',
            title: 'Lock Car',
            icon: '#carLock'
        },
        {
            id   : 'openBoot',
            title: 'Open Boot',
            icon: '#openBoot'
        },
        {
            id   : 'cleanCar',
            title: 'Clean Car',
            icon: '#cleanCar'
        },
        {
            id   : 'lockpick',
            title: 'Lockpick',
            icon: '#lockpick'
        },
        {
            id   : 'repair',
            title: 'Repair',
            icon: '#repair'
        },
        {
            id   : 'openHood',
            title: 'Open Hood',
            icon: '#openHood'
        },
        {
            id   : 'police',
            title: 'MET Police',
            icon: '#metPolice', //was #more
            items: [
                {
                    id   : 'searchvehicle',
                    title: 'Search Vehicle',
                    icon : '#searchVehicle'
                },
                {
                    id   : 'impoundVehicle',
                    title: 'Impound Vehicle',
                    icon : '#searchVehicle'
                },
                {
                    id   : 'askDriverId',
                    title: 'Ask Driver ID',
                    icon : '#askId'
                },
            ]
        },
    ];

    var pedItems = [
        {
            id   : 'askId',
            title: 'Ask ID',
            icon: '#askId'
        },
        {
            id   : 'giveCash',
            title: 'Give Cash',
            icon: '#giveMoney'
        },
        {
            id   : 'search',
            title: 'Search Player',
            icon: '#searchPerson'
        },
        {
            id   : 'robPerson',
            title: 'Rob Person',
            icon: '#robPlayer'
        },
        {
            id   : 'revive',
            title: 'CPR',
            icon: '#cpr'
        },
    ];

    var pedItemsPolice = [
        {
            id   : 'askId',
            title: 'Ask ID',
            icon: '#askId'
        },
        {
            id   : 'giveCash',
            title: 'Give Cash',
            icon: '#giveMoney'
        },
        {
            id   : 'search',
            title: 'Search Player',
            icon: '#searchPerson'
        },
        {
            id   : 'robPerson',
            title: 'Rob Person',
            icon: '#robPlayer'
        },
        {
            id   : 'revive',
            title: 'CPR',
            icon: '#cpr'
        },
        {
            id   : 'police',
            title: 'MET Police',
            icon: '#metPolice', //was #more
            items: [
                {
                    id   : 'handcuff',
                    title: 'Handcuff',
                    icon: '#handcuff'
                },
                {
                    id   : 'drag',
                    title: 'Drag',
                    icon: '#drag'
                },
                {
                    id   : 'putincar',
                    title: 'Put in car',
                    icon: '#putInVehicle'
                },
                {
                    id   : 'gunshottest',
                    title: 'GSR Test',
                    icon : '#seizeWeapons'
                },
                {
                    id   : 'jail',
                    title: 'Jail',
                    icon : '#jail'
                },
                {
                    id   : 'requesttransport',
                    title: 'Transport',
                    icon : '#putInVehicle'
                },
                {
                    id   : 'seizeweapons',
                    title: 'Seize Weapons',
                    icon : '#seizeWeapons'
                },
                {
                    id   : 'seizeillegals',
                    title: 'Seize Illegals',
                    icon : '#seizeIllegal'
                },
            ]
        },
    ];

    var radioItems = [
        {
            id   : 'leaveRadio',
            title: 'Leave',
            icon: '#noentry'
        },
        {
            id   : 'toggleMute',
            title: 'Mute',
            icon: '#mute'
        },
        {
            id   : 'radioConfig',
            title: 'Setup',
            icon: '#cogs'
        },
    ];

    var vehicleMenu = undefined
    var pedMenu = undefined
    var radioMenu = undefined

    window.addEventListener('message', function(event){
        if(event.data.crosshair == true){
            $(".radial-crosshair").addClass('fadeIn');
        }

        if(event.data.crosshair == false){
            $(".radial-crosshair").removeClass('fadeIn');
        }

        if(event.data.openRadialMenu == true){
            if(event.data.type == "ped"){
                if (event.data.police == true) {
                    pedMenu = new RadialMenu({
                        parent      : document.getElementById("centerRadial"),
                        size        : 500,
                        closeOnClick: true,
                        menuItems   : pedItemsPolice,
                        onClick     : function (item) {
                            $.post('https://xtra/radialClick', JSON.stringify({
                                itemid: item.id,
                                entity: event.data.entityId
                            }));
                        }
                    });
                }else{
                    pedMenu = new RadialMenu({
                        parent      : document.getElementById("centerRadial"),
                        size        : 500,
                        closeOnClick: true,
                        menuItems   : pedItems,
                        onClick     : function (item) {
                            $.post('https://xtra/radialClick', JSON.stringify({
                                itemid: item.id,
                                entity: event.data.entityId
                            }));
                        }
                    });
                }
                pedMenu.open();

            }else if(event.data.type == "vehicle"){
                if (event.data.police == true) {
                    vehicleMenu = new RadialMenu({
                        parent      : document.getElementById("centerRadial"),
                        size        : 500,
                        closeOnClick: true,
                        menuItems   : vehicleItemsPolice,
                        onClick     : function (item) {
                            $.post('https://xtra/radialClick', JSON.stringify({
                                itemid: item.id,
                                entity: event.data.entityId
                            }));
                        }
                    });
                }else{
                    vehicleMenu = new RadialMenu({
                        parent      : document.getElementById("centerRadial"),
                        size        : 500,
                        closeOnClick: true,
                        menuItems   : vehicleItems,
                        onClick     : function (item) {
                            $.post('https://xtra/radialClick', JSON.stringify({
                                itemid: item.id,
                                entity: event.data.entityId
                            }));
                        }
                    });
                }
                vehicleMenu.open();
            }else if(event.data.type == "radios"){
                const channelItems = []
                for (var i = 0; i < event.data.wheelData.length; i++) {
                    const channelInfo = event.data.wheelData[i]
                    channelItems.push({
                        id   : 'radioChannel' + channelInfo[0],
                        title: channelInfo[1],
                        icon: '#wifi'
                    })
                }
                radioMenu = new RadialMenu({
                    parent      : document.getElementById("centerRadial"),
                        size        : 500,
                        closeOnClick: true,
                        menuItems   : [...channelItems, ...radioItems],
                        onClick     : function (item) {
                            $.post('https://xtra/radialClick', JSON.stringify({
                                itemid: item.id,
                            }));
                        }
                })
                radioMenu.open();
            }
        }
        if(event.data.closeRadialMenu == true){
            $(".radial-crosshair").removeClass('fadeIn').removeClass('active');
            $(".menu").removeClass('fadeIn');
            $.post('https://xtra/radialDisablenuifocus', JSON.stringify({
                nuifocus: false
            }));
            if (vehicleMenu != undefined) {
                vehicleMenu.close();
            }
            if (pedMenu != undefined) {
                pedMenu.close();
            }
            if (radioMenu != undefined) {
                radioMenu.close();
            }
            vehicleMenu = undefined
            pedMenu = undefined
            radioMenu = undefined
            document.getElementById("centerRadial").innerHTML = "";
        }
    });

    $(document).keypress(function(e){
        if(e.which == 101 && $(".menu").length > 0){
            $(".radial-crosshair").removeClass('fadeIn').removeClass('active');
            $(".menu").removeClass('fadeIn');
            $.post('https://xtra/radialDisablenuifocus', JSON.stringify({
                nuifocus: false
            }));
            if (vehicleMenu != undefined) {
                vehicleMenu.close();
            }
            if (pedMenu != undefined) {
                pedMenu.close();
            }
            if (radioMenu != undefined) {
                radioMenu.close();
            }
            vehicleMenu = undefined
            pedMenu = undefined
            radioMenu = undefined
            document.getElementById("centerRadial").innerHTML = "";
        }
    });
});

