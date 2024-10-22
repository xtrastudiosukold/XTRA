local a = GetGameTimer() - 30000
local b = {
    ["city"] = vector3(309.04260253906, -592.22509765625, 42.284008026123),
    ["vip"] = vector3(3542.5090332031, 2570.2302246094, 6.9896578788757),
    ["sandy"] = vector3(1833.0328369141, 3682.8110351563, 33.270057678223),
    ["paleto"] = vector3(-251.9546661377, 6334.146484375, 31.427177429199),
    ["london"] = vector3(355.45614624023, -1416.0190429688, 32.510429382324),
    ["VIPisland"] = vector3(-2159.1472167969, 5234.54296875, 17.772897720337),
    ["mountzenah"] = vector3(-436.04296875, -326.27416992188, 33.910766601562)
}
Citizen.CreateThread(
    function()
        if true then
            local c = function(d)
                tXTRA.drawNativeNotification("Press ~INPUT_PICKUP~ to receive medical attention.")
            end
            local e = function(d)
            end
            local f = function(d)
                if IsControlJustPressed(1, 51) then
                    local g = tXTRA.getPlayerPed()
                    if not tXTRA.isInComa() then
                        if tXTRA.getPlayerVehicle() == 0 then
                            if tXTRA.getPlayerCombatTimer() == 0 then
                                if GetGameTimer() > a + 30000 then
                                    tXTRA.setHealth(200)
                                    tXTRA.notify("~g~Healed, free of charge by the NHS.")
                                    a = GetGameTimer()
                                else
                                    tXTRA.notify("~r~Healing cooldown, come back later.")
                                end
                            else
                                tXTRA.notify("~r~You can not heal whilst you have a combat timer.")
                            end
                        else
                            tXTRA.notify("~r~You can not heal whilst in a vehicle.")
                        end
                    else
                        tXTRA.notify("~r~You are bleeding out, call a doctor ASAP!")
                    end
                end
            end
            for h, i in pairs(b) do
                tXTRA.addMarker(i.x, i.y, i.z, 1.0, 1.0, 1.0, 0, 0, 255, 100, 50, 27, false, false, true)
                tXTRA.createArea(h .. "_hospital", i, 1.5, 6, c, e, f, {})
            end
        end
    end
)
local j = 0
function tXTRA.setHealth(k)
    if k ~= nil then
        if tXTRA.isPedScriptGuidChanging() and k < 200 then
            return
        end
        local l = math.floor(k)
        j = l
        SetEntityHealth(PlayerPedId(), l)
    end
end
function tXTRA.getHealth()
    return GetEntityHealth(PlayerPedId())
end
Citizen.CreateThread(
    function()
        Wait(60000)
        while true do
            if not spawning then
                if tXTRA.getHealth() > j then
                    if tXTRA.getHealth() - 2 == j then
                        return
                    end
                    tXTRA.setHealth(j)
                end
            end
            Wait(0)
        end
    end
)
