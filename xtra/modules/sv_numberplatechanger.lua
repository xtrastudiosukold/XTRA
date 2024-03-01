local forbiddenNames = {
	"%^1",
	"%^2",
	"%^3",
	"%^4",
	"%^5",
	"%^6",
	"%^7",
	"%^8",
	"%^9",
	"%^%*",
	"%^_",
	"%^=",
	"%^%~",
	"admin",
	"nigger",
	"cunt",
	"faggot",
	"fuck",
	"fucker",
	"fucking",
	"anal",
	"stupid",
	"damn",
	"cock",
	"cum",
	"dick",
	"dipshit",
	"dildo",
	"douchbag",
	"douch",
	"kys",
	"jerk",
	"jerkoff",
	"gay",
	"homosexual",
	"lesbian",
	"suicide",
	"mothafucka",
	"negro",
	"pussy",
	"queef",
	"queer",
	"weeb",
	"retard",
	"masterbate",
	"suck",
	"tard",
	"allahu akbar",
	"terrorist",
	"twat",
	"vagina",
	"wank",
	"whore",
	"wanker",
	"n1gger",
	"f4ggot",
	"n0nce",
	"d1ck",
	"h0m0",
	"n1gg3r",
	"h0m0s3xual",
	"free up mandem",
	"nazi",
	"hitler",
	"cheater",
	"cheating",
}

MySQL.createCommand("XTRA/update_numplate","UPDATE xtra_user_vehicles SET vehicle_plate = @registration WHERE user_id = @user_id AND vehicle = @vehicle")
MySQL.createCommand("XTRA/check_numplate","SELECT * FROM xtra_user_vehicles WHERE vehicle_plate = @plate")

RegisterNetEvent('XTRA:getCars')
AddEventHandler('XTRA:getCars', function()
    local cars = {}
    local source = source
    local user_id = XTRA.getUserId(source)
    exports['xtra']:execute("SELECT * FROM `xtra_user_vehicles` WHERE user_id = @user_id", {user_id = user_id}, function(result)
        if result ~= nil then 
            for k,v in pairs(result) do
                if v.user_id == user_id then
                    cars[v.vehicle] = {v.vehicle, v.vehicle_plate}
                end
            end
            TriggerClientEvent('XTRA:carsTable', source, cars)
        end
    end)
end)

RegisterNetEvent("XTRA:ChangeNumberPlate")
AddEventHandler("XTRA:ChangeNumberPlate", function(vehicle)
	local source = source
    local user_id = XTRA.getUserId(source)
	XTRA.prompt(source,"Plate Name:","",function(source, plateName)
		if plateName == '' then return end
		exports['xtra']:execute("SELECT * FROM `xtra_user_vehicles` WHERE vehicle_plate = @plate", {plate = plateName}, function(result)
            if next(result) then 
                XTRAclient.notify(source,{"This plate is already taken."})
                return
			else
				for name in pairs(forbiddenNames) do
					if plateName == forbiddenNames[name] then
						XTRAclient.notify(source,{"You cannot have this plate."})
						return
					end
				end
				if XTRA.tryFullPayment(user_id,500000) then
					XTRAclient.notify(source,{"~g~Changed plate of "..vehicle.." to "..plateName})
					MySQL.execute("XTRA/update_numplate", {user_id = user_id, registration = plateName, vehicle = vehicle})
					TriggerClientEvent("XTRA:RecieveNumberPlate", source, plateName)
					TriggerClientEvent("XTRA:PlaySound", source, "apple")
					TriggerEvent('XTRA:getCars')
				else
					XTRAclient.notify(source,{"You don't have enough money!"})
				end
            end
        end)
	end)
end)

RegisterNetEvent("XTRA:checkPlateAvailability")
AddEventHandler("XTRA:checkPlateAvailability", function(plate)
	local source = source
    local user_id = XTRA.getUserId(source)
	MySQL.query("XTRA/check_numplate", {plate = plate}, function(result)
		if #result > 0 then 
			XTRAclient.notify(source, {"The plate "..plate.." is already taken."})
		else
			XTRAclient.notify(source, {"~g~The plate "..plate.." is available."})
		end
	end)
end)
