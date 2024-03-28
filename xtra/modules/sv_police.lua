
-- this module define some police tools and functions
local lang = XTRA.lang
local a = module("xtra-vehicles", "cfg/weapons")

local isStoring = {}
local choice_store_weapons = function(player, choice)
    local user_id = XTRA.getUserId(player)
    local data = XTRA.getUserDataTable(user_id)
    XTRAclient.getWeapons(player,{},function(weapons)
      if not isStoring[player] then
        XTRA.getSubscriptions(user_id, function(cb, plushours, plathours)
          if cb then
            local maxWeight = 30
            if user_id == 1 or user_id == 3 then
              maxWeight = 1000
            elseif plathours > 0 then
              maxWeight = 50
            elseif plushours > 0 then
              maxWeight = 40
            end
            if XTRA.getInventoryWeight(user_id) <= maxWeight then
              isStoring[player] = true
              XTRAclient.giveWeapons(player,{{},true}, function(removedwep)
                for k,v in pairs(weapons) do
                  if k ~= 'GADGET_PARACHUTE' and k ~= 'WEAPON_STAFFGUN' and k~= 'WEAPON_SMOKEGRENADE' and k~= 'WEAPON_FLASHBANG' then
                    XTRA.giveInventoryItem(user_id, "wbody|"..k, 1, true)
                    if v.ammo > 0 and k ~= 'WEAPON_STUNGUN' then
                      for i,c in pairs(a.weapons) do
                        if i == k and c.class ~= 'Melee' then
                          if v.ammo > 250 then
                            v.ammo = 250
                          end
                          XTRA.giveInventoryItem(user_id, c.ammo, v.ammo, true)
                        end   
                      end
                    end
                  end
                end
                XTRAclient.notify(player,{"~g~Weapons Stored"})
                TriggerEvent('XTRA:RefreshInventory', player)
                XTRAclient.ClearWeapons(player,{})
                data.weapons = {}
                SetTimeout(3000,function()
                    isStoring[player] = nil 
                end)
              end)
            else
              XTRAclient.notify(player,{'~r~You do not have enough Weight to store Weapons.'})
            end
          end
        end)
      end 
    end)
end

local cooldowns = {}

RegisterServerEvent("XTRA:forceStoreSingleWeapon")
AddEventHandler("XTRA:forceStoreSingleWeapon", function(model)
    local source = source
    local user_id = XTRA.getUserId(source)
    local currentTime = os.time()
    
    if cooldowns[source] and currentTime - cooldowns[source] < 3 then
        XTRAclient.notify(source, {"~r~Store weapon cooldown. Please wait"})
    else
        cooldowns[source] = currentTime

        if model ~= nil then
            XTRAclient.getWeapons(source, {}, function(weapons)
                for k, v in pairs(weapons) do
                    if k == model then
                        local new_weight = XTRA.getInventoryWeight(user_id) + XTRA.getItemWeight(model)
                        if new_weight <= XTRA.getInventoryMaxWeight(user_id) then
                            RemoveWeaponFromPed(GetPlayerPed(source), k)
                            XTRAclient.removeWeapon(source, {k})
                            XTRA.giveInventoryItem(user_id, "wbody|"..k, 1, true)
                            if v.ammo > 0 then
                                for i, c in pairs(a.weapons) do
                                    if i == model and c.class ~= 'Melee' then
                                        XTRA.giveInventoryItem(user_id, c.ammo, v.ammo, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

RegisterCommand('storeallweapons', function(source)
    local source = source
    local currentTime = os.time()

    if cooldowns[source] and currentTime - cooldowns[source] < 3 then
        XTRAclient.notify(source, {"~r~Store weapon cooldown. Please wait"})
    else
        choice_store_weapons(source)
        cooldowns[source] = currentTime
    end
end)

RegisterCommand('shield', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasPermission(user_id, 'police.armoury') then
    TriggerClientEvent('XTRA:toggleShieldMenu', source)
  end
end)

RegisterCommand('cuff', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  XTRAclient.isHandcuffed(source,{},function(handcuffed)
    if handcuffed then
      return
    else
      XTRAclient.isStaffedOn(source, {}, function(staffedOn) 
        if (staffedOn and XTRA.hasPermission(user_id, 'admin.tickets')) or XTRA.hasPermission(user_id, 'police.armoury') then
          XTRAclient.getNearestPlayer(source,{5},function(nplayer)
            if nplayer ~= nil then
              local nplayer_id = XTRA.getUserId(nplayer)
              if (not XTRA.hasPermission(nplayer_id, 'police.armoury') or XTRA.hasPermission(nplayer_id, 'police.undercover')) then
                XTRAclient.isHandcuffed(nplayer,{},function(handcuffed)
                  if handcuffed then
                    TriggerClientEvent('XTRA:uncuffAnim', source, nplayer, false)
                    TriggerClientEvent('XTRA:unHandcuff', source, false)
                  else
                    TriggerClientEvent('XTRA:arrestCriminal', nplayer, source)
                    TriggerClientEvent('XTRA:arrestFromPolice', source)
                  end
                  TriggerClientEvent('XTRA:toggleHandcuffs', nplayer, false)
                  TriggerClientEvent('XTRA:playHandcuffSound', -1, GetEntityCoords(GetPlayerPed(source)))
                end)
              end
            else
              XTRAclient.notify(source,{lang.common.no_player_near()})
            end
          end)
        end
      end)
    end
  end)
end)

RegisterCommand('frontcuff', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  XTRAclient.isHandcuffed(source,{},function(handcuffed)
    if handcuffed then
      return
    else
      XTRAclient.isStaffedOn(source, {}, function(staffedOn) 
        if (staffedOn and XTRA.hasPermission(user_id, 'admin.tickets')) or XTRA.hasPermission(user_id, 'police.armoury') then
          XTRAclient.getNearestPlayer(source,{5},function(nplayer)
            if nplayer ~= nil then
              local nplayer_id = XTRA.getUserId(nplayer)
              if (not XTRA.hasPermission(nplayer_id, 'police.armoury') or XTRA.hasPermission(nplayer_id, 'police.undercover')) then
                XTRAclient.isHandcuffed(nplayer,{},function(handcuffed)
                  if handcuffed then
                    TriggerClientEvent('XTRA:uncuffAnim', source, nplayer, true)
                    TriggerClientEvent('XTRA:unHandcuff', source, true)
                  else
                    TriggerClientEvent('XTRA:arrestCriminal', nplayer, source)
                    TriggerClientEvent('XTRA:arrestFromPolice', source)
                  end
                  TriggerClientEvent('XTRA:toggleHandcuffs', nplayer, true)
                  TriggerClientEvent('XTRA:playHandcuffSound', -1, GetEntityCoords(GetPlayerPed(source)))
                end)
              end
            else
              XTRAclient.notify(source,{lang.common.no_player_near()})
            end
          end)
        end
      end)
    end
  end)
end)

function XTRA.handcuffKeys(source)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.getInventoryItemAmount(user_id, 'handcuffkeys') >= 1 then
    XTRAclient.getNearestPlayer(source,{5},function(nplayer)
      if nplayer ~= nil then
        local nplayer_id = XTRA.getUserId(nplayer)
        XTRAclient.isHandcuffed(nplayer,{},function(handcuffed)
          if handcuffed then
            XTRA.tryGetInventoryItem(user_id, 'handcuffkeys', 1)
            TriggerClientEvent('XTRA:uncuffAnim', source, nplayer, false)
            TriggerClientEvent('XTRA:unHandcuff', source, false)
            TriggerClientEvent('XTRA:toggleHandcuffs', nplayer, false)
            TriggerClientEvent('XTRA:playHandcuffSound', -1, GetEntityCoords(GetPlayerPed(source)))
          end
        end)
      else
        XTRAclient.notify(source,{lang.common.no_player_near()})
      end
    end)
  end
end

function XTRA.handcuff(source)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.getInventoryItemAmount(user_id, 'handcuff') >= 1 then
    XTRAclient.getNearestPlayer(source,{5},function(nplayer)
      if nplayer ~= nil then
        local nplayer_id = XTRA.getUserId(nplayer)
        XTRAclient.isHandcuffed(nplayer,{},function(handcuffed)
          if not handcuffed then
            XTRA.tryGetInventoryItem(user_id, 'handcuff', 1)
            TriggerClientEvent('XTRA:toggleHandcuffs', nplayer, true)
            TriggerClientEvent('XTRA:playHandcuffSound', -1, GetEntityCoords(GetPlayerPed(source)))
          end
        end)
      else
        XTRAclient.notify(source,{lang.common.no_player_near()})
      end
    end)
  end
end

local section60s = {}
RegisterCommand('s60', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.announce') then
        if args[1] ~= nil and args[2] ~= nil then
            local radius = tonumber(args[1])
            local duration = tonumber(args[2])*60
            local section60UUID = #section60s+1
            section60s[section60UUID] = {radius = radius, duration = duration, uuid = section60UUID}
            TriggerClientEvent("XTRA:addS60", -1, GetEntityCoords(GetPlayerPed(source)), radius, section60UUID)
        else
            XTRAclient.notify(source,{'~r~Invalid Arguments.'})
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(section60s) do
            if section60s[k].duration > 0 then
                section60s[k].duration = section60s[k].duration-1 
            else
                TriggerClientEvent('XTRA:removeS60', -1, section60s[k].uuid)
            end
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand('handbook', function(source, args)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
      TriggerClientEvent('XTRA:toggleHandbook', source)
    end
end)

local draggingPlayers = {}

RegisterServerEvent('XTRA:dragPlayer')
AddEventHandler('XTRA:dragPlayer', function(playersrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil and (XTRA.hasPermission(user_id, "police.armoury") or XTRA.hasPermission(user_id, "hmp.menu")) then
      if playersrc ~= nil then
        local nuser_id = XTRA.getUserId(playersrc)
          if nuser_id ~= nil then
            XTRAclient.isHandcuffed(playersrc,{},function(handcuffed)
                if handcuffed then
                    if draggingPlayers[user_id] then
                      TriggerClientEvent("XTRA:undrag", playersrc, source)
                      draggingPlayers[user_id] = nil
                    else
                      TriggerClientEvent("XTRA:drag", playersrc, source)
                      draggingPlayers[user_id] = playersrc
                    end
                else
                    XTRAclient.notify(source,{"~r~Player is not handcuffed."})
                end
            end)
          else
              XTRAclient.notify(source,{"~r~There is no player nearby"})
          end
      else
          XTRAclient.notify(source,{"~r~There is no player nearby"})
      end
    end
end)

RegisterServerEvent('XTRA:putInVehicle')
AddEventHandler('XTRA:putInVehicle', function(playersrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil and XTRA.hasPermission(user_id, "police.armoury") then
      if playersrc ~= nil then
        XTRAclient.isHandcuffed(playersrc,{}, function(handcuffed)  -- check handcuffed
          if handcuffed then
            XTRAclient.putInNearestVehicleAsPassenger(playersrc, {10})
          else
            XTRAclient.notify(source,{lang.police.not_handcuffed()})
          end
        end)
      end
    end
end)

RegisterServerEvent('XTRA:ejectFromVehicle')
AddEventHandler('XTRA:ejectFromVehicle', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil and XTRA.hasPermission(user_id, "police.armoury") then
      XTRAclient.getNearestPlayer(source,{10},function(nplayer)
        local nuser_id = XTRA.getUserId(nplayer)
        if nuser_id ~= nil then
          XTRAclient.isHandcuffed(nplayer,{}, function(handcuffed)  -- check handcuffed
            if handcuffed then
              XTRAclient.ejectVehicle(nplayer, {})
            else
              XTRAclient.notify(source,{lang.police.not_handcuffed()})
            end
          end)
        else
          XTRAclient.notify(source,{lang.common.no_player_near()})
        end
      end)
    end
end)


RegisterServerEvent("XTRA:Knockout")
AddEventHandler('XTRA:Knockout', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    XTRAclient.getNearestPlayer(source, {2}, function(nplayer)
        local nuser_id = XTRA.getUserId(nplayer)
        if nuser_id ~= nil then
            TriggerClientEvent('XTRA:knockOut', nplayer)
            SetTimeout(30000, function()
                TriggerClientEvent('XTRA:knockOutDisable', nplayer)
            end)
        end
    end)
end)

RegisterServerEvent("XTRA:KnockoutNoAnim")
AddEventHandler('XTRA:KnockoutNoAnim', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasGroup(user_id, 'Founder') or XTRA.hasGroup(user_id, 'Developer') or XTRA.hasGroup(user_id, 'Lead Developer') or XTRA.hasGroup(user_id, 'Developer') then
      XTRAclient.getNearestPlayer(source, {2}, function(nplayer)
          local nuser_id = XTRA.getUserId(nplayer)
          if nuser_id ~= nil then
              TriggerClientEvent('XTRA:knockOut', nplayer)
              SetTimeout(30000, function()
                  TriggerClientEvent('XTRA:knockOutDisable', nplayer)
              end)
          end
      end)
    end
end)

RegisterServerEvent("XTRA:requestPlaceBagOnHead")
AddEventHandler('XTRA:requestPlaceBagOnHead', function()
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.getInventoryItemAmount(user_id, 'Headbag') >= 1 then
      XTRAclient.getNearestPlayer(source, {10}, function(nplayer)
          local nuser_id = XTRA.getUserId(nplayer)
          if nuser_id ~= nil then
              XTRA.tryGetInventoryItem(user_id, 'Headbag', 1, true)
              TriggerClientEvent('XTRA:placeHeadBag', nplayer)
          end
      end)
    end
end)

RegisterServerEvent('XTRA:gunshotTest')
AddEventHandler('XTRA:gunshotTest', function(playersrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if user_id ~= nil and XTRA.hasPermission(user_id, "police.armoury") then
      if playersrc ~= nil then
        XTRAclient.hasRecentlyShotGun(playersrc,{}, function(shotagun)
          if shotagun then
            XTRAclient.notify(source, {"~r~Player has recently shot a gun."})
          else
            XTRAclient.notify(source, {"~r~Player has no gunshot residue on fingers."})
          end
        end)
      end
    end
end)

RegisterServerEvent('XTRA:tryTackle')
AddEventHandler('XTRA:tryTackle', function(id)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') or XTRA.hasPermission(user_id, 'admin.tickets') then
        TriggerClientEvent('XTRA:playTackle', source)
        TriggerClientEvent('XTRA:getTackled', id, source)
    end
end)

RegisterCommand('drone', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasGroup(user_id, 'Drone Trained') or XTRA.hasGroup(user_id, 'Lead Developer') or XTRA.hasGroup(user_id, 'Developer') then
      TriggerClientEvent('toggleDrone', source)
  end
end)

RegisterCommand('trafficmenu', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') then
      TriggerClientEvent('XTRA:toggleTrafficMenu', source)
  end
end)

RegisterServerEvent('XTRA:startThrowSmokeGrenade')
AddEventHandler('XTRA:startThrowSmokeGrenade', function(name)
    local source = source
    TriggerClientEvent('XTRA:displaySmokeGrenade', -1, name, GetEntityCoords(GetPlayerPed(source)))
end)

RegisterCommand('breathalyse', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasPermission(user_id, 'police.armoury') then
      TriggerClientEvent('XTRA:breathalyserCommand', source)
  end
end)

RegisterServerEvent('XTRA:breathalyserRequest')
AddEventHandler('XTRA:breathalyserRequest', function(temp)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
      TriggerClientEvent('XTRA:beingBreathalysed', temp)
      TriggerClientEvent('XTRA:breathTestResult', source, math.random(0, 100), XTRA.GetPlayerName(XTRA.getUserId(temp)))
    end
end)

seizeBullets = {
  ['9mm Bullets'] = true,
  ['7.62mm Bullets'] = true,
  ['.357 Bullets'] = true,
  ['12 Gauge Bullets'] = true,
  ['.308 Sniper Rounds'] = true,
  ['5.56mm NATO'] = true,
}

RegisterServerEvent('XTRA:seizeWeapons')
AddEventHandler('XTRA:seizeWeapons', function(playerSrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
      XTRAclient.isHandcuffed(playerSrc,{},function(handcuffed)
        if handcuffed then
          RemoveAllPedWeapons(GetPlayerPed(playerSrc), true)
          local player_id = XTRA.getUserId(playerSrc)
          local cdata = XTRA.getUserDataTable(player_id)
          for a,b in pairs(cdata.inventory) do
              if string.find(a, 'wbody|') then
                  c = a:gsub('wbody|', '')
                  cdata.inventory[c] = b
                  cdata.inventory[a] = nil
              end
          end
          for k,v in pairs(a.weapons) do
              if cdata.inventory[k] ~= nil then
                  if not v.policeWeapon then
                    cdata.inventory[k] = nil
                  end
              end
          end
          for c,d in pairs(cdata.inventory) do
              if seizeBullets[c] then
                cdata.inventory[c] = nil
              end
          end
          TriggerEvent('XTRA:RefreshInventory', playerSrc)
          XTRAclient.notify(source, {'Seized weapons.'})
          XTRAclient.notify(playerSrc, {'Your weapons have been seized.'})
        end
      end)
    end
end)

seizeDrugs = {
  ['Weed leaf'] = true,
  ['Weed'] = true,
  ['Coca leaf'] = true,
  ['Cocaine'] = true,
  ['Opium Poppy'] = true,
  ['Heroin'] = true,
  ['Ephedra'] = true,
  ['Meth'] = true,
  ['Frogs legs'] = true,
  ['Lysergic Acid Amide'] = true,
  ['LSD'] = true,
}
RegisterServerEvent('XTRA:seizeIllegals')
AddEventHandler('XTRA:seizeIllegals', function(playerSrc)
    local source = source
    local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') then
      local player_id = XTRA.getUserId(playerSrc)
      local cdata = XTRA.getUserDataTable(player_id)
      for a,b in pairs(cdata.inventory) do
          for c,d in pairs(seizeDrugs) do
              if a == c then
                cdata.inventory[a] = nil
              end
          end
      end
      TriggerEvent('XTRA:RefreshInventory', playerSrc)
      XTRAclient.notify(source, {'~r~Seized illegals.'})
      XTRAclient.notify(playerSrc, {'~r~Your illegals have been seized.'})
    end
end)

RegisterServerEvent("XTRA:newPanic")
AddEventHandler("XTRA:newPanic", function(a,b)
	local source = source
	local user_id = XTRA.getUserId(source)
    if XTRA.hasPermission(user_id, 'police.armoury') or XTRA.hasPermission(user_id, 'hmp.menu') or XTRA.hasPermission(user_id, 'nhs.menu') or XTRA.hasPermission(user_id, 'lfb.onduty.permission') then
        TriggerClientEvent("XTRA:returnPanic", -1, nil, a, b)
        XTRA.sendWebhook(getPlayerFaction(user_id)..'-panic', 'XTRA Panic Logs', "> Player Name: **"..XTRA.GetPlayerName(user_id).."**\n> Player TempID: **"..source.."**\n> Player PermID: **"..user_id.."**\n> Location: **"..a.Location.."**")
    end
end)

RegisterNetEvent("XTRA:flashbangThrown")
AddEventHandler("XTRA:flashbangThrown", function(coords)   
    TriggerClientEvent("XTRA:flashbangExplode", -1, coords)
end)

RegisterNetEvent("XTRA:updateSpotlight")
AddEventHandler("XTRA:updateSpotlight", function(a)  
  local source = source 
  TriggerClientEvent("XTRA:updateSpotlight", -1, source, a)
end)

RegisterCommand('wc', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasPermission(user_id, 'police.armoury') then
    XTRAclient.getNearestPlayer(source, {2}, function(nplayer)
      if nplayer ~= nil then
        XTRAclient.getPoliceCallsign(source, {}, function(callsign)
          XTRAclient.getPoliceRank(source, {}, function(rank)
            XTRAclient.playAnim(source,{true,{{'paper_1_rcm_alt1-9', 'player_one_dual-9', 1}},false})
            XTRAclient.notifyPicture(nplayer, {"polnotification","notification","~b~Callsign: ~w~"..callsign.."\n~b~Rank: ~w~"..rank.."\n~b~Name: ~w~"..XTRA.GetPlayerName(user_id),"Metropolitan Police","Warrant Card",false,nil})
            TriggerClientEvent('XTRA:flashWarrantCard', source)
          end)
        end)
      end
    end)
  end
end)

RegisterCommand('wca', function(source, args)
  local source = source
  local user_id = XTRA.getUserId(source)
  if XTRA.hasPermission(user_id, 'police.armoury') then
    XTRAclient.getNearestPlayer(source, {2}, function(nplayer)
      if nplayer ~= nil then
        XTRAclient.getPoliceCallsign(source, {}, function(callsign)
          XTRAclient.getPoliceRank(source, {}, function(rank)
            XTRAclient.playAnim(source,{true,{{'paper_1_rcm_alt1-9', 'player_one_dual-9', 1}},false})
            XTRAclient.notifyPicture(nplayer, {"polnotification","notification","~b~Callsign: ~w~"..callsign.."\n~b~Rank: ~w~"..rank,"Metropolitan Police","Warrant Card",false,nil})
            TriggerClientEvent('XTRA:flashWarrantCard', source)
          end)
        end)
      end
    end)
  end
end)
