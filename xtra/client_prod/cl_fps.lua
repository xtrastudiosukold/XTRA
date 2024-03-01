-- // FPS \\ --

local frames = 0
Citizen.CreateThread(function()
    while true do 
        for i = 1, 60 do
            Citizen.Wait(1000)
            frames = frames + math.floor(1.0 / GetFrameTime())
        end
        TriggerServerEvent("XTRA:FPS:Update",frames/60)
        frames = 0
        collectgarbage()
    end
end)