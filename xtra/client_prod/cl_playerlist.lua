local a = false
SetNuiFocus(false, false)
function func_playerlistControl()
    if IsUsingKeyboard(2) then
        if IsControlJustPressed(0, 212) then
            a = not a
            TriggerServerEvent("XTRA:getPlayerListData")
            Wait(100)
            sendFullPlayerListData()
            SetNuiFocus(true, true)
            SendNUIMessage({showPlayerList = true})
        end
    end
end
tXTRA.createThreadOnTick(func_playerlistControl)
RegisterNUICallback(
    "closeXTRAPlayerList",
    function(b, c)
        SetNuiFocus(false, false)
    end
)
AddEventHandler(
    "XTRA:onClientSpawn",
    function(d, e)
        if e then
            TriggerServerEvent("XTRA:getPlayerListData")
        end
    end
)
RegisterNetEvent(
    "XTRA:gotFullPlayerListData",
    function(f, g, h, i, j, k)
        sortedPlayersStaff = f
        sortedPlayersPolice = g
        sortedPlayersNHS = h
        sortedPlayersLFB = i
        sortedPlayersHMP = j
        sortedPlayersCivillians = k
    end
)
local l, m, n
RegisterNetEvent(
    "XTRA:playerListMetaUpdate",
    function(o)
        l, m, n = table.unpack(o)
        SendNUIMessage({wipeFooterPlayerList = true})
        SendNUIMessage({appendToFooterPlayerList = '<span class="foot">Server #1 | </span>'})
        SendNUIMessage(
            {
                appendToFooterPlayerList = '<span class="foot" style="color: rgb(0, 255, 20);">Server uptime ' ..
                    tostring(l) .. "</span>"
            }
        )
        SendNUIMessage(
            {
                appendToFooterPlayerList = '<span class="foot">  |  Number of players ' ..
                    tostring(m) .. "/" .. tostring(n) .. "</span>"
            }
        )
    end
)
function getLength(p)
    local q = 0
    for r in pairs(p) do
        q = q + 1
    end
    return q
end
function sendFullPlayerListData()
    local s = getLength(sortedPlayersStaff)
    local t = getLength(sortedPlayersPolice)
    local u = getLength(sortedPlayersNHS)
    local v = getLength(sortedPlayersLFB)
    local w = getLength(sortedPlayersHMP)
    local x = getLength(sortedPlayersCivillians)
    SendNUIMessage({wipePlayerList = true})
    SendNUIMessage({clearServerMetaData = true})
    SendNUIMessage(
        {
            setServerMetaData = '<img src="playerlist_images/xtra.png" align="top" width="20px",height="20px"><span class="staff">' ..
                tostring(s) .. "</span>"
        }
    )
    SendNUIMessage(
        {
            setServerMetaData = '<img src="playerlist_images/nhs.png" align="top" width="20",height="20"><span class="nhs">' ..
                tostring(u) .. "</span>"
        }
    )
    SendNUIMessage(
        {
            setServerMetaData = '<img src="playerlist_images/lfb.png" align="top" width="20",height="20"><span class="lfb">' ..
                tostring(v) .. "</span>"
        }
    )
    SendNUIMessage(
        {
            setServerMetaData = '<img src="playerlist_images/met.png" align="top"  width="24",height="24"><span class="police">' ..
                tostring(t) .. "</span>"
        }
    )
    SendNUIMessage(
        {
            setServerMetaData = '<img src="playerlist_images/hmp.png" align="top"  width="24",height="24"><span class="hmp">' ..
                tostring(w) .. "</span>"
        }
    )
    SendNUIMessage(
        {
            setServerMetaData = '<img src="playerlist_images/danny.png" align="top" width="20",height="20"><span class="aa">' ..
                tostring(x) .. "</span>"
        }
    )
    SendNUIMessage({wipeFooterPlayerList = true})
    SendNUIMessage({appendToFooterPlayerList = '<span class="foot">Server #1 | </span>'})
    SendNUIMessage(
        {
            appendToFooterPlayerList = '<span class="foot" style="color: rgb(0, 255, 20);">Server uptime ' ..
                tostring(l) .. "</span>"
        }
    )
    SendNUIMessage(
        {
            appendToFooterPlayerList = '<span class="foot">  |  Number of players ' ..
                tostring(m) .. "/" .. tostring(n) .. "</span>"
        }
    )
    if s >= 1 then
        SendNUIMessage({appendToContentPlayerList = '<span id="playerlist_seperator_staff">Staff</span>'})
    end
    for y, z in pairs(sortedPlayersStaff) do
        SendNUIMessage(
            {
                appendToContentPlayerList = '<span class="username">' ..
                    tostring(sortedPlayersStaff[y].name) ..
                        '</span><span class="job">' ..
                            tostring(sortedPlayersStaff[y].rank) ..
                                '</span><span class="playtime">' ..
                                    tostring(sortedPlayersStaff[y].hours) .. "hrs</span><br/>"
            }
        )
    end
    if t >= 1 then
        SendNUIMessage({appendToContentPlayerList = '<span id="playerlist_seperator_police">MET Police</span>'})
    end
    for y, z in pairs(sortedPlayersPolice) do
        SendNUIMessage(
            {
                appendToContentPlayerList = '<span class="username">' ..
                    tostring(sortedPlayersPolice[y].name) ..
                        '</span><span class="job">' ..
                            tostring(sortedPlayersPolice[y].rank) ..
                                '</span><span class="playtime">' ..
                                    tostring(sortedPlayersPolice[y].hours) .. "hrs</span><br/>"
            }
        )
    end
    if u >= 1 then
        SendNUIMessage({appendToContentPlayerList = '<span id="playerlist_seperator_nhs">NHS</span>'})
    end
    for y, z in pairs(sortedPlayersNHS) do
        SendNUIMessage(
            {
                appendToContentPlayerList = '<span class="username">' ..
                    tostring(sortedPlayersNHS[y].name) ..
                        '</span><span class="job">' ..
                            tostring(sortedPlayersNHS[y].rank) ..
                                '</span><span class="playtime">' ..
                                    tostring(sortedPlayersNHS[y].hours) .. "hrs</span><br/>"
            }
        )
    end
    if v >= 1 then
        SendNUIMessage({appendToContentPlayerList = '<span id="playerlist_seperator_lfb">LFB</span>'})
    end
    for y, z in pairs(sortedPlayersLFB) do
        SendNUIMessage(
            {
                appendToContentPlayerList = '<span class="username">' ..
                    tostring(sortedPlayersLFB[y].name) ..
                        '</span><span class="job">' ..
                            tostring(sortedPlayersLFB[y].rank) ..
                                '</span><span class="playtime">' ..
                                    tostring(sortedPlayersLFB[y].hours) .. "hrs</span><br/>"
            }
        )
    end
    if w >= 1 then
        SendNUIMessage({appendToContentPlayerList = '<span id="playerlist_seperator_hmp">HMP</span>'})
    end
    for y, z in pairs(sortedPlayersHMP) do
        SendNUIMessage(
            {
                appendToContentPlayerList = '<span class="username">' ..
                    tostring(sortedPlayersHMP[y].name) ..
                        '</span><span class="job">' ..
                            tostring(sortedPlayersHMP[y].rank) ..
                                '</span><span class="playtime">' ..
                                    tostring(sortedPlayersHMP[y].hours) .. "hrs</span><br/>"
            }
        )
    end
    if x >= 1 then
        SendNUIMessage({appendToContentPlayerList = '<span id="playerlist_seperator_civs">Civilians</span>'})
    end
    for y, z in pairs(sortedPlayersCivillians) do
        SendNUIMessage(
            {
                appendToContentPlayerList = '<span class="username">' ..
                    tostring(sortedPlayersCivillians[y].name) ..
                        '</span><span class="job">' ..
                            tostring(sortedPlayersCivillians[y].rank) ..
                                '</span><span class="playtime">' ..
                                    tostring(sortedPlayersCivillians[y].hours) .. "hrs</span><br/>"
            }
        )
    end
end
local a = {}

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        if l and m and n then
            local A = BTF.getUserId()
            local userHours = hourz[A] or 0
            funny = false
            local e = BTF.getPlayerCoords()
            d = GetStreetNameAtCoord(e.x, e.y, e.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger()) or "N/A"
            if not funny then
                SetDiscordAppId(1045061513964159076)
                SetDiscordRichPresenceAsset('btf')
                SetDiscordRichPresenceAssetText('discord.gg/btf5m')
                SetDiscordRichPresenceAssetSmallText(tBTF.getPlayerName(GetPlayerServerId(PlayerId())))
                SetDiscordRichPresenceAction(1, "Join BTF", "https://discord.gg/MSs56ypC8N")
                SetRichPresence("[ID:" .. tostring(A) .. "] | " .. tostring(m) .. "/" .. tostring(n) .. "\n" .. tBTF.getPlayerName(GetPlayerServerId(PlayerId())) .. " | Roaming On " .. tostring(GetStreetNameFromHashKey(d)))
            else
                SetDiscordAppId(1195076549993566239)
                SetDiscordRichPresenceAsset('btf')
                SetDiscordRichPresenceAssetText('Grand Theft Auto VI')
                SetDiscordRichPresenceAssetSmallText("Welcome to Vice City!")
                SetRichPresence("Playing Multiplayer")
            end
        end
        Wait(15000)
    end
end)
