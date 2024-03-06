
local doors = {
    {doorHash="1", position = vector3(437.2091, -985.1078, 30.68947), modelHash = 749848321}, -- reception door (mission row)
    {doorHash="2", position = vector3(445.1621, -989.3735, 30.68949), modelHash = -131296141}, -- door 1 to side (mission row)
    {doorHash="3", position = vector3(444.0549, -989.4479, 30.69236), modelHash = -131296141}, -- door 2 to side (mission row)
    {doorHash="4", position = vector3(464.0746, -1003.737, 24.91498), modelHash = 749848321}, -- door to exit cell area (mission row)
    {doorHash="5", position = vector3(1858.97, 3687.147, 30.25924), modelHash = -1927754726}, -- enter cells (sandy)
    {doorHash="6", position = vector3(1862.223, 3688.983, 30.25924), modelHash = -1927754726}, -- cell gate 1 (sandy)
    {doorHash="7", position = vector3(1860.331, 3692.091, 30.25924), modelHash = -1927754726}, -- cell gate 2 (sandy)
    {doorHash="8", position = vector3( 1858.602, 3695.625, 30.25924), modelHash = -1927754726}, -- cell gate 3 (sandy)
    {doorHash="9", position = vector3(480.6088, -1003.61, 24.91497), modelHash = 749848321}, -- secdoor scanner (mission row)
    {doorHash="10", position = vector3(467.7329, -1003.563, 24.91498), modelHash = 631614199}, -- cell gate 1 (mission row)
    {doorHash="11", position = vector3(472.024, -1003.463, 24.91498), modelHash = 631614199}, -- cell gate 2 (mission row)
    {doorHash="12", position = vector3(476.4612, -1003.559, 24.91498), modelHash = 631614199}, -- cell gate 3  (mission row)
    {doorHash="13", position = vector3(480.769, -996.5425, 24.91498), modelHash = 631614199}, -- cell gate 4 (mission row)
    {doorHash="14", position = vector3(476.5091, -996.4341, 24.91498), modelHash = 631614199}, -- cell gate 5 (mission row)
    {doorHash="15", position = vector3(472.1049, -996.4761, 24.91501), modelHash = 631614199}, -- cell gate 6 (mission row)
    {doorHash="16", position = vector3(467.9574, -996.4954, 24.91503), modelHash = 631614199}, -- cell gate 7 (mission row)
    {doorHash="17", position = vector3(469.2699, -1014.544, 26.38642), modelHash = -2023754432}, -- back door 1 (mission row)
    {doorHash="18", position = vector3(468.1198, -1014.595, 26.38642), modelHash = -2023754432}, -- back door 2 (mission row)
    {doorHash="19", position = vector3(-1072.93, -827.0834, 5.479728), modelHash = 631614199}, -- cell gate 1 (vespucci)
    {doorHash="20", position = vector3(-1087.223, -829.4236, 5.479716), modelHash = 631614199}, -- cell gate 2 (vespucci)
    {doorHash="21", position = vector3(-1086.248, -827.374, 5.479783), modelHash = 631614199}, -- cell gate 3 (vespucci)
    {doorHash="22", position = vector3(-1088.606, -824.2325, 5.480029), modelHash = 631614199}, -- cell gate 4 (vespucci)
    {doorHash="23", position = vector3(-1091.065, -821.1649, 5.479986), modelHash = 631614199}, -- cell gate 5 (vespucci)
    {doorHash="24", position = vector3(-1089.38, -829.7184, 5.479845), modelHash = 631614199}, -- cell gate 6 (vespucci)
    {doorHash="25", position = vector3(-1091.713, -826.4356, 5.479959), modelHash = 631614199}, -- cell gate 7 (vespucci)
    {doorHash="26", position = vector3(-1094.058, -823.3271, 5.479951), modelHash = 631614199}, -- cell gate 8 (vespucci)
    {doorHash="27", position = vector3(-1096.401, -820.2177, 5.479957), modelHash = 631614199}, -- cell gate 9 (vespucci)
}
-- 5 or 0 is open, 4 is closed by default

local doorStates = {
    ["1"] = 5,
    ["2"] = 5,
    ["3"] = 5,
    ["4"] = 5,
    ["5"] = 4,
    ["6"] = 4,
    ["7"] = 4,
    ["8"] = 4,
    ["9"] = 4,
    ["10"] = 4,
    ["11"] = 4,
    ["12"] = 4,
    ["13"] = 4,
    ["14"] = 4,
    ["15"] = 4,
    ["16"] = 4,
    ["17"] = 5,
    ["18"] = 5,
    ["19"] = 4,
    ["20"] = 4,
    ["21"] = 4,
    ["22"] = 4,
    ["23"] = 4,
    ["24"] = 4,
    ["25"] = 4,
    ["26"] = 4,
    ["27"] = 4,
}

AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
    if first_spawn then
        TriggerClientEvent('XTRA:policeSyncAllDoors', source, doors, doorStates)
    end
end)

RegisterNetEvent("XTRA:policeSetDoorState")
AddEventHandler("XTRA:policeSetDoorState", function(doorHash, state)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
        doorStates[doorHash] = state
        TriggerClientEvent('XTRA:policeSyncDoor', -1, doorHash, state)
    end
end)

RegisterNetEvent("XTRA:enterPoliceSyncDoors")
AddEventHandler("XTRA:enterPoliceSyncDoors", function()
    local source = source
    TriggerClientEvent('XTRA:gotAllDoorStates', source, doorStates)
end)