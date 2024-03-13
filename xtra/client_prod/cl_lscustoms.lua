local a = module("cfg/cfg_lscustoms")
RMenu.Add("lscustoms", "repair", RageUI.CreateMenu("", "Repair Vehicle", XTRA.getRageUIMenuWidth(), XTRA.getRageUIMenuHeight(), "menus", "lscustoms"))
RMenu.Add("lscustoms", "mainmenu", RageUI.CreateMenu("", "Los Santos Customs", XTRA.getRageUIMenuWidth(), XTRA.getRageUIMenuHeight(), "menus", "lscustoms"))
local b = {}
local function c(d)
	local e = table.concat(b, "_")
	table.insert(b, string.lower(string.gsub(d.name, "%s+", "")))
	d.menu = table.concat(b, "_")
	if d.name ~= "Main Menu" then
		RMenu.Add("lscustoms", d.menu, RageUI.CreateSubMenu(RMenu:Get("lscustoms", e), "", d.name, XTRA.getRageUIMenuWidth(), XTRA.getRageUIMenuHeight()))
		if d.name == "Biometric Users" then
			RMenu:Get("lscustoms", d.menu):AddInstructionButton({"~INPUT_CELLPHONE_OPTION~","Refund biometric user"})
		end
	end
	if d.type == "categoryList" then
        table.sort(d.categories, function(f, g)
            return f.name < g.name
        end)
		for f, g in pairs(d.categories) do
			c(g)
		end
	else
		RMenu:Get("lscustoms", d.menu):AddInstructionButton({"~INPUT_NEXT_CAMERA~","Change Camera"})
	end
	table.remove(b)
end
c(a.category)
local h = {}
local i = nil
local j = 0
local k = nil
local l = 0
local m = 0
local n = - 1
local o = false
local q = {["livery"] = function()
    local r = {}
	if GetVehicleLiveryCount(j) > 0 then
		table.insert(r, 0)
	end
    for s = 1, GetVehicleLiveryCount(j) do
        table.insert(r, s)
    end
    return r
end}
local function p(q, r)
    SetCamActive(l, true)
    local s = GetModelDimensions(GetEntityModel(j))
    local t = s.y * - 2.0
    local u = s.x * - 2.0
    local v = s.z * - 2.0
    local w
    if q == "front" then
        w = GetOffsetFromEntityInWorldCoords(j, r.x, t / 2.0 + r.y, r.z)
    elseif q == "front-top" then
        w = GetOffsetFromEntityInWorldCoords(j, r.x, t / 2.0 + r.y, v + r.z)
    elseif q == "back" then
        w = GetOffsetFromEntityInWorldCoords(j, r.x, - (t / 2.0) + r.y, r.z)
    elseif q == "back-top" then
        w = GetOffsetFromEntityInWorldCoords(j, r.x, - (t / 2.0) + r.y, v / 2.0 + r.z)
    elseif q == "left" then
        w = GetOffsetFromEntityInWorldCoords(j, - (u / 2.0) + r.x, r.y, r.z)
    elseif q == "right" then
        w = GetOffsetFromEntityInWorldCoords(j, u / 2.0 + r.x, r.y, r.z)
    elseif q == "middle" then
        w = GetOffsetFromEntityInWorldCoords(j, r.x, r.y, v / 2.0 + r.z)
	elseif q == "bottom" then
		w = GetOffsetFromEntityInWorldCoords(j, r.x, r.y, -v / 2.0 + r.z)
    else
        DestroyCam(l, false)
    end
    SetCamCoord(l, w.x, w.y, w.z)
    local x = GetOffsetFromEntityInWorldCoords(j, 0.0, 0.0, 0.0)
    PointCamAtCoord(l, x.x, x.y, x.z)
    RenderScriptCams(true, true, 1000, false, false)
end
local function y(z, A)
	local B = GetEntityBoneIndexByName(j, z)
	if B == - 1 then
		return
	end
	local C = GetWorldPositionOfEntityBone(j, B)
	local r = GetOffsetFromEntityGivenWorldCoords(j, C.x, C.y, C.z)
	local q = GetOffsetFromEntityInWorldCoords(j, r.x + A.x, r.y + A.y, r.z + A.z)
	SetCamActive(l, true)
	SetCamCoord(l, q.x, q.y, q.z)
	local D = GetOffsetFromEntityInWorldCoords(j, 0.0, r.y, r.z)
	PointCamAtCoord(l, D.x, D.y, D.z)
	RenderScriptCams(true, true, 1000, false, false)
end
local function E(d)
	if l == 0 then
		return
	end
	local F = d.cameraPreset
	if not F then
		return
	end
	local G = a.cameraPresets[F]
	assert(G, string.format("Camera preset %s does not exist", F))
	if G.type == "moveVeh" then
		p(G.position, G.offset)
	elseif G.type == "pointBone" then
		y(G.bone, G.offset)
	elseif G.type == "doors" then
		for f, H in pairs(G.doors) do
			SetVehicleDoorOpen(j, H, false, false)
		end
	elseif G.type == "viewMode" then
		SetFollowVehicleCamViewMode(G.mode)
	end
end
local function I()
	if l == 0 then
		return
	end
	local J = GetFinalRenderedCamCoord()
	SetCamCoord(l, J.x, J.y, J.z)
	local K = GetGameplayCamRot(2)
	SetCamRot(l, K.x, K.y, K.z, 2)
	RenderScriptCams(true, true, 0, false, false)
	RenderScriptCams(false, true, 1000, false, false)
	SetCamActive(m, true)
	TogglePausedRenderphases(true)
	SetCamActive(l, false)
end
local function L(d)
	local F = d.cameraPreset
	if not F then
		return
	end
	local G = a.cameraPresets[F]
	assert(G, string.format("Camera preset %s does not exist", F))
	if G.type == "moveVeh" then
		I()
	elseif G.type == "pointBone" then
		I()
	elseif G.type == "doors" then
		for H = 0, GetNumberOfVehicleDoors(j) do
			SetVehicleDoorOpen(j, H, false, false)
		end
	elseif G.type == "viewMode" then
		SetFollowVehicleCamViewMode(1)
	end
end
local function M(N, O)
	for P, Q in pairs(N) do
		if Q == true then
			O(P)
			return
		end
	end
	O(nil)
end
local function R(S, T, U)
	if S then
		return {
			RightBadge = RageUI.BadgeStyle.CarWhite
		}
	elseif T then
		return {
			RightBadge = RageUI.BadgeStyle.CarBlack
		}
	else
		return {
			RightLabel = "£" .. getMoneyStringFormatted(U)
		}
	end
end
local function V()
	if n ~= - 1 then
		return
	end
	n = GetSoundId()
	PlaySoundFromEntity(n, "Drill", PlayerPedId(), "DLC_HEIST_FLEECA_SOUNDSET", true, 0)
	Citizen.CreateThread(function()
		local W = GetGameTimer()
		while GetGameTimer() - W < 2000 do
			local X = (GetGameTimer() - W) / 2000
			SetVariableOnSound(n, "DrillState", X)
			Citizen.Wait(0)
		end
		StopSound(n)
		Citizen.Wait(1000)
		ReleaseSoundId(n)
		n = - 1
	end)
end
local function Y(d, Z, livery)
    if livery then
        SetVehicleLivery(j, livery)
    end
	if d.modType == 18 or d.modType == 22 then
		ToggleVehicleMod(j, d.modType, true)
	else
		SetVehicleMod(j, d.modType, Z, true)
	end
end
local function _(d)
	M(h[d.saveKey], function(P)
		if P then
			if d.modType == 18 or d.modType == 2 then
				ToggleVehicleMod(j, d.modType, true)
			else
				SetVehicleMod(j, d.modType, tonumber(P), false)
			end
		else
			if d.modType == 18 or d.modType == 2 then
				ToggleVehicleMod(j, d.modType, false)
			else
				SetVehicleMod(j, d.modType, - 1, false)
			end
		end
	end)
end
local function a0(d)
	for a1 = - 1, GetNumVehicleMods(j, d.modType) - 1 do
		local a2 = "Stock"
		if a1 >= 0 then
			local a3 = GetModTextLabel(j, d.modType, a1)
			local a4 = GetLabelText(a3)
			a2 = a4 ~= "NULL" and a4 or "N/A"
		end
		local a5 = h[d.saveKey][tostring(a1)]
		local U = a1 >= 0 and d.price or 0
		local a6 = R(a5 == true, a5 ~= nil, U)
		RageUI.Button(a2, nil, a6, true, function(a7, a8, a9)
			if a8 then
				Y(d, a1)
			end
			if a9 then
				if a5 == true then
					tXTRA.notify("~r~You have already applied this mod")
				elseif a5 == false then
					TriggerServerEvent("XTRA:setActiveModList", k, a.categoryToIndentifier[d], a1)
					V()
				else
					TriggerServerEvent("XTRA:purchaseModList", k, a.categoryToIndentifier[d], a1)
					V()
				end
			end
		end)
	end
end
local function ae(d)
    local r = q[d.generatorName]()
    for f, a2 in pairs(r) do
        local a9 = h[d.saveKey][tostring(a2)]
        local aa = R(a9 == true, a9 ~= nil, d.price)
        RageUI.Button(a2 > 0 and string.format("%s %d", d.prefix, a2) or "Stock",nil,aa,true,function(ab, ac, ad)
            if ac then
                Y(d, nil, a2)
            end
            if ad then
                if a9 == true then
                    tXTRA.notify("~r~You have already applied this mod")
                elseif a9 == false then
                    TriggerServerEvent("XTRA:setActiveModList", k, a.categoryToIndentifier[d], a2)
                    V()
                else
                    TriggerServerEvent("XTRA:purchaseModList", k, a.categoryToIndentifier[d], a2)
                    V()
                end
            end
        end)
    end
end
local function aa(ab, ac)
	for ad = 0, GetNumModColors(ab, false) - 1 do
		SetVehicleModColor_1(j, ab, ad, 0)
		if GetVehicleColours(j) == ac then
			return
		end
	end
	local f, ae = GetVehicleColours(j)
	SetVehicleColours(j, ac, ae)
end
local function af(ab, ac)
	for ad = 0, GetNumModColors(ab, false) - 1 do
		SetVehicleModColor_2(j, ab, ad)
		local f, ae = GetVehicleColours(j)
		if ae == ac then
			return
		end
	end
	SetVehicleColours(j, GetVehicleColours(j), ac)
end
local function ag(d, ah)
	local ai = d.saveKey
	if ai == "windowtint" then
		SetVehicleWindowTint(j, ah.tint)
	elseif ai == "frontwheel" then
		SetVehicleWheelType(j, 0)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "backwheel" then
		SetVehicleWheelType(j, 0)
		SetVehicleMod(j, 24, ah.index, false)
	elseif ai == "sportwheels" then
		SetVehicleWheelType(j, 0)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "musclewheels" then
		SetVehicleWheelType(j, 1)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "lowriderwheels" then
		SetVehicleWheelType(j, 2)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "highendwheels" then
		SetVehicleWheelType(j, 7)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "suvwheels" then
		SetVehicleWheelType(j, 3)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "offroadwheels" then
		SetVehicleWheelType(j, 4)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "tunerwheels" then
		SetVehicleWheelType(j, 6)
		SetVehicleMod(j, 23, ah.index, false)
	elseif ai == "wheelaccessories" then
		if not ah.colour then
			return
		end
		SetVehicleModKit(j, 0)
		ToggleVehicleMod(j, 20, true)
		SetVehicleTyreSmokeColor(j, ah.colour[1], ah.colour[2], ah.colour[3])
	elseif ai == "chrome" then
		aa(5, ah.index)
	elseif ai == "classic" then
		aa(0, ah.index)
	elseif ai == "matte" then
		aa(3, ah.index)
	elseif ai == "metals" then
		aa(4, ah.index)
	elseif ai == "metallic" then
		aa(1, ah.index)
	elseif ai == "util" then
		local f, ae = GetVehicleColours(j)
		SetVehicleColours(j, ah.index, ae)
	elseif ai == "chameleon" then
		local f, ae = GetVehicleColours(j)
		--print("F: "..f.."ae: " ..ae.. "ah.index: "..ah.index.. "j: ".. j)
		SetVehicleColours(j, ah.index, ae)
	elseif ai == "chrome2" then
		af(5, ah.index)
	elseif ai == "classic2" then
		af(0, ah.index)
	elseif ai == "matte2" then
		af(3, ah.index)
	elseif ai == "metal2" then
		af(4, ah.index)
	elseif ai == "metallic2" then
		af(1, ah.index)
	elseif ai == "pearlescent" then
		local f, aj = GetVehicleColours(j)
		SetVehicleExtraColours(j, ah.index, aj)
	elseif ai == "wheelcolor" then
		SetVehicleExtraColours(j, GetVehicleColours(j), ah.index)
	elseif ai == "interiorcolour" then
		SetVehicleInteriorColor(j, ah.index)
	elseif ai == "dashboardcolour" then
		SetVehicleDashboardColor(j, ah.index)
	elseif ai == "mod_14" then
		SetVehicleMod(j, 14, ah.index, false)
	elseif ai == "mod_15" then
		SetVehicleMod(j, 15, ah.index, false)
	elseif ai == "mod_22" then
		ToggleVehicleMod(j, 22, ah.index > 0)
	elseif ai == "xenonlights" then
		ToggleVehicleMod(j, 22, true)
		SetVehicleXenonLightsColor(j, ah.index)
	elseif ai == "neonlayout" then
		SetVehicleNeonLightEnabled(j, 0, false)
		SetVehicleNeonLightEnabled(j, 1, false)
		SetVehicleNeonLightEnabled(j, 2, false)
		SetVehicleNeonLightEnabled(j, 3, false)
		if ah.mod == 1 then
			SetVehicleNeonLightEnabled(j, 0, true)
			SetVehicleNeonLightEnabled(j, 1, true)
			SetVehicleNeonLightEnabled(j, 2, true)
			SetVehicleNeonLightEnabled(j, 3, true)
		elseif ah.mod == 2 then
			SetVehicleNeonLightEnabled(j, 2, true)
			SetVehicleNeonLightEnabled(j, 3, true)
		elseif ah.mod == 3 then
			SetVehicleNeonLightEnabled(j, 0, true)
			SetVehicleNeonLightEnabled(j, 1, true)
			SetVehicleNeonLightEnabled(j, 2, true)
		elseif ah.mod == 4 then
			SetVehicleNeonLightEnabled(j, 0, true)
			SetVehicleNeonLightEnabled(j, 1, true)
			SetVehicleNeonLightEnabled(j, 3, true)
		end
		SetVehicleNeonLightsColour(j, 222, 222, 255)
	elseif ai == "neoncolour" then
		SetVehicleNeonLightEnabled(j, 0, true)
		SetVehicleNeonLightEnabled(j, 1, true)
		SetVehicleNeonLightEnabled(j, 2, true)
		SetVehicleNeonLightEnabled(j, 3, true)
		local ak = a.neonColours[ah.name]
		SetVehicleNeonLightsColour(j, ak[1], ak[2], ak[3])
	elseif ai == "sounds" then
		EnableControlAction(0, 71, true)
		if Entity(j).state.previewSoundId ~= ah.soundId then
			ForceVehicleEngineAudio(j, ah.soundId)
			SetTimeout(500, function()
				SetVehicleRadioEnabled(j, false)
				SetVehRadioStation(j, "OFF")
			end)
			Entity(j).state.previewSoundId = ah.soundId
		end
    elseif ai == "plate_colour" then
		SetVehicleNumberPlateTextIndex(j, ah.index)
	end
end
local function al(d)
	local ai = d.saveKey
	if ai == "chrome" or ai == "classic" or ai == "matte" or ai == "metallic" or ai == "metals" or ai == "util" or ai == "chameleon" then
		applyPrimaryColours(h, j)
	elseif ai == "chrome2" or ai == "classic2" or ai == "matte2" or ai == "metallic2" or ai == "metal2" then
		applySecondaryColours(h, j)
	elseif ai == "windowtint" then
		M(h["windowtint"], function(P)
			if P then
				SetVehicleWindowTint(j, tonumber(P))
			else
				SetVehicleWindowTint(j, 0)
			end
		end)
	elseif ai == "frontwheel" then
		M(h["frontwheel"], function(P)
			SetVehicleWheelType(j, 0)
			if P then
				SetVehicleMod(j, 23, tonumber(P), false)
			else
				SetVehicleMod(j, 23, 0, false)
			end
		end)
	elseif ai == "backwheel" then
		M(h["backwheel"], function(P)
			SetVehicleWheelType(j, 0)
			if P then
				SetVehicleMod(j, 24, tonumber(P), false)
			else
				SetVehicleMod(j, 24, 0, false)
			end
		end)
	elseif ai == "pearlescent" then
		M(h["pearlescent"], function(P)
			local f, aj = GetVehicleColours(j)
			if P then
				SetVehicleExtraColours(j, tonumber(P), aj)
			else
				SetVehicleExtraColours(j, 0, aj)
			end
		end)
	elseif ai == "wheelcolor" then
		M(h["wheelcolor"], function(P)
			if P then
				SetVehicleExtraColours(j, GetVehicleColours(j), tonumber(P))
			else
				SetVehicleExtraColours(j, GetVehicleColours(j), 0)
			end
		end)
	elseif ai == "interiorcolour" then
		M(h["interiorcolour"], function(P)
			if P then
				SetVehicleInteriorColor(j, tonumber(P))
			else
				SetVehicleInteriorColor(j, 0)
			end
		end)
	elseif ai == "dashboardcolour" then
		M(h["dashboardcolour"], function(P)
			if P then
				SetVehicleDashboardColor(j, tonumber(P))
			else
				SetVehicleDashboardColor(j, 0)
			end
		end)
	elseif ai == "mod_14" then
		M(h["mod_14"], function(P)
			if P then
				SetVehicleMod(j, 14, tonumber(P), false)
			else
				SetVehicleMod(j, 14, - 1, false)
			end
		end)
	elseif ai == "mod_15" then
		M(h["mod_15"], function(P)
			if P then
				SetVehicleMod(j, 15, tonumber(P), false)
			else
				SetVehicleMod(j, 15, - 1, false)
			end
		end)
	elseif ai == "mod_22" or ai == "xenonlights" then
		M(h["mod_22"], function(am)
			M(h["xenonlights"], function(an)
				if am and tonumber(am) > 0 then
					ToggleVehicleMod(j, 22, true)
					if an then
						SetVehicleXenonLightsColor(j, tonumber(an))
					end
				else
					ToggleVehicleMod(j, 22, false)
				end
			end)
		end)
	elseif ai == "neonlayout" or ai == "neoncolour" then
		M(h["neonlayout"], function(ao)
			M(h["neoncolour"], function(ap)
				if ao and tonumber(ao) > 0 then
					local aq = tonumber(ao)
					if aq == 1 then
						SetVehicleNeonLightEnabled(j, 0, true)
						SetVehicleNeonLightEnabled(j, 1, true)
						SetVehicleNeonLightEnabled(j, 2, true)
						SetVehicleNeonLightEnabled(j, 3, true)
					elseif aq == 2 then
						SetVehicleNeonLightEnabled(j, 2, true)
						SetVehicleNeonLightEnabled(j, 3, true)
					elseif aq == 3 then
						SetVehicleNeonLightEnabled(j, 0, true)
						SetVehicleNeonLightEnabled(j, 1, true)
						SetVehicleNeonLightEnabled(j, 2, true)
					elseif aq == 4 then
						SetVehicleNeonLightEnabled(j, 0, true)
						SetVehicleNeonLightEnabled(j, 1, true)
						SetVehicleNeonLightEnabled(j, 3, true)
					end
					if ap then
						local ak = a.neonColours[ap]
						SetVehicleNeonLightsColour(j, ak[1], ak[2], ak[3])
					else
						SetVehicleNeonLightsColour(j, 222, 222, 255)
					end
				else
					SetVehicleNeonLightEnabled(j, 0, false)
					SetVehicleNeonLightEnabled(j, 1, false)
					SetVehicleNeonLightEnabled(j, 2, false)
					SetVehicleNeonLightEnabled(j, 3, false)
				end
			end)
		end)
	elseif ai == "sounds" then
		M(h["sounds"], function(P)
			if P then
				ForceVehicleEngineAudio(j, getVehicleSoundNameFromId(tonumber(P)))
			else
				ForceVehicleEngineAudio(j, "")
			end
			SetTimeout(500, function()
				SetVehicleRadioEnabled(j, false)
				SetVehRadioStation(j, "OFF")
			end)
		end)
    elseif ai == "plate_colour" then
		M(h["plate_colour"], function(P)
			if P then
				SetVehicleNumberPlateTextIndex(j, tonumber(P))
			else
				SetVehicleNumberPlateTextIndex(j, 0)
			end
		end)
	end
end
local function ar(d)
	if d.saveKey == "mod_14" then
		Citizen.CreateThread(function()
			local W = GetGameTimer()
			while GetGameTimer() - W < 2500 do
				SetControlNormal(0, 86, 1.0)
				Citizen.Wait(0)
			end
		end)
	else
		V()
	end
	if d.name ~= "Chrome" and d.name ~= "Classic" and d.name ~= "Matte" and d.name ~= "Metallic" and d.name ~= "Metals" and d.name ~= "Pearlescent" and d.name ~= "Util" and d.name ~= "Chameleon" then
		return
	end
	Citizen.CreateThread(function()
		XTRA.loadPtfx("scr_as_trans")
		UseParticleFxAsset("scr_as_trans")
		local as = StartParticleFxLoopedOnEntity("scr_as_trans_smoke", j, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, false, false, false)
		local at, au, av = GetVehicleColor(j)
		SetParticleFxLoopedColour(as, at / 255, au / 255, av / 255, false)
		Citizen.Wait(1000)
		StopParticleFxLooped(as)
		RemoveNamedPtfxAsset("scr_as_trans")
	end)
end
local function aw(d)
	if d.helpText then
		drawNativeNotification(d.helpText, true)
	end
	for Z, ah in pairs(d.items) do
		local ax = ah[d.saveValue]
		local ay = type(ax) == "table" and json.encode(ax) or tostring(ax)
		local a5 = h[d.saveKey][ay]
		local a6 = R(a5 == true, a5 ~= nil, ah.price or d.price)
		RageUI.Button(ah.name, nil, a6, true, function(a7, a8, a9)
			if a8 then
				ag(d, ah)
			end
			if a9 then
				if a5 == true then
					tXTRA.notify("~r~You have already applied this mod")
				elseif a5 == false then
					TriggerServerEvent("XTRA:setActiveStaticList", k, a.categoryToIndentifier[d], Z)
					ar(d)
				else
					TriggerServerEvent("XTRA:purchaseStaticList", k, a.categoryToIndentifier[d], Z)
					ar(d)
				end
			end
		end)
	end
end
local function az(d)
	for Z, ah in pairs(d.items) do
		local aA = h[d.saveKey] or 0
		if type(aA) ~= "number" then
			aA = tonumber(aA)
		end
		local a6 = R(aA == d.ownedValue, false, ah.price or d.price)
		RageUI.Button(ah.name, nil, a6, true, function(a7, a8, a9)
			if a9 then
				if aA == d.ownedValue then
					tXTRA.notify("~r~You have already applied this mod")
				else
					TriggerServerEvent("XTRA:purchaseStaticValueList", k, a.categoryToIndentifier[d], Z)
					V()
				end
			end
		end)
	end
end
local function aB(d)
	local aC = h[d.saveKey] or {}
	if # aC > 0 then
		drawNativeNotification(string.format("Press ~INPUT_FRONTEND_ACCEPT~ to change %s", d.helpSuffix))
	end
	for Z, aD in pairs(aC) do
		RageUI.Button(string.format("%s%s", d.indexPrefix, Z), "", {RightLabel = tostring(aD)}, true, function(a7, a8, a9)
			if a8 then
				if IsControlJustPressed(0, 178) then
					TriggerServerEvent("XTRA:deleteValueInputList", k, a.categoryToIndentifier[d], Z)
				end
			end
			if a9 then
				tXTRA.clientPrompt(tostring(d.inputTitle), "", function(aE)
					local aF = aC[Z]
					local aG = nil
					if d.valueType == "number" then
						local aH = tonumber(aE)
						if aH then
							aG = aH
						else
							tXTRA.notify("~r~Could not parse number.")
						end
					else
						aG = aE
					end
					if aG and aG ~= aF then
						TriggerServerEvent("XTRA:setValueInputList", k, a.categoryToIndentifier[d], Z, aG)
					end
				end)
			end
		end)
	end
	RageUI.Button(d.buyTitle, "", {RightLabel = "£" .. getMoneyStringFormatted(d.price)}, true, function(a7, a8, a9)
		if a9 then
			TriggerServerEvent("XTRA:purchaseValueInputList", k, a.categoryToIndentifier[d])
		end
	end)
end
local function isButtonEnabled(disabled)
    if disabled == nil or not disabled then
        return true
    end
    return false
end
local function aI(d)
	RageUI.Button(d.name, isButtonEnabled(d.disabled) and (d.description or "") or "~r~This feature is currently disabled", isButtonEnabled(d.disabled) and {RightLabel = "→→→"} or {}, isButtonEnabled(d.disabled), function(a7, a8, a9)
		if a9 then
			TriggerEvent("XTRA:lsCustomsOpenExternalMenu", d.menuType, j, k, h)
		end
	end, RMenu:Get(d.menuType, d.menuName))
end
local function aJ(d)
	if IsControlJustPressed(0, 0) then
		if l == 0 then
			E(d)
		else
			I()
		end
	end
end
local function aK(d)
	if d.menu == 'mainmenu' and RageUI.Visible(RMenu:Get('lscustoms', d.menu)) then
        I()
    end
	if RageUI.Visible(RMenu:Get('lscustoms', d.menu)) then
		RageUI.DrawContent({ header = true, glare = false, instructionalButton = true}, function()
			RageUI.BackspaceMenuCallback(function()
				L(d)
				if d.type == "modList" then
					_(d)
				elseif d.type == "staticList" then
					al(d)
				end
			end)
			if d.type == "modList" then
				a0(d)
				aJ(d)
			elseif d.type == "indexModList" then
				ae(d)
				aJ(d)
			elseif d.type == "staticList" then
				aw(d)
				aJ(d)
			elseif d.type == "staticValueList" then
				az(d)
				aJ(d)
			elseif d.type == "valueInputList" then
				aB(d)
				aJ(d)
			elseif d.type == "categoryList" then
				for f, g in pairs(d.categories) do
					if g.visible then
						if g.type == "externalMenu" then
							aI(g)
							I()
						else
							RageUI.Button(g.name, isButtonEnabled(g.disabled) and (g.description or "") or "~r~This feature is currently disabled", isButtonEnabled(g.disabled) and {RightLabel = "→→→"} or {}, isButtonEnabled(g.disabled), function(a7, a8, a9)
								if a9 then
									E(g)
								end
							end, RMenu:Get("lscustoms", g.menu))
						end
					end
				end
			end
		end)
	end
	if d.type == "categoryList" then
		for f, g in pairs(d.categories) do
			aK(g)
		end
	end
end
RageUI.CreateWhile(1.0, RMenu:Get("lscustoms", "mainmenu"), function()
	if RageUI.Visible(RMenu:Get('lscustoms', 'repair')) then
		RageUI.DrawContent({ header = true, glare = false, instructionalButton = true}, function()
			RageUI.Button("Repair Vehicle", nil, {RightLabel = "£1,000"}, true, function(a7, a8, a9)
				if a9 then
					TriggerServerEvent("XTRA:lscustomsRepairVehicle")
				end
			end)
		end)
	end
	aK(a.category)
end)
local aL = {
	["default"] = function()
		return true
	end,
	["isCar"] = function()
		return IsThisModelACar(GetEntityModel(j))
	end,
	["isBike"] = function()
		return IsThisModelABike(GetEntityModel(j))
	end,
	["isPlane"] = function()
		return IsThisModelAPlane(GetEntityModel(j))
	end,
	["hasFrontBumper"] = function()
		return GetNumVehicleMods(j, 1) > 0
	end,
	["hasRearBumper"] = function()
		return GetNumVehicleMods(j, 2) > 0
	end,
	["hasAnyBumper"] = function()
		return GetNumVehicleMods(j, 1) > 0 or GetNumVehicleMods(j, 2) > 0
	end,
	["hasChassis"] = function()
		for ad = 42, 46 do
			if GetNumVehicleMods(j, ad) > 0 then
				return true
			end
		end
		return GetNumVehicleMods(j, 5) > 0
	end,
	["hasInterior"] = function()
		for ad = 27, 37 do
			if GetNumVehicleMods(j, ad) > 0 then
				return true
			end
		end
		return false
	end,
	["hasPlates"] = function()
		return GetNumVehicleMods(j, 25) > 0 or GetNumVehicleMods(j, 26) > 0
	end,
	["isCarOrBike"] = function()
		return IsThisModelACar(GetEntityModel(j)) or IsThisModelABike(GetEntityModel(j))
	end,
	["isCarOrBikeOrHeli"] = function()
		return IsThisModelACar(GetEntityModel(j)) or IsThisModelABike(GetEntityModel(j)) or IsThisModelAHeli(GetEntityModel(j))
	end,
	["hasBiometricLock"] = function()
		return h and h["security"] and h["security"]["21"] ~= nil
	end
}
local aR = {[18] = true}
local function aM(d)
	d.visible = true
	if d.type == "modList" then
		d.visible = GetNumVehicleMods(j, d.modType) > 0
    elseif d.type == "indexModList" then
        d.visible = table.count(q[d.generatorName]()) > 0
	else
        if d.type == "staticList" and string.match(d.saveKey, "mod_") then
            local aT = tonumber(string.sub(d.saveKey, 5))
            if aT and not aR[aT] and GetNumVehicleMods(j, aT) == 0 then
                d.visible = false
            end
        end
		if d.requirements then
			local aN = stringsplit(d.requirements, ",")
			for f, aO in pairs(aN) do
				aO = string.gsub(aO, "%s+", "")
				local aP = aL[aO]
				if not aP() then
					d.visible = false
					break
				end
			end
		else
			d.visible = aL["default"]()
		end
	end
	if d.type == "categoryList" then
		for f, g in pairs(d.categories) do
			aM(g)
		end
	end
end
local function aQ()
	k = XTRA.getVehicleIdFromHash(GetEntityModel(j))
	if k == nil then
		tXTRA.notify("~r~Could not identify the vehicle you are in.")
		i = nil
		j = 0
		return
	end
	TriggerServerEvent("XTRA:getBoughtUpgrades", k)
	while not h do
		Citizen.Wait(0)
	end
	DisplayRadar(false)
	SetPlayerControl(PlayerId(), false, 0)
	TriggerServerEvent("XTRA:setCustomsGarageStatus", i.index, true)
	DoScreenFadeOut(500)
	while IsScreenFadingOut() do
		Citizen.Wait(0)
	end
	local aR = i.driveIn
	SetEntityCoordsNoOffset(j, aR.position.x, aR.position.y, aR.position.z, false, false, false)
	SetEntityHeading(j, aR.heading)
	FadeOutLocalPlayer(true)
	SetVehicleOnGroundProperly(j)
	SetVehicleLights(j, 2)
	SetVehicleInteriorlight(j, true)
	SetVehicleDoorsLocked(j, 4)
	SetPlayerInvincible(PlayerId(), true)
	SetEntityInvincible(j, true)
	SetEntityCanBeDamaged(j, false)
	SetVehRadioStation(j, "OFF")
	local aS = i.interior
	if aS then
		ForceRoomForEntity(PlayerPedId(), aS.key, aS.room)
		ForceRoomForEntity(j, aS.key, aS.room)
		ForceRoomForGameViewport(aS.key, aS.room)
	end
	if i.type == "automobile" then
		local aT = i.camera
		m = GetRenderingCam()
		l = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		SetCamCoord(l, aT.position.x, aT.position.y, aT.position.z + 1.0)
		PointCamAtEntity(l, j, 1, 1, 1, true)
		SetCamActive(l, true)
		RenderScriptCams(true, false, 0, false, false)
		local aU = i.inside
		TaskVehicleDriveToCoord(PlayerPedId(), j, aU.position.x, aU.position.y, aU.position.z, 3.0, 1.0, GetEntityModel(j), 16777216, 0.1, 1)
	end
	if aS then
		ForceRoomForEntity(PlayerPedId(), aS.key, aS.room)
		ForceRoomForEntity(j, aS.key, aS.room)
		ForceRoomForGameViewport(aS.key, aS.room)
	end
	DoScreenFadeIn(3000)
	while IsScreenFadingIn() do
		Citizen.Wait(0)
	end
	local W = GetGameTimer()
	while not IsVehicleStopped(j) do
		if GetGameTimer() - W < 15000 then
			break
		end
		Citizen.Wait(0)
	end
	ClearPedTasks(PlayerPedId())
	if i.type == "automobile" then
		local aV = GetFinalRenderedCamCoord()
		SetCamCoord(l, aV.x, aV.y, aV.z)
		local aW = GetGameplayCamRot(2)
		SetCamRot(l, aW.x, aW.y, aW.z, 2)
		RenderScriptCams(true, true, 0, false, false)
		RenderScriptCams(false, true, 1000, false, false)
		SetCamActive(l, true)
		TogglePausedRenderphases(true)
		SetCamActive(l, false)
	end
	FreezeEntityPosition(j, true)
	SetEntityCollision(j, false, false)
	SetPlayerControl(PlayerId(), true, 0)
	RequestScriptAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL", false)
	RequestScriptAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2", false)
	currentCategory = a
	RMenu:Get("lscustoms", "mainmenu"):SetSubtitle(i.name)
	aM(a.category)
	if IsVehicleDamaged(j) then
		RageUI.Visible(RMenu:Get("lscustoms", "repair"), true)
	else
		RageUI.Visible(RMenu:Get("lscustoms", "mainmenu"), true)
	end
	o = true
end
local function aX()
	SetPlayerControl(PlayerId(), false, 0)
	DoScreenFadeOut(500)
	while IsScreenFadingOut() do
		Citizen.Wait(0)
	end
	tXTRA.applyModsOnVehicle(h, k, j)
	local aY = i.driveOut
	SetEntityCoords(j, aY.position.x, aY.position.y, aY.position.z, false, false, false, false)
	SetEntityHeading(j, aY.heading)
	SetEntityCollision(j, true, true)
	FreezeEntityPosition(j, false)
	SetVehicleOnGroundProperly(j)
	SetVehicleDoorsLocked(j, 0)
	SetPlayerInvincible(PlayerId(), false)
	SetVehicleLights(j, 0)
	NetworkLeaveTransition()
	if i.type == "automobile" then
		SetCamActive(l, false)
		RenderScriptCams(false, false, 0, false, false)
		DestroyCam(l, false)
		l = 0
		local aZ = i.outside
		TaskVehicleDriveToCoord(PlayerPedId(), j, aZ.position.x, aZ.position.y, aZ.position.z, 3.0, 0.1, GetEntityModel(j), 16777216, 0.1, 1)
	end
	local aS = i.interior
	if aS then
		ForceRoomForEntity(PlayerPedId(), aS.key, aS.room)
		ForceRoomForEntity(j, aS.key, aS.room)
		ForceRoomForGameViewport(aS.key, aS.room)
	end
	DoScreenFadeIn(3000)
	while IsScreenFadingIn() do
		Citizen.Wait(0)
	end
	local W = GetGameTimer()
	while not IsVehicleStopped(j) do
		if GetGameTimer() - W < 15000 then
			break
		end
		Citizen.Wait(0)
	end
	ClearPedTasks(PlayerPedId())
	SetEntityInvincible(j, false)
	SetEntityCanBeDamaged(j, true)
	SetVehicleFixed(j)
	ReleaseNamedScriptAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL")
	ReleaseNamedScriptAudioBank("DLC_MPHEIST\\HEIST_FLEECA_DRILL_2")
	TriggerServerEvent("XTRA:setCustomsGarageStatus", i.index, false)
	i = nil
	previousCategory = nil
	currentCategory = nil
	j = 0
	SetPlayerControl(PlayerId(), true, 0)
	DisplayRadar(true)
end
local function a_(b0)
	local b1, b2 = XTRA.getPlayerVehicle()
	if b1 == 0 or not b2 or i then
		return
	end
	local b3 = GetEntityModel(b1)
	if b0.isLocked then
		XTRA.DrawText(0.5, 0.8, "~r~Locked, please wait~w~", 1.0, 4, 0)
	elseif b0.type == "plane" and not IsThisModelAPlane(b3) then
		XTRA.DrawText(0.5, 0.8, "~r~You must be a in a plane to use this~w~", 1.0, 4, 0)
	elseif b0.type == "boat" and not IsThisModelABoat(b3) then
		XTRA.DrawText(0.5, 0.8, "~r~You must be a in a boat to use this~w~", 1.0, 4, 0)
	else
		XTRA.DrawText(0.5, 0.8, "Press ~b~ENTER~w~ to enter ~b~" .. b0.name .. "~w~", 1.0, 4, 0)
		if IsControlJustPressed(0, 201) then
			i = b0
			j = b1
			Citizen.CreateThread(aQ)
		end
	end
end
local function b4(d)
	if RageUI.Visible(RMenu:Get("lscustoms", d.menu)) then
		return true
	end
	if d.type == "externalMenu" then
		return RageUI.Visible(RMenu:Get(d.menuType, d.menuName))
	elseif d.type == "categoryList" then
		for f, g in pairs(d.categories) do
			if b4(g) then
				return true
			end
		end
	end
	return false
end
local function b5()
	if i then
		SetLocalPlayerVisibleLocally(true)
		if o and not b4(a.category) and not RageUI.Visible(RMenu:Get("lscustoms", "repair")) then
			Citizen.CreateThread(aX)
			o = false
		end
	end
end
Citizen.CreateThread(function()
	for Z, b0 in pairs(a.garages) do
		b0.index = Z
		XTRA.createArea("lscustoms_" .. tostring(Z), b0.driveIn.position, 5.0, 6.0, function()
		end, function()
		end, a_, b0)
		tXTRA.addBlip(b0.inside.position.x, b0.inside.position.y, b0.inside.position.z, 72, nil, "LS Customs")
	end
	XTRA.createThreadOnTick(b5)
end)
RegisterNetEvent("XTRA:setCustomsGarageStatus", function(b6, b7)
	a.garages[b6].isLocked = b7
end)
RegisterNetEvent("XTRA:syncCustomsGarageStatus", function(b8)
	for Z, f in pairs(b8) do
		a.garages[Z].isLocked = true
	end
end)
RegisterNetEvent("XTRA:gotBoughtUpgrades", function(b9)
	h = b9
end)
RegisterNetEvent("XTRA:setSpecificOwnedUpgrade", function(P, Q)
	h[P] = Q
end)
RegisterNetEvent("XTRA:lscustomsRepairVehicle", function()
	SetVehicleFixed(j)
	RageUI.Visible(RMenu:Get("lscustoms", "repair"), false)
	RageUI.Visible(RMenu:Get("lscustoms", "mainmenu"), true)
end)
function XTRA.isInsideLsCustoms()
	return i ~= nil
end

-- print("Loaded LS Customs")