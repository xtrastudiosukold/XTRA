local cfg = {}

cfg.validQuests = {
    ["FIGURINE7"] = false, -- Figurines Collectable (7 days)
    ["FIGURINE14"] = true, -- Figurines Collectable (14 days)
    ["HALLOWEEN"] = true, -- Sweet Collectable
    ["CHRISTMAS"] = true, -- Present Collectable
}

cfg.quests = {
    ["FIGURINE14"] = {
        name = "Figurines",
        reward = {
            completion = "plat14"
        },
        locations = {
            [1] = {pos = vector3(392.93579101563,-986.09350585938,29.536422729492), model = `vw_prop_vw_colle_alien`},
            [2] = {pos = vector3(247.11929321289,-578.48358154297,42.299430847168), model = `vw_prop_vw_colle_prbubble`},
            [3] = {pos = vector3(-336.10382080078,-640.97827148438,32.037563323975), model = `vw_prop_vw_colle_pogo`},
            [4] = {pos = vector3(-1184.8115234375,-906.0458984375,12.372309684753), model = `vw_prop_vw_colle_rsrcomm`},
            [5] = {pos = vector3(-1051.8314208984,-232.25430297852,43.020919799805), model = `vw_prop_vw_colle_rsrgeneric`},
            [6] = {pos = vector3(-538.68109130859,-193.47421264648,38.119552612305), model = `vw_prop_vw_colle_alien`},
            [7] = {pos = vector3(-930.13494873047,-2993.6242675781,19.789463043213), model = `vw_prop_vw_colle_prbubble`},
            [8] = {pos = vector3(1935.5562744141,3726.4650878906,32.188140869141), model = `vw_prop_vw_colle_pogo`},
            [9] = {pos = vector3(-717.65002441406,-913.67077636719,18.215608596802), model = `vw_prop_vw_colle_rsrcomm`},
            [10] = {pos = vector3(-284.27319335938,-1053.9976806641,26.654722213745), model = `vw_prop_vw_colle_rsrgeneric`},
            [11] = {pos = vector3(483.16397094727,-1339.3645019531,28.278081893921), model = `vw_prop_vw_colle_pogo`},
            [12] = {pos = vector3(-99.920829772949,-947.30096435547,28.229970932007), model = `vw_prop_vw_colle_rsrgeneric`},
            [13] = {pos = vector3(373.99819946289,-1606.9119873047,28.291959762573), model = `vw_prop_vw_colle_alien`},
            [14] = {pos = vector3(-587.09893798828,-1165.7362060547,21.178253173828), model = `vw_prop_vw_colle_prbubble`},
            [15] = {pos = vector3(-1626.2829589844,-1018.3368530273,12.155345916748), model = `vw_prop_vw_colle_rsrcomm`},
            [16] = {pos = vector3(-3132.431640625,1131.8603515625,19.680768966675), model = `vw_prop_vw_colle_alien`},
            [17] = {pos = vector3(-2562.8999023438,2317.546875,32.215717315674), model = `vw_prop_vw_colle_rsrgeneric`},
            [18] = {pos = vector3(230.39883422852,224.70484924316,104.54831695557), model = `vw_prop_vw_colle_alien`},
            [19] = {pos = vector3(905.97821044922,18.552291870117,78.375137329102), model = `vw_prop_vw_colle_prbubble`},
            [20] = {pos = vector3(1557.4967041016,860.82165527344,76.473602294922), model = `vw_prop_vw_colle_alien`},
            [21] = {pos = vector3(1848.5529785156,2587.6628417969,44.671993255615), model = `vw_prop_vw_colle_alien`},
            [22] = {pos = vector3(2302.3393554688,2981.6733398438,45.806644439697), model = `vw_prop_vw_colle_prbubble`},
            [23] = {pos = vector3(1742.3250732422,3302.8342285156,40.223453521729), model = `vw_prop_vw_colle_pogo`},
            [24] = {pos = vector3(350.86264038086,2619.9438476562,43.600082397461), model = `vw_prop_vw_colle_rsrcomm`},
            [25] = {pos = vector3(-747.77868652344,5545.8671875,32.485664367676), model = `vw_prop_vw_colle_rsrgeneric`},
            [26] = {pos = vector3(-442.49362182617,6017.1508789062,30.712348937988), model = `vw_prop_vw_colle_alien`},
            [27] = {pos = vector3(-245.95056152344,6327.4321289062,31.869472503662), model = `vw_prop_vw_colle_prbubble`},
            [28] = {pos = vector3(1577.0767822266,6455.2509765625,24.31717300415), model = `vw_prop_vw_colle_pogo`},
            [29] = {pos = vector3(2450.9826660156,4953.48828125,43.957180023193), model = `vw_prop_vw_colle_rsrcomm`},
            [30] = {pos = vector3(2492.4990234375,2812.8896484375,46.532741546631), model = `vw_prop_vw_colle_rsrgeneric`},
            [31] = {pos = vector3(-280.50592041016,-1916.3929443359,28.946022033691), model = `vw_prop_vw_colle_pogo`},
            [32] = {pos = vector3(-518.56939697266,-1792.3686523438,21.099979400635), model = `vw_prop_vw_colle_rsrgeneric`},
            [33] = {pos = vector3(-709.15539550781,-1397.8522949219,4.1502599716187), model = `vw_prop_vw_colle_alien`},
            [34] = {pos = vector3(-827.82318115234,-1087.1162109375,10.13264465332), model = `vw_prop_vw_colle_prbubble`},
            [35] = {pos = vector3(-935.89593505859,-1304.1628417969,4.0186438560486), model = `vw_prop_vw_colle_rsrcomm`},
            [36] = {pos = vector3(-1471.8054199219,-924.53765869141,9.113266944885), model = `vw_prop_vw_colle_alien`},
            [37] = {pos = vector3(-1663.7991943359,-537.11877441406,36.257522583008), model = `vw_prop_vw_colle_rsrgeneric`},
            [38] = {pos = vector3(-2158.3444824219,-416.31286621094,12.368584632874), model = `vw_prop_vw_colle_alien`},
            [39] = {pos = vector3(-2022.1680908203,-495.98376464844,10.743299484253), model = `vw_prop_vw_colle_prbubble`},
            [40] = {pos = vector3(-1094.8052978516,-507.29995727539,34.813873291016), model = `vw_prop_vw_colle_alien`},
            [41] = {pos = vector3(1068.6545410156,2992.6599121094,42.332332611084), model = `vw_prop_vw_colle_alien`},
            [42] = {pos = vector3(395.68112182617,3585.9650878906,32.292282104492), model = `vw_prop_vw_colle_alien`},
            [43] = {pos = vector3(503.8893737793,5599.2392578125,795.4970703125), model = `vw_prop_vw_colle_alien`},
            [44] = {pos = vector3(1465.5445556641,6349.1694335938,22.857103347778), model = `vw_prop_vw_colle_alien`},
            [45] = {pos = vector3(2111.3044433594,6019.9760742188,49.906005859375), model = `vw_prop_vw_colle_alien`},
            [46] = {pos = vector3(3456.9736328125,3765.58984375,29.533452987671), model = `vw_prop_vw_colle_alien`},
            [47] = {pos = vector3(-2291.5236816406,366.84359741211,174.6015625), model = `vw_prop_vw_colle_alien`},
            [48] = {pos = vector3(857.33612060547,532.96740722656,124.78028106689), model = `vw_prop_vw_colle_alien`},
            [49] = {pos = vector3(1215.8714599609,-279.23986816406,69.98380279541), model = `vw_prop_vw_colle_alien`},
            [50] = {pos = vector3(1170.8679199219,-1463.484375,33.888477325439), model = `vw_prop_vw_colle_alien`}
        },
        lightColour = "green"
    },
    ["HALLOWEEN"] = {
        name = "Halloween",
        startDate = {17,10},
        endDate = {1,11},
        reward = {
            location = "sweet"
        },
        locations = {
            [1] = {pos = vector3(1864.9888916016,269.33218383789,164.07778930664), model = `tr_prop_tr_plate_sweets_01a`},
            [2] = {pos = vector3(112.05941772461,-749.32012939453,45.762432098389), model = `tr_prop_tr_plate_sweets_01a`},
            [3] = {pos = vector3(-820.27178955078,176.85664367676,71.613700866699), model = `tr_prop_tr_plate_sweets_01a`},
            [4] = {pos = vector3(1976.8232421875,3815.0466308594,33.425479888916), model = `tr_prop_tr_plate_sweets_01a`},
            [5] = {pos = vector3(1664.3002929688,4773.9365234375,42.001174926758), model = `tr_prop_tr_plate_sweets_01a`},
            [6] = {pos = vector3(-334.28012084961,6303.8198242188,33.088134765625), model = `tr_prop_tr_plate_sweets_01a`},
            [7] = {pos = vector3(-1889.0288085938,2048.3984375,140.98016357422), model = `tr_prop_tr_plate_sweets_01a`},
            [8] = {pos = vector3(326.67276000977,-2048.970703125,20.825277328491), model = `tr_prop_tr_plate_sweets_01a`},
            [9] = {pos = vector3(-1080.5402832031,-262.85876464844,37.793529510498), model = `tr_prop_tr_plate_sweets_01a`},
            [10] = {pos = vector3(300.84362792969,200.97651672363,104.37110900879), model = `tr_prop_tr_plate_sweets_01a`},
            [11] = {pos = vector3(1372.7838134766,-555.69146728516,74.68578338623), model = `tr_prop_tr_plate_sweets_01a`},
            [12] = {pos = vector3(-2280.2504882812,262.57073974609,184.60154724121), model = `tr_prop_tr_plate_sweets_01a`},
            [13] = {pos = vector3(340.16732788086,2617.3828125,44.53596496582), model = `tr_prop_tr_plate_sweets_01a`},
            [14] = {pos = vector3(943.96282958984,442.11465454102,121.9800491333), model = `tr_prop_tr_plate_sweets_01a`},
            [15] = {pos = vector3(2887.6635742188,4383.4658203125,50.300662994385), model = `tr_prop_tr_plate_sweets_01a`},
            [16] = {pos = vector3(-1231.0913085938,-201.65863037109,39.254123687744), model = `tr_prop_tr_plate_sweets_01a`},
            [17] = {pos = vector3(-115.70942687988,986.18121337891,235.75285339355), model = `tr_prop_tr_plate_sweets_01a`},
            [18] = {pos = vector3(-932.91912841797,694.53686523438,152.71324157715), model = `tr_prop_tr_plate_sweets_01a`},
            [19] = {pos = vector3(153.66456604004,-967.990234375,30.976125717163), model = `tr_prop_tr_plate_sweets_01a`},
            [20] = {pos = vector3(3316.5732421875,5172.5673828125,18.437269210815), model = `tr_prop_tr_plate_sweets_01a`},
        },
        lightColour = "orange"
    },
    ["CHRISTMAS"] = {
        name = "Christmas",
        startDate = {12,12},
        endDate = {31,12},
        reward = {
            completion = "plat14"
        },
        locations = {
            [1] = {pos = vector3(-799.91687011719,177.15560913086,71.834671020508), model = `prop_xmas_tree_int`},
            [2] = {pos = vector3(-1528.5749511719,137.08424377441,54.66796875), model = `xs_propintxmas_tree_2018`},
            [3] = {pos = vector3(-1390.9505615234,-611.14508056641,29.319547653198), model = `xs3_prop_int_xmas_tree_01`},
            [4] = {pos = vector3(904.14361572266,-476.85809326172,61.766910552979), model = `xs_propintxmas_tree_2018`},
            [5] = {pos = vector3(1113.3792724609,249.37628173828,-47.040984344482), model = `xs3_prop_int_xmas_tree_01`},
            [6] = {pos = vector3(2440.3090820312,4984.2705078125,50.564838409424), model = `prop_xmas_tree_int`},
            [7] = {pos = vector3(10.40776348114,6712.3544921875,-106.85440063477), model = `xs3_prop_int_xmas_tree_01`},
            [8] = {pos = vector3(106.70291900635,6439.1938476562,37.245933532715), model = `xs_propintxmas_tree_2018`},
            [9] = {pos = vector3(1843.8540039062,2594.8771972656,44.952312469482), model = `xs3_prop_int_xmas_tree_01`},
            [10] = {pos = vector3(135.39323425293,-1942.1428222656,14.224863052368), model = `prop_xmas_tree_int`},
            [11] = {pos = vector3(713.5693359375,-963.14868164062,29.395318984985), model = `xs3_prop_int_xmas_tree_01`},
            [12] = {pos = vector3(-167.40338134766,296.39764404297,92.762153625488), model = `xs_propintxmas_tree_2018`},
            [13] = {pos = vector3(393.69723510742,-14.098926544189,90.935302734375), model = `prop_xmas_tree_int`},
            [14] = {pos = vector3(257.38037109375,-780.49011230469,29.69419670105), model = `prop_xmas_tree_int`},
            [15] = {pos = vector3(-1903.4907226562,2085.3950195312,139.40859985352), model = `xs3_prop_int_xmas_tree_01`},
            [16] = {pos = vector3(-1940.7785644531,-20.920022964478,90.674880981445), model = `xs_propintxmas_tree_2018`},
            [17] = {pos = vector3(1990.771484375,3045.0874023438,46.215061187744), model = `xs_propintxmas_tree_2018`},
            [18] = {pos = vector3(-76.612525939941,829.51965332031,234.51788024902), model = `prop_xmas_tree_int`},
            [19] = {pos = vector3(-1142.6568603516,-183.44702148438,39.080463409424), model = `xs3_prop_int_xmas_tree_01`},
            [20] = {pos = vector3(-3166.2429199219,1087.1220703125,19.838750839233), model = `xs_propintxmas_tree_2018`},
        },
        lightColour = "red"
    }
}

return cfg