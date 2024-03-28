local a = false
local b = nil
local c = nil
local d = nil
local e = false
local f = GetHashKey("prop_poly_bag_money")
AddEventHandler(
    "XTRA:IsInMoneyComa",
    function(g)
        e = g
        if g then
            d = false
            a = false
            b = nil
        end
    end
)
Citizen.CreateThread(
    function()
        while true do
            Wait(250)
            if not e then
                local h = GetEntityCoords(PlayerPedId())
                if DoesObjectOfTypeExistAtCoords(h, 10.5, f, true) then
                    if not a then
                        a = true
                        b = GetClosestObjectOfType(h, 10.5, f, false, false, false)
                        PlaceObjectOnGroundProperly(b)
                        c = ObjToNet(b)
                        d = GetEntityCoords(b)
                    end
                else
                    d = false
                    a = false
                    b = nil
                end
            end
        end
    end
)
