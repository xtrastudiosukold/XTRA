local a = {
    vector3(459.33172607422, -979.49810791016, 30.689582824708),
    vector3(1841.6328125, 3690.603515625, 34.26708984375),
    vector3(-1106.9595947266, -824.35784912109, 14.282789230347),
    vector3(-440.9443, 5990.631, 31.7162),
    vector3(1777.8238525391, 2542.4521484375, 45.797782897949)
}
local b = {vector3(454.01052856445, -1024.8431396484, 28.496109008789)}
Citizen.CreateThread(
    function()
        if true then
            local c = function()
                drawNativeNotification("Press ~INPUT_PICKUP~ to Pickup Armour")
            end
            local d = function()
            end
            local e = function()
                if IsControlJustPressed(1, 51) then
                    if tXTRA.globalOnPoliceDuty() or tXTRA.globalOnPrisonDuty() then
                        TriggerServerEvent("XTRA:getArmour")
                        local soundId = GetSoundId()
                        PlaySoundFrontend(soundId, "Armour_On", "DLC_GR_Steal_Miniguns_Sounds", true)
                        ReleaseSoundId(soundId)
                    else
                        tXTRA.notify("~r~You shouldn't be here...Engaging defenses in 3..2..1...")
                    end
                end
            end
            for f, g in pairs(a) do
                tXTRA.createArea("armour_" .. f, g, 1.5, 6, c, d, e)
                tXTRA.addMarker(g.x, g.y, g.z - 0.2, 0.5, 0.5, 0.5, 0, 50, 255, 4, 50, 20, false, false, true)
            end
        end
    end
)
local h = 0
function tXTRA.setArmour(i, j)
    if i ~= nil then
        local k = math.floor(i)
        h = k
        SetPedArmour(PlayerPedId(), k)
        if j then
            PlaySoundFrontend(soundId, "Armour_On", "DLC_GR_Steal_Miniguns_Sounds", true)
        end
    end
end
function tXTRA.getArmour()
    return GetPedArmour(PlayerPedId())
end
Citizen.CreateThread(
    function()
        while true do
            if tXTRA.getArmour() > h then
                tXTRA.setArmour(0)
            end
            Wait(0)
        end
    end
)
local l = 0
local m = false
function tXTRA.isPlayerInAnimalForm()
    return m or GetPedType(PlayerPedId()) == 28
end
function tXTRA.isPoliceHorse()
    return m
end
local function n()
    local o = GetEntityModel(PlayerPedId())
    if o == GetHashKey("mp_m_freemode_01") or o == GetHashKey("mp_f_freemode_01") then
        if GetEntityHealth(tXTRA.getPlayerPed()) <= 102 then
            tXTRA.notify("~r~Cannot spawn horse while dead.")
            return
        end
        l = tXTRA.getArmour()
        local p = tXTRA.loadModel("a_c_deer")
        local q = tXTRA.getPlayerCoords()
        local r = ClonePed(PlayerPedId(), true, true, true)
        local s = tXTRA.getCustomization()
        tXTRA.setCustomization({modelhash = "a_c_deer"})
        local t = "Horse"
        local u = 1
        local v = 0.12
        local w = -0.2
        AttachEntityToEntity(
            r,
            PlayerPedId(),
            GetPedBoneIndex(PlayerPedId(), 24816),
            w,
            0.0,
            v,
            0.0,
            0.0,
            -90.0,
            false,
            false,
            false,
            true,
            2,
            true
        )
        tXTRA.loadAnimDict("amb@prop_human_seat_chair@male@generic@base")
        TaskPlayAnim(r, "amb@prop_human_seat_chair@male@generic@base", "base", 8.0, 1, -1, 1, 1.0, 0, 0, 0)
        FreezeEntityPosition(PlayerPedId(), false)
        FreezeEntityPosition(r, false)
        SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 0)
        SetBlockingOfNonTemporaryEvents(r, true)
        SetPedCombatAttributes(r, 292, true)
        SetPedFleeAttributes(r, 0, 0)
        SetPedRelationshipGroupHash(r, "CIVFEMALE")
        m = true
        while m do
            Wait(0)
            drawNativeNotification("~s~~INPUT_JUMP~ to exit horse")
            tXTRA.setWeapon(PlayerPedId(), "weapon_unarmed", true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)
            if IsDisabledControlPressed(0, 22) then
                m = false
            end
        end
        DeleteEntity(r)
        DetachEntity(PlayerPedId())
        tXTRA.setCustomization(s)
        tXTRA.setArmour(l)
    else
        tXTRA.notify("~r~Custom peds cannot be used with horses.")
    end
end
Citizen.CreateThread(
    function()
        if true then
            local x = function()
                drawNativeNotification("Press ~INPUT_PICKUP~ to spawn police horse!")
            end
            local y = function()
            end
            local z = function()
                if IsControlJustPressed(1, 51) and not m then
                    if tXTRA.globalOnPoliceDuty() and not inOrganHeist then
                        if tXTRA.globalHorseTrained() or tXTRA.getUserId() == 0 then
                            n()
                        else
                            tXTRA.notify("~r~You do not have the [Horse Trained] whitelist.")
                        end
                    else
                        tXTRA.notify("~r~This is only available to the MET Police only.")
                    end
                end
            end
            for A, B in pairs(b) do
                tXTRA.createArea("horse_" .. A, B, 1.5, 6, x, y, z)
                tXTRA.addMarker(B.x, B.y, B.z, 1.0, 1.0, 1.0, 0, 50, 255, 4, 50, 42, false, false, true)
            end
        end
    end
)
RegisterCommand(
    "policehorse",
    function()
        if not m then
            if tXTRA.globalOnPoliceDuty() and not inOrganHeist then
                if tXTRA.globalHorseTrained() or tXTRA.getUserId() == 0 then
                    n()
                else
                    tXTRA.notify("~r~You do not have the [Horse Trained] whitelist.")
                end
            else
                tXTRA.notify("~r~This is only available to the MET Police only.")
            end
        end
    end
)
local C = false
Citizen.CreateThread(
    function()
        while true do
            local D = GetEntityModel(GetPlayerPed(-1))
            if D == GetHashKey("a_c_deer") and C == false then
                SetRunSprintMultiplierForPlayer(PlayerId(), 1.49)
                C = true
            elseif C == true and D ~= GetHashKey("a_c_deer") then
                SetRunSprintMultiplierForPlayer(PlayerId(), 1.00)
            end
            Wait(0)
        end
    end
)



RegisterNetEvent("XTRA:playArmourApplyAnim",function()
    tXTRA.loadAnimDict("clothingtie")
    tXTRA.setCanAnim(false)
    TaskPlayAnim(PlayerPedId(), "clothingtie", "try_tie_negative_a", 3.0, 3.0, 5000, 51, 0, false, false, false)
    RemoveAnimDict("clothingtie")
    tXTRA.startCircularProgressBar("",5000,nil,function()
    end)
    tXTRA.setCanAnim(true)
end)