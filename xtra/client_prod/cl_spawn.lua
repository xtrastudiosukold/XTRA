AddEventHandler(
    "onClientMapStart",
    function()
        exports.xtra:setAutoSpawn(false)
        exports.xtra:spawnPlayer()
        SetClockTime(24, 0, 0)
    end
)
