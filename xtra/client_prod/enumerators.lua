local a = {__gc = function(b)
    if b.destructor and b.handle then
        b.destructor(b.handle)
    end
    b.destructor = nil
    b.handle = nil
end}
local function c(d, e, f)
return coroutine.wrap(
    function()
        local g, h = d()
        if not h or h == 0 then
            f(g)
            return
        end
        local b = {handle = g, destructor = f}
        setmetatable(b, a)
        local i = true
        repeat
            coroutine.yield(h)
            i, h = e(g)
        until not i
        b.destructor, b.handle = nil, nil
        f(g)
    end
)
end
function EnumerateObjects()
return c(FindFirstObject, FindNextObject, EndFindObject)
end
function EnumeratePeds()
return c(FindFirstPed, FindNextPed, EndFindPed)
end
function EnumerateVehicles()
return c(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function EnumeratePickups()
return c(FindFirstPickup, FindNextPickup, EndFindPickup)
end
function GetAllEnumerators()
return {vehicles = EnumerateVehicles, objects = EnumerateObjects, peds = EnumeratePeds, pickups = EnumeratePickups}
end
