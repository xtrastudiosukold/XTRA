local a = module("cfg/cfg_purge")
local b = a.coords[a.location]
local function c()
    math.random()
    math.random()
    math.random()
    return b[math.random(1, #b)]
end
local d = false
function tXTRA.hasSpawnProtection()
    return d
end
local function e()
    d = true
    SetTimeout(
        10000,
        function()
            d = false
        end
    )
    Citizen.CreateThread(
        function()
            SetLocalPlayerAsGhost(true)
            while d do
                SetEntityProofs(PlayerPedId(), true, true, true, true, true, true, true, true)
                SetEntityAlpha(PlayerPedId(), 100, false)
                Wait(0)
            end
            SetEntityAlpha(PlayerPedId(), 255, false)
            SetLocalPlayerAsGhost(false)
            ResetGhostedEntityAlpha()
            tXTRA.notify("~g~Spawn protection ended!")
            SetEntityProofs(PlayerPedId(), false, false, false, false, false, false, false, false)
        end
    )
end
local f
RegisterNetEvent("XTRA:purgeSpawnClient")
AddEventHandler(
    "XTRA:purgeSpawnClient",
    function(g)
        ShutdownLoadingScreen()
        ShutdownLoadingScreenNui()
        e()
        DoScreenFadeOut(250)
        tXTRA.hideUI()
        SetBigmapActive(false)
        Wait(500)
        TriggerScreenblurFadeIn(100.0)
        f = c()
        RequestCollisionAtCoord(f.x, f.y, f.z)
        local h = GetGameTimer()
        while HaveAllStreamingRequestsCompleted(PlayerPedId()) ~= 1 and GetGameTimer() - h < 5000 do
            Wait(0)
          --  print("[XTRA] Waiting for streaming requests to complete!")
        end
        tXTRA.checkCustomization()
        TriggerServerEvent("XTRA:getPlayerHairstyle")
        TriggerServerEvent("XTRA:getPlayerTattoos")
        DoScreenFadeIn(1000)
        tXTRA.showUI()
        local i = tXTRA.getPlayerCoords()
        SetEntityCoordsNoOffset(PlayerPedId(), i.x, i.y, 1200.0, false, false, false)
        SetEntityVisible(PlayerPedId(), false, false)
        FreezeEntityPosition(PlayerPedId(), true)
        SetEntityVisible(PlayerPedId(), true, true)
        SetFocusPosAndVel(f.x, f.y, f.z + 1000, 0.0, 0.0, 0.0)
        spawnCam = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", f.x, f.y, f.z + 1000, 0.0, 0.0, 0.0, 65.0, 0, 2)
        SetCamActive(spawnCam, true)
        RenderScriptCams(true, true, 0, true, false)
        spawnCam2 = CreateCameraWithParams("DEFAULT_SCRIPTED_CAMERA", f.x, f.y, f.z, 0.0, 0.0, 0.0, 65.0, 0, 2)
        SetCamActiveWithInterp(spawnCam2, spawnCam, 5000, 0, 0)
        Wait(2500)
        ClearFocus()
        if not g then
            SetEntityCoords(PlayerPedId(), f.x, f.y, f.z)
        end
        FreezeEntityPosition(PlayerPedId(), false)
        TriggerScreenblurFadeOut(2000.0)
        Wait(2000)
        DestroyCam(spawnCam, false)
        DestroyCam(spawnCam2, false)
        RenderScriptCams(false, true, 2000, 0, 0)
        tXTRA.setHealth(200)
        tXTRA.setArmour(200)
        TriggerServerEvent("XTRA:purgeClientHasSpawned")
    end
)
RegisterNetEvent("XTRA:purgeGetWeapon")
AddEventHandler(
    "XTRA:purgeGetWeapon",
    function()
        tXTRA.notify("~o~Random weapon received!")
        PlaySoundFrontend(-1, "Weapon_Upgrade", "DLC_GR_Weapon_Upgrade_Soundset", true)
    end
)
Citizen.CreateThread(
    function()
        if tXTRA.isPurge() then
            local j = AddBlipForRadius(0.0, 0.0, 0.0, 50000.0)
            SetBlipColour(j, 1)
            SetBlipAlpha(j, 180)
        end
    end
)

RegisterCommand(
    "purge",
    function()
        if tXTRA.isPurge() then
            TriggerEvent("XTRA:purgeSpawnClient")
            local k = tXTRA.getPlayerCoords()
            tXTRA.notify("~g~Teleporting to airport... please wait.")
            Wait(5000)
            if k == tXTRA.getPlayerCoords() then
                tXTRA.teleport(-1113.495, -2917.377, 13.94363)
                tXTRA.notify("~g~Teleported to airport, use /suicide to return to the purge.")
            else
                tXTRA.notify("~r~Teleportation failed, please remain still when teleporting.")
            end
        end
    end
)
RegisterCommand(
    "airport",
    function()
        if tXTRA.isPurge() then
            local k = tXTRA.getPlayerCoords()
            tXTRA.notify("~g~Teleporting to airport... please wait.")
            Wait(5000)
            if k == tXTRA.getPlayerCoords() then
                tXTRA.teleport(-1113.495, -2917.377, 13.94363)
                tXTRA.notify("~g~Teleported to airport, use /suicide to return to the purge.")
            else
                tXTRA.notify("~r~Teleportation failed, please remain still when teleporting.")
            end
        end
    end
)
