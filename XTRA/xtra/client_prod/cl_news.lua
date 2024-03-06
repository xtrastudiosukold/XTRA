local a = module("cfg/cfg_news")
local b = 70.0
local c = 5.0
local d = 10.0
local e = 8.0
local f = 8.0
local g = (b + c) * 0.5
local h = 1
RegisterNetEvent(
    "XTRA:toggleNewsItem",
    function(i)
        if not a.items[i].holding then
            stopAllActions()
            createNewsItemInitally(i)
        else
            removeNewsItem(i)
        end
    end
)
function createNewsItemInitally(i)
    local j = PlayerPedId()
    local k = GetOffsetFromEntityInWorldCoords(j, 0.0, 0.0, -5.0)
    local l = a.items[i]
    tXTRA.loadModel(l.model)
    local m = CreateObject(l.model, k.x, k.y, k.z, true, true, true)
    local n, o, p = l.boneId, l.position, l.rotation
    SetEntityCollision(m, false, true)
    AttachEntityToEntity(m, j, GetPedBoneIndex(j, n), o.x, o.y, o.z, p.x, p.y, p.z, true, true, false, true, 0, true)
    tXTRA.loadAnimDict(l.animations.dict)
    TaskPlayAnim(j, 1.0, -1, -1, 50, 0, 0, 0, 0, false, false)
    TaskPlayAnim(j, l.animations.dict, l.animations.name, 1.0, -1, -1, 50, 0, 0, 0, 0)
    RemoveAnimDict(l.animations.dict)
    local q = ""
    if i == "camera" then
        q = "~s~. \n \nPress ~r~[E]~s~ to enter recording mode~s~"
    end
    tXTRA.notifyPicture(
        "bbcnotification",
        "notification",
        "You are now holding a ~r~" .. a.items[i].formalName .. q .. "~s~.",
        "BBC News",
        "Equipment",
        nil,
        nil
    )
    a.items[i].holding = true
    Wait(1000)
    a.items[i].netId = ObjToNet(m)
    SetNetworkIdExistsOnAllMachines(a.items[i].netId, true)
    NetworkUseHighPrecisionBlending(a.items[i].netId, true)
    SetNetworkIdCanMigrate(a.items[i].netId, false)
    SetModelAsNoLongerNeeded(l.model)
end
function removeNewsItem(i)
    if a.items[i].holding then
        ClearPedSecondaryTask(PlayerPedId())
        DetachEntity(tXTRA.getObjectId(a.items[i].netId, "removeNewsItem (1)"), true, true)
        DeleteEntity(tXTRA.getObjectId(a.items[i].netId, "removeNewsItem (2)"))
        a.items[i].netId = nil
        a.items[i].holding = false
        a.items[i].using = false
        tXTRA.showUI()
        ExecuteCommand("showchat")
        tXTRA.notifyPicture(
            "bbcnotification",
            "notification",
            "You have put away the ~r~" .. a.items[i].formalName .. "~s~.",
            "BBC News",
            "Equipment",
            nil,
            nil
        )
    end
end
function stopAllActions()
    for r, s in pairs(a.items) do
        removeNewsItem(r)
    end
end
Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            local j = PlayerPedId()
            for i, s in pairs(a.items) do
                if a.items[i].holding then
                    if not IsEntityPlayingAnim(j, a.items[i].animations.dict, a.items[i].animations.name, 3) then
                        tXTRA.loadAnimDict(a.items[i].animations.dict)
                        TaskPlayAnim(j, 1.0, -1, -1, 50, 0, 0, 0, 0, false, false)
                        TaskPlayAnim(
                            j,
                            a.items[i].animations.dict,
                            a.items[i].animations.name,
                            1.0,
                            -1,
                            -1,
                            50,
                            0,
                            0,
                            0,
                            0
                        )
                        RemoveAnimDict(a.items[i].animations.dict)
                    end
                    DisablePlayerFiring(j, true)
                    DisableControlAction(0, 25, true)
                    DisableControlAction(0, 44, true)
                    DisableControlAction(0, 37, true)
                    SetCurrentPedWeapon(j, GetHashKey("WEAPON_UNARMED"), true)
                end
            end
            if a.items["camera"].using then
                if not HasStreamedTextureDictLoaded("bbcnews") then
                    RequestStreamedTextureDict("bbcnews", true)
                    while not HasStreamedTextureDictLoaded("bbcnews") do
                     --   print("stuck loading", "bbcnews")
                        Wait(0)
                    end
                end
                DrawSprite("bbcnews", a.textures[h].textureName, 0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255)
                if a.textures[h].textureName == "bbcnews" then
                    DrawAdvancedText(0.3575, 0.936, 0.0, 0.0, 0.75, getFormattedClock(), 255, 255, 255, 255, 2, 0)
                end
                if a.textures[h].textureName == "skynews" then
                    DrawAdvancedText(0.187, 0.935, 0.0, 0.0, 0.6, getFormattedClock(), 255, 255, 255, 255, 2, 0)
                end
            end
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Wait(0)
            if a.items["camera"].holding and IsControlJustReleased(1, 38) then
                a.items["camera"].using = true
                tXTRA.hideUI()
                ExecuteCommand("hidechat")
                tXTRA.notifyPicture(
                    "bbcnotification",
                    "notification",
                    "Press ~r~LEFT ALT ~s~to change overlay or ~r~BACKSPACE ~s~to exit recording mode.",
                    "BBC News",
                    "Now Recording",
                    nil,
                    nil
                )
                SetTimecycleModifier("default")
                SetTimecycleModifierStrength(0.3)
                local j = PlayerPedId()
                local t = GetVehiclePedIsIn(j, false)
                local u = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
                AttachCamToEntity(u, j, 0.0, 0.5, 0.65, true)
                SetCamRot(u, 2.0, 1.0, GetEntityHeading(j), 2)
                SetCamFov(u, g)
                RenderScriptCams(true, false, 0, 1, 0)
                EndScaleformMovieMethod()
                while a.items["camera"].using and not IsEntityDead(j) and GetVehiclePedIsIn(j, false) == t do
                    if IsControlJustReleased(1, 19) then
                        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                        if h <= 7 then
                            h = h + 1
                        else
                            h = 1
                        end
                    end
                    if IsControlJustReleased(1, 177) then
                        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                        a.items["camera"].using = false
                        tXTRA.showUI()
                        ExecuteCommand("showchat")
                    end
                    SetEntityRotation(j, 0, 0, new_z, 2, true)
                    local v = 1.0 / (b - c) * (g - c)
                    checkInputRotation(u, v)
                    handleZoom(u)
                    hideHUDThisFrame()
                    local w = GetGameplayCamRelativeHeading()
                    local x = GetGameplayCamRelativePitch()
                    if x < -70.0 then
                        x = -70.0
                    elseif x > 42.0 then
                        x = 42.0
                    end
                    x = (x + 70.0) / 112.0
                    if w < -180.0 then
                        w = -180.0
                    elseif w > 180.0 then
                        w = 180.0
                    end
                    w = (w + 180.0) / 360.0
                    SetTaskMoveNetworkSignalFloat(j, "Pitch", x)
                    SetTaskMoveNetworkSignalFloat(j, "Heading", w * -1.0 + 1.0)
                    Wait(0)
                end
                a.items["camera"].using = false
                tXTRA.showUI()
                ExecuteCommand("showchat")
                ClearTimecycleModifier()
                g = (b + c) * 0.5
                RenderScriptCams(false, false, 0, 1, 0)
                DestroyCam(u, false)
                SetNightvision(false)
                SetSeethrough(false)
            end
        end
    end
)
function getFormattedClock()
    local y = GetClockHours()
    local z = GetClockMinutes()
    if y < 10 then
        y = "0" .. y
    end
    if z < 10 then
        z = "0" .. z
    end
    return y .. " " .. z
end
function hideHUDThisFrame()
    HideHelpTextThisFrame()
    HideHudAndRadarThisFrame()
    HideHudComponentThisFrame(1)
    HideHudComponentThisFrame(2)
    HideHudComponentThisFrame(3)
    HideHudComponentThisFrame(4)
    HideHudComponentThisFrame(6)
    HideHudComponentThisFrame(7)
    HideHudComponentThisFrame(8)
    HideHudComponentThisFrame(9)
    HideHudComponentThisFrame(13)
    HideHudComponentThisFrame(11)
    HideHudComponentThisFrame(12)
    HideHudComponentThisFrame(15)
    HideHudComponentThisFrame(18)
    HideHudComponentThisFrame(19)
end
function checkInputRotation(A, v)
    local B = GetDisabledControlNormal(0, 220)
    local C = GetDisabledControlNormal(0, 221)
    local D = GetCamRot(A, 2)
    if B ~= 0.0 or C ~= 0.0 then
        new_z = D.z + B * -1.0 * f * (v + 0.1)
        new_x = math.max(math.min(20.0, D.x + C * -1.0 * e * (v + 0.1)), -89.5)
        SetCamRot(A, new_x, 0.0, new_z, 2)
    end
end
function handleZoom(A)
    local j = PlayerPedId()
    if not IsPedSittingInAnyVehicle(j) then
        if IsControlJustPressed(0, 241) then
            g = math.max(g - d, c)
        end
        if IsControlJustPressed(0, 242) then
            g = math.min(g + d, b)
        end
        local E = GetCamFov(A)
        if math.abs(g - E) < 0.1 then
            g = E
        end
        SetCamFov(A, E + (g - E) * 0.05)
    else
        if IsControlJustPressed(0, 17) then
            g = math.max(g - d, c)
        end
        if IsControlJustPressed(0, 16) then
            g = math.min(g + d, b)
        end
        local E = GetCamFov(A)
        if math.abs(g - E) < 0.1 then
            g = E
        end
        SetCamFov(A, E + (g - E) * 0.05)
    end
end
