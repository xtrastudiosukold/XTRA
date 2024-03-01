local a = module("xtra-vehicles", "cfg/weapons")
a = a.weapons
local b = false
local c = {
    {type = 1, desc = "Noclip"},
    {type = 2, desc = "Spawning of Weapon(s)"},
    {type = 3, desc = "Explosion Event"},
    {type = 4, desc = "Blacklisted Event"},
    {type = 5, desc = "Removal of Weapon(s)"},
    {type = 6, desc = "Semi Godmode"},
    {type = 7, desc = "Mod Menu"},
    {type = 8, desc = "Weapon Modifier"},
    {type = 9, desc = "Armour Modifier"},
    {type = 10, desc = "Health Modifier"},
    {type = 11, desc = "Server Trigger"},
    {type = 12, desc = "Vehicle Modifications"},
    {type = 13, desc = "Night Vision"},
    {type = 14, desc = "Model Dimensions"},
    {type = 15, desc = "Godmoding"},
    {type = 16, desc = "Failed Keep Alive (els)"},
    {type = 17, desc = "Spawned Ammo"},
    {type = 18, desc = "Resource Stopper"},
    {type = 19, desc = "Infinite Combat Roll"},
    {type = 20, desc = "Spawning of Weapon(s)"},
  --  {type = 21, desc = "Teleport to Waypoint"},
  --  {type = 22, desc = "Vehicle Repair"},
    {type = 23, desc = "Spectate"},
    {type = 24, desc = "Freecam"},
    {type = 25, desc = "Warping into Vehicle"},
    {type = 26, desc = "NUI Tools"},
    {type = 27, desc = "Invisible"},
    {type = 28, desc = "Fast Run"},
    {type = 29, desc = "Anti Eulen"},
}
RegisterServerEvent("XTRA:acType1")
AddEventHandler(
    "XTRA:acType1",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        if not table.includes(carrying, source) then
            Wait(500)
            TriggerEvent("XTRA:acBan", user_id, 1, name, source)
        end
    end
)

RegisterServerEvent("XTRA:AntiCheatVehicle")
AddEventHandler("XTRA:AntiCheatVehicle", function(vehicle)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    TriggerClientEvent("XTRA:takeClientScreenshotAndUpload", source, XTRA.getWebhook("anticheat"))
    Wait(2000)
    XTRA.sendWebhook("anticheat","Anticheat Log","> Players Name: **" .. name .. "**\n> Players Perm ID: **" .. user_id .. "**\n> Spawned Vehicle: **" .. vehicle .. "**")
end)

RegisterServerEvent("XTRA:acType27")
AddEventHandler(
    "XTRA:acType27",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 27, name, source)
    end
)

RegisterServerEvent("XTRA:acType28")
AddEventHandler(
    "XTRA:acType28",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 28, name, source)
    end
)
function table.includes(table, f)
    for g, h in pairs(table) do
        if h == f then
            return true
        end
    end
    return false
end
local i = false
function tXTRA.isSpectatingEvent()
    return i
end
RegisterServerEvent("XTRA:acType2")
AddEventHandler(
    "XTRA:acType2",
    function(j)
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        if j ~= "GADGET_PARACHUTE" then
            if XTRA.hasPermission(user_id, 'admin.tickets') then return end
            TriggerEvent("XTRA:acBan", user_id, 2, name, source, j)
        end
    end
)
RegisterServerEvent("XTRA:acType20")
AddEventHandler(
    "XTRA:acType20",
    function(j)
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        if not string.match(j, "GADGET_PARACHUTE") then
            TriggerEvent("XTRA:acBan", user_id, 2, name, source, j)
        end
    end
)
AddEventHandler("clearPedTasksEvent",function(source)
    local source = source
    local user_id = XTRA.getUserId(source)
    local entity = NetworkGetEntityFromNetworkId(source)
    if DoesEntityExist(entity) then
        if NetworkGetEntityOwner(entity) ~= source then
            CancelEvent()
            local name = XTRA.GetPlayerName(user_id)
            Wait(500)
            TriggerEvent("XTRA:acBan", user_id, 25, name, source)
        end
    end
end)
RegisterServerEvent("XTRA:acType24")
AddEventHandler("XTRA:acType24",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    Wait(500)
    TriggerEvent("XTRA:acBan", user_id, 24, name, source)
end)
RegisterServerEvent("XTRA:acType26")
AddEventHandler("XTRA:acType26",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    Wait(500)
    TriggerEvent("XTRA:acBan", user_id, 26, name, source)
end)
RegisterServerEvent("XTRA:acType23")
AddEventHandler("XTRA:acType23",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    Wait(500)
    TriggerEvent("XTRA:acBan", user_id, 23, name, source)
end)
RegisterServerEvent("XTRA:acType23")
AddEventHandler("XTRA:acType23",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    Wait(500)
    TriggerEvent("XTRA:acBan", user_id, 23, name, source)
end)
local k = {1, 2, 5, 32, 33, 35, 35, 36, 37, 38, 45}
AddEventHandler(
    "explosionEvent",
    function(source, l)
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        for m, n in ipairs(k) do
            if l.explosionType == n then
                l.damagescale = 0.0
                CancelEvent()
                Wait(500)
                TriggerEvent("XTRA:acBan", user_id, 3, name, source, "Explosion Type: " .. l.explosionType)
            end
        end
    end
)


local Check_Player = {}
local AlreadyChecking = false

RegisterNetEvent('XTRA:CheckSyncOriginalToServer')
AddEventHandler('XTRA:CheckSyncOriginalToServer', function()
    Check_Player[#Check_Player+1] = source
    if not AlreadyChecking then
        AlreadyChecking = true
        Wait(7500)
        for i = 1, #Check_Player do
            local p = Check_Player[i]
            TriggerClientEvent("XTRA:SyncTime", p)
        end
        AlreadyChecking = false
        Check_Player = {}
    end
end)

RegisterNetEvent('XTRA:CheckSyncOriginal')
AddEventHandler('XTRA:CheckSyncOriginal', function(timetook)
    local source = tonumber(source)
    local user_id = XTRA.getUserId(source)
    local player_ping = GetPlayerPing(source)
    if player_ping > 500 then
        print("Dropping Player: ".. source ..", Maximum ping exceed rejoin to server")
        DropPlayer(source, "Maximum ping exceed rejoin to server")
    else
        TriggerEvent("XTRA:acBan",user_id, 11,XTRA.GetPlayerName(user_id),source,"Loading Time: "..timetook.."ms")
    end
end)


local o = {
    "esx:getSharedObject",
    "bank:transfer",
    "esx_ambulancejob:revive",
    "esx-qalle-jail:openJailMenu",
    "esx_jailer:wysylandoo",
    "esx_policejob:getarrested",
    "esx_society:openBossMenu",
    "esx:spawnVehicle",
    "esx_status:set",
    "HCheat:TempDisableDetection",
    "UnJP",
    "8321hiue89js",
    "adminmenu:allowall",
    "AdminMenu:giveBank",
    "AdminMenu:giveCash",
    "AdminMenu:giveDirtyMoney",
    "Tem2LPs5Para5dCyjuHm87y2catFkMpV",
    "esx_dmvschool:pay"
}
for p, q in ipairs(o) do
    RegisterNetEvent(q)
    AddEventHandler(
        q,
        function()
            local source = source
            local user_id = XTRA.getUserId(source)
            local name = XTRA.GetPlayerName(user_id)
            Wait(500)
            TriggerEvent("XTRA:acBan", user_id, 4, name, source, "Event: " .. q)
        end
    )
end
local blacklistedprops = {
    'prop_cs_dildo_01',
    'prop_speaker_05',
    'prop_speaker_01',
    'prop_speaker_03',
    'surano',
    'ar_prop_ar_bblock_huge_01',
    'dt1_05_build1_damage',
    'prop_juicestand',
    'prop_knife',
    'p_bloodsplat_s',
    'p_spinning_anus_s',
    'dt1_lod_slod3',
    'prop_xmas_tree_int',
    'prop_cs_cardbox_01',
    'prop_alien_egg_01',
    'prop_tv_03',
    'prop_beach_fire',
    'prop_windmill_01_l1',
    'stt_prop_stunt_track_start',
    'stt_prop_stunt_track_start_02',
    'apa_prop_flag_mexico_yt',
    'apa_prop_flag_us_yt',
    'apa_prop_flag_uk_yt',
    'prop_jetski_ramp_01',
    'prop_const_fence03b_cr',
    'prop_fnclink_03gate5',
    'ind_prop_firework_03',
    'prop_weed_01',
    'prop_weed_01',
    'xs_prop_hamburgher_wl',
    'prop_container_01a',
    'prop_contnr_pile_01a',
    'ce_xr_ctr2',
    'stt_prop_ramp_jump_xxl',
    'hei_prop_carrier_jet',
    'prop_parking_hut_2',
    'csx_seabed_rock3_',
    'db_apart_03_',
    'db_apart_09_',
    'stt_prop_stunt_tube_l',
    'stt_prop_stunt_track_dwuturn',
    'sr_prop_spec_tube_xxs_01a',
    'prop_air_bigradar',
    'p_tram_crash_s',
    'prop_fnclink_03a',
    'prop_fnclink_05crnr1',
    'xs_prop_plastic_bottle_wl',
    'prop_windmill_01',
    'prop_gold_cont_01',
    'p_cablecar_s',
    'stt_prop_stunt_tube_l',
    'stt_prop_stunt_track_dwuturn',
    'prop_ld_ferris_wheel',
    'prop_ferris_car_01',
    'p_ferris_car_01',
    'stt_prop_ramp_spiral_l',
    'stt_prop_ramp_spiral_l_l',
    'stt_prop_ramp_multi_loop_rb',
    'stt_prop_ramp_spiral_l_xxl',
    'stt_prop_ramp_spiral_xxl',
    'stt_prop_stunt_bblock_huge_01',
    'stt_prop_stunt_bblock_huge_02',
    'stt_prop_stunt_bblock_huge_03',
    'stt_prop_stunt_bblock_huge_04',
    'stt_prop_stunt_bblock_huge_05',
    'stt_prop_stunt_bblock_hump_01',
    'stt_prop_stunt_bblock_qp',
    'stt_prop_stunt_bblock_qp2',
    'stt_prop_stunt_jump_loop',
    'stt_prop_stunt_landing_zone_01',
    'stt_prop_stunt_track_dwslope45',
    'stt_prop_stunt_track_dwturn',
    'stt_prop_stunt_track_dwslope30',
    'stt_prop_stunt_track_dwsh15',
    'stt_prop_stunt_track_dwshort',
    'stt_prop_stunt_track_dwslope15',
    'stt_prop_stunt_track_dwuturn',
    'stt_prop_stunt_track_exshort',
    'stt_prop_stunt_track_fork',
    'stt_prop_stunt_track_funlng',
    'stt_prop_stunt_track_funnel',
    'stt_prop_stunt_track_hill',
    'stt_prop_stunt_track_slope15',
    'stt_prop_stunt_track_slope30',
    'stt_prop_stunt_track_slope45',
    'prop_gas_pump_1a',
    'prop_gas_pump_1b',
    'prop_gas_pump_1c',
    'prop_gas_pump_1d',
    'prop_rock_1_a',
    'prop_vintage_pump',
    'prop_gas_pump_old2',
    'prop_gas_pump_old3',
    'apa_mp_h_acc_box_trinket_01',
    'prop_roundbailer02',
    'prop_roundbailer01',
    'prop_container_05a',
    'stt_prop_stunt_bowling_ball',
    'apa_mp_h_acc_rugwoolm_03',
    'prop_container_ld2',
    'p_ld_stinger_s',
    'hei_prop_carrier_cargo_02a',
    'p_cablecar_s',
    'p_ferris_car_01',
    'prop_rock_4_big2',
    'prop_steps_big_01',
    'v_ilev_lest_bigscreen',
    'prop_carcreeper',
    'apa_mp_h_bed_double_09',
    'apa_mp_h_bed_wide_05',
    'prop_cattlecrush',
    'prop_cs_documents_01',
    'prop_construcionlamp_01',
    'prop_fncconstruc_01d',
    'prop_fncconstruc_02a',
    'p_dock_crane_cabl_s',
    'prop_dock_crane_01',
    'prop_dock_crane_02_cab',
    'prop_dock_float_1',
    'prop_dock_crane_lift',
    'apa_mp_h_bed_wide_05',
    'apa_mp_h_bed_double_08',
    'apa_mp_h_bed_double_09',
    'csx_seabed_bldr4_',
    'imp_prop_impexp_sofabed_01a',
    'apa_mp_h_yacht_bed_01',
    'cs4_lod_04_slod2',
    'dt1_05_build1_damage',
    'po1_lod_slod4',
    'id2_lod_slod4',
    'ap1_lod_slod4',
    'sm_lod_slod2_22',
    'prop_ld_ferris_wheel',
    'prop_container_05a',
    'prop_gas_tank_01a',
    'p_crahsed_heli_s',
    'prop_gas_pump_1d',
    'prop_gas_pump_1a',
    'prop_gas_pump_1b',
    'prop_gas_pump_1c',
    'prop_vintage_pump',
    'prop_gas_pump_old2',
    'prop_gas_pump_old3',
    'prop_gascyl_01a',
    'prop_ld_toilet_01',
    'prop_ld_bomb_anim',
    'prop_ld_farm_couch01',
    'prop_beachflag_le',
    'stt_prop_stunt_track_uturn',
    'stt_prop_stunt_track_turnice',
    'cargoplane',
    `prop_beach_fire`,
    `xs_prop_hamburgher_wl`,
    `prop_fnclink_05crnr1`,
    -1207431159,
    -145066854,
    `stt_prop_stunt_soccer_ball`,
    `sr_prop_spec_tube_xxs_01a`
}

AddEventHandler("entityCreated", function(entity)
    if DoesEntityExist(entity) then
        local entityOwner = NetworkGetEntityOwner(entity)
        if blacklistedprops[entity] then
            DeleteEntity(entity)
        end
    end
end)
AddEventHandler(
    "removeWeaponEvent",
    function(r, s)
        CancelEvent()
        local source = r
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 5, name, source)
    end
)
AddEventHandler(
    "giveWeaponEvent",
    function(source)
        CancelEvent()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 2, name, source)
    end
)
AddEventHandler(
    "loadModel",
    function(source)
        CancelEvent()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 5, name, source)
    end
)
AddEventHandler(
    "spawnVehicle",
    function(source)
        CancelEvent()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 5, name, source)
    end
)
AddEventHandler(
    "GetAmmoInPedWeapon",
    function(source)
        CancelEvent()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 5, name, source)
    end
)
AddEventHandler(
    "removeAllWeaponsEvent",
    function(source)
        CancelEvent()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 5, name, source)
    end
)
RegisterServerEvent("XTRA:acType6")
AddEventHandler(
    "XTRA:acType6",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 6, name, source)
    end
)
RegisterServerEvent("XTRA:acType7")
AddEventHandler(
    "XTRA:acType7",
    function(t)
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 7, name, source, t)
    end
)
RegisterServerEvent("XTRA:acType8")
AddEventHandler(
    "XTRA:acType8",
    function(u)
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        XTRA.sendWebhook("anticheat-log", "Anticheat Log", "> Players Name: **" .. name .. "**\n> Players Perm ID: **" .. user_id .. "**\n> Extra Info: **" .. u .. "**")
        -- TriggerEvent("XTRA:acBan", user_id, 8, name, source, u)
    end
)
RegisterServerEvent("XTRA:acType9")
AddEventHandler(
    "XTRA:acType9",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 9, name, source)
    end
)
RegisterServerEvent("XTRA:acType10")
AddEventHandler(
    "XTRA:acType10",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 10, name, source)
    end
)
RegisterServerEvent("XTRA:acType11")
AddEventHandler(
    "XTRA:acType11",
    function(u)
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
    --TriggerEvent("XTRA:acBan", user_id, 11, name, source, u)
    end
)
--RegisterServerEvent("XTRA:acType12")
--AddEventHandler(
  --  "XTRA:acType12",
  --  function(u)
  --      local source = source
   --     local user_id = XTRA.getUserId(source)
 --       local name = XTRA.GetPlayerName(user_id)
   --     Wait(500)
   --     TriggerEvent("XTRA:acBan", user_id, 12, name, source, u)
   -- end
--)
RegisterServerEvent("XTRA:acType13")
AddEventHandler(
    "XTRA:acType13",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 13, name, source)
    end
)
RegisterServerEvent("XTRA:acType14")
AddEventHandler(
    "XTRA:acType14",
    function()
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 14, name, source)
    end
)
RegisterServerEvent("XTRA:acType15")
AddEventHandler("XTRA:acType15",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    Wait(500)
    TriggerEvent("XTRA:acBan", user_id, 15, name, source)
end)
RegisterServerEvent("XTRA:acType16")
AddEventHandler("XTRA:acType16",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    TriggerEvent("XTRA:acBan", user_id, 16, name, source)
end)
RegisterServerEvent("XTRA:sendVelocityLimit")
AddEventHandler("XTRA:sendVelocityLimit",function(x, y)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    
    if #(x - vector3(196.24597167969, 7397.2084960938, 14.497759819031)) < 150.0 or
        #(y - vector3(196.24597167969, 7397.2084960938, 14.497759819031)) < 150.0 or
        XTRA.hasPermission(user_id, "admin.tickets") then
        return
    end
    TriggerEvent("XTRA:acBan", user_id, 21, name, source, "1st: "..x.."  |  2nd: "..y.."")
end)

RegisterServerEvent("XTRA:acType18")
AddEventHandler("XTRA:acType18",function(z)
    if z ~= "xtra" then
        local source = source
        local user_id = XTRA.getUserId(source)
        local name = XTRA.GetPlayerName(user_id)
        Wait(500)
        TriggerEvent("XTRA:acBan", user_id, 18, name, source, z)
    end
end)

RegisterServerEvent("XTRA:acType19")
AddEventHandler("XTRA:acType19",function()
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    Wait(500)
    TriggerEvent("XTRA:acBan", user_id, 19, name, source)
end)
RegisterServerEvent("XTRA:acBan")
AddEventHandler(
    "XTRA:acBan",
    function(d, A, e, B, u)
        local C = ""
        local D = ""
        if u == nil then
            u = "None"
        end
        if d == 0 or d == 1 or d == 2 then
            print("Ban Type: " .. A, "Name: " .. e, "Extra: " .. u)
            return
        end
        if source == "" then
            if not b then
                for m, n in pairs(c) do
                    if A == n.type then
                        D = "Type #" .. A
                        C = n.desc
                    end
                end
                print("Ban Type: " .. A, "Name: " .. e, "Extra: " .. u)
                b = true
                TriggerClientEvent("XTRA:takeClientScreenshotAndUpload", B, XTRA.getWebhook("anticheat"))
                Wait(2000)
                b = false
                XTRA.sendWebhook(
                    "anticheat",
                    "Anticheat Ban",
                    "> Players Name: **" ..
                        e ..
                            "**\n> Players Perm ID: **" ..
                                d ..
                                    "**\n> Reason: **" ..
                                        D .. "**\n> Type Meaning: **" .. C .. "**\n> Extra Info: **" .. u .. "**"
                )
                TriggerClientEvent(
                    "chatMessage",
                    -1,
                    "^7^*[XTRA Anticheat]",
                    {180, 0, 0},
                    e .. " ^7 Was Banned | Reason: Cheating " .. D,
                    "alert"
                )
                XTRA.banConsole(d, "perm", "Cheating " .. D)
                exports["xtra"]:execute(
                    "INSERT INTO `xtra_anticheat` (`user_id`, `username`, `reason`, `extra`) VALUES (@user_id, @username, @reason, @extra);",
                    {user_id = d, username = e, reason = D, extra = u},
                    function()
                    end
                )
            end
        end
    end
)

RegisterServerEvent("XTRA:sendVehicleStats",function(Afterbodyhealth,previousbodyhealth,Afterenginehealth,previousenginehealth,Afterpetroltankhealth,previouspetroltankhealth,Afterentityhealth,previousentityhealth,passangers,vehiclehash)
    local source = source
    local user_id = XTRA.getUserId(source)
    local name = XTRA.GetPlayerName(user_id)
    TriggerEvent("XTRA:acBan", user_id, 22, name, source, "**\n> Spawn Code: **"..vehiclehash.."**\n> Body Health: **"..previousbodyhealth.."**\n> Engine Health: **"..previousenginehealth.."**\n> Petrol Tank Health: **"..previouspetroltankhealth.."**\n> Entity Health: **"..previousentityhealth.."**\n> After Body Health: **"..Afterbodyhealth.."**\n> After Engine Health: **"..Afterenginehealth.."**\n> After Petrol Tank Health: **"..Afterpetroltankhealth.."**\n> After Entity Health: **"..Afterentityhealth.."****")
end)

RegisterServerEvent("XTRA:CheckKVP",function(kvpid)
    local source = source
    local user_id = XTRA.getUserId(source)
    if kvpid then
        if user_id ~= kvpid then
            XTRA.sendWebhook(
                "multi-account",
                "XTRA Multi Account Logs",
                "> Player Current Perm ID: **" .. user_id .. "**\n> Player Other Perm ID: **" .. kvpid .. "**"
            )
        end
        XTRA.isBanned(kvpid,function(R)
            if R then
                XTRA.banConsole(d, "perm", "1.11 Ban Evading")
                XTRA.sendWebhook(
                    "ban-evaders",
                    "XTRA Ban Evade Logs",
                    "> Player Name: **"..e.."**\n> Player Current Perm ID: **" .. user_id .. "**\n> Player Banned Perm ID: **" .. kvpid .. "**"
                )
            end
        end)
    end
end)

decor = {}
decor = generateUUID("decor", 15, "alphanumeric")
Citizen.CreateThread(
    function()
        Wait(2500)
        exports["xtra"]:execute(
            [[
    CREATE TABLE IF NOT EXISTS `xtra_anticheat` (
    `ban_id` int(11) NOT NULL AUTO_INCREMENT,
    `user_id` int(11) NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `reason` VARCHAR(100) NOT NULL,
    `extra` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`ban_id`)
    );]]
        )
    end
)


RegisterCommand("crashplayer", function(source, args)
    local user_id = XTRA.getUserId(source)
    if source == 0 or user_id == 1 then
        if args[1] ~= nil then
            print("XTRA - Crashing Player: "..args[1])
            XTRAclient.isPlayerLoading(XTRA.getUserSource(tonumber(args[1])), {})
        end
    else
        print("XTRA - Crashing Player: "..user_id)
        XTRAclient.isPlayerLoading(source, {})
    end
end)

        
AddEventHandler("fg:BanHandler", function(BanId, data, additional_info, screenshot_url)
    local license = data.license
    exports['xtra']:execute('SELECT * FROM xtra_users WHERE license = @license', {['@license'] = license}, function(result)
        if result and #result > 0 then
            local userInfo = result[1]
            local user_id = userInfo.id
            local username = userInfo.username
            local reason = "Cheating Five Guard"
            local extra = additional_info
            local date = os.date("%c")
            if extra == nil then
                extra = "None"
            end
            if screenshot_url == nil then
                screenshot_url = "None"
            end
            XTRA.setBanned(user_id, true, "perm", reason, "Five Gaurd AntiCheat", extra)
            exports['xtra-ac']:UnbanId(BanId)
            exports['xtra']:execute('INSERT INTO `xtra_anticheat` (`user_id`, `username`, `reason`, `extra`) VALUES (@user_id, @username, @reason, @extra);', {
                ['user_id'] = user_id,
                ['username'] = username,
                ['reason'] = reason,
                ['extra'] = extra
            }, function()
            end)
            XTRA.sendWebhook("anticheat","Anticheat Ban","> Players Name: **" .. username .."**\n> Players Perm ID: **" .. user_id .."**\n> Reason: **" .. data.reason .. "**\n> Extra Info: **" .. extra .. "**")
            PerformHttpRequest(XTRA.getWebhook("anticheat"),function(N, O, P)end,"POST",json.encode({username = "XTRA Anticheat", content = screenshot_url}),{["Content-Type"] = "application/json"})
            TriggerClientEvent("chatMessage", -1, "^7^*[XTRA Anticheat]", {180, 0, 0}, username.." ^7Was Banned | Reason: Cheating Five Guard", "alert")
        end
    end)
end)


-- If someone trying to spawn spoofed object's get the object hash and put it in this table

local blockedItems = {
	[841438406] = true,
    [-473353655] = true,
    [-1327155414] = true,
    [-109599267] = true,
    [566160949] = true,
    [1121747524] = true,
    [-133291774] = true,
    [-552807189] = true,
    [1803116220] = true,
    [522807189] = true,
    [1803116220] = true,
    [552807189] = true,
    [516505552] = true,
    [-1980613044] = true,
    [-2130482718] = true,
    [1765283457] = true,
    [-699955605] = true,
    [1865929795] = true,
    [1325339411] = true,
    [-2071359746] = true,
    [-1576911260] = true,
    [-512634970] = true,
    [-999293939] = true,
    [1885233650] = true,
    [1289401397] = true,
    [2088441666] = true,
    [-111377536] = true,
    [22143489] = true,
    [-1111377536] = true,
    [137575484] = true,
    [206865238] = true,
    [-46303329] = true,
    [1708919037] = true,
    [959265690] = true,
    [-1043459709] = true,
    [1885712733] = true,
    [-1008818392] = true,
    [133481871] = true,
    [1185249461] = true,
    [-1011638209] = true,
    [-1279773008] = true,
    [-1268580434] = true,
    [1920863736] = true,
    [1336576410] = true,
    [-417505688] = true,
    [-220552467] = true,
    [68070371] = true,
    [-1660909656] = true,
    [71929310] = true,
    [-1863364300] = true,
    [-57685738] = true,
    [1264920838] = true,
    [-1044093321] = true,
    [-1699520669] = true,
    [-835930287] = true,
    [1813637474] = true,
    [880829941] = true,
    [2109968527] = true,
    [-1404353274] = true,
    [-1920001264] = true,
    [959275690] = true,
    [2046537925] = true,
}

AddEventHandler('entityCreating', function(entity)
    if blockedItems[GetEntityModel(entity)] then
        CancelEvent()
    end
end)