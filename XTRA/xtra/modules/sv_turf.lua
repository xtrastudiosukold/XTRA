turfData = {
    {name = 'Weed', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0}, -- weed
    {name = 'Cocaine', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0}, -- cocaine
    {name = 'Meth', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0}, -- meth
    {name = 'Heroin', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0}, -- heroin
    {name = 'LargeArms', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0}, -- large arms
    {name = 'LSDNorth', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0}, -- lsd north
    {name = 'LSDSouth', gangOwner = "N/A", commission = 0, beingCaptured = false, timeLeft = 300, cooldown = 0} -- lsd south
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        for k,v in pairs(turfData) do
            if v.cooldown > 0 then
                v.cooldown = v.cooldown - 1
            end
        end
    end
end)

RegisterNetEvent('XTRA:refreshTurfOwnershipData')
AddEventHandler('XTRA:refreshTurfOwnershipData', function()
    local source = source
	local user_id = XTRA.getUserId(source)
	local data = turfData
	local gangname = XTRA.getGangName(user_id)
	if gangname and gangname ~= "" then
		for a,b in pairs(data) do
			data[a].ownership = false
			if b.gangOwner == gangname then
				data[a].ownership = true
			end
			TriggerClientEvent('XTRA:updateTurfOwner', source, a, b.gangOwner)
		end
		TriggerClientEvent('XTRA:gotTurfOwnershipData', source, data)
		TriggerClientEvent('XTRA:recalculateLargeArms', source, turfData[5].commission)
		XTRA.updateTraderInfo()
	end
end)

RegisterNetEvent('XTRA:checkTurfCapture')
AddEventHandler('XTRA:checkTurfCapture', function(turfid)
    local source = source
	local user_id = XTRA.getUserId(source)
	if not XTRA.hasPermission(user_id, 'police.armoury') or not XTRA.hasPermission(user_id, 'nhs.menu') then
		if turfData[turfid].cooldown > 0 then 
			XTRAclient.notify(source, {'This turf is on cooldown for another '..turfData[turfid].cooldown..' seconds.'})
			return
		end
		local gangname = XTRA.getGangName(user_id)
		if gangname and turfData[turfid].gangOwner == gangname and gangname ~= "" then
			TriggerClientEvent('XTRA:captureOwnershipReturned', source, turfid, true, turfData[turfid].name)
		else
			TriggerClientEvent('XTRA:captureOwnershipReturned', source, turfid, false, turfData[turfid].name)
		end
	end
end)

RegisterNetEvent('XTRA:gangDefenseLocationUpdate')
AddEventHandler('XTRA:gangDefenseLocationUpdate', function(turfname, atkdfnd, trueorfalse)
    local source = source
	local user_id = XTRA.getUserId(source)
	local turfID = 0
	for k,v in pairs(turfData) do
		if v.name == turfname then
			turfID = k
		end
	end
	if atkdfnd == 'Attackers' then
		if trueorfalse then
			turfData[turfID].beingCaptured = false
			turfData[turfID].timeLeft = 300
			TriggerClientEvent('chatMessage', -1, "^0The "..turfData[turfID].name.." trader is no longer being captured.", { 128, 128, 128 }, message, "alert")
		end
	elseif atkdfnd == 'Defenders' then
		if trueorfalse then
			turfData[turfID].beingCaptured = true
			turfData[turfID].timeLeft = turfData[turfID].timeLeft - 1
			TriggerClientEvent('XTRA:setBlockedStatus', -1, turfname, true)
		else
			turfData[turfID].beingCaptured = false
			turfData[turfID].timeLeft = 300
			TriggerClientEvent('chatMessage', -1, "^0The "..turfData[turfID].name.." is no longer being captured.", { 128, 128, 128 }, message, "alert")
		end
	end
	
end)

RegisterNetEvent('XTRA:failCaptureTurfOwned')
AddEventHandler('XTRA:failCaptureTurfOwned', function(x)
    local source = source
	local user_id = XTRA.getUserId(source)
end)

RegisterNetEvent('XTRA:initiateGangCapture')
AddEventHandler('XTRA:initiateGangCapture', function(x,y)
    local source = source
	local user_id = XTRA.getUserId(source)
	if not XTRA.hasPermission(user_id, 'police.armoury') or not XTRA.hasPermission(user_id, 'nhs.menu') then
		if not turfData[x].beingCaptured then
			local gangname = XTRA.getGangName(user_id)
			if gangname and gangname ~= "" then
				TriggerClientEvent('XTRA:initiateGangCaptureCheck', source, y, true)
				turfData[x].beingCaptured = true 
				TriggerClientEvent('chatMessage', -1, "^0The "..turfData[x].name.." trader is being attacked by "..gangname..".", { 128, 128, 128 }, message, "alert")
				if turfData[x].gangOwner ~= 'N/A' then
					exports['xtra']:execute('SELECT * FROM xtra_gangs WHERE gangname = @gangname', {gangname = turfData[x].gangOwner}, function(gotGangs)
						for A,B in pairs(gotGangs) do
							for C,D in pairs(json.decode(B.gangmembers)) do
								local tempid = XTRA.getUserSource(C)
								if tempid then
									TriggerClientEvent('XTRA:sendGangMessage', temp, '^0Your gang is being attacked by '..gangname..'.', 'error', 5000)
								end
							end
						end
					end)
				end
			else
				XTRAclient.notify(source, {'You are not in a gang.'})
			end
		else
			XTRAclient.notify(source, {'This turf is currently being captured.'})
		end
	else
		XTRAclient.notify(source, {'You cannot capture a turf while on duty.'})
	end
end)

RegisterNetEvent('XTRA:gangCaptureSuccess')
AddEventHandler('XTRA:gangCaptureSuccess', function(turfname)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	for k,v in pairs(turfData) do
		if v.name == turfname and v.beingCaptured and gangname and gangname ~= "" then
			TriggerClientEvent('chatMessage', -1, "^0The "..v.name.." trader has been captured by "..gangname..".", { 128, 128, 128 }, message, "alert")
			local gangmembers = exports['xtra']:executeSync('SELECT * FROM xtra_user_gangs WHERE gangname = @gangname', {gangname = gangname})
			turfData[k].gangOwner = gangname
			turfData[k].commission = v.commission
			turfData[k].cooldown = 300
			turfData[k].beingCaptured = false
			local data = turfData
			data[k].ownership = true
			TriggerClientEvent('XTRA:updateTurfOwner', -1, k, gangname)
			for a,b in pairs(gangmembers) do
				local tempid = XTRA.getUserSource(b.user_id)
				if tempid then
					TriggerClientEvent('XTRA:gotTurfOwnershipData', tempid, data)
				end
			end
		end
	end
end)

RegisterNetEvent('XTRA:gangDefenseSuccess')
AddEventHandler('XTRA:gangDefenseSuccess', function(turfname)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname and gangname ~= "" then 
		for a,b in pairs(turfData) do
			if b.name == turfname then
				TriggerClientEvent('chatMessage', -1, "^0The "..b.name.." trader is no longer being attacked.", { 128, 128, 128 }, message, "alert")
				turfData[a] = {ownership = true, gangOwner = gangname, commission = b.commission, cooldown = 300, beingCaptured = false}
				TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
				return
			end
		end
	end
end)

RegisterNetEvent('XTRA:setNewWeedPrice')
AddEventHandler('XTRA:setNewWeedPrice', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[1].gangOwner and gangname ~= "" then
		turfData[1].commission = price
		TriggerClientEvent('chatMessage', -1, "^0Weed trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		return
	end
end)

RegisterNetEvent('XTRA:setNewCocainePrice')
AddEventHandler('XTRA:setNewCocainePrice', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[2].gangOwner and gangname ~= "" then
		turfData[2].commission = price
		TriggerClientEvent('chatMessage', -1, "^0Cocaine trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		return
	end
end)

RegisterNetEvent('XTRA:setNewMethPrice')
AddEventHandler('XTRA:setNewMethPrice', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[3].gangOwner and gangname ~= "" then
		turfData[3].commission = price
		TriggerClientEvent('chatMessage', -1, "^0Meth trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		return
	end
end)

RegisterNetEvent('XTRA:setNewHeroinPrice')
AddEventHandler('XTRA:setNewHeroinPrice', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[4].gangOwner and gangname ~= "" then
		turfData[4].commission = price
		TriggerClientEvent('chatMessage', -1, "^0Heroin trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		return
	end
end)

RegisterNetEvent('XTRA:setNewLargeArmsCommission')
AddEventHandler('XTRA:setNewLargeArmsCommission', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[5].gangOwner and gangname ~= "" then
		turfData[5].commission = price
		TriggerClientEvent('chatMessage', -1, "^0Large Arms trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		TriggerClientEvent('XTRA:recalculateLargeArms', -1, price)
		return
	end
end)

RegisterNetEvent('XTRA:setNewLSDNorthPrice')
AddEventHandler('XTRA:setNewLSDNorthPrice', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[6].gangOwner and gangname ~= "" then
		turfData[6].commission = price
		TriggerClientEvent('chatMessage', -1, "^0LSD North trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		return
	end
end)

RegisterNetEvent('XTRA:setNewLSDSouthPrice')
AddEventHandler('XTRA:setNewLSDSouthPrice', function(price)
    local source = source
	local user_id = XTRA.getUserId(source)
	local gangname = XTRA.getGangName(user_id)
	if gangname == turfData[7].gangOwner and gangname ~= "" then
		turfData[7].commission = price
		TriggerClientEvent('chatMessage', -1, "^0LSD South trader commission has been set to "..price.."%", { 128, 128, 128 }, message, "alert")
		XTRA.updateTraderInfo()
		TriggerClientEvent('XTRA:gotTurfOwnershipData', -1, turfData)
		return
	end
end)

function XTRA.turfSaleToGangFunds(amount, drugtype)
	for k,v in pairs(turfData) do
		if v.name == drugtype then
			exports["xtra"]:execute("SELECT * FROM xtra_gangs WHERE gangname = @gangname", {gangname = v.gangOwner}, function(gotGang)
				if gotGang[1] ~= nil then
					if drugtype ~= 'LargeArms' then
						amount = amount*(v.commission/100)/(1-v.commission/100)
					else
						if v.commission == nil then
							v.commission = 0
						end
						amount = amount/(1+v.commission)
					end
					exports['xtra']:execute('UPDATE xtra_gangs SET funds = funds+@funds WHERE gangname = @gangname', {funds = amount, gangname = v.gangOwner})
				end
			end)
		end
	end
end