local a = {
    enabled = true,
    locations = {
        {coords = vector3(112.60, -1286.76, 28.56), number = "1"},
        {coords = vector3(102.24, -1290.54, 29.26), number = "2"},
        {coords = vector3(104.18, -1293.94, 29.26), number = "3"},
        {coords = vector3(215.0162701416, -1654.5923339844, 29.762783203125), number = "1"}
    }
}
local b = false
local c = false
local d = function(e, f, g)
    local h, i, j = World3dToScreen2d(e.x, e.y, e.z)
    local k, l, m = table.unpack(GetGameplayCamCoords())
    SetTextScale(g, g)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(f)
    DrawText(i, j)
    local n = string.len(f) / 370
    DrawRect(i, j + 0.0125, 0.015 + n, 0.03, 41, 41, 41, 125)
end
Citizen.CreateThread(
    function()
        if true then
            for o, p in pairs(a.locations) do
                local function q()
                end
                local function r()
                    c = false
                end
                local function s(t)
                    local u = a.locations[t.poleId].number
                    if not c then
                        d(p.coords, "[E~w~] Poledance", 0.35)
                        if IsControlJustReleased(0, 51) then
                            tXTRA.loadAnimDict("mini@strip_club@pole_dance@pole_dance" .. u)
                            local v =
                                NetworkCreateSynchronisedScene(
                                p.coords,
                                vector3(0.0, 0.0, 0.0),
                                2,
                                false,
                                false,
                                1065353216,
                                0,
                                1.3
                            )
                            if p.coords == vector3(215.0162701416, -1654.5923339844, 29.762783203125) then
                                SendNUIMessage({transactionType = "fireman"})
                            end
                            NetworkAddPedToSynchronisedScene(
                                tXTRA.getPlayerPed(),
                                v,
                                "mini@strip_club@pole_dance@pole_dance" .. u,
                                "pd_dance_0" .. u,
                                1.5,
                                -4.0,
                                1,
                                1,
                                1148846080,
                                0
                            )
                            NetworkStartSynchronisedScene(v)
                            c = true
                        end
                    end
                end
                tXTRA.createArea("poledance_" .. o, p.coords, 2.25, 6, q, r, s, {poleId = o})
            end
        end
    end
)
