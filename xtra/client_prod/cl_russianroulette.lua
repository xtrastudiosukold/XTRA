RegisterNetEvent(
    "playRussianRoulette",
    function(a)
        local b = GetEntityCoords(tXTRA.getPlayerPed())
        local c = #(b - a)
        if c <= 15 then
            SendNUIMessage({transactionType = "playRussianRoulette"})
        end
    end
)
RegisterNetEvent(
    "playEmptyGun",
    function(a)
        local b = GetEntityCoords(tXTRA.getPlayerPed())
        local c = #(b - a)
        if c <= 15 then
            SendNUIMessage({transactionType = "emptygun"})
        end
    end
)
math.randomseed(GetGameTimer())
RegisterCommand(
    "russianroulette",
    function()
        local d = tXTRA.getPlayerPed()
        if HasPedGotWeapon(d, "WEAPON_PYTHON", false) then
            if GetAmmoInPedWeapon(d, "WEAPON_PYTHON") > 0 then
                tXTRA.setWeapon(d, "WEAPON_PYTHON", true)
                local e = GetEntityCoords(d)
                TriggerServerEvent("playRussianRouletteGlobally", e)
                num = math.random(1, 6)
                if not HasAnimDictLoaded("anim@weapons@first_person@aim_rng@general@pistol@revolver@str") then
                    RequestAnimDict("anim@weapons@first_person@aim_rng@general@pistol@revolver@str")
                    while not HasAnimDictLoaded("anim@weapons@first_person@aim_rng@general@pistol@revolver@str") do
                        Wait(1)
                    end
                end
                TaskPlayAnim(
                    d,
                    "anim@weapons@first_person@aim_rng@general@pistol@revolver@str",
                    "reload_aim",
                    8.0,
                    8.0,
                    -1,
                    2
                )
                RemoveAnimDict("anim@weapons@first_person@aim_rng@general@pistol@revolver@str")
                Wait(4500)
                if not HasAnimDictLoaded("mp_suicide") then
                    RequestAnimDict("mp_suicide")
                    while not HasAnimDictLoaded("mp_suicide") do
                        Wait(1)
                    end
                end
                if num == 1 then
                    TaskPlayAnim(d, "mp_suicide", "pistol", 4.0, 0.0, -1, 0, 0.1, 0, 0, 0)
                    Wait(800)
                    SetPedShootsAtCoord(d, 0.0, 0.0, 0.0, 0)
                    SetEntityHealth(d, 0)
                else
                    local f = GetEntityCoords(d)
                    local g = GetEntityHeading(d)
                    TaskPlayAnim(d, "mp_suicide", "pistol", 2.0, 100.0, 500, 0, 0.1, 0, 0, 0)
                    Wait(500)
                    TriggerServerEvent("playEmptyGunGlobally", e)
                end
                RemoveAnimDict("mp_suicide")
                ClearPedSecondaryTask(d)
            end
        end
    end
)
