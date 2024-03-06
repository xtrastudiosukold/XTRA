local cfg = {}

cfg.arenas = {
    {
        name = "Prison Paintball",
        teams = {
            {
                name = "red",
                joinPosition = vector3(1853.2536621094,2589.8918457031,45.672058105469),
                spawnPosition = vector3(2030.6877441406,2858.5400390625,50.13737487793),
                buyPaintballPosition = vector3(2030.7010498047,2858.5400390625,50.137340545654),
                buyPlasmaPosition = vector3(2025.5998535156,2846.6806640625,50.251846313477)
            },
            {
                name = "blue",
                joinPosition = vector3(1853.068359375,2582.9055175781,45.672054290771),
                spawnPosition = vector3(2015.4444580078,2704.5092773438,49.873683929443),
                buyPaintballPosition = vector3(2015.5908203125,2704.4899902344,49.88081741333),
                buyPlasmaPosition = vector3(2015.1773681641,2717.6733398438,50.06559753418)
            }
        },
        startPosition = vector3(1975.2271728516,2794.5434570312,50.203243255615),
        endPosition = vector3(1978.3853759766,2800.8393554688,50.209060668945),
        exitPosition = vector3(1973.7836914062,2801.0053710938,50.184047698975),
        homePosition = vector3(1848.2963867188,2586.0529785156,45.672145843506),
        boundCenter = vector3(2020.2694091797,2790.1369628906,50.303535461426),
        boundRadius = 100.0,
        maxPlayers = 20
    },
    {
        name = "Lloydz Paintball",
        teams = {
            {
                name = "red",
                joinPosition = vector3(592.708984375,2752.0432128906,42.142517089844),
                spawnPosition = vector3(610.14959716797,2748.0419921875,42.142543792725),
                buyPaintballPosition = vector3(610.130859375,2748.0849609375,42.142520904541),
                buyPlasmaPosition = vector3(599.82025146484,2747.1950683594,42.142566680908)
            },
            {
                name = "blue",
                joinPosition = vector3(596.29150390625,2752.23046875,42.142528533936),
                spawnPosition = vector3(574.71636962891,2746.6606445312,42.142520904541),
                buyPaintballPosition = vector3(574.29699707031,2745.5415039062,42.142559051514),
                buyPlasmaPosition = vector3(583.16320800781,2746.2463378906,42.142517089844)
            }
        },
        startPosition = vector3(594.62677001953,2761.880859375,42.142543792725),
        endPosition = vector3(596.10949707031,2758.7009277344,42.142528533936),
        exitPosition = vector3(593.73406982422,2758.2607421875,42.142528533936),
        homePosition = vector3(595.15307617188,2756.279296875,42.142509460449),
        boundCenter = vector3(590.20989990234,2771.1828613281,42.142517089844),
        boundRadius = 50.0,
        maxPlayers = 12
    }
}

cfg.teamConfigs = {
    ["red"] = {
        markerColour = {255,10,0},
        textFormatColour = "~r~",
        modelHash = `ig_claypain`,
        blipColour = 1
    },
    ["blue"] = {
        markerColour = {0,50,255},
        textFormatColour = "~w~",
        modelHash = `a_m_m_soucent_03`,
        blipColour = 3
    }
}

return cfg