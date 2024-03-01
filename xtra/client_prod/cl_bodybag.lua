RegisterCommand(
    "bodybag",
    function()
        local a = tXTRA.getNearestPlayer(3)
        if a then
            TriggerServerEvent("XTRA:requestBodyBag", a)
        else
            tXTRA.notify("No one dead nearby")
        end
    end
)
RegisterNetEvent(
    "XTRA:removeIfOwned",
    function(b)
        local c = tXTRA.getObjectId(b, "bodybag_removeIfOwned")
        if c then
            if DoesEntityExist(c) then
                if NetworkHasControlOfEntity(c) then
                    DeleteEntity(c)
                end
            end
        end
    end
)
RegisterNetEvent(
    "XTRA:placeBodyBag",
    function()
        local d = tXTRA.getPlayerPed()
        local e = GetEntityCoords(d)
        local f = GetEntityHeading(d)
        SetEntityVisible(d, false, 0)
        local g = tXTRA.loadModel("xm_prop_body_bag")
        local h = CreateObject(g, e.x, e.y, e.z, true, true, true)
        DecorSetInt(h, decor, 945)
        PlaceObjectOnGroundProperly(h)
        SetModelAsNoLongerNeeded(g)
        local b = ObjToNet(h)
        TriggerServerEvent("XTRA:removeBodybag", b)
        while GetEntityHealth(tXTRA.getPlayerPed()) <= 102 do
            Wait(0)
        end
        DeleteEntity(h)
        SetEntityVisible(d, true, 0)
    end
)
