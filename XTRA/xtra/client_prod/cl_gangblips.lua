local a = false
Blips = {}
RegisterCommand(
    "gangblips",
    function()
        if not a then
            a = true
            TriggerServerEvent("XTRA:EnableGangBlips")
            notify("Gang blips Enabled")
            Citizen.CreateThread(
                function()
                    while a do
                        Citizen.Wait(5000)
                        TriggerServerEvent("XTRA:GetGangBlipsData")
                    end
                end
            )
        else
            DeleteAllBlips()
            a = false
        end
    end
)
RegisterNetEvent("XTRA:ReceiveGangBlipsData")
AddEventHandler(
    "XTRA:ReceiveGangBlipsData",
    function(b)
        DeleteAllBlips()
        local c = GetPlayerServerId(PlayerId())
        for d, e in ipairs(b) do
            local f = tonumber(e.playerID)
            if c ~= f and GetPlayerPed(GetPlayerFromServerId(f)) ~= nil then
                local g = GetPlayerFromServerId(f)
                local h = AddBlipForEntity(GetPlayerPed(g))
                SetBlipSprite(h, 1)
                SetBlipColour(h, e.blipColor)
                SetBlipCategory(h, 2)
                SetBlipAsShortRange(h, false)
                Citizen.InvokeNative(0x5FBCA48327B914DF, h, true)
                SetBlipNameToPlayerName(h, g)
                Blips[#Blips + 1] = h
            end
        end
    end
)
function DeleteAllBlips()
    for d, h in ipairs(Blips) do
        RemoveBlip(h)
    end
    Blips = {}
end
