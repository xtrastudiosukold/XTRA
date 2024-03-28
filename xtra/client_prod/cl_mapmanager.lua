local a = {}
local b = {}
AddEventHandler(
    "onClientResourceStart",
    function(c)
        local d = GetNumResourceMetadata(c, "map")
        if d > 0 then
            for e = 0, d - 1 do
                local f = GetResourceMetadata(c, "map", e)
                if f then
                    addMap(f, c)
                end
            end
        end
        local g = GetResourceMetadata(c, "resource_type", 0)
        if g then
            local h = GetResourceMetadata(c, "resource_type_extra", 0)
            if h then
                h = json.decode(h)
            else
                h = {}
            end
            if g == "map" then
                a[c] = h
            elseif g == "gametype" then
                b[c] = h
            end
        end
        loadMap(c)
        Citizen.CreateThread(
            function()
                Citizen.Wait(15)
                if a[c] then
                    TriggerEvent("onClientMapStart", c)
                elseif b[c] then
                    TriggerEvent("onClientGameTypeStart", c)
                end
            end
        )
    end
)
AddEventHandler(
    "onResourceStop",
    function(c)
        if a[c] then
            TriggerEvent("onClientMapStop", c)
        elseif b[c] then
            TriggerEvent("onClientGameTypeStop", c)
        end
        unloadMap(c)
    end
)
AddEventHandler(
    "getMapDirectives",
    function(i)
        if not CreateScriptVehicleGenerator then
            return
        end
        i(
            "vehicle_generator",
            function(j, k)
                return function(l)
                    local m, n, o, p
                    local q, r
                    if l.x then
                        m = l.x
                        n = l.y
                        o = l.z
                    else
                        m = l[1]
                        n = l[2]
                        o = l[3]
                    end
                    p = l.heading or 1.0
                    q = l.color1 or -1
                    r = l.color2 or -1
                    CreateThread(
                        function()
                            local s = GetHashKey(k)
                            RequestModel(s)
                            while not HasModelLoaded(s) do
                                Wait(4)
                            end
                            local t =
                                CreateScriptVehicleGenerator(
                                m,
                                n,
                                o,
                                p,
                                5.0,
                                3.0,
                                s,
                                q,
                                r,
                                -1,
                                -1,
                                true,
                                false,
                                false,
                                true,
                                true,
                                -1
                            )
                            SetScriptVehicleGenerator(t, true)
                            SetAllVehicleGeneratorsActive(true)
                            j.add("cargen", t)
                        end
                    )
                end
            end,
            function(j, u)
                Citizen.Trace("deleting car gen " .. tostring(j.cargen) .. "\n")
                DeleteScriptVehicleGenerator(j.cargen)
            end
        )
    end
)
