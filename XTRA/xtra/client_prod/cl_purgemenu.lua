local a = {[1] = 12, [2] = 3, [3] = 43}
local b = {}
local c = 0
local function d(d, e, f)
    local g = 0.17
    local h = -0.01
    local i = 0.038
    local j = 0.008
    local k = 0.005
    local l = 0.32
    local m = -0.04
    local n = 0.014
    local o = GetSafeZoneSize()
    local p = n + o - g + g / 2
    local q = m + o - i + i / 2 - (f - 1) * (i + k)
    local name = string.upper(e) or e or "N/A"
    DrawSprite("timerbars", "all_black_bg", p, q, g, 0.038, 0, 0, 0, 0, 128)
    DrawGTAText(d, o - g + 0.04, q - j, l)
    DrawGTAText(name, o - h, q - 0.0175, 0.5, true, g / 2)
end
function func_purgeTimerBars()
    for f = 1, 3 do
        local r = b[f]
        local s =
            ("%d%s: %s(%s)"):format(
            f,
            f == 1 and "st" or f == 2 and "nd" or "rd",
            r and r.name or "None",
            r and r.user_id or "0"
        )
        d("~HC_" .. a[f] .. "~" .. s, r and r.kills or "0", 4 - f)
    end
    d("~r~KILLS", c, 0)
end
if tXTRA.isPurge() then
    tXTRA.createThreadOnTick(func_purgeTimerBars)
end
RegisterNetEvent("XTRA:gotTopFraggers")
AddEventHandler(
    "XTRA:gotTopFraggers",
    function(t, u)
        b = t
        table.sort(
            b,
            function(a, b)
                return a.kills > b.kills
            end
        )
        c = u
    end
)
Citizen.CreateThread(
    function()
        Wait(5000)
        if tXTRA.isPurge() then
            while true do
                TriggerServerEvent("XTRA:getTopFraggers")
                Wait(5000)
            end
        end
    end
)
