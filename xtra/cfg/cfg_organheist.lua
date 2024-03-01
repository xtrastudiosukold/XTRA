local cfg = {}

cfg.locations = {
    {
        safePositions = {
            vector3(569.11688232422, 5962.5517578125, -158.08581542969),
            vector3(292.75506591797,-1349.1447753906,24.537817001343)
        },
        pastGates = {
            vector3(518.94403076172, 5919.232421875, -158.29566955566),
        },
        gunStores = {
            ["police"] = {
                { "Organ Heist Small Arms", "policeSmallArms", vector3(565.16070556641, 5942.6586914062, -159.08728027344) },
                { "Organ Heist Large Arms", "policeLargeArms", vector3(571.04095458984, 5942.1025390625, -158.78784179688) }
            },
            ["civ"] = {
                { "Organ Heist Large Arms", "LargeArmsDealer", vector3(571.04095458984, 5942.1025390625, -158.78784179688) }
            }
        },
        atmLocation = vector3(575.4677734375, 5946.9716796875, -157.69018554688)
    },
    {
        safePositions = {
            vector3(312.97689819336, 5945.4672851562, -158.2717590332),
            vector3(314.65393066406, 5953.2099609375, -158.28521728516)
        },
        pastGates = {
            vector3(440.00463867188, 5953.0498046875, -158.25993347168),
            vector3(329.63888549805, 5923.6225585938, -158.25216674805)
        },
        gunStores = {
            ["police"] = {
                { "Organ Heist Small Arms", "policeSmallArms", vector3(335.59881591797, 5955.1450195312, -159.27177429199) },
                { "Organ Heist Large Arms", "policeLargeArms", vector3(339.07601928711, 5950.896484375, -159.27177429199) }
            },
            ["civ"] = {
                { "Organ Heist Large Arms", "LargeArmsDealer", vector3(339.07601928711, 5950.896484375, -159.27177429199) }
            }
        },
        atmLocation = vector3(330.03457641602, 5954.736328125, -158.27177429199)
    }
}

return cfg