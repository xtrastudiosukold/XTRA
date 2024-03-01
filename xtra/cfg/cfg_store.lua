local cfg = {}

cfg.items = {
    ["phone_number"] = {
        name = "Phone Number",
        description = "This item can be redeemed in the city hall.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["license_plate"] = {
        name = "License Plate",
        description = "This item can be redeemed in the city hall.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["1_money_bag"] = {
        name = "£1,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["2_money_bag"] = {
        name = "£2,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["5_money_bag"] = {
        name = "£5,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["10_money_bag"] = {
        name = "£10,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["20_money_bag"] = {
        name = "£20,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["30_money_bag"] = {
        name = "£30,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["100_money_bag"] = {
        name = "£100,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["250_money_bag"] = {
        name = "£250,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["500_money_bag"] = {
        name = "£500,000,000 Money Bag",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["melee_import"] = {
        name = "Melee Import",
        description = "To use this item open a Weapon Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["pistol_import"] = {
        name = "Pistol Import",
        description = "To use this item open a Weapon Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["shotgun_import"] = {
        name = "Shotgun Import",
        description = "To use this item open a Weapon Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["SMG_import"] = {
        name = "SMG Import",
        description = "To use this item open a Weapon Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["ar_import"] = {
        name = "Assault Rifle Import",
        description = "To use this item open a Weapon Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["sniper_import"] = {
        name = "Sniper Import",
        description = "To use this item open a Weapon Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["melee_whitelist"] = {
        name = "Melee Whitelist",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "gun_whitelist"
    },
    ["pistol_whitelist"] = {
        name = "Pistol Whitelist",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "gun_whitelist"
    },
    ["shotgun_whitelist"] = {
        name = "Shotgun Whitelist",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "gun_whitelist"
    },
    ["SMG_whitelist"] = {
        name = "SMG Whitelist",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "gun_whitelist"
    },
    ["ar_whitelist"] = {
        name = "Assault Rifle Whitelist",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "gun_whitelist"
    },
    ["sniper_whitelist"] = {
        name = "Sniper Whitelist",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "gun_whitelist"
    },
    ["echo_plus"] = {
        name = "ECHO Plus (30 Days)",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["echo_platinum"] = {
        name = "ECHO Platinum (30 Days)",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["supporter"] = {
        name = "Supporter",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supporter"
    },
    ["premium"] = {
        name = "Premium",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "premium"
    },
    ["supreme"] = {
        name = "Supreme",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supreme"
    },
    ["kingpin"] = {
        name = "King Pin",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "kingpin"
    },
    ["rainmaker"] = {
        name = "Rainmaker",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "rainmaker"
    },
    ["baller"] = {
        name = "Baller",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "baller"
    },
    ["supporter_to_premium"] = {
        name = "Supporter To Premium",
        manuallyRedeemable = true,
        canTransfer = true
    },
    ["supporter_to_supreme"] = {
        name = "Supporter To Supreme",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supporter_to_supreme"
    },
    ["supporter_to_kingpin"] = {
        name = "Supporter To King Pin",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supporter_to_kingpin"
    },
    ["supporter_to_rainmaker"] = {
        name = "Supporter To Rainmaker",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supporter_to_rainmaker"
    },
    ["supporter_to_baller"] = {
        name = "Supporter To Baller",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supporter_to_baller"
    },
    ["premium_to_supreme"] = {
        name = "Premium To Supreme",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "premium_to_supreme"
    },
    ["premium_to_kingpin"] = {
        name = "Premium To King Pin",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "premium_to_kingpin"
    },
    ["premium_to_rainmaker"] = {
        name = "Premium To Rainmaker",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "premium_to_rainmaker"
    },
    ["premium_to_baller"] = {
        name = "Premium To Baller",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "premium_to_baller"
    },
    ["supreme_to_kingpin"] = {
        name = "Supreme To King Pin",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supreme_to_kingpin"
    },
    ["supreme_to_rainmaker"] = {
        name = "Supreme To Rainmaker",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supreme_to_rainmaker"
    },
    ["supreme_to_baller"] = {
        name = "Supreme To Baller",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "supreme_to_baller"
    },
    ["kingpin_to_rainmaker"] = {
        name = "King Pin To Rainmaker",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "kingpin_to_rainmaker"
    },
    ["kingpin_to_baller"] = {
        name = "King Pin To Baller",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "kingpin_to_baller"
    },
    ["rainmaker_to_baller"] = {
        name = "Rainmaker To Baller",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "rainmaker_to_baller"
    },
    ["lock_slot"] = {
        name = "Lock Slot",
        description = "To use this item open a Ticket in the ECHO Support Tickets Discord.",
        manuallyRedeemable = false,
        canTransfer = true
    },
    ["import_slot"] = {
        name = "Import Slot",
        description = "To use this item as an import slot open a Ticket in the ECHO Support tickets Discord.",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "import_slot"
    },
    ["vip_car"] = {
        name = "VIP Vehicle",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "vip_car"
    },
    ["black_friday"] = {
        name = "Black Friday Special",
        manuallyRedeemable = true,
        canTransfer = true,
        args = "black_friday",
    },
    ["baller_id"] = {
        name = "Baller ID",
        manuallyRedeemable = false,
        canTransfer = false
    }
}

local vipCars = {
    ["bugatti"] = "Bugatti Veyron",
    ["lp770"] = "Lamborghini LP770",
    ["720s"] = "McLaren 720s",
    ["amv19"] = "Aston Martin 2019",
    ["f430s"] = "Ferrari F430s",
    ["gtoxx"] = "Ferrari GTOXX",
    ["rs7"] = "Audi RS7",
    ["acs8"] = "BMW i8",
    ["spyder"] = "Ferrari Spyder",
    ["bugatti2"] = "Buggatti Cheyron",
    ["windsor"] = "Bentley GT",
    ["650slw"] = "Mclaren 650slw",
    ["panamera18"] = "Porche Panamera 2018",
    ["italia458"] = "Ferrari 458",
    ["kamaz6396"] = "Kamaz 6396",
    ["m977l"] = "M977-L",
    ["m977t"] = "M977-T",
    ["zl12017"] = "Hennessey Camaro",
    ["superleggera"] = "Aston Martin Leggera",
    ["g63"] = "Mercedes G-Wagon",
    ["gt18"] = "Ford GT 2018",
    ["dawn"] = "Rolls Royce Dawn",
    ["havok"] = "Havok (100kg)",
    ["microlight"] = "MicroLight (100kg)",
}

local customCars = {
    ["Compacts"] = {
        ["fordstline"] = "Ford Focus StLine",
        ["fd2"] = "Honda FD2",
        ["deltaintegrale"] = "Lancia Delta HF Integrale EVO",
        ["a45amg"] = "Mercedes AXTRA A45 Edition One",
        ["macla"] = "Mercedes AXTRA A Class",
        ["lwcla45"] = "Mercedes CLA-45 RB",
        ["minilb"] = "Mini Cooper R56 GP",
        ["mcjcw20"] = "Mini Cooper JCW 2020",
        ["206lo"] = "Peugeot 206 Widebody",
        ["twizy"] = "Renault Twizy",
        ["rrobin"] = "Reliant Robin",
        ["vivio"] = "Subaru Vivio",
        ["subisti08"] = "Subaru WRX STI 2008",
        ["golfr"] = "Volkswagen Golf R",
        ["mk3"] = "Volkswagen Golf MK3 GTI",
        ["golfmk7"] = "Volkswagen Golf MK7",
        ["polos2018"] = "Volkswagen Polo Bodykit",
    },
    ["Coupes"] = {
        ["rs5r"] = "Audi RS5-R ABT",
        ["rs7c8"] = "Audi RS7 Sportback",
        ["m135i"] = "BMW M135i",
        ["m3kean"] = "BMW M3 E46 CSL",
        ["rmodm4gts"] = "BMW M4 GTS Liberty-Walk",
        ["rmodm4"] = "BMW M4 Widebody",
        ["m6f13"] = "BMW M6 F13",
        ["ap2"] = "Honda s2000",
        ["carlton"] = "Lotus Carlton 1989",
        ["mx5m"] = "Mazda MX5 Drift",
        ["fc3s"] = "Mazda RX7 FC3S",
        ["rmodamgc63"] = "Mercedes AXTRA C63S Coupe Widebody",
        ["c63sc"] = "Mercedes AXTRA C63s Coupe",
        ["amggtsmansory"] = "Mercedes AXTRA GT S Mansory",
        ["amggtr"] = "Mercedes AXTRA GTR 2017",
        ["wraithb"] = "Rolls Royce Wraith Black Badge"
    },
    ["Sedans"] = {
        ["aaq4"] = "Audi A4 Quattro ABT",
        ["a6avant"] = "Audi A6 Avant 2019",
        ["rs4b7b"] = "Audi RS4",
        ["rmodrs6"] = "Audi RS6 C8",
        ["rs615"] = "Audi RS6 Quattro",
        ["2015s3"] = "Audi S3",
        ["bmm"] = "Bentley Mulsanne Mulliner",
        ["e60"] = "BMW E60",
        ["e34touring"] = "BMW E34 Estate",
        ["mi8"] = "BMW i8 Coupe Mansaug",
        ["m3e36"] = "BMW M3 E36",
        ["m3f80"] = "BMW M3 F80",
        ["2019m5"] = "BMW M5 F90 2019",
        ["bm8c"] = "BMW M8 Gran Coupe Concept",
        ["x6m"] = "BMW X6M",
        ["750lix19"] = "BMW 750Li xDrive 2019",
        ["onebeast"] = "Cadillac Russian State Car",
        ["chevy10"] = "Chevrolet Silverado XXXL",
        ["16charger"] = "Dodge Charger Hellcat",
        ["chr20"] = "Dodge Charger Hellcat Blistein",
        ["forgiecat"] = "Dodge Charger Forgiato Widebody",
        ["mk6fiesta"] = "Ford Fiesta MK6",
        ["ghostbusters"] = "Ghostbusters",
        ["hondelsol"] = "Honda Del Sol",
        ["is350mod"] = "Lexus IS 350",
        ["mlmansory"] = "Maserati Levante Mansory",
        ["c63w205"] = "Mercedes AXTRA C63 S",
        ["a45b"] = "Mercedes AXTRA A45 Brabus",
        ["cla45sb"] = "Mercedes CLA-45",
        ["cls63"] = "Mercedes CLS 63 AXTRA",
        ["merclimo"] = "Mercedes CLA 45 AXTRA Limosuine",
        ["cls63s"] = "Mercedes CLS 63s",
        ["e63w213"] = "Mercedes E63",
        ["e63ss"] = "Mercedes E63s",
        ["merchearse"] = "Mercedes Herse",
        ["dzsb600"] = "Mercedes Maybach S600L",
        ["s600"] = "Mercedes Maybach S600",
        ["glendale"] = "Mercedes 190E 1990",
        ["evovaris"] = "Mitsubishi Lancer Evo X VARIS",
        ["rrphantom"] = "Rolls Royce Phantom",
        ["rlimo"] = "Rolls Royce Limo",
        ["models"] = "Tesla Model S",
        ["tmodel"] = "Tesla Model 3",
        ["cam8tun"] = "Toyota Camry",
        ["jzx100"] = "Toyota Chaser jzx100",
        ["volvo850r"] = "Volvo 850r"
    },
    ["Sports"] = {
        ["filthynsx"] = "Acura NSX Liberty Walk",
        ["atom"] = "Ariel Atom",
        ["rs5lb"] = "Audi RS5 LB",
        ["rs615"] = "Audi RS6 Quattro",
        ["rmodrs7"] = "Audi RS7 Sportback Widebody",
        ["rs72020"] = "Audi RS7 2020",
        ["sheepyr8tt"] = "Audi R8 Twin Turbo Sheepy Race",
        ["r8v10bk"] = "Audi R8 V10",
        ["tts"] = "Audi TTS",
        ["8c"] = "Alfa Romeo 8C",
        ["db11"] = "Aston Martin DB11",
        ["cyrus"] = "Aston Martin DB11 Cyrus Mansory",
        ["avalk"] = "Aston Martin Valkyrie",
        ["vulcan"] = "Aston Martin Vulcan",
        ["ast"] = "Aston Martin Vanquish",
        ["apollointensa"] = "Apollo Intensa",
        ["bac2"] = "Bac Mono",
        ["bexp"] = "Bentley EXP-10",
        ["bmwhommage"] = "BMW CSL Hommage R",
        ["m8gte"] = "BMW M8 GTE",
        ["e89"] = "BMW Z4 GT3",
        ["c7r"] = "Chevrolet Corvette C7R",
        ["c8"] = "Chevrolet Corvette C8",
        ["c8r"] = "Chevrolet Corvette C8R",
        ["c8c"] = "Chevrolet Corvette C8",
        ["dmc12"] = "Deloeran DMC",
        ["vip8"] = "Dodge Viper",
        ["hondacivictr"] = "Honda Civic Type R FK8",
        ["infq60"] = "Infiniti Q60",
        ["cx75"] = "Jaguar CX-75",
        ["jagpr8"] = "Jaguar XE SVR Project 8",
        ["xkgt"] = "Jaguar XKR-S",
        ["ktmx"] = "KTM Xbow",
        ["exige12"] = "Lotus Exige 2012",
        ["alfieri"] = "Maserati Alfieri",
        ["amggtsprior"] = "Mercedes AXTRA GT S Prior",
        ["rmodgt63"] = "Mercedes GT63 S Coupe",
        ["slr"] = "Mercedes SLR",
        ["slsrbs"] = "Mercedes SLS AXTRA",
        ["benzsl63"] = "Mercedes SL 63 AXTRA",
        ["eclipse"] = "Mitsubishi Eclipse",
        ["rmodgtr"] = "Nissan GT-R Widebody",
        ["gtrgt3"] = "Nissan GT-R Nismo GT3",
        ["nismo20"] = "Nissan GT-R Nismo",
        ["lwgtr"] = "Nissan LW-GTR",
        ["z15badmeetsevil"] = "Nissan Silvia S15 Evil",
        ["silvia"] = "Nissan Silvia S15",
        ["jgtc34"] = "Nissan Skyline GT-R Bridgestone",
        ["s13one"] = "Nissan S13 Onevia",
        ["180326"] = "Nissan 180sx 2JZ ",
        ["370z"] = "Nissan 370Z",
        ["slingshot"] = "Polaris Slingshot SL",
        ["panamera17turbo"] = "Porsche Panamera Turbo 17",
        ["gt2rsmr"] = "Porsche 911 GT2 RS",
        ["radiantvff"] = "Radiant Vff",
        ["renaultm"] = "Renault M Sport",
        ["ms1"] = "Saleen S1 Mansaug",
        ["skylinegtr32"] = "Skyline GTR-32",
        ["mlec"] = "Subaru Evolution X",
        ["supra2"] = "Toyota Supra JZA80",
        ["gt86"] = "Toyota GT-86",
        ["gt86panv2"] = "Toyota GT-86 Rocketbuny v2",
        ["gt86lb"] = "Toyota GT-86 Liberty Walk",
        ["zenvo"] = "Zenvo TS1 GT"
    },
    ["Sports Classics"] = {
        ["royale"] = "Bugatti Type 41",
        ["eldorado59"] = "Cadillac Eldorado 1959",
        ["impalass2"] = "Chevrolet Impala SS",
        ["cord812"] = "Cord 812",
        ["airflow"] = "Chrysler Airflow",
        ["zach375"] = "Ferrari 375 F1 1950",
        ["cali57"] = "Ferrari 250 California 1957",
        ["f288gto"] = "Ferrari 288 GTO 1984",
        ["fordeh2"] = "Ford Escort Hoonigan",
        ["fordt12"] = "Ford Model T",
        ["civiceg6"] = "Honda Civic Gen5",
        ["nsx3"] = "Honda NSX",
        ["nsexrb"] = "Honda NSX Rocket Bunny",
        ["etype"] = "Jaguar E-Type",
        ["jwhotrod"] = "Jeep Willys Hot Rod",
        ["kr200"] = "Kabinenroller 200",
        ["type60"] = "Maserati Type 60",
        ["na6"] = "Mazda MX5",
        ["mx5rb"] = "Mazda MX5 Rocket Bunny",
        ["rx7"] = "Mazda RX7",
        ["rx71"] = "Mazda RX7 RB",
        ["mb300sl"] = "Mercedes 300 1954",
        ["993rwb"] = "Porsche 911 GT-2 1992 RWB",
        ["btype33"] = "Roosevelt Valor",
        ["hgasser"] = "Vapid Hustler Gasser",
        ["mk1rabbit"] = "Volkswagen Golf MK1 Rabbit",
        ["v242x"] = "Volvo 242 Modded"
    },
    ["Supers"] = {
        ["rmodi8mlb"] = "BMW i8m Liberty Walk",
        ["bcps"] = "Bugatti Chiron",
        ["centuria"] = "Bugatti Centuria Mansory",
        ["bdivo"] = "Bugatti Divo",
        ["eb110"] = "Bugatti EB110 Super Sport",
        ["mig"] = "Ferrari Enzo",
        ["fxxkevo"] = "Ferrari FXXK Evo",
        ["gtc4"] = "Ferrari GTC4 Lusso",
        ["aperta"] = "Ferrari (La Ferrari) Aperta",
        ["monza"] = "Ferrari Monza",
        ["p80c"] = "Ferrari P80-C",
        ["sf90"] = "Ferrari SF90",
        ["fgt2"] = "Ferrari 458 Italia",
        ["pistas"] = "Ferrari 488 Pista",
        ["ferrari812"] = "Ferrari 488 F812",
        ["458mishadesign"] = "Ferrari 458 Italia Misha Design",
        ["apollos"] = "Gumpert Apollo S",
        ["xnsgt"] = "Hennessey Venom F5",
        ["it18"] = "Italdesign Zerouno",
        ["agerars"] = "Koenigsegg Agera RS",
        ["jes"] = "Koenigsegg Jesko 2020",
        ["regera16"] = "Koenigsegg Regera 2016 SE",
        ["regera"] = "Koeniggseg Regera",
        ["asterion"] = "Lamborghini Asterion",
        ["lb750sv"] = "Lamborghini Aventador LP750SV",
        ["lamboavj"] = "Lamborghini Aventador SVJ",
        ["aventwide"] = "Lamborghini Aventador LB",
        ["zentenario"] = "Lamborghini Centenario Z-Type Widebody",
        ["lget"] = "Lamborghini Gallardo LP570-4 Superleggera",
        ["gallardop"] = "Lamborghini Gallardo Spyder",
        ["huracanst"] = "Lamborghini Huracan Trofeo",
        ["lhgt3"] = "Lamborghini Huracan GT3",
        ["lp610"] = "Lamborghini Huracan Spyder",
        ["nimbul"] = "Lamborghini Huracan Nimbul",
        ["18performante"] = "Lamborghini Performante 2018",
        ["vesper"] = "Lamborghini Murcielago Vesper",
        ["reventon"] = "Lamborghini Reventon",
        ["sc18"] = "Lamborghini SC18 Alston",
        ["sian2"] = "Lamborghini Sian",
        ["sianr"] = "Lamborghini Sian Roadster",
        ["callatic"] = "Lamborghini Veneno",
        ["ligierlmp2"] = "Ligier JS P2",
        ["mcgt4"] = "Maserati MC-GT4",
        ["evantram"] = "Mazzanti Evantra",
        ["furaiv"] = "Mazda Furai",
        ["mazdasuper"] = "Mazda Super Concept",
        ["787b"] = "Mazda 787B",
        ["600lt"] = "McLaren 600LT 2019",
        ["f1"] = "Mclaren F1",
        ["rmp4"] = "McLaren MP4",
        ["msohs"] = "McLaren MSO HS",
        ["mcst"] = "McLaren Speedtail",
        ["p1"] = "McLaren P1",
        ["p1lm"] = "McLaren P1 GTR",
        ["winalot"] = "Mercedes AXTRA CLK GTR 1999",
        ["zoomertorno"] = "Mercedes AXTRA P1 Alpha",
        ["clklm"] = "Mercedes CLK-LM",
        ["sbc9"] = "Mercedes Sauber",
        ["moss"] = "Mercedes SLR Stirling Moss",
        ["huayrar"] = "Pagani Huayra Roadster",
        ["zondar"] = "Pagani Zonda R",
        ["ktkzr"] = "Pagani Zonda R Khattakay",
        ["tricolore"] = "Pagani Zonda Tricolore",
        ["boxterlb"] = "Porsche Boxter Widebody",
        ["cgt"] = "Porsche Carrera GT",
        ["porgt3"] = "Porsche GT3 RS",
        ["surge"] = "Porsche Mission-E",
        ["turbos"] = "Porsche Turbo S Moshammer",
        ["str20"] = "Porsche 911 Speedster",
        ["pts21"] = "Porsche 911 Turbo S",
        ["918"] = "Porsche 918 Spyder",
        ["p935"] = "Porsche 935",
        ["992t"] = "Porsche 992 Turbo",
        ["rimac"] = "Rimac Concept One",
        ["rct2"] = "Rimac Concept 2020",
        ["rmodscg003s"] = "Scuderia Cameron SCG 003",
        ["tr22"] = "Tesla Roadster 2020",
        ["idr"] = "Volkswagen IDR",
        ["zn20"] = "Zenvo TSR"
    },
    ["Muscle"] = {
        ["amxss"] = "AMC AMX SS",
        ["czl1"] = "Chevrolet Camaro ZL1",
        ["z2879"] = "Chevrolet Camaro z28 1979",
        ["hemi"] = "Dodge Charger Hemi",
        ["rt70"] = "Dodge Charger 1970",
        ["challanger15"] = "Dodge Challenger",
        ["demon"] = "Dodge Challenger SRT",
        ["fordcapri"] = "Ford Capri Zakspeed",
        ["13fmb302"] = "Ford Mustang Boss 302",
        ["boss429"] = "Ford Mustang Boss 429",
        ["mst"] = "Ford Mustang GT NFS",
        ["19gt500"] = "Ford Mustang Shelby 2020",
        ["gt500wide"] = "Ford Mustang Shelby GT 500 Wide",
        ["mustang65"] = "Ford Mustang 1965",
        ["rattfukt"] = "Ratty Ratloader"
    },
    ["Offroad"] = {
        ["buggybaja"] = "Baja Buggy",
        ["baja"] = "Beetle Offroad",
        ["1500dj"] = "Chevrolet Silverado 1500",
        ["13tahoe"] = "Chevrolet Tahoe",
        ["charge4"] = "Dodge Charger Offroad",
        ["raid"] = "Dodge Challenger Raid",
        ["megaram"] = "Dodge Mega Ram 3500",
        ["19ramoffroad"] = "Dodge Ram 2019",
        ["trx"] = "Dodge Ram 1500 Rebel TRX",
        ["pabsram"] = "Dodge Ram 2500",
        ["dukes3"] = "Dukes Trophy Truck",
        ["mallcrawler"] = "Ford Bronco Mallcrawler 1972",
        ["bc78bronco"] = "Ford Bronco Lifted",
        ["f150"] = "Ford F-150 SVT Raptor R",
        ["velociraptor"] = "Ford Hennessey Velociraptor",
        ["gtoffroad"] = "Ford Mustang Offroad",
        ["raptor2017"] = "Ford Velociraptor 2017",
        ["gmck"] = "GMC Sierra 2500",
        ["k5"] = "Hoonigan Baldwin",
        ["cherokee1"] = "Jeep Cherokee 1984",
        ["wagoneer"] = "Jeep Grand Wagoneer",
        ["trailcat"] = "Jeep Wrangler Trailcat",
        ["xjcrawler"] = "Jeep XJ 1984",
        ["ensenada"] = "Karin Ensenada",
        ["lrdef17"] = "Land Rover Defender",
        ["def90"] = "Land Rover Defender 90",
        ["dubsta3"] = "Land Rover Spectre",
        ["lr110"] = "Land Rover 110",
        ["17ram3500"] = "Dodge Ram 3500",
        ["luazb"] = "Luaz on Tracks",
        ["statesmen2"] = "Mercedes G65 6x6",
        ["gronos6x6"] = "Mercedes Gronos 6x6 Mansory",
        ["whiz"] = "Mercedes 190e Offroad",
        ["nissantitan17"] = "Nissan Titan 17",
        ["polaris"] = "Polaris Buggy",
        ["sandking200"] = "Sandking HD Monster Dually",
        ["slam4x4"] = "Vapid Slamvan 4x4"
    },
    ["SUVs"] = {
        ["sq72016"] = "Audi SQ7 2016",
        ["urus"] = "Bentley Bentayga Lumma",
        ["bentaygam"] = "Bentley Bentayga Mansory",
        ["bentaygast"] = "Bentley Bentayga StarTech",
        ["bentayga17"] = "Bentley Bentayga 2017",
        ["x5m"] = "BMW X5M",
        ["x6hamann"] = "BMW X6 Hamann",
        ["esv"] = "Cadillac Escalade ESV",
        ["cesc21"] = "Cadillac Escalade 2021",
        ["fordexp2020"] = "Ford Explorer ST",
        ["mache"] = "Ford Mustang Mach-E",
        ["fpacehm"] = "Jaguar F-PACE",
        ["trhawk"] = "Jeep Grand Cherokee Trackhawk",
        ["fx4"] = "Land Rover Discovery 4",
        ["b63s"] = "Mercedes Brabus B63s",
        ["urus2018"] = "Lamborghini Urus 2018",
        ["urustopcar"] = "Lamborghini Urus Topcar Design",
        ["wald2018"] = "Lexus LX570 2018",
        ["mb400"] = "Mercedes EQC400",
        ["4444"] = "Mercedes G-Class Brabus 700",
        ["g800brabus4x4"] = "Mercedes G63 BRABUS 4x4",
        ["g6mg"] = "Mercedes G63 Gronos Mansory",
        ["g770"] = "Mercedes G63 Lumma CLR G770",
        ["mbgle"] = "Mercedes GLE 450",
        ["gls63"] = "Mercedes GLS63",
        ["duffieldvan"] = "Mercedes V250 Bluetec",
        ["xclass"] = "Mercedes X-Class 2018",
        ["cayenne"] = "Porsche Cayenne",
        ["cayenneturbo"] = "Porsche Cayenne Turbo 2018",
        ["tulenis"] = "Nissan Patrol Nismo",
        ["macan"] = "Porsche Macan Turbo",
        ["rstech"] = "Range Rover Sport Startech",
        ["18svr"] = "Range Rover Sport SVR 2018",
        ["18velar"] = "Range Rover Velar 2019",
        ["rrstart"] = "Range Rover Vogue StarTech",
        ["teslax"] = "Tesla Model X",
        ["p90d"] = "Tesla Model X UP",
        ["volvoxc90"] = "Volvo XC 90 "
    },
    ["Vans"] = {
        ["chevycandy"] = "Chevrolet Express",
        ["woodyvan"] = "Chevrolet GMC",
        ["tgfvan"] = "Childish Icecream Van",
        ["berlingo"] = "Citroen Berlingo",
        ["p600coca"] = "Coca Cola Van",
        ["17jamb"] = "Fleetwood Jamboree RV",
        ["fordconnect"] = "Ford Connect",
        ["e15082"] = "Ford E-150",
        ["econoline"] = "Ford Econoline",
        ["trannysport"] = "Ford Transit Sport",
        ["ateam"] = "GMC Vandura 1983",
        ["youga22"] = "Mercedes Sprinter",
        ["thomastruck"] = "Mercedes Sprinter Airstream",
        ["refluxsprint"] = "Mercedes Sprinter Amber",
        ["sprinter211"] = "Mercedes Sprinter 211 CDI",
        ["sprinter2020"] = "Mercedes Sprinter 313",
        ["mercvan"] = "Mercedes Utility Vito",
        ["vito"] = "Mercedes Vito",
        ["peugotvan2"] = "Peugeot Bipper",
        ["boxvan"] = "Peugeot Box Panel Van",
        ["expertpeug"] = "Peugeot Expert",
        ["pedalbeer"] = "Pedal Beer Bus",
        ["apecar50"] = "Piaggio Ape 50",
        ["kangoo"] = "Renault Kangoo",
        ["master"] = "Renault Master",
        ["ukvan"] = "Renault Trafic 2013",
        ["steed3"] = "Vapid Steed 1500 Utility",
        ["nspeedo"] = "Vapid Speedo Express",
        ["minivan22"] = "Volswagen Caddy Rotterdam",
        ["crafter"] = "Volkswagen Crafter",
        ["crafter17"] = "Volkswagen Crafter 2017",
        ["68trans"] = "Volkswagen Transporter 1960",
        ["yougat"] = "Youga Turbo Van",
        ["transvan2"] = "Transit Van"
    },
    ["Trucks"] = {
        ["terl300"] = "Benefactor L300",
        ["coach1"] = "Dashhound Coach",
        ["unimog"] = "Mercedes Unimog",
        ["tractorc"] = "Stanley Tractor",
        ["foxct"] = "Tesla Cyber Truck",
        ["zil130"] = "ZiL-130"
    },
    ["Motorcycles"] = {
        ["mxv450sm"] = "Aprilia MXV",
        ["bmws"] = "BMW S1000 RR",
        ["bm1100r"] = "BMW 1100R",
        ["p51"] = "Confederate P51 Combat",
        ["serv_electricscooter"] = "Electric Scooter",
        ["harley1"] = "Harley Davidson Fat Boy",
        ["hvrod"] = "Harley Davidson Cubic",
        ["na25"] = "Harley Davidson Road King",
        ["hcbr17"] = "Honda CBR1000RR",
        ["hondacrf"] = "Honda CRF450R",
        ["crf450r"] = "Honda CRF450RX",
        ["cbr1000rrr"] = "Honda CBR 1000RR",
        ["kx450f"] = "Kawasaki KX450F",
        ["ninja300"] = "Kawasaki Ninja 300",
        ["ninjah2"] = "Kawasaki Ninja H2",
        ["zx10r"] = "Kawasaki ZX10R",
        ["sxf450"] = "KTM 450 SXF",
        ["exc530"] = "KTM EXC 530",
        ["verin"] = "LCC Verin",
        ["remower"] = "Lawnmower",
        ["blazer4"] = "Mobility Scooter",
        ["skart"] = "Nagasaki Shopping Kart",
        ["purequad"] = "Pure Quad",
        ["rmzsm"] = "Suzuki RMZ SM",
        ["tmaxdx"] = "Yamaha TMAX DX",
        ["yz250f"] = "Yamaha YZ250F",
        ["yz450f"] = "Yamaha YZ450F",
        ["kart"] = "Nagasaki Kart",
        ["foxcq"] = "Tesla Quad"
    },
    ["Police Vehicles"] = {
        ["polar"] = "Alfa Romeo Giulia Unmarked",
        ["poltt"] = "Audi TT RS Unmarked",
        ["polaudia3"] = "Audi A3 Unmarked",
        ["chrisa6"] = "Audi A6 Unmarked",
        ["polq7"] = "Audi Q7 Unmarked",
        ["polrs6marked"] = "Audi RS6 Marked",
        ["charlzunmark"] = "Audi S4 Avant Unmarked",
        ["rs5pd"] = "Audi S5 Unmarked",
        ["i3unmarked"] = "BMW i3 Unmarked",
        ["polx1"] = "BMW X1 Unmarked",
        ["redsco19"] = "BMW X3 DPG Marked",
        ["polx5u"] = "BMW X5 Unmarked",
        ["bmw12018"] = "BMW 1 Series Marked",
        ["pol1series"] = "BMW 1 Series Unmarked",
        ["530d"] = "BMW 530d Unmarked",
        ["polz1"] = "Chevrolet Carmaro Z1 Unmarked",
        ["unmarkedcobalt"] = "Chevrolet Cobalt Unmarked",
        ["grangerpd"] = "Declasse Granger Unmarked",
        ["polcharger"] = "Dodge Charger Unmarked",
        ["unmarkedsrt"] = "Dodge SRT Durango Unmarked",
        ["polram"] = "Dodge Ram Unmarked",
        ["polforde"] = "Ford Estate Unmarked",
        ["focushatch"] = "Ford Focus Unmarked",
        ["polf150"] = "Ford F-150 Marked",
        ["polundercoverford"] = "Ford F-150 Raptor Unmarked",
        ["polexplorer"] = "Ford Police Interceptor Utility",
        ["polapex"] = "Ford Mustang Unmarked",
        ["polmustang"] = "Ford Mustang Marked",
        ["polfordf"] = "Ford ST Unmarked",
        ["taupol"] = "Ford Taurus Unmarked",
        ["poltransit"] = "Ford Transit Marked",
        ["polhonda"] = "Honda Odyssey Unmarked",
        ["splinthauler"] = "Iveco Stralis Unmarked",
        ["polfpaceunmarked"] = "Jaguar F-Pace Marked",
        ["poljagun"] = "Jaguar XE-S Unmarked",
        ["poltrackhawk"] = "Jeep Cherokee Marked",
        ["pollandrovermarked"] = "Land Rover Sport Marked",
        ["polmaserati"] = "Maserati Ghibli Marked",
        ["nbk"] = "Mercedes AXTRA A45 Unmarked",
        ["polc63"] = "Mercedes AXTRA C63 Unmarked",
        ["unmarkedcla"] = "Mercedes AXTRA CLA Unmarked",
        ["poleclass"] = "Mercedes E-Class Unmarked",
        ["s500unmarked"] = "Mercedes S500 Unmarked",
        ["splintoffroad"] = "Mitsubishi Triton Unmarked",
        ["polsubi"] = "Mitsubishi WRX Unmarked",
        ["pdpong8"] = "Pontiac G8 GXP",
        ["newrange"] = "Range Rover Vogue Marked",
        ["rrsportpol"] = "Range Rover Sport Unmarked",
        ["poloctavia"] = "Skoda Octavia Unmarked",
        ["poltesla1"] = "Tesla Model S",
        ["lspdtru"] = "Tru Granger Unmarked",
        ["celicapd"] = "Toyota Celica Unmarked",
        ["unmarkedsupra"] = "Toyota Supra Unmarked",
        ["tundrap"] = "Toyota Tundra Unmarked",
        ["umkscout"] = "Vapid Scout Cruiser",
        ["poldominator"] = "Vapid Dominator Unmarked",
        ["vectraunmarked"] = "Vauxhall Vectra Unmarked",
        ["vwpassat"] = "Volkswagen Passat",
        ["polpolo"] = "Volkswagen Polo R-line Police Unmarked",
        ["polsuv2"] = "Volvo XC90 Unmarked"
    },
    ["Helicopters"] = {
        ["valkyrie"] = "Norweign Sea King",
        ["axiomz"] = "MH-X Ghost Hawk",
        ["uh1mash"] = "UH-1H",
        ["littlebird"] = "Little Bird MH6",
        ["knighthawk"] = "Knighthawk",
        ["polisheli"] = "Polis Heli",
        ["rcmavic"] = "DJI Mavic Pro",
        ["ka60"] = "Ka-60",
        ["polmav1"] = "Swedish Police EC",
        ["nh90"] = "NH90",
        ["seaknight"] = "CH-46E Seaknight",
        ["foxch47"] = "Chinook Special Operations",
        ["osprey"] = "CV-22B Osprey",
        ["seastallion"] = "Sea Stallion",
        ["aw139"] = "AW-39 Westpac",
        ["kch53"] = "Sikorsky CH-53",
        ["pavelow"] = "MH-53J Pavelow",
        ["ems_djim600"] = "Matrice 600 Drone"
    },
    ["Aircraft"] = {
        ["f4blu"] = "F-4 Phantom II",
        ["779x"] = "Boeing 777-9X",
        ["jet2"] = "Jet Classic 747-300",
        ["blackbird"] = "Black Bird",
        ["747sp"] = "Boeing 747SP",
        ["crj900"] = "Bombardier CRJ-900",
        ["p180"] = "Piaggio P-180 Avanti",
        ["yf23"] = "YF-23"
    }
}

cfg.vehicleCategoryToPermissionLookup = {
    ["Police Vehicles"] = "cop.whitelisted",
    ["Helicopters"] = "vip.airgarage",
    ["Aircraft"] = "vip.airgarage"
}

local function buildVIPCarArgument(number)
    return {
        name = "VIP Car " .. tostring(number),
        description = "Select the VIP car to be added to your garage.",
        field = "vipCar" .. tostring(number),
        type = "vehicleList",
        items = vipCars,
        allowEmpty = false,
        allowEmptyIfError = true
    }
end

local function buildCustomCarArgument(number)
    return {
        name = "Custom Car " .. tostring(number),
        description = "Select the custom car to be added to your garage. Leave empty to recieve an import slot instead.",
        field = "customCar" .. tostring(number),
        type = "vehicleList",
        items = customCars,
        allowEmpty = true,
        allowEmptyIfError = false,
        emptyText = "~y~Import Slot"
    }
end

cfg.argsTemplate = {
    ["gun_whitelist"] = {
        {
            name = "Access Code",
            description = "The six digit code you was provided by the gun owner.",
            field = "accessCode",
            type = "string",
            minLength = 6,
            maxLength = 6
        }
    },
    ["supporter"] = {
        buildVIPCarArgument(1)
    },
    ["premium"] = {
        buildVIPCarArgument(1)
    },
    ["supreme"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2)
    },
    ["kingpin"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildCustomCarArgument(1)
    },
    ["rainmaker"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildVIPCarArgument(3),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3)
    },
    ["baller"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildVIPCarArgument(3),
        buildVIPCarArgument(4),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3),
        buildCustomCarArgument(4),
        buildCustomCarArgument(5)
    },
    ["supporter_to_supreme"] = {
        buildVIPCarArgument(1)
    },
    ["supporter_to_kingpin"] = {
        buildVIPCarArgument(1),
        buildCustomCarArgument(1)
    },
    ["supporter_to_rainmaker"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3)
    },
    ["supporter_to_baller"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildVIPCarArgument(3),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3),
        buildCustomCarArgument(4)
    },
    ["premium_to_supreme"] = {
        buildVIPCarArgument(1)
    },
    ["premium_to_kingpin"] = {
        buildVIPCarArgument(1),
        buildCustomCarArgument(1)
    },
    ["premium_to_rainmaker"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3)
    },
    ["premium_to_baller"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildVIPCarArgument(3),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3),
        buildCustomCarArgument(4)
    },
    ["supreme_to_kingpin"] = {
        buildCustomCarArgument(1)
    },
    ["supreme_to_rainmaker"] = {
        buildVIPCarArgument(1),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3)
    },
    ["supreme_to_baller"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3),
        buildCustomCarArgument(4)
    },
    ["kingpin_to_rainmaker"] = {
        buildVIPCarArgument(1),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2)
    },
    ["kingpin_to_baller"] = {
        buildVIPCarArgument(1),
        buildVIPCarArgument(2),
        buildCustomCarArgument(1),
        buildCustomCarArgument(2),
        buildCustomCarArgument(3)
    },
    ["rainmaker_to_baller"] = {
        buildVIPCarArgument(1),
        buildCustomCarArgument(1)
    },
    ["import_slot"] = {
        {
            name = "Custom Car",
            description = "Select the custom car to be added to your garage.",
            field = "customCar",
            type = "vehicleList",
            items = customCars,
            allowEmpty = false,
            allowEmptyIfError = false
        }
    },
    ["vip_car"] = {
        {
            name = "VIP Car",
            description = "Select the VIP car to be added to your garage.",
            field = "vipCar",
            type = "vehicleList",
            items = vipCars,
            allowEmpty = false,
            allowEmptyIfError = false
        }
    },
    ["black_friday"] = {
        buildCustomCarArgument(1),
        buildCustomCarArgument(2)
    }
}

return cfg