local a = {active = false, id = 0, prop = 0, inVehicle = false}
local b = {
    {
        name = "CTSFO",
        model = "prop_shield_one",
        offSet = {-0.59, 0.29, 0.15},
        rotation = {0.16, 79.04, 41.39},
        boneIndex = 24818,
        collision = true,
        allowPistol = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180"
    },
    {
        name = "Firearms",
        model = "prop_shield_two",
        offSet = {-0.59, 0.29, 0.15},
        rotation = {0.16, 79.04, 41.39},
        boneIndex = 24818,
        collision = true,
        allowPistol = true,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180"
    },
    {
        name = "Long",
        model = "prop_shield_three",
        offSet = {-1.2, 0.31, -0.05},
        rotation = {1.0, 74.39, 41.39},
        boneIndex = 24818,
        collision = false,
        allowPistol = false,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180"
    },
    {
        name = "Short",
        model = "prop_shield_four",
        offSet = {-0.68, 0.22, 0.15},
        rotation = {0.52, 79.28, 41.39},
        boneIndex = 24818,
        collision = true,
        allowPistol = false,
        animDict = "combat@combat_reactions@pistol_1h_hillbilly",
        animName = "180"
    }
}
local c = {"WEAPON_STUNGUN", "WEAPON_PDGLOCK"}
Citizen.CreateThread(
    function()
        TriggerEvent("chat:addSuggestion", "/shield", "Use a police shield")
        while true do
            if a.active and a.id ~= 0 then
                local d = tXTRA.getPlayerPed()
                if IsPedInAnyVehicle(d, true) then
                    if not a.inVehicle then
                        SetEntityCollision(a.prop, false, true)
                        a.inVehicle = true
                        if not b[a.id].collision then
                            SetEntityCollision(a.prop, false, true)
                        end
                    end
                else
                    if a.inVehicle then
                        SetEntityCollision(a.prop, b[a.id].collision, true)
                        if not b[a.id].collision then
                            SetEntityCompletelyDisableCollision(a.prop, true, true)
                        end
                        Wait(200)
                        TaskPlayAnim(d, b[a.id].animDict, b[a.id].animName, 8.0, -8.0, -1, 50, 0.0, 0, 0, 0)
                        a.inVehicle = false
                        if not b[a.id].collision then
                            SetEntityCollision(a.prop, false, true)
                        end
                    end
                end
                if not a.inVehicle then
                    if b[a.id] ~= nil and b[a.id].animDict ~= nil and b[a.id].animName ~= nil then
                        if not IsEntityPlayingAnim(d, b[a.id].animDict, b[a.id].animName, 3) then
                            TaskPlayAnim(d, b[a.id].animDict, b[a.id].animName, 8.0, -8.0, -1, 50, 0.0, 0, 0, 0)
                        end
                    end
                    if not b[a.id].collision then
                        SetEntityCollision(a.prop, false, true)
                    end
                end
                local e = GetSelectedPedWeapon(d)
                if e ~= GetHashKey("WEAPON_UNARMED") and (not b[a.id].allowPistol or not table.has(c, e)) then
                    tXTRA.setWeapon(d, "WEAPON_UNARMED", true)
                end
                DisableControlAction(0, 210, true)
                DisableControlAction(1, 210, true)
                DisableControlAction(0, 36, true)
                DisableControlAction(1, 36, true)
                if not b[a.id].collision then
                    SetEntityCollision(a.prop, false, true)
                end
            end
            Wait(0)
        end
    end
)
RMenu.Add(
    "policeshields",
    "main",
    RageUI.CreateMenu("Police Shields", "Shield Management", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight())
)
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("policeshields", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for f, g in pairs(b) do
                        RageUI.Button(
                            g.name .. " Shield",
                            "Use the " .. g.name .. " Shield",
                            {},
                            true,
                            function(h, i, j)
                                if j then
                                    createShield(f)
                                end
                            end
                        )
                    end
                    if a.active then
                        RageUI.Button(
                            "Remove Shield",
                            "Removes your current shield",
                            {},
                            true,
                            function(h, i, j)
                                if j then
                                    removeShield(true)
                                end
                            end
                        )
                    end
                end
            )
        end
    end
)
RegisterNetEvent(
    "XTRA:toggleShieldMenu",
    function(k)
        RageUI.Visible(RMenu:Get("policeshields", "main"), true)
    end
)
function removeShield(l)
    if DoesEntityExist(a.prop) then
        local d = tXTRA.getPlayerPed()
        DetachEntity(a.prop)
        DeleteEntity(a.prop)
        a.id = 0
        a.active = false
        ClearPedTasks(d)
        ClearPedTasksImmediately(d)
        SetWeaponAnimationOverride(d, "Default")
        if l then
            tXTRA.notify("~g~Success~w~: Shield removed")
        end
    end
end
function createShield(m)
    print("Creating a shield")
    local n = false
    local d = tXTRA.getPlayerPed()
    local o = tXTRA.getPlayerCoords()
    if a.active then
        removeShield(false)
    end
    a.id = m
    local p = tXTRA.loadModel(b[m].model)
    a.prop = CreateObject(p, o.x, o.y, o.z, true, true, true)
    while not DoesEntityExist(a.prop) do
        Wait(0)
        print("Shield does not exist")
    end
    SetModelAsNoLongerNeeded(p)
    if not b[m].collision then
        SetEntityCompletelyDisableCollision(a.prop, true, true)
    end
    SetWeaponAnimationOverride(d, "Gang1H")
    tXTRA.loadAnimDict(b[m].animDict)
    TaskPlayAnim(d, b[m].animDict, b[m].animName, 8.0, -8.0, -1, 50, 0.0, 0, 0, 0)
    RemoveAnimDict(b[m].animDict)
    local q = GetPedBoneIndex(d, b[m].boneIndex)
    AttachEntityToEntity(
        a.prop,
        d,
        q,
        b[m].offSet[1],
        b[m].offSet[2],
        b[m].offSet[3],
        b[m].rotation[1],
        b[m].rotation[2],
        b[m].rotation[3],
        true,
        true,
        b[m].collision,
        false,
        1,
        true
    )
    a.active = true
end
