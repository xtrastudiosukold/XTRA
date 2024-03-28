RegisterNUICallback(
    "exit",
    function(a)
        SetDisplay(false)
        stopAnim()
    end
)
RegisterNUICallback(
    "personsearch",
    function(a)
        TriggerServerEvent("XTRA:searchPerson", a.firstname, a.lastname)
    end
)
RegisterNUICallback(
    "platesearch",
    function(a)
        TriggerServerEvent("XTRA:searchPlate", a.plate)
    end
)
RegisterNUICallback(
    "submitfine",
    function(a)
        TriggerServerEvent("XTRA:finePlayer", a.user_id, a.charges, a.amount, a.notes)
    end
)
RegisterNUICallback(
    "addnote",
    function(a)
        TriggerServerEvent("XTRA:addNote", a.user_id, a.note)
    end
)
RegisterNUICallback(
    "removenote",
    function(a)
        TriggerServerEvent("XTRA:removeNote", a.user_id, a.note)
    end
)
RegisterNUICallback(
    "addattentiondrawn",
    function(a)
        TriggerServerEvent("XTRA:addAttentionDrawn", a)
    end
)
RegisterNUICallback(
    "removeattentiondrawn",
    function(a)
        TriggerServerEvent("XTRA:removeAttentionDrawn", a.ad)
    end
)
RegisterNUICallback(
    "savenotes",
    function(a)
        TriggerServerEvent("XTRA:updateVehicleNotes", a.notes, a.user_id, a.vehicle)
    end
)
RegisterNUICallback(
    "savepersonnotes",
    function(a)
        TriggerServerEvent("XTRA:updatePersonNote", a.user_id, a.notes)
    end
)
RegisterNUICallback(
    "generatewarrant",
    function(a)
        TriggerServerEvent("XTRA:getWarrant")
    end
)
RegisterNUICallback(
    "addpoint",
    function(a)
        TriggerServerEvent("XTRA:addPoints", a.points, a.id)
    end
)
RegisterNUICallback(
    "addmarker",
    function(a, b)
        TriggerServerEvent("XTRA:addWarningMarker", tonumber(a.id), a.type, a.reason)
        b()
    end
)
RegisterNUICallback(
    "wipeallmarkers",
    function(a, b)
        TriggerServerEvent("XTRA:wipeAllMarkers", a.code)
        b()
    end
)
RegisterNetEvent(
    "XTRA:sendSearcheduser",
    function(c)
        SendNUIMessage({type = "addPersons", user = c})
    end
)
RegisterNetEvent(
    "XTRA:sendSearchedvehicle",
    function(d)
        SendNUIMessage({type = "displaySearchedVehicle", vehicle = d})
    end
)
RegisterNetEvent(
    "XTRA:addADToClient",
    function(e)
        SendNUIMessage({type = "updateAttentionDrawn", ad = e})
    end
)
RegisterNetEvent(
    "XTRA:verifyFineSent",
    function(f, g)
        SendNUIMessage({type = "verifyFine", sentornah = f, msg = g})
    end
)
RegisterNetEvent(
    "XTRA:novehFound",
    function(g)
        SendNUIMessage({type = "noveh", message = g or "No vehicles found!"})
    end
)
RegisterNetEvent(
    "XTRA:openPNC",
    function(h, i, e)
        SetNuiFocus(true, true)
        SendNUIMessage(
            {
                type = "ui",
                status = true,
                id = tXTRA.getUserId(),
                name = GetPlayerName(PlayerId()),
                gc = h,
                news = i,
                ad = e
            }
        )
        startAnim()
    end
)
RegisterNetEvent(
    "XTRA:updateAttentionDrawn",
    function(j)
        SendNUIMessage({type = "updateAttentionDrawn", ad = j})
    end
)
RegisterNetEvent(
    "XTRA:setNameFields",
    function(k, l)
        SendNUIMessage({type = "setNameFields", lname = k, fname = l})
    end
)
RegisterNetEvent(
    "XTRA:noPersonsFound",
    function()
        SendNUIMessage({type = "NoPersonsFound"})
    end
)
CreateThread(
    function()
        while true do
            if IsControlJustPressed(0, 168) then
                TriggerServerEvent("XTRA:checkForPolicewhitelist")
            end
            Citizen.Wait(0)
        end
    end
)
function startAnim()
    CreateThread(
        function()
            RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")
            while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
                Citizen.Wait(0)
            end
            attachObject()
            TaskPlayAnim(
                tXTRA.getPlayerPed(),
                "amb@world_human_seat_wall_tablet@female@base",
                "base",
                8.0,
                -8.0,
                -1,
                50,
                0,
                false,
                false,
                false
            )
        end
    )
end
function attachObject()
    tab = CreateObject("prop_cs_tablet", 0, 0, 0, true, true, true)
    AttachEntityToEntity(
        tab,
        tXTRA.getPlayerPed(),
        GetPedBoneIndex(tXTRA.getPlayerPed(), 57005),
        0.17,
        0.10,
        -0.13,
        24.0,
        180.0,
        180.0,
        true,
        true,
        false,
        true,
        1,
        true
    )
end
function stopAnim()
    StopAnimTask(tXTRA.getPlayerPed(), "amb@world_human_seat_wall_tablet@female@base", "base", 8.0)
    DeleteEntity(tab)
end
function SetDisplay(f)
    SetNuiFocus(f, f)
    SendNUIMessage({type = "ui", status = f, name = GetPlayerName(PlayerId())})
end
function PoliceSeizeTrunk(m, n)
    TriggerServerEvent("XTRA:policeClearVehicleTrunk", m, n)
end
RegisterNetEvent(
    "XTRA:notifyAD",
    function(g, o)
        tXTRA.notifyPicture("met_logo", "met_logo1", g, "Met Control", o, "police", 2)
    end
)
