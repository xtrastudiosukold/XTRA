local a = false
local b = nil
local c = false
local d = nil
local e = false
local f = false
function tXTRA.isKnockedOut()
    return a
end
function tXTRA.putInNearestVehicleAsPassenger(g)
    local h = tXTRA.getClosestVehicle(g)
    if IsEntityAVehicle(h) then
        for i = 1, math.max(GetVehicleMaxNumberOfPassengers(h), 3) do
            if IsVehicleSeatFree(h, i) then
                SetPedIntoVehicle(tXTRA.getPlayerPed(), h, i)
                return true
            end
        end
    end
    return false
end
function tXTRA.putInNetVehicleAsPassenger(j)
    local h = tXTRA.getObjectId(j)
    if IsEntityAVehicle(h) then
        for i = 1, GetVehicleMaxNumberOfPassengers(h) do
            if IsVehicleSeatFree(h, i) then
                SetPedIntoVehicle(tXTRA.getPlayerPed(), h, i)
                return true
            end
        end
    end
end
function tXTRA.putInVehiclePositionAsPassenger(k, l, m)
    local h = tXTRA.getVehicleAtPosition(k, l, m)
    if IsEntityAVehicle(h) then
        for i = 1, GetVehicleMaxNumberOfPassengers(h) do
            if IsVehicleSeatFree(h, i) then
                SetPedIntoVehicle(tXTRA.getPlayerPed(), h, i)
                return true
            end
        end
    end
end
local n = {{"switch@franklin@bed", "sleep_loop"}, {"switch@trevor@bed", "bed_sleep_floyd"}}
local function o()
    return n[math.random(1, #n)]
end
RegisterNetEvent(
    "XTRA:knockOut",
    function()
        if not a and not tXTRA.isPurge() then
            tXTRA.setCanAnim(false)
            a = true
            b = o()
        end
    end
)
RegisterNetEvent(
    "XTRA:knockOutDisable",
    function()
        if a then
            local p = PlayerPedId()
            SetEntityCollision(p, true, true)
            FreezeEntityPosition(p, false)
            StopAnimTask(p, b[1], b[2], 1.0)
            tXTRA.setCanAnim(true)
            a = false
            b = nil
        end
    end
)
RegisterNetEvent("XTRA:drag")
AddEventHandler(
    "XTRA:drag",
    function(t)
        d = t
        e = not e
    end
)
RegisterNetEvent("XTRA:undrag")
AddEventHandler(
    "XTRA:undrag",
    function(t)
        e = false
    end
)
TriggerEvent(
    "chat:addSuggestion",
    "/s60",
    "Authorise a new Section 60 order",
    {{name = "Radius", help = "In metres"}, {name = "Duration", help = "In Minutes"}}
)
local q = {}
RegisterNetEvent(
    "XTRA:addS60",
    function(r, s, u)
        local v = AddBlipForCoord(r.x, r.y, r.z)
        local w = AddBlipForRadius(r.x, r.y, r.z, s + .0)
        local x = 61
        SetBlipSprite(v, 526)
        SetBlipColour(v, x)
        SetBlipScale(v, 1.0)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName("Section 60")
        EndTextCommandSetBlipName(v)
        SetBlipAlpha(w, 80)
        SetBlipColour(w, x)
        q[u] = {w, v}
        local y = GetStreetNameAtCoord(r.x, r.y, r.z)
        local z = GetStreetNameFromHashKey(y)
        TriggerEvent(
            "XTRA:showNotification",
            {
                text = "Metropolitan Police: <br/>A Section 60 has been authorised for the area of " ..
                    z ..
                        ".<br/><br/>This gives officers the power to search any person or vehicle in the area, without any grounds. <br/><br/>This has been authorised in line with legislation.",
                height = "auto",
                width = "auto",
                colour = "#FFF",
                background = "#3287cd",
                pos = "bottom-right",
                icon = "success"
            },
            100000
        )
    end
)
RegisterNetEvent(
    "XTRA:removeS60",
    function(u)
        if q[t] == nil then
            return
        else
            local A = q[u]
            local v = A[2]
            local s = A[1]
            RemoveBlip(v)
            RemoveBlip(s)
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            if e and d ~= nil then
                DisableControlAction(0, 21, true)
                local B = GetPlayerPed(GetPlayerFromServerId(d))
                local C = tXTRA.getPlayerPed()
                AttachEntityToEntity(C, B, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2)
                f = true
            else
                if f then
                    DetachEntity(tXTRA.getPlayerPed(), true, false)
                    f = false
                end
            end
            if IsControlPressed(0, 323) or IsControlPressed(0, 27) and not IsUsingKeyboard(2) then
                if
                    not globalSurrenderring and not tXTRA.isInComa() and not tXTRA.isHandcuffed() and
                        (tXTRA.canAnim() or tXTRA.isTazedByRevive())
                 then
                    DisablePlayerFiring(tXTRA.getPlayerPed(), true)
                    DisableControlAction(0, 22, true)
                    DisableControlAction(0, 25, true)
                    DisableControlAction(0, 154, true)
                    if not IsEntityDead(tXTRA.getPlayerPed()) then
                        if not c and not GetIsTaskActive(tXTRA.getPlayerPed(), 298) then
                            c = true
                            tXTRA.loadAnimDict("missminuteman_1ig_2")
                            TaskPlayAnim(
                                tXTRA.getPlayerPed(),
                                "missminuteman_1ig_2",
                                "handsup_enter",
                                7.0,
                                1.0,
                                -1,
                                50,
                                0,
                                false,
                                false,
                                false
                            )
                            RemoveAnimDict("missminuteman_1ig_2")
                        end
                    end
                end
            end
            if
                (IsControlJustReleased(1, 323) or IsControlJustReleased(1, 27)) and not globalSurrenderring and c and
                    not tXTRA.isInComa() and
                    not tXTRA.isHandcuffed() and
                    tXTRA.canAnim()
             then
                c = false
                CreateThread(
                    function()
                        local D = false
                        CreateThread(
                            function()
                                Wait(1000)
                                D = true
                            end
                        )
                        while not D do
                            DisablePlayerFiring(tXTRA.getPlayerPed(), true)
                            Wait(1)
                        end
                    end
                )
                DisableControlAction(0, 21, true)
                DisableControlAction(0, 137, true)
                ClearPedTasks(tXTRA.getPlayerPed())
            end
            if a then
                if tXTRA.isStaffedOn() then
                    TriggerEvent("XTRA:knockOutDisable")
                elseif not tXTRA.isInComa() then
                    local p = PlayerPedId()
                    if not IsEntityPlayingAnim(p, b[1], b[2], 3) then
                        tXTRA.loadAnimDict(b[1])
                        local r = GetEntityCoords(p, true)
                        SetEntityCollision(p, false, false)
                        FreezeEntityPosition(p, true)
                        local E, I = GetGroundZFor_3dCoord(r.x, r.y, r.z)
                        if E then
                            r = vector3(r.x, r.y, I + 0.3)
                        end
                        TaskPlayAnimAdvanced(p, b[1], b[2], r.x, r.y, r.z, 0.0, 0.0, 0.0, 3.0, 1.0, -1, 1, 0.0, 0, 0)
                        RemoveAnimDict(b[1])
                    end
                    tXTRA.notify("~r~You have been knocked out!")
                end
            end
            Wait(0)
        end
    end
)
RMenu.Add(
    "policehandbook",
    "main",
    RageUI.CreateMenu("Police Handbook", "~b~Officer Handbook", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight())
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        RageUI.IsVisible(
            RMenu:Get("policehandbook", "main"),
            true,
            true,
            true,
            function()
                RageUI.Button(
                    "Arrest",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "The time now is ___. <br/>You are currently under arrest on suspision of ___. <br/>You do not have to say anything. But, it may harm your defence if you do not mention when questioned something which you later rely on in court. <br/>Anything you do say may be given in evidence. <br/>Do you understand?. <br/>The necessities for your arrest are to ___.",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "Search - GOWISELY",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "Before you stop and search someone you must remember GO-WISELY. <br/>You do not have to use this after arrest. <br/>Grounds: for the search. <br/>Object: of the search. <br/>Warrant card: If not in uniform. <br/>Identity: I am PC ___. <br/>Station: attached to ___ Police Station. <br/>Entitlement: Entitled to a copy of this search up to ___ months. <br/>Legal power: Searching under s1 PACE (1984) / s23 MODA (1971). <br/>You: You are currently detained for the purpose of a search.",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "PACE - Key Legislation",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "Police and Criminal Evidence Act 1984  - PACE.<br/> Section 1 - Stop and search (Stolen property, prohibited articles, weapons, articles used to commit an offence.<br/>Section 17 - Entry for the purpose of life and arrest<br/> Section 18 - Entry to search after an arrest <br/>Section 19 - Power of seizure<br/> Section 24 - Power of arrest <br/> Section 32 - Search after an arrest",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "Identify Codes",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "IC1:~s~ White - North European. <br/>IC2: White - South European. <br/>IC3: Black. <br/>IC4: Asian. <br/>IC5: Chinese, Japanese or other South East Asian. <br/>IC6: Arabic or North African. <br/>IC9: Unknown",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "Traffic Offence Report",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "I am reporting you for consideration of the question of prosecuting you for the offence(s) of ___. <br/><br/>You do not have to say anything but it may harm your defence if you do not mention NOW something which you may later rely on in court. Anything you do say may be given in evidence. <br/><br/>You are not under arrest - you are entitled to legal advice and you are not obliged to remain with me.",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "Initial Phase Pursuit",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "VEHICLE DESCRIPTION: MAKE/MODEL/VRM. <br/>LOCATION & DIRECTION: ___. <br/>SPEED: ___. <br/>VEHICLE DENSITY: LOW/MED/HIGH. <br/>PEDESTRIAN DENSITY: LOW/MED/HIGH. <br/>ROAD CONDITIONS: WET/DRY/DIRT. <br/>WEATHER: CLEAR/LIGHT/DARK. <br/>VISIBILITY: CLEAR/MED/LOW. <br/>DRIVER CLASSIFICATION: IPP/ADV/TPAC. <br/>POLICE VEHICLE: MARKED/UNMARKED",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "Warning Markers",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "FI: FIREARMS. <br/>WE: WEAPONS. <br/>XP: EXPLOSIVES. <br/>VI: VIOLENT. <br/>CO: CONTAGIOUS. <br/>ES: ESCAPER. <br/>AG: ALLEGES. <br/>AT: AILMENT. <br/>SU: SUICIDAL. <br/>MH: MENTAL HEALTH. <br/>DR: DRUGS. <br/>IM: MALE IMPERSONATOR. <br/>IF: FEMALE IMPERSONATOR",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "s136 - Mental Healt Act",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "A constable may take a person to (or keep at) a place of a safety. <br/>This can be done without a warrant if: The individual appears to have a mental disorder, and they are in any place other than a house, flat or room where a person is living, or garden or garage that only one household has access to, and they are in need of immediate care or control. <br/><br/>A registered medical practitioner/healthcare professional must be consulted if practicable to do so.",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
                RageUI.Button(
                    "Arrest Necessities",
                    nil,
                    {},
                    function(F, G, H)
                        if H then
                            TriggerEvent(
                                "XTRA:showNotification",
                                {
                                    text = "You require at least two of the following necessities to arrest a suspect: <br/><br/>Investigation: conduct a prompt and effective. <br/>Disappearance: prevent the prosecution being hindered. <br/>Child or Vulnerable person: to protect a. <br/>Obstruction: of the highway unlawfully (preventing). <br/>Physical Injury: prevent to themselves or other person. <br/>Public Decency: prevent an offence being committed against. <br/>Loss or Damage: prevent to property. <br/>Address: enable to be ascertained (not readily available). <br/>Name: enable to be ascertained (not readily available).",
                                    height = "auto",
                                    width = "auto",
                                    colour = "#FFF",
                                    background = "#3287cd",
                                    pos = "bottom-right",
                                    icon = "success"
                                },
                                100000
                            )
                        end
                    end
                )
            end,
            function()
            end
        )
    end
)
TriggerEvent("chat:addSuggestion", "/handbook", "Toggle the Police Handbook")
RegisterNetEvent(
    "XTRA:toggleHandbook",
    function()
        RageUI.Visible(RMenu:Get("policehandbook", "main"), true)
    end
)
RegisterNetEvent(
    "playBreathalyserSound",
    function(r)
        Citizen.SetTimeout(
            10000,
            function()
                local J = tXTRA.getPlayerCoords()
                local K = #(J - r)
                if K <= 15 then
                    SendNUIMessage({transactionType = "breathalyser"})
                end
            end
        )
    end
)
TriggerEvent("chat:addSuggestion", "/breathalyse", "Breathalyse the nearest person")
RegisterNetEvent(
    "XTRA:breathTestResult",
    function(L, M)
        local N = M
        RequestAnimDict("weapons@first_person@aim_rng@generic@projectile@shared@core")
        while not HasAnimDictLoaded("weapons@first_person@aim_rng@generic@projectile@shared@core") do
            Wait(0)
        end
        TaskPlayAnim(
            tXTRA.getPlayerPed(),
            "weapons@first_person@aim_rng@generic@projectile@shared@core",
            "idlerng_med",
            1.0,
            -1,
            10000,
            50,
            0,
            false,
            false,
            false
        )
        RageUI.Text({message = "~w~You are now ~b~breathalysing ~b~" .. I .. "~w~, please wait for the results."})
        Citizen.SetTimeout(
            10000,
            function()
                if L < 36 then
                    RageUI.Text(
                        {
                            message = "~w~The suspect has provided a legal breathalyser sample of ~b~" ..
                                L .. " ~w~µg/100ml."
                        }
                    )
                else
                    RageUI.Text(
                        {
                            message = "~w~The suspect has provided an illegal breathalyser sample of ~b~" ..
                                L .. " ~w~µg/100ml."
                        }
                    )
                end
            end
        )
    end
)
RegisterNetEvent(
    "XTRA:beingBreathalysed",
    function()
        RageUI.Text({message = "~w~You are currently being ~b~breathalysed ~w~by a police officer."})
    end
)
RegisterNetEvent(
    "XTRA:breathalyserCommand",
    function()
        local B = tXTRA.getPlayerPed()
        if not IsPedInAnyVehicle(B, true) then
            local r = GetEntityCoords(B)
            local O = GetActivePlayers()
            for P, Q in pairs(O) do
                if GetPlayerPed(Q) ~= B then
                    local R = GetEntityCoords(GetPlayerPed(Q))
                    local S = #(r - R)
                    if S < 3.0 then
                        local T = GetPlayerServerId(Q)
                        TriggerServerEvent("XTRA:breathalyserRequest", T)
                        break
                    end
                end
            end
        end
    end
)
TriggerEvent("chat:addSuggestion", "/wc", "Flash your police warrant card.")
TriggerEvent("chat:addSuggestion", "/wca", "Flash your police warrant card anonymously.")
RegisterNetEvent(
    "XTRA:flashWarrantCard",
    function()
        local B = PlayerPedId()
        local U = tXTRA.loadModel("prop_fib_badge")
        local V = CreateObject(U, 0, 0, 0, true, true, true)
        while not DoesEntityExist(V) do
            Wait(0)
        end
        SetModelAsNoLongerNeeded(U)
        FreezeEntityPosition(V)
        AttachEntityToEntity(
            V,
            B,
            GetPedBoneIndex(B, 58866),
            0.03,
            -0.05,
            -0.044,
            0.0,
            90.0,
            25.0,
            true,
            true,
            false,
            true,
            1,
            true
        )
        Wait(3000)
        DeleteObject(V)
    end
)
RegisterNetEvent(
    "XTRA:startSearchingSuspect",
    function()
        tXTRA.setCanAnim(false)
        tXTRA.loadAnimDict("custom@police")
        TaskPlayAnim(PlayerPedId(), "custom@police", "police", 8.0, 8.0, -1, 0, 0.0, false, false, false)
        RemoveAnimDict("custom@police")
        local W = GetGameTimer()
        while GetGameTimer() - W < 10000 do
            if IsDisabledControlJustPressed(0, 73) then
                TriggerServerEvent("XTRA:cancelPlayerSearch")
                return
            end
            Citizen.Wait(0)
        end
        tXTRA.setCanAnim(true)
    end
)
local X = false
RegisterNetEvent(
    "XTRA:startBeingSearching",
    function(Y)
        local Z = GetPlayerFromServerId(Y)
        if Z == -1 then
            return
        end
        local _ = GetPlayerPed(Z)
        if _ == 0 then
            return
        end
        X = true
        tXTRA.setCanAnim(false)
        tXTRA.loadAnimDict("custom@suspect")
        local p = tXTRA.getPlayerPed()
        AttachEntityToEntity(p, _, -1, -0.05, 0.5, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
        TaskPlayAnim(p, "custom@suspect", "suspect", 8.0, 8.0, -1, 2, 0.0, false, false, false)
        RemoveAnimDict("custom@suspect")
        local W = GetGameTimer()
        while GetGameTimer() - W < 10000 do
            if not X then
                return
            end
            Citizen.Wait(0)
        end
        X = false
        tXTRA.setCanAnim(true)
        DetachEntity(p)
        ClearPedTasks(p)
    end
)
RegisterNetEvent(
    "XTRA:cancelPlayerSearch",
    function()
        X = false
        tXTRA.setCanAnim(true)
        local p = tXTRA.getPlayerPed()
        DetachEntity(p)
        ClearPedTasks(p)
    end
)
local a0 = ""
local a1 = ""
local a2 = ""
local a3 = false
local a4 = ""
local a5 = ""
local a6 = ""
local a7 = false
RegisterNetEvent(
    "XTRA:receivePoliceCallsign",
    function(a8, a9, aa)
        a0 = a9
        a1 = a8
        a2 = aa
        a3 = true
        print("Your PD rank is: " .. a0 .. "\nYour callsign is: " .. a1)
    end
)
RegisterNetEvent(
    "XTRA:receiveHmpCallsign",
    function(a8, a9, aa)
        a4 = a9
        a5 = a8
        a6 = aa
        a7 = true
        print("Your HMP rank is: " .. a6 .. "\nYour callsign is: " .. a5)
    end
)
function tXTRA.getPoliceCallsign()
    return a1
end
function tXTRA.getPoliceRank()
    return a0
end
function tXTRA.getPoliceName()
    return a2
end
function tXTRA.hasPoliceCallsign()
    return a3
end
function tXTRA.getHmpCallsign()
    return a5
end
function tXTRA.getHmpRank()
    return a4
end
function tXTRA.getHmpName()
    return a6
end
function tXTRA.hasHmpCallsign()
    return a7
end
function func_drawCallsign()
    if not globalHideUi then
        if a1 ~= "" and globalOnPoliceDuty then
            DrawAdvancedText(1.064, 0.972, 0.005, 0.0028, 0.4, a1, 255, 255, 255, 255, 0, 0)
        end
        if a5 ~= "" and globalOnPrisonDuty then
            DrawAdvancedText(1.064, 0.972, 0.005, 0.0028, 0.4, a5, 255, 255, 255, 255, 0, 0)
        end
    end
end
tXTRA.createThreadOnTick(func_drawCallsign)
local ab = 0
local function ac()
    local p = tXTRA.getPlayerPed()
    if IsPedShooting(p) then
        local ad = GetSelectedPedWeapon(p)
        local ae, af = GetMaxAmmo(p, ad)
        local ag = GetWeapontypeGroup(ad)
        if af >= 1 and ag ~= GetHashKey("GROUP_MELEE") and ag ~= GetHashKey("GROUP_THROWN") then
            ab = GetGameTimer()
        end
    end
end
tXTRA.createThreadOnTick(ac)
function tXTRA.hasRecentlyShotGun()
    return ab ~= 0 and GetGameTimer() - ab < 600000
end
AddEventHandler(
    "XTRA:onClientSpawn",
    function()
        ab = 0
    end
)
RMenu.Add(
    "trainingWorlds",
    "mainmenu",
    RageUI.CreateMenu("Training Worlds", "Main Menu", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight())
)
local ah = {}
local ai = false
RegisterNetEvent(
    "XTRA:trainingWorldOpen",
    function(aj)
        ai = aj
        RageUI.Visible(RMenu:Get("trainingWorlds", "mainmenu"), true)
    end
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        RageUI.IsVisible(
            RMenu:Get("trainingWorlds", "mainmenu"),
            true,
            true,
            true,
            function()
                local ak = false
                for u, al in pairs(ah) do
                    local am = string.format("Created by %s (%s) - Bucket %s", al.ownerName, al.ownerUserId, al.bucket)
                    local an = al.bucket == tXTRA.getPlayerBucket()
                    local ao = an and {RightLabel = "(Joined)"} or {}
                    RageUI.ButtonWithStyle(
                        al.name,
                        am,
                        ao,
                        true,
                        function(F, G, H)
                            if G and ai then
                                drawNativeNotification("Press ~INPUT_FRONTEND_DELETE~ to delete this world")
                                if IsControlJustPressed(0, 214) then
                                    TriggerServerEvent("XTRA:trainingWorldRemove", u)
                                end
                            end
                            if H then
                                TriggerServerEvent("XTRA:trainingWorldJoin", u)
                            end
                        end
                    )
                    if an then
                        ak = an
                    end
                end
                if ak then
                    RageUI.ButtonWithStyle(
                        "~r~Leave Training World",
                        nil,
                        {},
                        true,
                        function(F, G, H)
                            if H then
                                TriggerServerEvent("XTRA:trainingWorldLeave")
                            end
                        end
                    )
                end
                if ai then
                    RageUI.ButtonWithStyle(
                        "~b~Create Training World",
                        nil,
                        {},
                        true,
                        function(F, G, H)
                            if H then
                                TriggerServerEvent("XTRA:trainingWorldCreate")
                            end
                        end
                    )
                end
            end,
            function()
            end
        )
    end
)
RegisterNetEvent(
    "XTRA:trainingWorldSend",
    function(u, ap)
        ah[u] = ap
    end
)
RegisterNetEvent(
    "XTRA:trainingWorldSendAll",
    function(ap)
        ah = ap
    end
)
RegisterNetEvent(
    "XTRA:trainingWorldRemove",
    function(u)
        ah[u] = nil
    end
)
function tXTRA.canBeCuffed()
    return tXTRA.isPlayerSurrenderedNoProgressBar(), tXTRA.isHandcuffed() or tXTRA.isPedBeingTackled() or tXTRA.isTazed()
end
