function XTRA.updateCurrentPlayerInfo()
  local currentPlayersInformation = {}
  local playersJobs = {}
  for k,v in pairs(XTRA.getUsers()) do
    table.insert(playersJobs, {user_id = k, jobs = XTRA.getUserGroups(k)})
  end
  currentPlayersInformation['currentStaff'] = XTRA.getUsersByPermission('admin.tickets')
  currentPlayersInformation['jobs'] = playersJobs
  TriggerClientEvent("XTRA:receiveCurrentPlayerInfo", -1, currentPlayersInformation)
end


AddEventHandler("XTRA:playerSpawn", function(user_id, source, first_spawn)
  if first_spawn then
    XTRA.updateCurrentPlayerInfo()
  end
end)