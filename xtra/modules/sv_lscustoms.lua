local tbl = {
	[1] = {locked = false, player = nil},
	[2] = {locked = false, player = nil},
	[3] = {locked = false, player = nil},
	[4] = {locked = false, player = nil},
	[5] = {locked = false, player = nil},
	[6] = {locked = false, player = nil},
	[7] = {locked = false, player = nil},
	[8] = {locked = false, player = nil},
	[9] = {locked = false, player = nil},
	[10] = {locked = false, player = nil},
}

RegisterServerEvent('lockGarage')
AddEventHandler('lockGarage', function(b,garage)
	tbl[tonumber(garage)].locked = b
	if not b then
		tbl[tonumber(garage)].player = nil
	else
		tbl[tonumber(garage)].player = source
	end
	TriggerClientEvent('lockGarage',-1,tbl)
end)

RegisterServerEvent('getGarageInfo')
AddEventHandler('getGarageInfo', function()
	TriggerClientEvent('lockGarage',-1,tbl)
end)

AddEventHandler('playerDropped', function()
	for i,g in pairs(tbl) do
		if g.player then
			if source == g.player then
				g.locked = false
				g.player = nil
				TriggerClientEvent('lockGarage',-1,tbl)
			end
		end
	end
end)

RegisterServerEvent("LSC:buttonSelected")
AddEventHandler("LSC:buttonSelected", function(name, button)
	local source = source
	local user_id = XTRA.getUserId(source)
	if user_id then
		TriggerClientEvent("LSC:buttonSelected", source, name, button, XTRA.tryFullPayment(XTRA.getUserId(source), button.price or 0)) -- money
	end
end)

RegisterServerEvent("LSC:finished")
AddEventHandler("LSC:finished", function(veh)
	local source = source
	local user_id = XTRA.getUserId(source)
	if user_id then
		MySQL.execute("XTRAls/update_vehicle_modifications", {user_id = user_id, vehicle = veh.spawncode, modifications = json.encode({color = veh.color, extraColor = veh.extracolor, neon = veh.neon, neonColor = veh.neoncolor, xenonColor = veh.xenoncolor, smokeColor = veh.smokecolor, wheelType = veh.wheeltype, bulletProofTyres = veh.bulletProofTyres, windowTint = veh.windowtint, plateIndex = veh.plateindex, mods = veh.mods, biometric = veh.securityBiometricLock, remoteblips = veh.remoteVehicleBlips, dashcam = veh.remoteDashcams, customexhausts = veh.engineSounds})})
	end
end)

RegisterServerEvent("LSC:applyModifications")
AddEventHandler("LSC:applyModifications", function(model, vehicle)
	local source = source
	local user_id = XTRA.getUserId(source)
	if model and vehicle and user_id then
		local rows = MySQL.query("XTRAls/get_vehicle_modifications", {user_id = user_id, vehicle = model}, function(rows, affected) 
			if rows ~= nil then 
				if #rows > 0 then
					local modifications = json.decode(rows[1].modifications)
					if modifications then
						TriggerClientEvent("LSC:applyModifications", source, vehicle, modifications)
					end
				end
			end
		end)
	end
end)

RegisterServerEvent("XTRA:setBiometricUsersState")
AddEventHandler("XTRA:setBiometricUsersState", function(entity, table)
	local source = source
	local user_id = XTRA.getUserId(source)
	Entity(entity).state.biometricUsers = table
end)