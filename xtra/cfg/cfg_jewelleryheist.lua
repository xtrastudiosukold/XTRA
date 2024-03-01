
local cfg = {
    jewelrySellLocs = {
        {coords = vector3(182.7134552002,-1319.4260253906,29.316925048828)}
    },

    jewelryItems = {
        {name = "Gold Ring", spawnName = "jewelry_ring", sellPrice = 30000},
        {name = "Gold Watch", spawnName = "jewelry_watch", sellPrice = 50000},
        {name = "Gold Necklace", spawnName = "jewelry_necklace", sellPrice = 100000},
        {name = "Sapphire", spawnName = "sapphire", sellPrice = 300000},
    },

    aiMissionTeleporterEnter = vector3(2695.2370605469,1613.9442138672,24.528381347656),
    aiMissionTeleporterExit = vector3(2154.7629394531,2921.0078125,-81.075508117676),

    hackDoorCoords = vector3(-629.20068359375,-230.68086242676,37.097064056396),
    hackComputerCoords = vector3(-631.40637207031,-230.25004577637,37.097056427002),

    enterTeleporterCoords = vector3(-620.69567871094,-224.75303649902,38.056915283203),
    exitTeleporterCoords = vector3(-618.21313476563,-242.56474304199,52.785148620605),

    aiSpawnLocs = {
        {coords = vector3(2165.6018066406,2923.2263183594,-81.075332641602), heading = 92.75, weaponHash = `weapon_pistol`},
        {coords = vector3(2165.2802734375,2918.5341796875,-81.075309753418), heading = 92.75, weaponHash = `weapon_appistol`},
        {coords = vector3(2179.0979003906,2918.5170898438,-81.075180053711), heading = 260.0, weaponHash = `weapon_snspistol`},
        {coords = vector3(2178.0676269531,2924.8674316406,-81.075256347656), heading = 316.0, weaponHash = `weapon_mosin`},
        {coords = vector3(2185.1748046875,2928.6281738281,-84.800033569336), heading = 280.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2185.1948242188,2913.3120117188,-84.799728393555), heading = 260.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2150.9968261719,2913.3540039063,-84.800033569336), heading = 92.41, weaponHash = `weapon_pistol`},
        {coords = vector3(2150.9709472656,2928.521484375,-84.800048828125), heading = 84.0, weaponHash = `weapon_appistol`},
        {coords = vector3(2103.1206054688,2940.8679199219,-84.794219970703), heading = 270.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2102.1069335938,2901.1665039063,-84.793167114258), heading = 270.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2056.5246582031,2900.1333007813,-84.793159484863), heading = 270.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2057.095703125,2941.4592285156,-84.793640136719), heading = 270.0, weaponHash = `weapon_pistol`},
        {coords = vector3(1996.3237304688,2941.9567871094,-84.793266296387), heading = 270.0, weaponHash = `weapon_pistol`},
        {coords = vector3(1997.9401855469,2899.4775390625,-84.793159484863), heading = 270.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2225.40234375,2902.1325683594,-84.80004119873), heading = 78.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2225.6057128906,2939.0493164063,-84.79320526123), heading = 78.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2278.2963867188,2941.9301757813,-84.793167114258), heading = 78.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2279.1010742188,2900.1713867188,-84.793174743652), heading = 78.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2332.3215332031,2899.9912109375,-84.800048828125), heading = 78.0, weaponHash = `weapon_pistol`},
        {coords = vector3(2330.318359375,2942.0668945313,-84.794036865234), heading = 78.0, weaponHash = `weapon_pistol`},
    },

    hackingDevicePickupLocs = {
        {coords = vector3(1990.5128173828,2946.1826171875,-84.724319458008), h = 1.67},
        {coords = vector3(2005.1832275391,2937.3654785156,-84.719268798828), h= 178.78},
        {coords = vector3(1990.1772460938,2929.521484375,-84.724319458008), h = 0.26},
        {coords = vector3(2026.8342285156,2920.7255859375,-84.724319458008), h = 179.61},
        {coords = vector3(2028.5406494141,2895.7878417969,-84.724304199219), h = 2.25},
        {coords = vector3(2048.3737792969,2920.8569335938,-84.724319458008), h = 2.25},
        {coords = vector3(2048.4270019531,2937.6220703125,-84.724319458008), h = 2.25},
        {coords = vector3(2068.3200683594,2937.5151367188,-84.719276428223), h = 2.25},
        {coords = vector3(2101.017578125,2945.5122070313,-84.719268798828), h = 168.3},
        {coords = vector3(2094.0563964844,2929.3361816406,-84.719268798828), h = 0.38},
        {coords = vector3(2095.7863769531,2912.5561523438,-84.724319458008), h = 0.38},
        {coords = vector3(2118.6364746094,2899.4211425781,-84.719268798828), h = 191.54},
        {coords = vector3(2134.3518066406,2920.7912597656,-84.724319458008), h = 180.82},
        {coords = vector3(2177.0837402344,2906.876953125,-84.724319458008), h = 349.95},
        {coords = vector3(2200.2209472656,2929.8051757813,-84.719261169434), h = 187.78},
        {coords = vector3(2217.2043457031,2899.5544433594,-84.724311828613), h = 349.1},
        {coords = vector3(2229.9150390625,2897.1125488281,-84.719276428223), h = 171.66},
        {coords = vector3(2227.6826171875,2920.9702148438,-84.724327087402), h = 0.52},
        {coords = vector3(2243.8439941406,2929.482421875,-84.724327087402), h = 0.52},
        {coords = vector3(2265.9758300781,2945.9692382813,-84.724319458008), h = 181.12},
        {coords = vector3(2267.8522949219,2920.9775390625,-84.719276428223), h = 180.79},
        {coords = vector3(2287.8366699219,2904.0432128906,-84.724311828613), h = 179.87},
        {coords = vector3(2327.6418457031,2904.3488769531,-84.719276428223), h = 179.87},
        {coords = vector3(2345.8742675781,2929.3190917969,-84.724319458008), h = 179.87},
        {coords = vector3(2351.1596679688,2904.4291992188,-84.724319458008), h = 359.02}
    },

    jewelryCases = {
        [1] = {modelHash = `des_jewel_cab2_start`, coords = vector3(-626.40020751953,-239.0104675293,38.943701934814), heading = 218.2},
        [2] = {modelHash = `des_jewel_cab3_start`, coords = vector3(-625.36267089844,-238.27844238281,38.943701934814), heading = 218.2},
        [3] = {modelHash = `des_jewel_cab_start`, coords = vector3(-627.61456298828,-234.36140441895,38.943701934814), heading = 217.62},
        [4] = {modelHash = `des_jewel_cab_start`, coords = vector3(-626.48992919922,-233.58406066895,38.943701934814), heading = 217.62},
        [5] = {modelHash = `des_jewel_cab4_start`, coords = vector3(-626.12249755859,-234.05964660645,38.943701934814), heading = 37.82},
        [6] = {modelHash = `des_jewel_cab3_start`, coords = vector3(-627.15649414063,-234.8741607666,38.943701934814), heading = 37.82},
        [7] = {modelHash = `des_jewel_cab_start`, coords = vector3(-622.59704589844,-232.66456604004,38.943701934814), heading = 305.52},
        [8] = {modelHash = `des_jewel_cab4_start`,coords = vector3(-620.55017089844,-232.9239654541,38.943701934814), heading = 38.18},
        [9] = {modelHash = `des_jewel_cab_start`, coords = vector3(-620.10595703125,-230.65397644043,38.943701934814), heading = 125.94},
        [10] = {modelHash = `des_jewel_cab3_start`, coords = vector3(-621.47985839844,-228.9697265625,38.943701934814), heading = 125.94},
        [11] = {modelHash = `des_jewel_cab2_start`, coords = vector3(-623.63726806641,-228.60426330566,38.943701934814), heading = 215.55},
        [12] = {modelHash = `des_jewel_cab4_start`,coords = vector3(-624.01428222656,-230.8136138916,38.943701934814), heading = 305.43},
        [13] = {modelHash = `des_jewel_cab_start`, coords = vector3(-619.81024169922,-234.89282226563,38.943701934814), heading = 219.74},
        [14] = {modelHash = `des_jewel_cab3_start`, coords = vector3(-618.83856201172,-234.23609924316,38.943701934814), heading = 219.74},
        [15] = {modelHash = `des_jewel_cab2_start`, coords = vector3(-617.14691162109,-230.10830688477,38.943701934814), heading = 305.18},
        [16] = {modelHash = `des_jewel_cab3_start`, coords = vector3(-617.85931396484,-229.14646911621,38.943701934814), heading = 305.18},
        [17] = {modelHash = `des_jewel_cab2_start`, coords = vector3(-619.17730712891,-227.26536560059,38.943701934814), heading = 305.18},
        [18] = {modelHash = `des_jewel_cab_start`, coords = vector3(-619.95751953125,-226.27757263184,38.943701934814), heading = 305.18},
        [19] = {modelHash = `des_jewel_cab4_start`, coords = vector3(-624.40118408203,-226.6047668457,38.943701934814), heading = 38.08},
        [20] = {modelHash = `des_jewel_cab3_start`, coords = vector3(-625.38214111328,-227.37365722656,38.943701934814), heading = 38.08},

    }
}
return cfg