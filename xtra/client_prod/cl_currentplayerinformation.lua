local a = {}
RegisterNetEvent("XTRA:receiveCurrentPlayerInfo")
AddEventHandler(
    "XTRA:receiveCurrentPlayerInfo",
    function(b)
        a = b
    end
)
function tXTRA.getCurrentPlayerInfo(c)
    for d, e in pairs(a) do
        if d == c then
            return e
        end
    end
end
function tXTRA.clientGetPlayerIsStaff(f)
    local g = tXTRA.getCurrentPlayerInfo("currentStaff")
    if g then
        for h, i in pairs(g) do
            if i == f then
                return true
            end
        end
        return false
    end
end
