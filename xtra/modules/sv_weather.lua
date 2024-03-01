voteCooldown = 1800
currentWeather = "CLEAR"

weatherVoterCooldown = voteCooldown

RegisterServerEvent("XTRA:vote") 
AddEventHandler("XTRA:vote", function(weatherType)
    TriggerClientEvent("XTRA:voteStateChange",-1,weatherType)
end)

RegisterServerEvent("XTRA:tryStartWeatherVote")
AddEventHandler("XTRA:tryStartWeatherVote", function()
    local source = source
    local user_id = XTRA.getUserId(source)
    
    if weatherVoterCooldown >= voteCooldown then
        TriggerClientEvent("XTRA:startWeatherVote", -1)
        weatherVoterCooldown = 0
    else
        TriggerClientEvent("chatMessage", source, "Another vote can be started in " .. tostring(voteCooldown - weatherVoterCooldown) .. " seconds!", {255, 0, 0})
    end

    if hasPermission(source) then
        XTRAclient.notify(source, {'You do not have permission for this.'})
    end
end)


RegisterServerEvent("XTRA:getCurrentWeather") 
AddEventHandler("XTRA:getCurrentWeather", function()
    local source = source
    TriggerClientEvent("XTRA:voteFinished",source,currentWeather)
end)

RegisterServerEvent("XTRA:setCurrentWeather")
AddEventHandler("XTRA:setCurrentWeather", function(newWeather)
	currentWeather = newWeather
end)

Citizen.CreateThread(function()
	while true do
		weatherVoterCooldown = weatherVoterCooldown + 1
		Citizen.Wait(1000)
	end
end)