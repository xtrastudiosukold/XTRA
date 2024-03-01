local cfg = {}

cfg.positions = {
    ["City"] = {
        {
            x = 389.3150329589844,
            y = -1613.2210693359376,
            z = 29.29191970825195,
            heading = 229.24693298339845,
        },
        {
            x = 391.4687805175781,
            y = -1610.8800048828126,
            z = 29.29191970825195,
            heading = 222.77548217773438,
        },
        {
            x = 393.3611755371094,
            y = -1608.6627197265626,
            z = 29.29191970825195,
            heading = 227.10740661621095,
        },

        {
            x = 392.7969970703125,
            y = -1628.1668701171876,
            z = 29.29192543029785,
            heading = 49.32107925415039,
        },
        {
            x = 394.7721252441406,
            y = -1625.76806640625,
            z = 29.29192543029785,
            heading = 48.46761322021484
        },
        {
            x = 396.7799072265625,
            y = -1623.5364990234376,
            z = 29.29192543029785,
            heading = 47.54738998413086,
        },
        {
            x = 398.770263671875,
            y = -1621.169677734375,
            z = 29.29192543029785,
            heading = 50.76906967163086
        },
        {
            x = 400.65716552734377,
            y = -1618.6280517578126,
            z = 29.29192543029785,
            heading = 52.82695007324219
        },
        {
            x = 402.722900390625,
            y = -1616.322509765625,
            z = 29.29192543029785,
            heading = 58.2410888671875
        }
    },
    ["Paleto"] = {
        {
            x = -448.36953735352,
            y = 5994.4643554688,
            z = 31.340543746948,
            heading = 266.45669555664
        },
        {
            x = -451.79830932617,
            y = 5998.2802734375,
            z = 31.340543746948,
            heading = 266.45669555664
        },
        {
            x = -455.33145141602,
            y = 6001.8969726562,
            z = 31.340526580811,
            heading = 266.45669555664
        },
        {
            x = -458.81066894531,
            y = 6005.486328125,
            z = 31.340532302856,
            heading = 289.13385009766
        },
        {
            x = -463.00570678711,
            y = 6009.2905273438,
            z = 31.340532302856,
            heading = 260.78741455078
        }
    }

}

cfg.peds = {
    { -- City
        modelHash = `ig_trafficwarden`,
        position = vector3(369.81695556641,-1607.9230957031,28.3031152344),
        heading = 215.0,
        animDict = "amb@world_human_hang_out_street@male_c@idle_a",
        animName = "idle_b"
    },
    { -- Paleto
        modelHash = `ig_trafficwarden`,
        position = vector3(-442.59323120117,5994.7045898438,30.490104675293),
        heading = 102.0,
        animDict = "amb@world_human_hang_out_street@male_c@idle_a",
        animName = "idle_b"
    },
}

cfg.driveToPosition = vector3(406.3603515625,-1600.9317626953,29.237545013428)

cfg.reasonsForImpound = {
    {option = "Vehicle has been stolen", selected = false},
    {option = "Vehicle has been involved in a collision", selected = false},
    {option = "Vehicle was parked illegally", selected = false},
    {option = "Vehicle was involved in a crime and abandoned", selected = false},
    {option = "Vehicle was driven in an anti-social manner", selected = false},
    {option = "Vehicle was causing an obstruction or danger", selected = false},
}
cfg.disallowedGarageTypes = {
    -- Government vehicles
    ["Met Police Vehicles"] = true,
    ["Met Police Boats"] = true,
    ["NHS Vehicles"] = true,
    ["LFB Garage"] = true,
    ["Police Helicopters"] = true,
    ["NHS Helicopters"] = true,
    ["HMP Vehicles"] = true,
    -- Large vehicles
    ["Standard Aircraft"] = true,
    ["Standard Helicopters"] = true,
    ["VIP Aircraft"] = true,
    ["VIP Helicopters"] = true,
}

cfg.impoundPrice = 25000

cfg.disallowedVehicleClasses = {
    [10] = true,
    [13] = true,
    [14] = true,
    [21] = true,
    [18] = true,
    [15] = true,
    [16] = true,
}


return cfg