RMenu.Add(
    "devmenu",
    "main",
    RageUI.CreateMenu("XTRA Dev Tools", "Developer Tools", tXTRA.getRageUIMenuWidth(), tXTRA.getRageUIMenuHeight())
)
RMenu.Add(
    "devmenu",
    "animations",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Animations",
        "Animations",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "devmenu",
    "animations2",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Animations",
        "Animations",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "devmenu",
    "tplocations",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Teleporter",
        "Teleporter",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "devmenu",
    "tplocations2",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Teleporter",
        "Teleporter",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "devmenu",
    "nativesounds",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Native Sounds",
        "Native Sounds",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "devmenu",
    "musicevents",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Music Events",
        "music",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
RMenu.Add(
    "devmenu",
    "propplacement",
    RageUI.CreateSubMenu(
        RMenu:Get("devmenu", "main"),
        "Prop Placement",
        "Prop Placement",
        tXTRA.getRageUIMenuWidth(),
        tXTRA.getRageUIMenuHeight()
    )
)
local a = false
local b = {}
for c = -5, 5, 0.01 do
    table.insert(b, math.floor(c * 1000) / 1000)
end
local d = {}
for c = -360, 360, 1.0000001 do
    table.insert(d, math.floor(c * 1000) / 1000)
end
local e = nil
local f = {
    ["Offices"] = {
        ["Maze Bank Tower"] = {
            {"Old Spice Warm", "ex_dt1_11_office_01a"},
            {"Old Spice Classical", "ex_dt1_11_office_01b"},
            {"Old Spice Vintage", "ex_dt1_11_office_01c"},
            {"Executive Contrast", "ex_dt1_11_office_02a"},
            {"Executive Rich", "ex_dt1_11_office_02b"},
            {"Executive Cool", "ex_dt1_11_office_02c"},
            {"Power Broker Ice", "ex_dt1_11_office_03a"},
            {"Power Broker Conservative", "ex_dt1_11_office_03b"},
            {"Power Broker Polished", "ex_dt1_11_office_03c"}
        },
        ["Arcadius Business Centre"] = {
            {"Old Spice Warm", "ex_dt1_02_office_01a"},
            {"Old Spice Classical", "ex_dt1_02_office_01b"},
            {"Old Spice Vintage", "ex_dt1_02_office_01c"},
            {"Executive Contrast", "ex_dt1_02_office_02a"},
            {"Executive Rich", "ex_dt1_02_office_02b"},
            {"Executive Cool", "ex_dt1_02_office_02c"},
            {"Power Broker Ice", "ex_dt1_02_office_03a"},
            {"Power Broker Conservative", "ex_dt1_02_office_03b"},
            {"Power Broker Polished", "ex_dt1_02_office_03c"}
        },
        ["Lombank West"] = {
            {"Old Spice Warm", "ex_dt1_13_office_01a"},
            {"Old Spice Classical", "ex_dt1_13_office_01b"},
            {"Old Spice Vintage", "ex_dt1_13_office_01c"},
            {"Executive Contrast", "ex_dt1_13_office_02a"},
            {"Executive Rich", "ex_dt1_13_office_02b"},
            {"Executive Cool", "ex_dt1_13_office_02c"},
            {"Power Broker Ice", "ex_dt1_13_office_03a"},
            {"Power Broker Conservative", "ex_dt1_13_office_03b"},
            {"Power Broker Polished", "ex_dt1_13_office_03c"}
        },
        ["Maze Bank West"] = {
            {"Old Spice Warm", "ex_dt1_15_office_01a"},
            {"Old Spice Classical", "ex_dt1_15_office_01b"},
            {"Old Spice Vintage", "ex_dt1_15_office_01c"},
            {"Executive Contrast", "ex_dt1_15_office_02a"},
            {"Executive Rich", "ex_dt1_15_office_02b"},
            {"Executive Cool", "ex_dt1_15_office_02c"},
            {"Power Broker Ice", "ex_dt1_15_office_03a"},
            {"Power Broker Conservative", "ex_dt1_15_office_03b"},
            {"Power Broker Polished", "ex_dt1_15_office_03c"}
        }
    },
    ["Apartments"] = {
        ["MP One"] = {
            {"Modern 1", "apa_v_mp_h_01_a"},
            {"Moody 1", "apa_v_mp_h_02_a"},
            {"Vibrant 1", "apa_v_mp_h_03_a"},
            {"Sharp 1", "apa_v_mp_h_04_a"},
            {"Monochrome 1", "apa_v_mp_h_05_a"},
            {"Seductive 1", "apa_v_mp_h_06_a"},
            {"Regal 1", "apa_v_mp_h_07_a"},
            {"Aqua 1", "apa_v_mp_h_08_a"}
        },
        ["MP Two"] = {
            {"Modern 2", "apa_v_mp_h_01_c"},
            {"Moody 2", "apa_v_mp_h_02_c"},
            {"Vibrant 2", "apa_v_mp_h_03_c"},
            {"Sharp 2", "apa_v_mp_h_04_c"},
            {"Monochrome 2", "apa_v_mp_h_05_c"},
            {"Seductive 2", "apa_v_mp_h_06_c"},
            {"Regal 2", "apa_v_mp_h_07_c"},
            {"Aqua 2", "apa_v_mp_h_08_c"}
        },
        ["MP Three"] = {
            {"Modern 3", "apa_v_mp_h_01_b"},
            {"Moody 3", "apa_v_mp_h_02_b"},
            {"Vibrant 3", "apa_v_mp_h_03_b"},
            {"Sharp 3", "apa_v_mp_h_04_b"},
            {"Monochrome 3", "apa_v_mp_h_05_b"},
            {"Seductive 3", "apa_v_mp_h_06_b"},
            {"Regal 3", "apa_v_mp_h_07_b"},
            {"Aqua 3", "apa_v_mp_h_08_b"}
        }
    }
}
local g = {
    ["XTRA"] = {
        {"Scuba Diving", -2185.7143554688, -406.33847045898, 13.60400390625},
        {"Pilot Job", -991.31866455078, -2957.7099609375, 14.4296875},
        {"Trucking (Illegal)", 149.49890136719, -3101.4987792969, 6.392333984375},
        {"Trucking (Legal)", 860.22857666016, -3182.3471679688, 6.51025390625},
        {"G4S Depot", -693.46813964844, 273.1516418457, 82.6376953125}
    },
    ["GTA Apartments"] = {
        {"Low End Apartment", 260.5322, -999.1339, -99.0087},
        {"Mid Range Apartment", 343.8500, -999.0800, -99.1977},
        {"3 Alta Street Apt 10", -262.46, -951.89, 75.83},
        {"3 Alta Street Apt 57", -280.74, -961.50, 91.11},
        {"Weazel Plaza Apt 26", -895.85, -433.90, 94.06},
        {"Weazel Plaza Apt 70", -909.054, -441.466, 120.205},
        {"Weazel Plaza Apt 101", -884.301, -454.515, 125.132},
        {"Richard Majestic Apt 4", -897.197, -369.246, 84.0779},
        {"Richard Majestic Apt 51", -932.29, -385.88, 108.03},
        {"Tinsel Towers Apt 29", -575.305, 42.3233, 92.2236},
        {"Tinsel Towers Apt 45", -617.609, 63.024, 106.624},
        {"Eclipse Towers Apt 5", -795.04, 342.37, 206.22},
        {"Eclipse Towers Apt 9", -759.79, 315.71, 175.40},
        {"Eclipse Towers Apt 31", -797.095, 335.069, 158.599},
        {"Eclipse Towers Apt 40", -752.605, 320.821, 221.855},
        {"4 Integrity Way Apt 28", -14.7964, -581.709, 79.4307},
        {"4 Integrity Way Apt 30", -37.41, -582.82, 88.71},
        {"4 Integrity Way Apt 35", -10.58, -581.26, 98.83},
        {"Del Perro Heights Apt 7", -10.58, -581.26, 98.83},
        {"Del Perro Heights Apt 20", -1474.17, -528.124, 68.1541},
        {"Del Perro Heights Apt 4", -1468.14, -541.815, 73.4442},
        {"Richard Majestic Apt 2", -915.811, -379.432, 113.675},
        {"Tinsel Towers Apt 42", -614.86, 40.6783, 97.6001},
        {"Eclipse Towers Apt 3", -773.407, 341.766, 211.397},
        {"3655 Wild Oats Drive", -172.983, 494.033, 137.654},
        {"2044 North Conker Avenue", 340.941, 437.18, 149.39},
        {"2045 North Conker Avenue", 340.941, 437.18, 149.39},
        {"2862 Hillcrest Avenue", -676.127, 588.612, 145.17},
        {"2868 Hillcrest Avenue", -763.107, 615.906, 144.14},
        {"2874 Hillcrest Avenue", -857.798, 682.563, 152.653},
        {"3677 Whispymound Drive", 120.5, 549.952, 184.097},
        {"2113 Mad Wayne Thunder", -1288.0, 440.748, 97.6946},
        {"Eclispe Towers MP 1", -788.28, 340.97, 216.84, "Customizable Apartment via Ipls"},
        {"Eclispe Towers MP 2", -786.73, 342.81, 187.11, "Customizable Apartment via Ipls"},
        {"Eclispe Towers MP 3", -773.425, 332.380, 196.086, "Customizable Apartment via Ipls"}
    }
}
local h = {
    {"Crash", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Crash_NPC", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Trail_1", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Trail_2", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Trail_3", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Trail_4", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Turn", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Turn_NPC", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Recharging_Loop", "DLC_AW_Machine_Gun_Ammo_Counter_Sounds", true},
    {"CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", true},
    {"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", true},
    {"hangar_doors_loop", "dlc_xm_facility_entry_exit_sounds", true},
    {"Recharging_Loop", "DLC_AW_Machine_Gun_Ammo_Counter_Sounds", true},
    {"Timer_10s", "GTAO_FM_Events_Soundset", false},
    {"10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", true},
    {"10s", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"1st_Place_Gain", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"1st_Place_Lose", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"321", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"3_2_1", "HUD_MINI_GAME_SOUNDSET", false},
    {"3_2_1", "HUD_MINI_GAME_SOUNDSET", true},
    {"3_2_1_NON_RACE", "HUD_MINI_GAME_SOUNDSET", true},
    {"5_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", true},
    {"5_Second_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false},
    {"5s", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"5S", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", false},
    {"Accept_Ghosting_Mode", "RESPAWN_ONLINE_SOUNDSET", false},
    {"Activate_Trap", "DLC_AW_Trap_Controller_Sounds", true},
    {"Airhorn", "DLC_BTL_RB_Remix_Sounds", false},
    {"Airhorn", "DLC_TG_Running_Back_Sounds", false},
    {"Apt_Style_Purchase", "DLC_APT_Apartment_SoundSet", false},
    {"ARM_3_CAR_GLASS_CRASH", 0, true},
    {"ARM_3_PISTOL_COCK", 0, true},
    {"ARM_WRESTLING_WHOOSH_MASTER", 0, true},
    {"Armour_Off", "DLC_GR_Steal_Miniguns_Sounds", true},
    {"Armour_On", "DLC_GR_Steal_Miniguns_Sounds", true},
    {"ASSASSINATIONS_HOTEL_TIMER_COUNTDOWN", "ASSASSINATION_MULTI", true},
    {"ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"BACK", "DLC_EXEC_Warehouse_Upgrade_Bench_Sounds", true},
    {"BACK", "HUD_AMMO_SHOP_SOUNDSET", true},
    {"BACK", "HUD_FREEMODE_SOUNDSET", true},
    {"BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Back", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"BACK", "HUD_FRONTEND_MP_SOUNDSET", true},
    {"Banshee2_Upgrade", "JA16_Super_Mod_Garage_Sounds", true},
    {"Barge_Door", "dlc_h4_Prep_FC_Sounds", true},
    {"Barge_Door_Glass", "dlc_h4_Prep_FC_Sounds", true},
    {"Barge_Door_Metal", "dlc_h4_Prep_FC_Sounds", true},
    {"Barge_Door_Metal_Bars", "dlc_h4_Prep_FC_Sounds", true},
    {"BASE_JUMP_PASSED", "HUD_AWARDS", true},
    {"Beat_Pulse_Default", "GTAO_Dancing_Sounds", false},
    {"Become_Attacker", "DLC_BTL_TP_Remix_Juggernaut_Player_Sounds", false},
    {"Become_Attacker", "DLC_IE_JN_Player_Sounds", false},
    {"Become_Hunted", "dlc_xm_sls_Sounds", true},
    {"Become_JN", "DLC_BTL_TP_Remix_Juggernaut_Player_Sounds", false},
    {"Become_JN", "DLC_IE_JN_Player_Sounds", false},
    {"Become_Slasher", "dlc_xm_sls_Sounds", true},
    {"Become_Target", "dlc_xm_hata_Sounds", false},
    {"Bed", "WastedSounds", true},
    {"Beep_Green", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Blue_Target_Explode", "dlc_xm_silo_laser_hack_sounds", true},
    {"BOATS_PLANES_HELIS_BOOM", "MP_LOBBY_SOUNDS", true},
    {"Bomb_Collect", "DLC_SR_TR_Bomb_Player_Sounds", true},
    {"Bomb_Collected", "DLC_AW_PTB_Sounds", false},
    {"bomb_deployed", "DLC_SM_Bomb_Bay_Bombs_Sounds", true},
    {"Bomb_Disarmed", "GTAO_Speed_Convoy_Soundset", false},
    {"Bomb_Passed", "DLC_AW_PTB_Sounds", false},
    {"bombs_empty", "DLC_SM_Bomb_Bay_Bombs_Sounds", true},
    {"boot_pop", "dlc_vw_body_disposal_sounds", true},
    {"Boss_Message_Orange", "GTAO_Biker_FM_Soundset", false},
    {"Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", false},
    {"Bounds_Timer_Pulse", "DLC_SM_VEHWA_Player_Sounds", false},
    {"Bounds_Timer_Reset", "DLC_SM_VEHWA_Player_Sounds", false},
    {"BULL_SHARK_TESTOSTERONE_END_MASTER", "", false},
    {"BULL_SHARK_TESTOSTERONE_START_MASTER", "", false},
    {"Bunker_Hatch", "GTAO_Script_Doors_Faded_Screen_Sounds", true},
    {"Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS", false},
    {"Business_Restart", "DLC_Biker_Computer_Sounds", true},
    {"Business_Restart", "DLC_GR_Disruption_Logistics_Sounds", true},
    {"Business_Shutdown", "DLC_Biker_Computer_Sounds", true},
    {"Business_Shutdown", "DLC_GR_Disruption_Logistics_Sounds", true},
    {"BUTTON", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"CAM_PAN_DARTS", "HUD_MINI_GAME_SOUNDSET", true},
    {"Camera_Shoot", "Phone_Soundset_Franklin", true},
    {"CANCEL", "DLC_EXEC_Warehouse_Upgrade_Bench_Sounds", true},
    {"Cancel", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true},
    {"CANCEL", "HUD_FREEMODE_SOUNDSET", true},
    {"CANCEL", "HUD_FRONTEND_CLOTHESSHOP_SOUNDSET", true},
    {"CANCEL", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"CANCEL", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"CANCEL", "HUD_LIQUOR_STORE_SOUNDSET", true},
    {"cannon_active", "dlc_xm_orbital_cannon_sounds", true},
    {"CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", true},
    {"car_crushed", "dlc_vw_body_disposal_sounds", true},
    {"chaff_cooldown", "DLC_SM_Countermeasures_Sounds", true},
    {"chaff_empty", "DLC_SM_Countermeasures_Sounds", true},
    {"CHALLENGE_UNLOCKED", "HUD_AWARDS", true},
    {"Checkpoint", "DLC_AW_Frontend_Sounds", false},
    {"Checkpoint", "DLC_Stunt_Race_Frontend_Sounds", false},
    {"Checkpoint", "DLC_sum20_Open_Wheel_Racing_Sounds", false},
    {"CHECKPOINT_AHEAD", "HUD_MINI_GAME_SOUNDSET", false},
    {"Checkpoint_Beast_Hit", "FM_Events_Sasquatch_Sounds", false},
    {"CHECKPOINT_BEHIND", "HUD_MINI_GAME_SOUNDSET", false},
    {"Checkpoint_Buzz", "DLC_AW_Frontend_Sounds", false},
    {"Checkpoint_Cash_Hit", "GTAO_FM_Events_Soundset", false},
    {"Checkpoint_Finish", "DLC_AW_Frontend_Sounds", false},
    {"Checkpoint_Finish", "DLC_Stunt_Race_Frontend_Sounds", false},
    {"Checkpoint_Finish", "DLC_sum20_Open_Wheel_Racing_Sounds", false},
    {"Checkpoint_Hit", "GTAO_FM_Events_Soundset", false},
    {"Checkpoint_Lap", "DLC_AW_Frontend_Sounds", false},
    {"Checkpoint_Lap", "DLC_AW_Frontend_Sounds", true},
    {"Checkpoint_Lap", "DLC_Stunt_Race_Frontend_Sounds", false},
    {"Checkpoint_Lap", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"Checkpoint_Lap", "DLC_sum20_Open_Wheel_Racing_Sounds", false},
    {"CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", false},
    {"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", false},
    {"CHECKPOINT_NORMAL", "HUD_MINI_GAME_SOUNDSET", false},
    {"CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", false},
    {"Checkpoint_Teammate", "GTAO_Shepherd_Sounds", false},
    {"CHECKPOINT_UNDER_THE_BRIDGE", "HUD_MINI_GAME_SOUNDSET", false},
    {"Cheers", "DLC_TG_Running_Back_Sounds", false},
    {"Click", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Click_Back", "DLC_Biker_Computer_Sounds", true},
    {"Click_Back", "DLC_H3_Arcade_Laptop_Sounds", true},
    {"Click_Back", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", true},
    {"Click_Cancel", "DLC_Biker_Computer_Sounds", true},
    {"Click_Fail", "DLC_Biker_Computer_Sounds", true},
    {"Click_Fail", "DLC_GR_Disruption_Logistics_Sounds", true},
    {"Click_Fail", "DLC_H3_Arcade_Laptop_Sounds", true},
    {"Click_Fail", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"Click_Fail", "WEB_NAVIGATION_SOUNDS_PHONE", true},
    {"Click_Link", "DLC_GR_Disruption_Logistics_Sounds", true},
    {"Click_Link", "DLC_H3_Arcade_Laptop_Sounds", true},
    {"Click_Link", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"Click_Special", " WEB_NAVIGATION_SOUNDS_PHONE", true},
    {"Click_Special", "DLC_Biker_Computer_Sounds", true},
    {"Click_Special", "DLC_GR_Disruption_Logistics_Sounds", true},
    {"Click_Special", "DLC_H3_Arcade_Laptop_Sounds", true},
    {"Click_Special", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"Click_Special", "WEB_NAVIGATION_SOUNDS_PHONE", true},
    {"Close", "DLC_H3_Tracker_App_Sounds", true},
    {"Closed", "DLC_APT_YACHT_DOOR_SOUNDS", true},
    {"CLOSED", "DLC_APT_YACHT_DOOR_SOUNDS", true},
    {"CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"CLOSING", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"club_crowd_transition", "dlc_btl_club_open_transition_crowd_sounds", true},
    {"clue_complete_shard", "dlc_btl_fm_th_sounds", false},
    {"clue_complete_shard", "dlc_xm_fm_th_sounds", false},
    {"clue_seen", "dlc_ch_hidden_collectibles_sk_sounds", false},
    {"collect_chips_handed", "dlc_vw_tracking_chips_sounds", false},
    {"collect_part", "DLC_sum20_BB_Captured_Sounds", true},
    {"Collect_Pickup", "DLC_IE_PL_Player_Sounds", false},
    {"collect_water", "dlc_sum20_yacht_missions_ah_sounds", true},
    {"Condemned", "DLC_SM_CND_Player_Sounds", true},
    {"Confirm", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true},
    {"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"continue", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"CONTINUE", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Continue_Accepted", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Continue_Appears", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Countdown_1", "DLC_AW_Frontend_Sounds", true},
    {"Countdown_1", "DLC_SR_TR_General_Sounds", true},
    {"Countdown_2", "DLC_AW_Frontend_Sounds", true},
    {"Countdown_2", "DLC_SR_TR_General_Sounds", true},
    {"Countdown_3", "DLC_AW_Frontend_Sounds", true},
    {"Countdown_3", "DLC_SR_TR_General_Sounds", true},
    {"Countdown_GO", "DLC_AW_Frontend_Sounds", true},
    {"Countdown_GO", "DLC_SR_TR_General_Sounds", true},
    {"Countdown_Timer_Bleep", "DLC_AW_Arena_Spin_Wheel_Game_Frontend_Sounds", true},
    {"Countdown_Timer_Bleep_Red", "DLC_AW_Arena_Spin_Wheel_Game_Frontend_Sounds", true},
    {"Counter_Tick", "DLC_Biker_Burn_Assets_Sounds", false},
    {"Crash", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Crate_Destroy_Remote", "DLC_IE_Vip_Stockpile_Sounds", false},
    {"Crate_Pickup_Remote", "DLC_IE_Vip_Stockpile_Sounds", false},
    {"Crates_Blipped", "GTAO_Biker_Modes_Soundset", false},
    {"Crates_Blipped", "GTAO_Magnate_Boss_Modes_Soundset", false},
    {"Creator_Snap", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"Criminal_Damage_High_Value", "GTAO_FM_Events_Soundset", false},
    {"Criminal_Damage_Kill_Player", "GTAO_FM_Events_Soundset", false},
    {"Criminal_Damage_Low_Value", "GTAO_FM_Events_Soundset", false},
    {"Crush", "DLC_H4_Submarine_Crush_Depth_Sounds", true},
    {"CUTSCENE_DIALOGUE_OVERRIDE_SOUND_01", 0, false},
    {"CUTSCENE_DIALOGUE_OVERRIDE_SOUND_02", 0, false},
    {"Cycle_Item", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"DayBreak_Stinger", "DLC_Biker_LostAndDamned_Sounds", true},
    {"Degenatron_Logo", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Degenatron_Star", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"DELETE", "HUD_DEATHMATCH_SOUNDSET", true},
    {"Delete_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Deliver", "In_And_Out_Attacker_Sounds", false},
    {"Deliver_Item", "GTAO_Biker_Modes_Soundset", false},
    {"Deliver_Item", "GTAO_Biker_Modes_Soundset", true},
    {"Deliver_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true},
    {"DLC_VW_BET_MAX", "dlc_vw_table_games_frontend_sounds", true},
    {"DLC_VW_BET_UP", "dlc_vw_table_games_frontend_sounds", true},
    {"DLC_VW_CONTINUE", "dlc_vw_table_games_frontend_sounds", true},
    {"DLC_VW_ERROR_MAX", "dlc_vw_table_games_frontend_sounds", true},
    {"DLC_VW_RULES", "dlc_vw_table_games_frontend_sounds", true},
    {"DLC_VW_WIN_CHIPS", "dlc_vw_table_games_frontend_sounds", true},
    {"Door_Open", "DOCKS_HEIST_FINALE_2B_SOUNDS", true},
    {"Door_Open_Limit", "DLC_GR_Bunker_Door_Sounds", true},
    {"Door_Open_Limit", "DLC_SM_Hangar_Door_Sounds", true},
    {"Door_Open_Limit", "DLC_XM_Silo_Secret_Door_Sounds", true},
    {"download_complete", "DLC_BTL_Break_In_Sounds", true},
    {"download_start", "DLC_BTL_Break_In_Sounds", true},
    {"DPAD_WEAPON_SCROLL", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Drill_Pin_Break", "DLC_HEIST_FLEECA_SOUNDSET", true},
    {"Drop_Pickup", "DLC_IE_PL_Enemy_Sounds", false},
    {"Drop_Pickup", "DLC_IE_PL_Player_Sounds", false},
    {"Drop_Pickup", "DLC_IE_PL_Team_Sounds", false},
    {"Dropped", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true},
    {"Dropped", "In_And_Out_Attacker_Sounds", false},
    {"Dropped", "In_And_Out_Defender_Sounds", false},
    {"EDIT", "HUD_DEATHMATCH_SOUNDSET", true},
    {"emp_activate", "dlc_ch_heist_finale_sounds", true},
    {"EMP_vehicle_affected", "DLC_AW_EMP_Sounds", true},
    {"Empty_Fire_Fail", "DLC_AW_Machine_Gun_Ammo_Counter_Sounds", true},
    {"End_Squelch", "CB_RADIO_SFX", true},
    {"End_Zone_Flash", "DLC_BTL_RB_Remix_Sounds", true},
    {"Enemy_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true},
    {"Enemy_Deliver", "In_And_Out_Defender_Sounds", false},
    {"Enemy_Killed_1p", "dlc_xm_hata_Sounds", false},
    {"Enemy_Killed_3p", "dlc_xm_hata_Sounds", false},
    {"Enemy_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true},
    {"Enemy_Pick_Up", "In_And_Out_Defender_Sounds", false},
    {"Enter_1st", "GTAO_Biker_Modes_Soundset", false},
    {"Enter_1st", "GTAO_FM_Events_Soundset", false},
    {"Enter_1st", "GTAO_Magnate_Boss_Modes_Soundset", false},
    {"Enter_Area", "DLC_Lowrider_Relay_Race_Sounds", false},
    {"Enter_On_Foot", "GTAO_ImpExp_Enter_Exit_Garage_Sounds", true},
    {"Enter_Zone", "DLC_Biker_SYG_Sounds", true},
    {"ERROR", "DLC_Biker_Mission_Wall_Sounds", true},
    {"ERROR", "DLC_EXEC_Warehouse_Upgrade_Bench_Sounds", true},
    {"Error", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true},
    {"ERROR", "HUD_AMMO_SHOP_SOUNDSET", true},
    {"ERROR", "HUD_FREEMODE_SOUNDSET", true},
    {"ERROR", "HUD_FRONTEND_CLOTHESSHOP_SOUNDSET", true},
    {"ERROR", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"ERROR", "HUD_LIQUOR_STORE_SOUNDSET", true},
    {"Event_Message_Purple", "GTAO_FM_Events_Soundset", false},
    {"Event_Start_Text", "GTAO_FM_Events_Soundset", false},
    {"EXILE_3_TRAIN_BRAKE_PULL_MASTER", 0, true},
    {"EXILE_3_TRAIN_BRAKE_RELEASE_MASTER", 0, true},
    {"Exit", "DLC_Biker_Computer_Sounds", true},
    {"Exit", "DLC_GR_Disruption_Logistics_Sounds", true},
    {"Exit", "DLC_H3_Arcade_Laptop_Sounds", true},
    {"Exit", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"EXIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Faction3_Upgrade", "Low2_Super_Mod_Garage_Sounds", true},
    {"Fail", "dlc_xm_silo_laser_hack_sounds", true},
    {"Failure", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"FAKE_ARRIVE", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"Falling_Crates", "EXILE_1", true},
    {"FAMILY_1_CAR_BREAKDOWN", "FAMILY1_BOAT", true},
    {"FAMILY_1_CAR_BREAKDOWN_ADDITIONAL", "FAMILY1_BOAT", true},
    {"Faster_Bar_Full", "RESPAWN_ONLINE_SOUNDSET", true},
    {"Faster_Click", "RESPAWN_ONLINE_SOUNDSET", true},
    {"FestiveGift", "Feed_Message_Sounds", false},
    {"Finish_Default", "DLC_AW_Frontend_Sounds", true},
    {"Finish_Win", "DLC_AW_Frontend_Sounds", true},
    {"FIRST_PLACE", "HUD_MINI_GAME_SOUNDSET", true},
    {"Flag_Collected", "DLC_SM_STPI_Enemy_Sounds", true},
    {"Flag_Collected", "DLC_SM_STPI_Player_Sounds", true},
    {"Flag_Delivered", "DLC_SM_STPI_Enemy_Sounds", true},
    {"Flag_Delivered", "DLC_SM_STPI_Player_Sounds", true},
    {"Flag_Dropped", "DLC_SM_STPI_Enemy_Sounds", true},
    {"Flag_Dropped", "DLC_SM_STPI_Player_Sounds", true},
    {"flares_empty", "DLC_SM_Countermeasures_Sounds", true},
    {"Flight_Unlock", "DLC_XM17_IAA_Deluxos_Sounds", true},
    {"FLYING_STREAM_END_INSTANT", "FAMILY_5_SOUNDS", true},
    {"Focus", "DLC_AW_Trap_Controller_Sounds", true},
    {"FocusIn", "HintCamSounds", true},
    {"FocusOut", "HintCamSounds", true},
    {"formation_active", "formation_flying_blips_soundset", false},
    {"formation_inactive", "formation_flying_blips_soundset", false},
    {"Friend_Deliver", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true},
    {"Friend_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", false},
    {"Friend_Pick_Up", "HUD_FRONTEND_MP_COLLECTABLE_SOUNDS", true},
    {"Friend_Pick_Up", "In_And_Out_Attacker_Sounds", false},
    {"Frontend_Beast_Fade_Screen", "FM_Events_Sasquatch_Sounds", false},
    {"Frontend_Beast_Freeze_Screen", "FM_Events_Sasquatch_Sounds", false},
    {"Frontend_Beast_Text_Hit", "FM_Events_Sasquatch_Sounds", false},
    {"Frontend_Beast_Transform_Back", "FM_Events_Sasquatch_Sounds", false},
    {"gadget_pistol_shard", "dlc_hei4_hidden_collectibles_sounds", true},
    {"Gain_Point", "dlc_xm_aqo_sounds", false},
    {"Garage_Door_Close", "GTAO_Script_Doors_Faded_Screen_Sounds", true},
    {"Garage_Door_Open", "GTAO_Script_Doors_Faded_Screen_Sounds", true},
    {"Generic_Door_Closed", "GTAO_Script_Doors_Sounds", true},
    {"Generic_Negative_Event", "GTAO_Biker_Modes_Soundset", true},
    {"Generic_Positive_Event", "GTAO_Biker_Modes_Soundset", true},
    {"Go", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"GO", "HUD_MINI_GAME_SOUNDSET", false},
    {"GO", "HUD_MINI_GAME_SOUNDSET", true},
    {"GO_NON_RACE", "HUD_MINI_GAME_SOUNDSET", true},
    {"Go_To_Target", "DLC_AW_Trap_Controller_Sounds", true},
    {"Goal", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Goal_Reached", "dlc_xm_aqo_sounds", false},
    {"Goggles_Update", "DLC_XM17_Silo_Pred_Sounds", true},
    {"GOLF_NEW_RECORD", "HUD_AWARDS", true},
    {"Goon_Paid_Small", "GTAO_Boss_Goons_FM_Soundset", false},
    {"Gun_Collect", "DLC_SR_TR_Gun_Player_Sounds", true},
    {"Hack_Complete", "DLC_IE_SVM_Voltic2_Hacking_Sounds", true},
    {"Hack_Complete", "dlc_xm_deluxos_hacking_Hacking_Sounds", true},
    {"Hack_Fail", "DLC_sum20_Business_Battle_AC_Sounds", true},
    {"Hack_Failed", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", false},
    {"Hack_Start", "DLC_IE_SVM_Voltic2_Hacking_Sounds", true},
    {"Hack_Start", "dlc_xm_deluxos_hacking_Hacking_Sounds", true},
    {"Hack_Stop", "DLC_IE_SVM_Voltic2_Hacking_Sounds", true},
    {"Hack_Stop", "dlc_xm_deluxos_hacking_Hacking_Sounds", true},
    {"Hack_Success", "DLC_GR_Steal_Railguns_Sounds", true},
    {"Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Hack_Success", "DLC_sum20_Business_Battle_AC_Sounds", true},
    {"HACKING_CLICK", 0, true},
    {"HACKING_CLICK_BAD", 0, true},
    {"HACKING_CLICK_GOOD", 0, true},
    {"HACKING_FAILURE", 0, true},
    {"HACKING_MOVE_CURSOR", 0, true},
    {"HACKING_SUCCESS", 0, true},
    {"Hang_Up", "Phone_SoundSet_Michael", true},
    {"hangar_doors_close", "dlc_xm_facility_entry_exit_sounds", true},
    {"hangar_doors_limit", "dlc_xm_facility_entry_exit_sounds", true},
    {"hangar_doors_open", "dlc_xm_facility_entry_exit_sounds", true},
    {"health_lost", "DLC_sum20_Open_Wheel_Racing_Sounds", true},
    {"Highlight_Accept", "DLC_AW_Arena_Office_Planning_Wall_Sounds", true},
    {"Highlight_Accept", "DLC_Biker_Mission_Wall_Sounds", true},
    {"Highlight_Accept", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Highlight_Back", "DLC_AW_Arena_Office_Planning_Wall_Sounds", true},
    {"Highlight_Back", "DLC_Biker_Mission_Wall_Sounds", true},
    {"Highlight_Cancel", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Highlight_Error", "DLC_Biker_Mission_Wall_Sounds", true},
    {"Highlight_Error", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Highlight_Move", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Highlight_Move_Left_Right", "DLC_Biker_Mission_Wall_Sounds", true},
    {"Highlight_Move_Up_Down", "DLC_AW_Arena_Office_Planning_Wall_Sounds", true},
    {"Highlight_Move_Up_Down", "DLC_Biker_Mission_Wall_Sounds", true},
    {"Hit", "RESPAWN_ONLINE_SOUNDSET", true},
    {"Hit", "RESPAWN_SOUNDSET", false},
    {"Hit", "RESPAWN_SOUNDSET", true},
    {"Hit_1", "LONG_PLAYER_SWITCH_SOUNDS", false},
    {"Hit_1", "LONG_PLAYER_SWITCH_SOUNDS", true},
    {"Hit_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Hit_Mirror", "dlc_xm_silo_laser_hack_sounds", true},
    {"Hit_out", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Hit_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"HOORAY", "BARRY_02_SOUNDSET", true},
    {"HORDE_COOL_DOWN_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Hover_Unlock", "DLC_XM17_IAA_Deluxos_Sounds", true},
    {"HUD_FREEMODE_CANCEL_MASTER", 0, true},
    {"Idcnput_Code_Enter_Correct_Final", "Safe_Minigame_Sounds", true},
    {"In_Range", "DLC_Biker_SL_Sounds", true},
    {"inactive_fire_fail", "dlc_xm_orbital_cannon_sounds", true},
    {"INFO", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Input_Code_Down", "Safe_Minigame_Sounds", true},
    {"Input_Code_Enter_Correct", "Safe_Minigame_Sounds", true},
    {"Input_Code_Enter_Wrong", "Safe_Minigame_Sounds", true},
    {"Input_Code_Up", "Safe_Minigame_Sounds", true},
    {"item_found", "dlc_btl_fm_th_sounds", false},
    {"item_found", "dlc_xm_fm_th_sounds", false},
    {"Kill_List_Counter", "GTAO_FM_Events_Soundset", false},
    {"killer_down", "dlc_ch_hidden_collectibles_sk_sounds", false},
    {"laser_pin_break", "dlc_ch_heist_finale_laser_drill_sounds", true},
    {"Launch", "DLC_H3_Tracker_App_Sounds", true},
    {"LEADER_BOARD", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Leave_Zone", "DLC_Biker_SYG_Sounds", true},
    {"Lester_Laugh_Phone", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"lights_on", "dlc_xm_stealavg_sounds", true},
    {"LIMIT", "DLC_APT_YACHT_DOOR_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_GENERIC_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_WOOD_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_ROOF_METAL_SOUNDS", true},
    {"Load_Scene", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"LOCAL_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false},
    {"LOCAL_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false},
    {"Log_In", "DLC_GR_MOC_Computer_Sounds", true},
    {"Login", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true},
    {"Logout", "DLC_GR_MOC_Computer_Sounds", true},
    {"Logout", "GTAO_Exec_SecuroServ_Computer_Sounds", true},
    {"LOOSE_MATCH", "HUD_MINI_GAME_SOUNDSET", true},
    {"Lose_1st", "GTAO_Biker_Modes_Soundset", false},
    {"Lose_1st", "GTAO_FM_Events_Soundset", false},
    {"Lose_1st", "GTAO_Magnate_Boss_Modes_Soundset", false},
    {"Lose_First", "DLC_Biker_SL_Sounds", true},
    {"Lose_Powerup", "DLC_IE_VV_General_Sounds", true},
    {"LOSER", "CELEBRATION_SOUNDSET", true},
    {"LOSER", "HUD_AWARDS", true},
    {"Losing_Team_Shard", "DLC_Exec_TP_SoundSet", false},
    {"Lowrider_Upgrade", "Lowrider_Super_Mod_Garage_Sounds", true},
    {"Map_Roll_Down", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Map_Roll_Up", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Match_End", "DLC_Low2_Ibi_Sounds", false},
    {"Match_Start", "DLC_Low2_Ibi_Sounds", false},
    {"MEDAL_UP", "HUD_MINI_GAME_SOUNDSET", true},
    {"Menu_Accept", "Phone_SoundSet_Default", true},
    {"menu_back", "dlc_xm_orbital_cannon_sounds", true},
    {"menu_reset", "dlc_xm_orbital_cannon_sounds", true},
    {"menu_select", "dlc_xm_orbital_cannon_sounds", true},
    {"menu_up_down", "dlc_xm_orbital_cannon_sounds", true},
    {"MICHAEL_LONG_SCREAM", "FAMILY_5_SOUNDS", true},
    {"Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false},
    {"Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true},
    {"Mouse_Click", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true},
    {"movie_prop", "DLC_SUM20_HIDDEN_COLLECTIBLES", false},
    {"movie_prop_reward_cut_roar", "DLC_sum20_hidden_collectible_sounds", true},
    {"MP_5_SECOND_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"MP_AWARD", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"MP_AWARD", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"MP_Flash", "WastedSounds", true},
    {"MP_IDLE_KICK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"MP_IDLE_TIMER", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"MP_Impact", "WastedSounds", true},
    {"MP_RANK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"MP_WAVE_COMPLETE", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Music_Game_Over", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Music_Win", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"NAV", "HUD_AMMO_SHOP_SOUNDSET", true},
    {"Nav_Arrow_Ahead", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true},
    {"Nav_Arrow_Behind", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true},
    {"Nav_Arrow_Left", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true},
    {"Nav_Arrow_Right", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true},
    {"NAV_LEFT_RIGHT", "HUD_FREEMODE_SOUNDSET", true},
    {"NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"NAV_LEFT_RIGHT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"NAV_UP_DOWN", "DLC_EXEC_Warehouse_Upgrade_Bench_Sounds", true},
    {"NAV_UP_DOWN", "HUD_FREEMODE_SOUNDSET", true},
    {"NAV_UP_DOWN", "HUD_FRONTEND_CLOTHESSHOP_SOUNDSET", true},
    {"NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"NAV_UP_DOWN", "HUD_LIQUOR_STORE_SOUNDSET", true},
    {"Navigate", "GTAO_Exec_SecuroServ_Computer_Sounds", true},
    {"Near_Miss_Counter_Reset", "GTAO_FM_Events_Soundset", false},
    {"NET_RACE_START_EVENT_MASTER", 0, true},
    {"Next_Level_Explosive", "DLC_Biker_KQ_Sounds", true},
    {"Next_Level_Generic", "DLC_Biker_KQ_Sounds", true},
    {"Next_Level_Gun", "DLC_Biker_KQ_Sounds", true},
    {"Next_Level_Melee", "DLC_Biker_KQ_Sounds", true},
    {"Next_Trap", "DLC_AW_Trap_Controller_Sounds", true},
    {"NightFall_Stinger", "DLC_Biker_LostAndDamned_Sounds", true},
    {"NO", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"No_Longer_Target", "dlc_xm_hata_Sounds", false},
    {"Node_Release", "dlc_xm_silo_laser_hack_sounds", true},
    {"Node_Select", "dlc_xm_silo_laser_hack_sounds", true},
    {"Object_Collect_Player", "GTAO_FM_Events_Soundset", false},
    {"Object_Collect_Remote", "GTAO_FM_Events_Soundset", false},
    {"Object_Dropped_Remote", "GTAO_FM_Events_Soundset", false},
    {"Off_High", "MP_RADIO_SFX", true},
    {"Off_Low", "MP_RADIO_SFX", true},
    {"OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"On_Call_Player_Join", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true},
    {"Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"OOB_Cancel", "GTAO_FM_Events_Soundset", false},
    {"OOB_Start", "GTAO_FM_Events_Soundset", false},
    {"OPENED", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"OPENING", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"Orientation_Fail", "DLC_Air_Race_Sounds_Player", false},
    {"Orientation_Fail", "DLC_Air_Race_Sounds_Player", false},
    {"Orientation_Success", "DLC_Air_Race_Sounds_Player", false},
    {"Orientation_Success", "DLC_Air_Race_Sounds_Player", false},
    {"Out_Of_Ammo", "DLC_AW_Machine_Gun_Ammo_Counter_Sounds", true},
    {"Out_Of_Area", "DLC_Lowrider_Relay_Race_Sounds", false},
    {"Out_Of_Range", "DLC_Biker_SL_Sounds", true},
    {"package_delivered_success", "DLC_GR_Generic_Mission_Sounds", true},
    {"package_delivered_success_remote", "DLC_GR_Generic_Mission_Sounds", true},
    {"Paper_Shuffle", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Paper_Stick", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Parcel_Vehicle_Lost", "GTAO_FM_Events_Soundset", false},
    {"Pass", "dlc_xm_silo_laser_hack_sounds", true},
    {"Payment_Non_Player", "DLC_HEISTS_GENERIC_SOUNDS", false},
    {"Payment_Player", "DLC_HEISTS_GENERIC_SOUNDS", false},
    {"Pen_Tick", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Period_Start", "DLC_AW_BB_Sounds", true},
    {"Phone_Text_Arrive", "DLC_H4_MM_Sounds", true},
    {"PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Pickup_Keyring", "dlc_h4_heist_finale_sounds_soundset", true},
    {"Pickup_Standard", "GTAO_Biker_Modes_Soundset", false},
    {"Pilot_Perspective_Fire", "DLC_H3_Drone_Tranq_Weapon_Sounds", true},
    {"Pin_Bad", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"PIN_BUTTON", "ATM_SOUNDS", true},
    {"Pin_Centred", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Pin_Good", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Place_Gain", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"Place_Lose", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Place_Prop_Success", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Player_Collect", "DLC_PILOT_MP_HUD_SOUNDS", false},
    {"Player_Enter_Line", "GTAO_FM_Cross_The_Line_Soundset", false},
    {"Player_Exit_Line", "GTAO_FM_Cross_The_Line_Soundset", false},
    {"Player_Pick_Up", "In_And_Out_Attacker_Sounds", false},
    {"playing_card", "dlc_vw_hidden_collectible_sounds", false},
    {"police_notification", "DLC_AS_VNT_Sounds", true},
    {"Popup_Cancel", "GTAO_Exec_SecuroServ_Computer_Sounds", true},
    {"Popup_Confirm_Fail", "GTAO_Exec_SecuroServ_Computer_Sounds", true},
    {"Popup_Confirm_Success", "GTAO_Exec_SecuroServ_Computer_Sounds", true},
    {"Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"power_on", "dlc_ch_heist_finale_sounds", false},
    {"Pre_Screen_Stinger", "DLC_HEISTS_FAILED_SCREEN_SOUNDS", false},
    {"Pre_Screen_Stinger", "DLC_HEISTS_FINALE_SCREEN_SOUNDS", false},
    {"Pre_Screen_Stinger", "DLC_HEISTS_FINALE_SCREEN_SOUNDS", true},
    {"Pre_Screen_Stinger", "DLC_HEISTS_PREP_SCREEN_SOUNDS", false},
    {"Pre_Screen_Stinger", "DLC_HEISTS_PREP_SCREEN_SOUNDS", true},
    {"Previous_Trap", "DLC_AW_Trap_Controller_Sounds", true},
    {"PROPERTY_PURCHASE", "HUD_AWARDS", true},
    {"PURCHASE", "HUD_LIQUOR_STORE_SOUNDSET", true},
    {"Purchase_Upgrade", "DLC_EXEC_Warehouse_Upgrade_Bench_Sounds", true},
    {"PUSH", "DLC_APT_YACHT_DOOR_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_GENERIC_SOUNDS", true},
    {"Push", "GTAO_APT_DOOR_DOWNSTAIRS_GENERIC_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_WOOD_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_ROOF_METAL_SOUNDS", true},
    {"Put_Away", "Phone_SoundSet_Michael", true},
    {"R2_Boost", "DLC_Biker_SL_Sounds", true},
    {"RACE_PLACED", "HUD_AWARDS", true},
    {"Radar_Beast_Blip", "FM_Events_Sasquatch_Sounds", false},
    {"RANK_UP", "HUD_AWARDS", true},
    {"Rappel_Land", "GTAO_Rappel_Sounds", true},
    {"Rappel_Stop", "GTAO_Rappel_Sounds", true},
    {"rc_mines_empty", "DLC_AW_RCBandito_Mine_Sounds", true},
    {"Ready", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Recharged", "DLC_AW_Machine_Gun_Ammo_Counter_Sounds", true},
    {"Red_Target_Explode", "dlc_xm_silo_laser_hack_sounds", true},
    {"REMOTE_PLYR_CASH_COUNTER_COMPLETE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false},
    {"REMOTE_PLYR_CASH_COUNTER_INCREASE", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", false},
    {"Remote_Sniper_Rifle_Fire", 0, true},
    {"Remove_Tracker", "DLC_IO_Warehouse_Mod_Garage_Sounds", true},
    {"Reset_Prop_Position", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Reset_Win", "DLC_SR_RS_Enemy_Sounds", true},
    {"Reset_Win", "DLC_SR_RS_Team_Sounds", true},
    {"Resurrected", "DLC_SR_RS_Enemy_Sounds", true},
    {"Resurrected", "DLC_SR_RS_Player_Sounds", true},
    {"Resurrected", "DLC_SR_RS_Team_Sounds", true},
    {"Retune_High", "MP_RADIO_SFX", true},
    {"Retune_Low", "MP_RADIO_SFX", true},
    {"ROBBERY_MONEY_TOTAL", "HUD_FRONTEND_CUSTOM_SOUNDSET", true},
    {"Rocket_Collect", "DLC_SR_TR_Rocket_Player_Sounds", true},
    {"Round_End", "DLC_BTL_SM_Remix_Soundset", false},
    {"Round_End", "DLC_LOW2_Sumo_Soundset", false},
    {"ROUND_ENDING_STINGER_CUSTOM", "CELEBRATION_SOUNDSET", false},
    {"Round_Start", "DLC_BTL_SM_Remix_Soundset", false},
    {"Round_Start", "DLC_LOW2_Sumo_Soundset", false},
    {"Round_Start_Blade", "POWER_PLAY_General_Soundset", true},
    {"Save_Scene", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Scope_Spot_POI", "GTAO_Heists_HUD_Sounds", false},
    {"Score", "DLC_Low2_Ibi_Sounds", false},
    {"Score_Down", "DLC_IE_PL_Enemy_Sounds", false},
    {"Score_Down", "DLC_IE_PL_Player_Sounds", false},
    {"Score_Down", "DLC_IE_PL_Team_Sounds", false},
    {"Score_Opponent", "DLC_Biker_KQ_Sounds", true},
    {"Score_Team", "DLC_Biker_KQ_Sounds", true},
    {"Score_Up", "DLC_IE_PL_Enemy_Sounds", false},
    {"Score_Up", "DLC_IE_PL_Player_Sounds", false},
    {"Score_Up", "DLC_IE_PL_Team_Sounds", false},
    {"SCREEN_FLASH", "CELEBRATION_SOUNDSET", true},
    {"ScreenFlash", "MissionFailedSounds", true},
    {"ScreenFlash", "WastedSounds", true},
    {"SELECT", "DLC_EXEC_Warehouse_Upgrade_Bench_Sounds", true},
    {"SELECT", "HUD_FREEMODE_SOUNDSET", true},
    {"SELECT", "HUD_FRONTEND_CLOTHESSHOP_SOUNDSET", true},
    {"SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"SELECT", "HUD_FRONTEND_MP_SOUNDSET", false},
    {"SELECT", "HUD_FRONTEND_MP_SOUNDSET", true},
    {"SELECT", "HUD_LIQUOR_STORE_SOUNDSET", true},
    {"Select_Mission_Are_You_Sure", "DLC_GR_MOC_Computer_Sounds", true},
    {"Select_Mission_Cancel", "DLC_GR_MOC_Computer_Sounds", true},
    {"Select_Mission_Launch", "DLC_GR_MOC_Computer_Sounds", true},
    {"Select_Mission_Unavailable", "DLC_GR_MOC_Computer_Sounds", true},
    {"Select_Mission_Unavailable_OK", "DLC_GR_MOC_Computer_Sounds", true},
    {"Select_Placed_Prop", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Sell", "GTAO_Exec_SecuroServ_Computer_Sounds", true},
    {"Sell", "GTAO_Exec_SecuroServ_Warehouse_PC_Sounds", true},
    {"shard", "dlc_ch_hidden_collectibles_sj_sounds", false},
    {"shard", "dlc_vw_hidden_collectible_sounds", false},
    {"Shard_Disappear", "GTAO_Biker_FM_Shard_Sounds", false},
    {"Shard_Disappear", "GTAO_Boss_Goons_FM_Shard_Sounds", false},
    {"Shard_Disappear", "GTAO_FM_Events_Soundset", false},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Short_Transition_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"shotgun_shard", "dlc_hei4_hidden_collectibles_sounds", true},
    {"Show_Overview_Menu", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"Show_Sell_Menu", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"Show_Source_Menu", "GTAO_SMG_Hangar_Computer_Sounds", true},
    {"Speech_Floor_1", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Speech_Floor_2", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Speech_Floor_3", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Start", "DLC_AW_Frontend_Sounds", false},
    {"Start", "DLC_AW_Frontend_Sounds", true},
    {"Start", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Start_Squelch", "CB_RADIO_SFX", true},
    {"Steal_Powerup", "DLC_IE_VV_General_Sounds", true},
    {"Success", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"SultanRS_Upgrade", "JA16_Super_Mod_Garage_Sounds", true},
    {"Super_Mod_Garage_Upgrade_Car_Default", 0, true},
    {"supermod_consumer", "Arena_Vehicle_Mod_Shop_Sounds", true},
    {"supermod_scifi", "Arena_Vehicle_Mod_Shop_Sounds", true},
    {"supermod_wasteland", "Arena_Vehicle_Mod_Shop_Sounds", true},
    {"Survival_Failed", "DLC_VW_AS_Sounds", true},
    {"Swap_Sides", "DLC_HALLOWEEN_FVJ_Sounds", false},
    {"SWING_SHUT", "GTAO_APT_DOOR_DOWNSTAIRS_GENERIC_SOUNDS", true},
    {"SWING_SHUT", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"SWING_SHUT", "GTAO_APT_DOOR_DOWNSTAIRS_WOOD_SOUNDS", true},
    {"SWING_SHUT", "GTAO_APT_DOOR_ROOF_METAL_SOUNDS", true},
    {"tag_entity", "dlc_xm_heists_iaa_morgue_sounds", false},
    {"Take_First", "DLC_Biker_SL_Sounds", true},
    {"Target_Counter_Tick", "DLC_SM_Generic_Mission_Sounds", true},
    {"Team_Killed_1p", "dlc_xm_hata_Sounds", false},
    {"Team_Killed_3p", "dlc_xm_hata_Sounds", false},
    {"Teammate_Checkpoint", "DLC_Biker_SL_Sounds", true},
    {"TENNIS_POINT_WON", "HUD_AWARDS", true},
    {"TextHit", "WastedSounds", true},
    {"Thermal_Off", "CAR_STEAL_2_SOUNDSET", true},
    {"Thermal_On", "CAR_STEAL_2_SOUNDSET", true},
    {"TIME_LAPSE_MASTER", 0, true},
    {"TIMER_RADIAL_Pulse", "DLC_AS_TRP_Sounds", false},
    {"TIMER_RADIAL_Pulse", "DLC_BTL_SM_Remix_Soundset", false},
    {"TIMER_RADIAL_Reset", "DLC_AS_TRP_Sounds", false},
    {"TIMER_RADIAL_Reset", "DLC_BTL_SM_Remix_Soundset", false},
    {"TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", true},
    {"TOGGLE_ON", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"TOGGLE_ON", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Traffic_Control_Fail", "BIG_SCORE_3A_SOUNDS", true},
    {"Traffic_Control_Fail_Blank", "BIG_SCORE_3A_SOUNDS", true},
    {"Traffic_Control_Light_Switch_Back", "BIG_SCORE_3A_SOUNDS", true},
    {"TRAFFIC_CONTROL_MOVE_CROSSHAIR", "BIG_SCORE_3A_SOUNDS", true},
    {"Transform_Local_Player", "DLC_Exec_TP_SoundSet", false},
    {"Transform_Loser_Local_Player", "DLC_Exec_TP_SoundSet", false},
    {"transform_oneshot", "dlc_xm_stromberg_sounds", true},
    {"Turn", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"tyre_health_warning", "DLC_sum20_Open_Wheel_Racing_Sounds", true},
    {"Uncondemned", "DLC_SM_CND_Player_Sounds", true},
    {"UNDER_THE_BRIDGE", "HUD_AWARDS", true},
    {"Use_Boost", "DLC_Biker_DL_Sounds", true},
    {"Use_Bunnyhop", "DLC_Biker_DL_Sounds", true},
    {"Use_Zoned", "DLC_Biker_DL_Sounds", true},
    {"Wasted", "DLC_IE_VV_General_Sounds", true},
    {"Wasted", "POWER_PLAY_General_Soundset", true},
    {"WAYPOINT_SET", "HUD_FRONTEND_DEFAULT_SOUNDSET", false},
    {"Weapon_Disabled", "DLC_SR_LG_Player_Sounds", true},
    {"Weapon_Enabled", "DLC_SR_LG_Player_Sounds", true},
    {"WEAPON_PURCHASE", "HUD_AMMO_SHOP_SOUNDSET", true},
    {"WEAPON_SELECT_ARMOR", "HUD_AMMO_SHOP_SOUNDSET", true},
    {"Weapon_Upgrade", "DLC_GR_Weapon_Upgrade_Soundset", true},
    {"Wheel_Spin_Start", "DLC_AW_Arena_Spin_Wheel_Game_Frontend_Sounds", true},
    {"Whistle", "DLC_TG_Running_Back_Sounds", false},
    {"Whoosh_1s_L_to_R", "MP_LOBBY_SOUNDS", true},
    {"Whoosh_1s_R_to_L", "MP_LOBBY_SOUNDS", true},
    {"WIN", "HUD_AWARDS", true},
    {"WINNER", "CELEBRATION_SOUNDSET", true},
    {"Winning_Team_Shard", "DLC_Exec_TP_SoundSet", false},
    {"WOODEN_DOOR_CLOSED_AT", 0, false},
    {"WOODEN_DOOR_CLOSED_AT", 0, true},
    {"WOODEN_DOOR_CLOSING_AT", 0, false},
    {"WOODEN_DOOR_CLOSING_AT", 0, true},
    {"WOODEN_DOOR_OPEN_HANDLE_AT", 0, false},
    {"WOODEN_DOOR_OPEN_HANDLE_AT", 0, true},
    {"WOODEN_DOOR_OPEN_NO_HANDLE_AT", 0, true},
    {"YES", "HUD_FRONTEND_DEFAULT_SOUNDSET", true},
    {"Zone_Captured", "dlc_vw_koth_Sounds", false},
    {"Zone_Captured_Remote", "dlc_vw_koth_Sounds", false},
    {"Zone_Contested", "dlc_vw_koth_Sounds", false},
    {"Zone_Contested", "dlc_vw_koth_Sounds", false},
    {"Zone_Enemy_Capture", "dlc_vw_koth_Sounds", false},
    {"Zone_Enter", "dlc_vw_koth_Sounds", false},
    {"Zone_Held", "dlc_vw_koth_Sounds", false},
    {"Zone_Lost", "dlc_vw_koth_Sounds", false},
    {"Zoom_In", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Zoom_Left", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Zoom_Right", "DLC_HEIST_PLANNING_BOARD_SOUNDS", true},
    {"Off", "GTAO_Vision_Modes_SoundSet", false},
    {"Off", "GTAO_Vision_Modes_SoundSet", true},
    {"On", "GTAO_Vision_Modes_SoundSet", false},
    {"On", "GTAO_Vision_Modes_SoundSet", true},
    {"Switch", "GTAO_Vision_Modes_SoundSet", false},
    {"Switch", "GTAO_Vision_Modes_SoundSet", true},
    {"hangar_doors_loop", "dlc_xm_facility_entry_exit_sounds", true},
    {"elevator_descend_loop", "dlc_xm_facility_entry_exit_sounds", true},
    {"launch_power_up_loop", "dlc_xm_silo_finale_sounds", true},
    {"10S", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Crates_Blipped", "GTAO_Biker_Modes_Soundset", false},
    {"Enemy_In_Zone", "DLC_Biker_SYG_Sounds", true},
    {"Background", "MP_CCTV_SOUNDSET", false},
    {"Pan", "MP_CCTV_SOUNDSET", false},
    {"Zoom", "MP_CCTV_SOUNDSET", false},
    {"Change_Cam", "MP_CCTV_SOUNDSET", false},
    {"elevator_descend_loop", "dlc_xm_IAA_Finale_sounds", true},
    {"Elevation_Loop", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Move_Loop", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Rotate_Loop", "DLC_Dmod_Prop_Editor_Sounds", false},
    {"Boss_Message_Orange", "GTAO_Biker_FM_Soundset", false},
    {"Crates_Blipped", "GTAO_Biker_Modes_Soundset", false},
    {"Drone_View", "DLC_GR_WVM_APC_Sounds", true},
    {"CLOSING", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"OPENING", "MP_PROPERTIES_ELEVATOR_DOORS", true},
    {"laptop_download", "dlc_vw_heisters_sounds", true},
    {"HACKING_COUNTDOWN_IP_FIND", 0, true},
    {"HACKING_COUNTDOWN_CRACK_PASS", 0, true},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"HACKING_COUNTDOWN_IP_FIND", 0, true},
    {"HACKING_COUNTDOWN_CRACK_PASS", 0, true},
    {"1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Hit_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"HIT_OUT", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"TIME_LAPSE_MASTER", 0, true},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"HACKING_COUNTDOWN_IP_FIND", 0, true},
    {"HACKING_COUNTDOWN_CRACK_PASS", 0, true},
    {"OPENED", "DOOR_GARAGE", false},
    {"OPENING", "DOOR_GARAGE", false},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Rappel_Loop", "GTAO_Rappel_Sounds", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"DOOR_BUZZ", "MP_PLAYER_APARTMENT", true},
    {"Pan", "MP_CCTV_SOUNDSET", true},
    {"Zoom", "MP_CCTV_SOUNDSET", true},
    {"Background", "MP_CCTV_SOUNDSET", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"uw_ambience", 0, true},
    {"OOB_Timer_Dynamic", "GTAO_FM_Events_Soundset", false},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Signal_Loop", "DLC_H3_Tracker_App_Sounds", true},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"Fly_Loop", "dlc_xm_avngr_sounds", true},
    {"Hack_Loop", "dlc_xm_deluxos_hacking_Hacking_Sounds", true},
    {"Background_Hum", "DLC_XM_Vehicle_Interior_Security_Camera_Sounds", true},
    {"laptop_download_loop", "dlc_xm_heists_iaa_morgue_sounds", true},
    {"Out_of_Bounds", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Hack_Loop", "DLC_IE_SVM_Voltic2_Hacking_Sounds", true},
    {"Change_Station_Loud", "Radio_Soundset", true},
    {"OOB_Timer_Dynamic", "GTAO_FM_Events_Soundset", false},
    {"EMP", "DLC_HALLOWEEN_FVJ_Sounds", false},
    {"EMP_Blast", "DLC_HEISTS_BIOLAB_FINALE_SOUNDS", false},
    {"10S", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"5S", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Timer_10s", "DLC_TG_Dinner_Sounds", false},
    {"Timer_5s", "DLC_TG_Dinner_Sounds", false},
    {"Timer_To_Day", "DLC_Biker_LostAndDamned_Sounds", false},
    {"Timer_To_Night", "DLC_Biker_LostAndDamned_Sounds", false},
    {"Arming_Countdown", "GTAO_Speed_Convoy_Soundset", false},
    {"Slipstream_Follower", "DLC_Biker_SL_Sounds", false},
    {"SLIPSTREAM_MASTER", 0, false},
    {"Slipstream_Leader", "DLC_Biker_SL_Sounds", false},
    {"SLIPSTREAM_MASTER", 0, true},
    {"Get_Back_In_Vehicle", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"UW_Ambience", 0, true},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Altitude_Warning", "EXILE_1", true},
    {"Near_Miss_Counter", "GTAO_FM_Events_Soundset", false},
    {"FBI_04_HEAT_C4_DOORS", 0, true},
    {"Out_of_Bounds", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Camera_Hum", "BIG_SCORE_SETUP_SOUNDS", true},
    {"Camera_Zoom", "BIG_SCORE_SETUP_SOUNDS", true},
    {"10S", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"5S", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Carrying", "DLC_Low2_Ibi_Sounds", false},
    {"All", "SHORT_PLAYER_SWITCH_SOUND_SET", true},
    {"Heli_Crash", "FBI_HEIST_FINALE_CHOPPER", true},
    {"Found_Target", "POLICE_CHOPPER_CAM_SOUNDS", true},
    {"Lost_Target", "POLICE_CHOPPER_CAM_SOUNDS", true},
    {"Microphone", "POLICE_CHOPPER_CAM_SOUNDS", true},
    {"Carrying", "DLC_Low2_Ibi_Sounds", false},
    {"Out_of_Bounds", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Drone_View", "DLC_GR_WVM_APC_Sounds", true},
    {"OOB_Timer_Dynamic", "GTAO_FM_Events_Soundset", false},
    {"DOOR_BUZZ", "MP_PLAYER_APARTMENT", true},
    {"DOOR_Intercom_MASTER", 0, true},
    {"10s", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Pickup_Briefcase", "GTAO_Biker_Modes_Soundset", false},
    {"Pickup_Briefcase", "GTAO_Magnate_Boss_Modes_Soundset", false},
    {"PICKUP_WEAPON_BALL", "HUD_FRONTEND_WEAPONS_PICKUPS_SOUNDSET", true},
    {"Countdown_To_Win", "DLC_IE_PL_Player_Sounds", false},
    {"Countdown_To_Win", "DLC_IE_PL_Team_Sounds", false},
    {"laptop_download_loop", "dlc_xm_heists_iaa_morgue_sounds", true},
    {"Hack_Loop", "DLC_IE_SVM_Voltic2_Hacking_Sounds", true},
    {"Hack_Loop", "dlc_xm_deluxos_hacking_Hacking_Sounds", true},
    {"HACKING_COUNTDOWN_IP_FIND", 0, true},
    {"HACKING_COUNTDOWN_CRACK_PASS", 0, true},
    {"Last_Alive", "DLC_SR_RS_Player_Sounds", true},
    {"Condemned_Heartbeat", "DLC_SM_CND_Player_Sounds", true},
    {"Pin_Movement", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true},
    {"10s", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Elevator_Doors_Closing_Loop", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Elevator_Doors_Opening_Loop", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Garage_Door_Close_Loop", "GTAO_Script_Doors_Sounds", true},
    {"Garage_Door_Open_Loop", "GTAO_Script_Doors_Sounds", true},
    {"Speech_Going_Up", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Background_Loop", "CB_RADIO_SFX", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"Generic_Alarm_Electronic_01", 0, true},
    {"HACKING_COUNTDOWN_IP_FIND", 0, true},
    {"HACKING_COUNTDOWN_CRACK_PASS", 0, true},
    {"UW_Ambience", 0, true},
    {"UW_Rebreather", 0, true},
    {"FBI_05_RAID_BREATH", 0, true},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"FBI_02_SNATCH_AND_GRAB_AMB_HELI", 0, true},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Background", "MP_CCTV_SOUNDSET", false},
    {"Pan", "MP_CCTV_SOUNDSET", false},
    {"Zoom", "MP_CCTV_SOUNDSET", false},
    {"Change_Cam", "MP_CCTV_SOUNDSET", false},
    {"elevator_descend_loop", "dlc_xm_IAA_Finale_sounds", true},
    {"Out_of_Bounds", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Out_of_Bounds_Explode", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Hit_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Short_Transition_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"HACKING_COUNTDOWN_IP_FIND", 0, true},
    {"HACKING_COUNTDOWN_CRACK_PASS", 0, true},
    {"Altitude_Warning", "EXILE_1", true},
    {"Generic_Alarm_Fire_Electronic", 0, true},
    {"Background", "DLC_XM17_Facility_Strike_PC_Sounds", true},
    {"CHOP_CAM_A", 0, true},
    {"CHOP_CAM_B", 0, true},
    {"CHOP_CAM_C", 0, true},
    {"Pan", "MP_CCTV_SOUNDSET", true},
    {"HACKING_MOVE_CURSOR", 0, true},
    {"Zoom", "MP_CCTV_SOUNDSET", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"SAFE_DOOR_CLOSE", "SAFE_CRACK_SOUNDSET", true},
    {"SAFE_DOOR_OPEN", "SAFE_CRACK_SOUNDSET", true},
    {"TUMBLER_PIN_FALL", "SAFE_CRACK_SOUNDSET", true},
    {"TUMBLER_PIN_FALL_FINAL", "SAFE_CRACK_SOUNDSET", true},
    {"TUMBLER_RESET", "SAFE_CRACK_SOUNDSET", true},
    {"TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", true},
    {"Background", "MP_CCTV_SOUNDSET", true},
    {"Background", "MP_CCTV_SOUNDSET", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"elevator_ascend_loop", "dlc_xm_facility_entry_exit_sounds", true},
    {"hangar_doors_loop", "dlc_xm_facility_entry_exit_sounds", true},
    {"CHECKPOINT_UNDER_THE_BRIDGE", "HUD_MINI_GAME_SOUNDSET", true},
    {"COLLECTED", "HUD_AWARDS", true},
    {"Exit_In_Vehicle", "GTAO_ImpExp_Enter_Exit_Garage_Sounds", true},
    {"Garage_Door_Close", "GTAO_Script_Doors_Faded_Screen_Sounds", true},
    {"GARAGE_DOOR_SCRIPTED_CLOSE", 0, true},
    {"GARAGE_DOOR_SCRIPTED_OPEN", 0, true},
    {"PEYOTE_COMPLETED", "HUD_AWARDS", true},
    {"SIGN_DESTROYED", "HUD_AWARDS", true},
    {"Lose_1st", "GTAO_Magnate_Boss_Modes_Soundset", false},
    {"Goon_Paid_Large", "GTAO_Boss_Goons_FM_Soundset", false},
    {"Enter_1st", "GTAO_Magnate_Boss_Modes_Soundset", false},
    {"COP_HELI_CAM_ZOOM", 0, true},
    {"COP_HELI_CAM_TURN", 0, true},
    {"Remote_Enemy_Enter_Line", "GTAO_FM_Cross_The_Line_Soundset", false},
    {"Remote_Friendly_Enter_Line", "GTAO_FM_Cross_The_Line_Soundset", false},
    {"COP_HELI_CAM_ZOOM", 0, true},
    {"COP_HELI_CAM_TURN", 0, true},
    {"Background", "dlc_xm_silo_laser_hack_sounds", true},
    {"Cursor_Move", "dlc_xm_silo_laser_hack_sounds", true},
    {"Blue_Target_Charge", "dlc_xm_silo_laser_hack_sounds", true},
    {"Red_Target_Charge", "dlc_xm_silo_laser_hack_sounds", true},
    {"Rotate_Mirror", "dlc_xm_silo_laser_hack_sounds", true},
    {"VULKAN_LOCK_ON_AMBER", 0, true},
    {"VULKAN_LOCK_ON_RED", 0, true},
    {"Turret_Camera_Hum_Loop", "DLC_BTL_Terrobyte_Turret_Sounds", true},
    {"Background", "dlc_xm_silo_laser_hack_sounds", true},
    {"Cursor_Move", "dlc_xm_silo_laser_hack_sounds", true},
    {"Blue_Target_Charge", "dlc_xm_silo_laser_hack_sounds", true},
    {"Red_Target_Charge", "dlc_xm_silo_laser_hack_sounds", true},
    {"Rotate_Mirror", "dlc_xm_silo_laser_hack_sounds", true},
    {"Pan", "MP_CCTV_SOUNDSET", true},
    {"Zoom", "MP_CCTV_SOUNDSET", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"Background", "MP_CCTV_SOUNDSET", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_GENERIC_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_WOOD_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_ROOF_METAL_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_GENERIC_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_WOOD_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_ROOF_METAL_SOUNDS", true},
    {"WOODEN_DOOR_OPEN_NO_HANDLE_AT", 0, true},
    {"Altitude_Warning_Loop", "DLC_Exec_Fly_Low_Sounds", true},
    {"LIMIT", "DLC_APT_YACHT_DOOR_SOUNDS", true},
    {"LIMIT", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"PUSH", "DLC_APT_YACHT_DOOR_SOUNDS", true},
    {"PUSH", "GTAO_APT_DOOR_DOWNSTAIRS_GLASS_SOUNDS", true},
    {"WOODEN_DOOR_OPEN_NO_HANDLE_AT", 0, true},
    {"Scanner_Loop", "DLC_BTL_Target_Pursuit_Sounds", true},
    {"Delivery_Screen_Fade", "DLC_Exec1_Buy_Sell_Sounds", false},
    {"Delivery_Screen_Fade_On_Foot", "DLC_Exec1_Buy_Sell_Sounds", false},
    {"TRAFFIC_CONTROL_BG_NOISE", "BIG_SCORE_3A_SOUNDS", true},
    {"TRAFFIC_CONTROL_CHANGE_CAM", "BIG_SCORE_3A_SOUNDS", true},
    {"TRAFFIC_CONTROL_TOGGLE_LIGHT", "BIG_SCORE_3A_SOUNDS", true},
    {"DISTANT_DOG_BARK", "CAR_STEAL_2_SOUNDSET", true},
    {"Elevator_Start", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Elevator_Stop", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Elevator_Ascending_Loop", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Elevator_Descending_Loop", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Speech_Floor_1", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Speech_Floor_2", "DLC_IE_Garage_Elevator_Sounds", true},
    {"Speech_Floor_3", "DLC_IE_Garage_Elevator_Sounds", true},
    {"movie_prop_reward_cut_music", "DLC_sum20_hidden_collectible_sounds", true},
    {"VULKAN_LOCK_ON_AMBER", 0, true},
    {"VULKAN_LOCK_ON_RED", 0, true},
    {"Pan", "DLC_Arena_CCTV_SOUNDSET", true},
    {"Pan", "MP_CCTV_SOUNDSET", true},
    {"Blip_Pickup", "GTAO_Biker_Modes_Soundset", false},
    {"Enemy_Pickup_Briefcase", "GTAO_Biker_Modes_Soundset", false},
    {"pan_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Pickup_Briefcase", "GTAO_Biker_Modes_Soundset", false},
    {"Hit_In", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Camera_Move_Loop", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Hit_Out", "PLAYER_SWITCH_CUSTOM_SOUNDSET", true},
    {"Background", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"cannon_activating_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"cannon_charge_fire_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Change_Cam", "DLC_Arena_CCTV_SOUNDSET", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"Deliver_Item", "GTAO_Biker_Modes_Soundset", false},
    {"Background", "DLC_Arena_CCTV_SOUNDSET", true},
    {"Background", "MP_CCTV_SOUNDSET", true},
    {"background_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Change_Cam", "MP_CCTV_SOUNDSET", true},
    {"zoom_out_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"zoom_out_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Trail_Custom", "DLC_HEIST_HACKING_SNAKE_SOUNDS", true},
    {"Scanner_Loop", "DLC_BTL_Target_Pursuit_Sounds", true},
    {"pan_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"cannon_activating_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"background_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Background", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"zoom_out_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"zoom_out_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Creaking_Loop", "DLC_H4_Submarine_Crush_Depth_Sounds", true},
    {"Warning_Alarm_Loop", "DLC_H4_Submarine_Crush_Depth_Sounds", true},
    {"Knuckle_Crack_Hard_Cel", "MP_SNACKS_SOUNDSET", true},
    {"Knuckle_Crack_Slap_Cel", "MP_SNACKS_SOUNDSET", true},
    {"Slow_Clap_Cel", "MP_SNACKS_SOUNDSET", true},
    {"COP_HELI_CAM_ZOOM", 0, true},
    {"COP_HELI_CAM_TURN", 0, true},
    {"COP_HELI_CAM_BLEEP", 0, true},
    {"COP_HELI_CAM_BACKGROUND", 0, true},
    {"COP_HELI_CAM_SCAN_PED_LOOP", 0, true},
    {"COP_HELI_CAM_SCAN_PED_SUCCESS", 0, true},
    {"COP_HELI_CAM_SCAN_PED_FAILURE", 0, true},
    {"COP_HELI_CAM_BLEEP_TOO_FAR", 0, true},
    {"Cancel", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"cannon_charge_fire_loop", "dlc_xm_orbital_cannon_sounds", true},
    {"Insert_Coin", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Out_of_Bounds_Explode", "MP_MISSION_COUNTDOWN_SOUNDSET", false},
    {"Game_Over_Blink", "DLC_EXEC_ARC_MAC_SOUNDS", true},
    {"Nightvision_Loop", "GTAO_Vision_Modes_SoundSet", false},
    {"player_riding", "biker_formation_sounds", true},
    {"Thermal_Loop", "GTAO_Vision_Modes_SoundSet", false},
    {"Sink", "DLC_H4_Submarine_Sinking_Sounds", true},
    {"Return_To_Vehicle_Timer", "GTAO_FM_Events_Soundset", false},
    {"Slipstream", "DLC_Stunt_Race_Frontend_Sounds", true},
    {"Slipstream_Follower", "DLC_Biker_SL_Sounds", true},
    {"SLIPSTREAM_MASTER", 0, true},
    {"Slipstream_Leader", "DLC_Biker_SL_Sounds", true},
    {"Bomb_Countdown", "DLC_AW_PTB_Sounds", true},
    {"TIME_LAPSE_MASTER", 0, true}
}
local i = {
    "AC_DELIVERED",
    "AC_DONE",
    "AC_EN_ROUTE_CULT",
    "AC_END",
    "AC_LEFT_AREA",
    "AC_START",
    "AC_STOP",
    "AH1_BACK_IN_CAR",
    "AH1_FAIL",
    "AH1_HOLE_RESTART",
    "AH1_RESTART",
    "AH1_START",
    "AH1_STOP",
    "AH2A_EXIT_SITE",
    "AH2A_FIRST_FLOOR_RESTART",
    "AH2A_FLEE_SITE",
    "AH2A_MISSION_FAIL",
    "AH2A_MISSION_START",
    "AH3A_2ND_STAIRWELL",
    "AH3A_ABSEIL_DONE",
    "AH3A_ABSEIL_RT",
    "AH3A_ABSEILING",
    "AH3A_BLOW_BACK",
    "AH3A_C4_PLANTED",
    "AH3A_DETONATE",
    "AH3A_DOOR_OPEN",
    "AH3A_DOORS_EXPLODE",
    "AH3A_DOWN_ONE",
    "AH3A_ELEV_CS",
    "AH3A_EXIT",
    "AH3A_EXIT_LIFT",
    "AH3A_EXIT_TRUCK",
    "AH3A_FIB_DOCS_RT",
    "AH3A_FIRE_FLOOR_RT",
    "AH3A_FIRST_BOMB",
    "AH3A_FLOOR_CRACK",
    "AH3A_GET_DOCS",
    "AH3A_GET_TO_ELEV",
    "AH3A_HEAD_TO_LOO",
    "AH3A_INTO_FLAMES",
    "AH3A_LAST_BOMB",
    "AH3A_LEAVING",
    "AH3A_LIFT_CCTV",
    "AH3A_LIFT_LOOK",
    "AH3A_MOP_RETURNED",
    "AH3A_MOP_RT",
    "AH3A_MORE_MOPPING",
    "AH3A_RUBBLE_RT",
    "AH3A_SKYLIGHT",
    "AH3A_STAIRWELL",
    "AH3A_START",
    "AH3A_START_ESCAPE",
    "AH3A_STOP",
    "AH3A_TRUCK_ENTERED",
    "AH3B_AFTER_HELI_CS",
    "AH3B_ALARM",
    "AH3B_BURNTOUT_RT",
    "AH3B_BURNTOUT_TWO_RT",
    "AH3B_CHOPPER_APPEARS",
    "AH3B_CHOPPER_DEAD",
    "AH3B_COPS",
    "AH3B_DATA_FINISHED",
    "AH3B_DEAD",
    "AH3B_DOOR_52",
    "AH3B_DOWNLOADING_RT",
    "AH3B_ENEMIES_ARRIVE",
    "AH3B_ENEMY_DOWN",
    "AH3B_ENTERED_BURN",
    "AH3B_EVADE_COPS_RT",
    "AH3B_GET_TO_VAN_RT",
    "AH3B_HACK_RT",
    "AH3B_HACKED_PC",
    "AH3B_HALF_RAPPEL",
    "AH3B_HELI_CRASHED",
    "AH3B_HELI_CS",
    "AH3B_HELI_FALLS",
    "AH3B_HELI_HIT",
    "AH3B_HELI_LIFT_OFF",
    "AH3B_HELI_SHOOTS_HELI",
    "AH3B_INSIDE_BUILDING",
    "AH3B_JUMPED",
    "AH3B_LANDED",
    "AH3B_LOCKED_DOOR",
    "AH3B_LOST_COPS",
    "AH3B_LOST_COPS_VEH",
    "AH3B_NO_WANTED_ESCAPE_RT",
    "AH3B_ON_FLOOR",
    "AH3B_ON_GROUND",
    "AH3B_ON_PC",
    "AH3B_RAPPEL_CS",
    "AH3B_RAPPEL_RT",
    "AH3B_RAPPEL_STARTS",
    "AH3B_SKYDIVE_RT",
    "AH3B_STAIRWELL",
    "AH3B_STAIRWELL_RT",
    "AH3B_VAN_ENTERED",
    "AH3B_VAN_ENTERED_WANTED",
    "AH3B_VAN_READY",
    "AHP1_FAIL",
    "AHP1_START",
    "AHP1_STOP",
    "APT_COUNTDOWN_30S",
    "APT_COUNTDOWN_30S_KILL",
    "APT_FADE_IN_RADIO",
    "APT_PRE_COUNTDOWN_STOP",
    "APT_SUDDEN_DEATH_MUSIC_END",
    "APT_SUDDEN_DEATH_MUSIC_KILL",
    "APT_SUDDEN_DEATH_START_MUSIC",
    "APT_YA_ACTION",
    "APT_YA_ATTACK",
    "APT_YA_DEFENDING",
    "APT_YA_START_ATTACK",
    "APT_YA_START_DEFEND",
    "APT_YA_STOP",
    "APT_YA_STOP_LEAVE",
    "ARM1_RADIO_OFF",
    "ARM1_RADIO_ON",
    "ARM2_MISSION_FAIL",
    "ARM3_CALL",
    "ARM3_CAR",
    "ARM3_CS",
    "ARM3_FAIL",
    "ARM3_GARAGE_STOP",
    "ARM3_HIT",
    "ARM3_HIT_STOP",
    "ARM3_MIC",
    "ARM3_RESTART_1",
    "ARM3_RESTART_2",
    "ARM3_RESTART_3",
    "ARM3_RESTART_4",
    "ARM3_RESTART_5",
    "ARM3_RESTART_6",
    "ARM3_RESTART_7",
    "ARM3_RESTART_8",
    "ARM3_SPEED",
    "ARM3_START",
    "ARM3_WINDOW",
    "ASS1_ALERT",
    "ASS1_FAIL",
    "ASS1_LOST",
    "ASS1_RESTART1",
    "ASS1_START",
    "ASS1_STOP",
    "ASS3_COPS",
    "ASS3_FAIL",
    "ASS3_KILL",
    "ASS3_RADIO_FADE_OUT",
    "ASS3_RADIO_PASS",
    "ASS3_RESTART1",
    "ASS3_RESTART2",
    "ASS3_START",
    "ASS5_DRIVE",
    "ASS5_FAIL",
    "ASS5_KILL",
    "ASS5_LIFT",
    "ASS5_RESTART1",
    "ASS5_RESTART2",
    "ASS5_RESTART3",
    "ASS5_ROOF",
    "ASS5_START",
    "ASS5_STOP",
    "ASS5_TOP",
    "BG_ASSAULT_COLLECT",
    "BG_ASSAULT_DELIVER",
    "BG_ASSAULT_START",
    "BG_ASSAULT_STOP",
    "BG_FINDERS_KEEPERS_START",
    "BG_FINDERS_KEEPERS_STOP",
    "BG_HUNT_STOP",
    "BG_SIGHTSEER_FINAL",
    "BG_SIGHTSEER_MID",
    "BG_SIGHTSEER_START",
    "BG_SIGHTSEER_START_ATTACK",
    "BG_SIGHTSEER_STOP",
    "BLUE_DOOR",
    "BST_START",
    "BST_STOP",
    "CAR1_APPROACH",
    "CAR1_BRIDGE",
    "CAR1_CHASE_RESTART",
    "CAR1_CHASE_START",
    "CAR1_COP_BIKES",
    "CAR1_COPS_RESTART",
    "CAR1_MISSION_FAIL",
    "CAR1_MISSION_RESTART",
    "CAR1_MISSION_START",
    "CAR1_PULL_OVER",
    "CAR2_MISSION_FAIL",
    "CAR2_STOP",
    "CAR3_CAR_RESTART",
    "CAR3_DELIVER",
    "CAR3_DELIVER_RESTART",
    "CAR3_DRIVE",
    "CAR3_DROP",
    "CAR3_ESCAPE_RESTART",
    "CAR3_MISSION_FAIL",
    "CAR3_MISSION_START",
    "CAR3_SET_ALERT",
    "CAR3_STOP_TRACK",
    "CAR3_TRAILER",
    "CAR3_TRAILER_RESTART",
    "CAR4_CLIMB",
    "CAR4_MISSION_FAIL",
    "CAR4_RADIO_1",
    "CAR4_RADIO_2",
    "CAR4_RADIO_2_START_TRACK",
    "CAR4_REVERSE",
    "CAR4_TRUCK_RESTART",
    "CHN1_AFTER_GRENADE_RT",
    "CHN1_BACK_ROOF",
    "CHN1_CAR_ARRIVES",
    "CHN1_CS_SKIP",
    "CHN1_ENEMIES_FLEE",
    "CHN1_FAIL",
    "CHN1_FINAL_CS",
    "CHN1_FINAL_CS_SKIP",
    "CHN1_FIRST_FLOOR",
    "CHN1_FROM_LEFT",
    "CHN1_G_LAUNCHER",
    "CHN1_GAMEPLAY_STARTS",
    "CHN1_GAMEPLAY_STARTS",
    "CHN1_HEAD_TO_BACK",
    "CHN1_ICE_BIN",
    "CHN1_LAST_GUYS",
    "CHN1_NOW",
    "CHN1_OUTSIDE_RT",
    "CHN1_START",
    "CHN1_WAVE_3_RT",
    "CHN1_WAVE_ZERO_RT",
    "CHN2_MISSION_FAIL",
    "CHN2_TREV_RADIO_1_FRTA",
    "CHN2_TREV_RADIO_2_FRTA",
    "CUT_PIPE_END",
    "CUT_PIPE_START",
    "debug_stop_oneshot",
    "DH1_START",
    "DH1_STOP",
    "DH2A_1ST_BOMB_RT",
    "DH2A_1ST_SWITCH",
    "dh2a_2nd_bomb_planted",
    "DH2A_2ND_BOMB_RT",
    "dh2a_3rd_bomb_planted",
    "DH2A_3RD_BOMB_RT",
    "DH2A_4TH_BOMB_RT",
    "DH2A_ALL_CLEAR",
    "DH2A_CHOPPER_DEAD",
    "dh2a_clear_path",
    "dh2a_dead",
    "DH2A_DETONATE",
    "DH2A_DETONATE_RT",
    "DH2A_DIVER",
    "dh2a_double_guards",
    "dh2a_early_alarm",
    "DH2A_FINAL_EXP",
    "DH2A_FRANK_JUMPS",
    "DH2A_GOODS_RT",
    "dh2a_main_alarm",
    "DH2A_MINISUB",
    "DH2A_MISSION_COMPLETE",
    "dh2a_mission_complete",
    "DH2A_ON_BRIDGE",
    "DH2A_READY_FOR_2ND",
    "DH2A_RIB",
    "DH2A_SNIPE_GUARDS_RT",
    "DH2A_START",
    "DH2A_WAY_OUT_RT",
    "DH2B_ALL_DEAD",
    "DH2B_BOATS",
    "DH2B_CLEAR_MERRY",
    "DH2B_DROP_SUB_RT",
    "DH2B_FAIL",
    "DH2B_FIND_CONT_RT",
    "DH2B_FLY_AWAY_RT",
    "DH2B_FLY_SEA_RT",
    "DH2B_GET_SURFACE_RT",
    "DH2B_GOT_CONTAINER",
    "DH2B_GOT_SUB",
    "DH2B_GOT_SUB_2ND",
    "DH2B_HELIS_ARRIVE",
    "DH2B_PICK_SUB_RT",
    "DH2B_PICK_UP_RT",
    "DH2B_START",
    "DH2B_SUB_RETURNED",
    "DH2B_TREV_SUB",
    "DHP1_ATTACKED",
    "DHP1_FAIL",
    "DHP1_RELEASED",
    "DHP1_START",
    "DHP1_STOP",
    "DHP1_SUB",
    "DHP1_VEHICLE_ARRIVE",
    "DROPZONE_ACTION",
    "DROPZONE_ACTION_HIGH",
    "DROPZONE_HELI",
    "DROPZONE_JUMP",
    "DROPZONE_LAND",
    "EPS1_FAIL",
    "EPS1_START",
    "EPS1_STOP",
    "EPS2_FAIL",
    "EPS2_START",
    "EPS2_STOP",
    "EPS3_START",
    "EPS3_STOP",
    "EPS4_START",
    "EPS4_STOP",
    "EPS5_START",
    "EPS5_STOP",
    "EPS6_START",
    "EPS6_STOP",
    "EPS7_START",
    "EPS7_STOP",
    "EPS8_ESCAPE",
    "EPS8_FAIL",
    "EPS8_PASS",
    "EPS8_START",
    "EPS_FAIL",
    "EXL1_CARGO_DOORS_OPEN",
    "EXL1_JUMPED",
    "EXL1_LAND_IN_CARGO_PLANE",
    "EXL1_MISSION_FAILED",
    "EXL2_DEER",
    "EXL2_FLY_HELI_RT",
    "EXL2_HELI_CS",
    "EXL2_HELI_LIFT",
    "EXL2_MISSION_FAIL",
    "EXL2_ON_FOOT",
    "EXL2_ON_FOOT_RT",
    "EXL2_RPG_DEAD",
    "EXL2_RPG_FIRED",
    "EXL2_RPG_HELI",
    "EXL2_SNIPE_RT",
    "EXL2_SNIPE_START",
    "EXL2_SWITCH_START",
    "EXL2_TRUCK",
    "EXL3_BIKE_LAND",
    "EXL3_FIGHT_OS",
    "EXL3_MISSION_FAIL",
    "EXL3_RAPIDS_START",
    "EXL3_SEE_TRAIN",
    "EXL3_STOP",
    "EXL3_SWITCH_1",
    "EXL3_TUNNEL_EXIT",
    "EXT4_JUMPED_OS",
    "EXTREME1_BIKE",
    "EXTREME1_CYCLE",
    "EXTREME1_FAIL",
    "EXTREME1_JUMP",
    "EXTREME1_LAND",
    "EXTREME1_RESTART1",
    "EXTREME1_START",
    "EXTREME1_STOP",
    "EXTREME2_ENTER",
    "EXTREME2_FAIL",
    "EXTREME2_JUMP",
    "EXTREME2_PARA",
    "EXTREME2_READY",
    "EXTREME2_RESTART1",
    "EXTREME2_RESTART2",
    "EXTREME2_RUNWAY",
    "EXTREME2_START",
    "EXTREME2_STOP",
    "EXTREME3_FAIL",
    "EXTREME3_RESTART1",
    "EXTREME3_START",
    "EXTREME3_STOP",
    "FAM1_1ST_ENEMY_OS",
    "FAM1_BROKE_CAR",
    "FAM1_CLOSE_YACHT",
    "FAM1_DO_CHASE_RT",
    "FAM1_FADE_RADIO",
    "FAM1_FAIL",
    "FAM1_FRANK_JUMPS_RT",
    "FAM1_FRANK_LEAPS",
    "FAM1_FRANKLIN_JUMPS",
    "FAM1_JIMMY_APPEARS_RT",
    "FAM1_JIMMY_BOOM",
    "FAM1_JIMMY_LANDS",
    "FAM1_RADIO_START",
    "FAM1_START",
    "FAM2_CHASE_RT",
    "FAM2_COMING",
    "FAM2_COMPLETE",
    "FAM2_CS_SKIP",
    "FAM2_GRAB_NECK",
    "FAM2_LOST_HIM",
    "FAM2_NEAR_YACHT",
    "FAM2_NECK_GRAB",
    "FAM2_ON_JETSKI",
    "FAM2_SHOOTING",
    "FAM2_SPLASH",
    "FAM2_STOP",
    "FAM3_ARRIVE_HOUSE",
    "FAM3_BALCONY",
    "FAM3_CHASE_RESTART",
    "FAM3_CHASE_START",
    "FAM3_END",
    "FAM3_HOOKED_UP",
    "FAM3_HOUSE_COLLAPSE",
    "FAM3_HOUSE_RESTART",
    "FAM3_MEX_CHASE",
    "FAM3_MEX_LOST",
    "FAM3_MEX_RESTART",
    "FAM3_MISSION_FAIL",
    "FAM3_MISSION_START",
    "FAM3_PULL_RESTART",
    "FAM3_TRUCK_PULL",
    "FAM4_CHASE_RESTART",
    "FAM4_CHASE_START",
    "FAM4_MISSION_FAIL",
    "FAM4_MISSION_START",
    "FAM4_STOP_TRACK",
    "FAM5_YOGA_MOVE_START",
    "FAM5_YOGA_MUSIC_CHANGE",
    "FAM5_YOGA_MUSIC_CHANGE_DOWN",
    "FAM5_YOGA_MUSIC_ENDS",
    "FAM5_YOGA_MUSIC_RESTART",
    "FAM5_YOGA_MUSIC_START",
    "FANATIC2_FAIL",
    "FANATIC2_RESTART1",
    "FANATIC2_START",
    "FANATIC2_STOP",
    "FANATIC3_CYCLE",
    "FANATIC3_FAIL",
    "FANATIC3_RESTART1",
    "FANATIC3_RESTART2",
    "FANATIC3_RESTART3",
    "FANATIC3_RUN",
    "FANATIC3_START",
    "FBI1_2ND_STAIRWELL",
    "FBI1_ALARM",
    "FBI1_CALL_NORTON",
    "FBI1_COPS_LOST",
    "FBI1_DEAD",
    "FBI1_ESCAPE",
    "FBI1_FIND_BODY",
    "FBI1_GET_GUN",
    "FBI1_JUMP",
    "FBI1_LAND_TRUCK",
    "FBI1_LEAK",
    "FBI1_LIFT_ENEMY",
    "FBI1_LOSE_COPS_START",
    "FBI1_OUTSIDE_CORONERS_RT",
    "FBI1_RADIO",
    "FBI1_SHOOTOUT_HALFWAY_RT",
    "FBI1_SHOOTOUT_RT",
    "FBI1_STAIRWELL",
    "FBI1_THREE_DEAD",
    "FBI1_TOP_FLOOR",
    "FBI1_WAKE_UP",
    "FBI1_WAKE_UP_RT",
    "FBI3_BACK_TO_MICHAEL",
    "FBI3_FAIL",
    "FBI3_MICHAEL_ARRIVES_1",
    "FBI3_MICHAEL_ARRIVES_2",
    "FBI3_MICHAEL_MUSIC_1",
    "FBI3_MICHAEL_MUSIC_2",
    "FBI3_START",
    "FBI3_TORTURE",
    "FBI3_TORTURE_DONE",
    "FBI3_TORTURE_RT",
    "FBI3_TORTURE_START",
    "FBI4_COVER_RESTART",
    "fbi4_DEPOT_STOP_TRACK",
    "FBI4_ENTER_VEHICLE_MA",
    "fbi4_EXPLODE_MA",
    "FBI4_EXPLODE_RESTART_ST",
    "FBI4_GETAWAY_RESTART",
    "FBI4_MISSION_FAIL",
    "fbi4_PARK_AMBULANCE_OS",
    "FBI4_PETROL",
    "FBI4_PETROL_EXPLODE",
    "fbi4_PLANT_BOMB_MA",
    "fbi4_PRE_TRUCK_RAM_MA",
    "FBI4_RAM_OS",
    "fbi4_SHOOTOUT_MA",
    "fbi4_SHOOTOUT_MID_MA",
    "FBI4_SWITCH_1",
    "FBI4_SWITCH_BINOC_ST",
    "fbi4_TRUCK_RAM_MA",
    "FBI4_TRUCK_RAM_MA",
    "fbi4_TRUCK_RAM_RESTART_ST",
    "FBI5A_ALARM_MA",
    "FBI5A_BLUE_DOOR",
    "FBI5A_CHEM_START",
    "FBI5A_CONTAINER",
    "FBI5A_CUT_PIPE_END",
    "FBI5A_CUT_PIPE_RESTART",
    "FBI5A_CUT_PIPE_START",
    "FBI5A_CUT_SWIM_UP",
    "FBI5A_DIVE_OUT_MA",
    "FBI5A_ENTER_LAB_STEALTH_ST",
    "FBI5A_ENTER_LAB_STOP_TRACK",
    "FBI5A_FIGHT_END_MA",
    "FBI5A_FIGHT_RAMP_UP_MA",
    "FBI5A_FIGHT_RESTART",
    "FBI5A_FIGHT_START_MA",
    "FBI5A_FLY_RESTART",
    "FBI5A_FORKLIFT_RESTART",
    "FBI5A_GET_CHEMICALS_MA",
    "FBI5A_HELI_OS",
    "FBI5A_HELI_RESTART",
    "FBI5A_LIFT_EXIT",
    "FBI5A_LIFT_RESTART",
    "FBI5A_LOAD_CRATE_MA",
    "FBI5A_MISSION_FAIL",
    "FBI5A_MISSION_START_ST",
    "FBI5A_STOP_TRACK",
    "FBI5A_SWIM_UP",
    "FBI5A_SWITCH_HELI_MA",
    "FBI5A_TO_AIRPORT",
    "FBI5A_TREV_RADIO_FRTA",
    "FBI5A_TREV_RADIO_FRTA",
    "FBI_04_HEAT_SOUNDS",
    "FH1_END",
    "FH1_FAIL",
    "FH1_ONION86",
    "FH1_TRUCKS",
    "FH1_TRUCKS_2",
    "FH2A_ACCESS_BANK_MA",
    "FH2A_ACCESS_BANK_RESTART",
    "FH2A_ARRIVE_BANK",
    "FH2A_ARRIVE_BANK_2",
    "FH2A_BANK_MID",
    "FH2A_BANK_MID_RESTART",
    "FH2A_CARS",
    "FH2A_CARTS_MA",
    "FH2A_CARTS_RESTART",
    "FH2A_ENTER_BANK_MA",
    "FH2A_ENTER_LIFT",
    "FH2A_ENTER_TRUCK",
    "FH2A_ENTER_TUNNEL",
    "FH2A_FIGHT_DROP",
    "FH2A_FIGHT_END",
    "FH2A_FIGHT_MID",
    "FH2A_FIGHT_PRE",
    "FH2A_FIGHT_RESTART",
    "FH2A_FINAL_DRIVE_RADIO",
    "FH2A_GETAWAY_DRIVE_MA",
    "FH2A_GETAWAY_RESTART",
    "FH2A_GOLD",
    "FH2A_JUMP_LAND_MA",
    "FH2A_JUMP_START",
    "FH2A_LEAVE_BANK_MA",
    "FH2A_LEAVE_BANK_RESTART",
    "FH2A_MISSION_END",
    "FH2A_MISSION_FAIL",
    "FH2A_MISSION_RESTART",
    "FH2A_MISSION_START_OS",
    "FH2A_MISSION_START_ST",
    "FH2A_RADIO_FADE_OUT",
    "FH2A_STOP_TRACK",
    "FH2A_TRAFFIC_END",
    "FH2A_TRAFFIC_RESTART",
    "FH2A_TRAFFIC_START",
    "FH2A_VAN_RESTART",
    "FH2A_VAN_ST",
    "FH2B_BOMBS_RESTART",
    "FH2B_CARPARK",
    "FH2B_CREW_ESCAPE",
    "FH2B_DRILL_RESTART",
    "FH2B_DRILL_START",
    "FH2B_DROP_GOLD_RESTART",
    "FH2B_DROPPED_RESTART",
    "FH2B_ENTER_VEHICLE",
    "FH2B_ESCAPE_RESTART",
    "FH2B_EXPLODE",
    "FH2B_FIGHT_1_RESTART",
    "FH2B_FIGHT_START",
    "FH2B_GOLD_DROPPED",
    "FH2B_HELI_ARRIVE",
    "FH2B_HELI_CHASE_RESTART",
    "FH2B_HELI_RESTART",
    "FH2B_LEAVE_BANK",
    "FH2B_LEAVE_RESTART",
    "FH2B_MISSION_END",
    "FH2B_MISSION_FAIL",
    "FH2B_MISSION_START",
    "FH2B_NOOSE_FIGHT",
    "FH2B_NOOSE_FIGHT_RESTART",
    "FH2B_PARK_CUTTER",
    "FH2B_PLANT_BOMBS",
    "FH2B_SWITCH_2",
    "FH2B_SWITCH_3",
    "FH2B_TANKER",
    "FH2B_VAN_START",
    "FH2B_WALL_SMASH",
    "FHPRA_FAIL",
    "FHPRA_START",
    "FHPRA_STOP",
    "FHPRA_VAN",
    "FHPRB_COPS",
    "FHPRB_LOST",
    "FHPRB_START",
    "FHPRB_STOP",
    "FHPRB_TRUCK",
    "FHPRC_FAIL",
    "FHPRD_END",
    "FHPRD_FAIL",
    "FHPRD_RESTART_1",
    "FHPRD_RESTART_2",
    "FHPRD_RESTART_3",
    "FHPRD_SIDINGS",
    "FHPRD_START",
    "FHPRD_STOP",
    "FHPRD_TRAIN",
    "FIB2_DEATH_FAIL",
    "FIB2_HELICOPTERS_APPROACHING",
    "FIN1_AT_VEHICLES",
    "FIN1_BEFORE_GUNS",
    "FIN1_CS_SKIP",
    "FIN1_FAIL",
    "FIN1_GUNS_DONE",
    "FIN1_PREP",
    "FIN1_RADIO_FADE",
    "FIN1_SHOOTOUT_1",
    "FIN1_SHOOTOUT_2",
    "FIN1_SHOOTOUT_3",
    "FIN1_SHOOTOUT_4",
    "FIN1_SO_1_RT",
    "FIN1_SO_2_RT",
    "FIN1_SO_3_RT",
    "FIN1_SO_4_RT",
    "FIN1_START",
    "FIN1_SWAT_ARRIVE",
    "FIN1_TREV_HELPED",
    "FINA_CHASE",
    "FINA_END",
    "FINA_FAIL",
    "FINA_KILL_RESTART",
    "FINA_NITRO_CRASH",
    "FINA_RESTART_CHASE",
    "FINA_START",
    "FINB_ARRIVE",
    "FINB_CHASE",
    "FINB_CHOOSE",
    "FINB_CLIMB",
    "FINB_FAIL",
    "FINB_RESTART_ARRIVE",
    "FINB_RESTART_CHASE",
    "FINB_RESTART_CLIMB",
    "FINB_RESTART_STEPS",
    "FINB_START",
    "FINB_STEPS",
    "FINB_TOWER",
    "FINC2_FAIL",
    "FM_COUNTDOWN_10S",
    "FM_COUNTDOWN_20S",
    "FM_COUNTDOWN_30S",
    "FM_COUNTDOWN_30S_FIRA",
    "FM_COUNTDOWN_30S_KILL",
    "FM_INTRO_DRIVE_END",
    "FM_INTRO_DRIVE_START",
    "FM_INTRO_START",
    "FM_PRE_COUNTDOWN_30S",
    "FM_SUDDEN_DEATH_START_MUSIC",
    "FM_SUDDEN_DEATH_STOP_MUSIC",
    "FRA0_BADDY",
    "FRA0_BOY",
    "FRA0_DISMOUNT",
    "FRA0_FENCE",
    "FRA0_FOUND",
    "FRA0_MISSION_FAIL",
    "FRA0_MOUNT",
    "FRA0_OPEN_CAR",
    "FRA0_SWITCH_1",
    "FRA1_FIGHT_LEAVE",
    "FRA1_FIGHT_LEAVE_RESTART",
    "FRA1_FIGHT_RESTART",
    "FRA1_FIGHT_START",
    "FRA1_HUSTLER",
    "FRA1_MISSION_FAIL",
    "FRA1_MISSION_START",
    "FRA1_SPEED",
    "FRA1_SPEED_RESTART",
    "FRA1_STOP_TRACK",
    "FRA1_WATER_ARRIVE",
    "FRA2_ALERTED",
    "FRA2_ATTACK_RT",
    "FRA2_CUT_LAMAR_RT",
    "FRA2_END_ON_FOOT",
    "FRA2_END_VEHICLE",
    "FRA2_FAIL",
    "FRA2_FLEE_RT",
    "FRA2_GET_TO_LAMAR",
    "FRA2_GOT_LAMAR",
    "FRA2_HEAD_TO_POS",
    "FRA2_IN_POSITION",
    "FRA2_RETURN_LAMAR",
    "FRA2_START",
    "GA_KILL_ALERTED",
    "GA_KILL_ALERTED_RS",
    "GA_KILL_COMPLETE",
    "GA_KILL_HALF",
    "GA_KILL_HALF_RS",
    "GA_KILL_LEAVE",
    "GA_KILL_LEAVE_RS",
    "GA_KILL_START",
    "GA_LEAVE_AREA",
    "GA_STOP",
    "GLOBAL_KILL_MUSIC",
    "GLOBAL_KILL_MUSIC_FADEIN_RADIO",
    "GTA_ONLINE_STOP_SCORE",
    "HALLOWEEN_FAST_STOP_MUSIC",
    "HALLOWEEN_START_MUSIC",
    "HEIST_CELEB_APARTMENT",
    "HEIST_CELEB_STRIP_CLUB",
    "HEIST_STATS_SCREEN_START",
    "HEIST_STATS_SCREEN_STOP",
    "HEIST_STATS_SCREEN_STOP_PREP",
    "HELI_OS",
    "JH1_FAIL",
    "JH1_RESTART_1",
    "JH1_RESTART_2",
    "JH1_RESTART_3",
    "JH1_START",
    "JH1_STOP_TRACK_ACTION",
    "JH1_STORE",
    "JH2A_ARRIVE_DRAIN_MA",
    "JH2A_ARRIVE_STOP_TRACK",
    "JH2A_ENTER_SHOP_MA",
    "JH2A_ENTER_SHOP_RESTART",
    "JH2A_ENTER_TRUCK",
    "JH2A_ENTER_TUNNEL_MA",
    "JH2A_EXIT_SHOP_MA",
    "JH2A_EXIT_SHOP_RESTART",
    "JH2A_EXIT_TUNNEL_MA",
    "JH2A_EXIT_TUNNEL_RESTART",
    "JH2A_GAS_SHOP_MA",
    "JH2A_GAS_SHOP_OS",
    "JH2A_GAS_SHOP_RESTART",
    "JH2A_JUMP_OS",
    "JH2A_MISSION_FAIL",
    "JH2A_MISSION_START_OS",
    "JH2A_MISSION_START_ST",
    "JH2A_ONTO_BIKE_MA",
    "JH2A_ONTO_BIKE_RESTART",
    "JH2A_RADIO_FADE",
    "JH2A_STORM_DRAIN_MA",
    "JH2A_TUNNEL_MID",
    "JH2A_VEHICLE",
    "JH2B_ARRIVE_STOP_TRACK",
    "JH2B_ENTER_SHOP_MA",
    "JH2B_ENTER_SHOP_RESTART",
    "JH2B_ENTER_TRUCK",
    "JH2B_ENTER_TUNNEL_MA",
    "JH2B_EXIT_SHOP_MA",
    "JH2B_EXIT_TUNNEL_MA",
    "JH2B_EXIT_TUNNEL_RESTART",
    "JH2B_JUMP_OS",
    "JH2B_MISSION_FAIL",
    "JH2B_MISSION_RESTART",
    "JH2B_MISSION_START_ST",
    "JH2B_ONTO_BIKE_MA",
    "JH2B_ONTO_BIKE_RESTART",
    "JH2B_RADIO_FADE",
    "JH2B_SECURITY_MA",
    "JH2B_START",
    "JH2B_STORM_DRAIN_MA",
    "JH2B_TUNNEL_MID",
    "JH2B_VEHICLE",
    "JHP1A_ATTACK",
    "JHP1A_FAIL",
    "JHP1A_RADIO_1",
    "JHP1A_RADIO_2",
    "JHP1A_START",
    "JHP1A_VAN",
    "JHP1A_WAREHOUSE",
    "JHP1B_FAIL",
    "JHP1B_START",
    "JHP1B_STOP",
    "JHP1B_VAN",
    "JHP2A_FAIL",
    "JHP2A_START",
    "JHP2A_STOP",
    "JOSH3_COPS",
    "JOSH3_COPS_LOST",
    "JOSH3_COPS_LOST_RADIO",
    "JOSH3_HOUSE_EXPLODE",
    "JOSH3_MISSION_FAIL",
    "JOSH3_PETROL",
    "JOSH3_RESTART1",
    "JOSH3_START",
    "JOSH4_ACTION",
    "JOSH4_COPS_LOST",
    "JOSH4_COPS_LOST_RADIO",
    "JOSH4_MISSION_FAIL",
    "JOSH4_RESTART1",
    "JOSH4_START",
    "JOSH4_VEHICLE",
    "KILL_LIST_START_MUSIC",
    "KILL_LIST_STOP_MUSIC",
    "LIFT_EXIT",
    "LM1_COPS_LOST_RADIO",
    "LM1_TERMINADOR_1ST_DOOR_EXPLODES",
    "LM1_TERMINADOR_2ND_DOOR_EXPLODES",
    "LM1_TERMINADOR_ALL_WAREHOUSE",
    "LM1_TERMINADOR_CLIMB_LADDER",
    "LM1_TERMINADOR_CLIMB_LADDER_RESTART",
    "LM1_TERMINADOR_CLUMSY_ASS",
    "LM1_TERMINADOR_CORRIDOR",
    "LM1_TERMINADOR_CS_DOORS",
    "LM1_TERMINADOR_DOORS_OPEN",
    "LM1_TERMINADOR_ENTER_CAR",
    "LM1_TERMINADOR_ENTER_WAREHOUSE",
    "LM1_TERMINADOR_ENTER_WAREHOUSE_RESTART",
    "LM1_TERMINADOR_ENTERED_ROOM",
    "LM1_TERMINADOR_EXIT_WAREHOUSE",
    "LM1_TERMINADOR_GAMEPLAY_BEGINS",
    "LM1_TERMINADOR_GAMEPLAY_BEGINS_RESTART",
    "LM1_TERMINADOR_HALF_WAREHOUSE",
    "LM1_TERMINADOR_HEAD_SHOT",
    "LM1_TERMINADOR_LANDED",
    "LM1_TERMINADOR_LOST_ON_FOOT",
    "LM1_TERMINADOR_MISSION_FAIL",
    "LM1_TERMINADOR_MISSION_START",
    "LM1_TERMINADOR_SMOKE",
    "LOWRIDER_FINALE_START_MUSIC",
    "LOWRIDER_START_MUSIC",
    "XTRAGF_START",
    "XTRAGF_STOP",
    "XTRAPS_FAIL",
    "XTRAPS_START",
    "XTRAPS_STOP",
    "XTRASP_END",
    "XTRASP_FAIL",
    "XTRASP_START",
    "XTRASR_BACK_ON",
    "XTRASR_FELL_OFF",
    "XTRASR_START",
    "XTRASR_STOP",
    "XTRATN_END",
    "XTRATN_START",
    "XTRATR_COMPLETE",
    "XTRATR_LAST_CYCLE",
    "XTRATR_LAST_FOOT",
    "XTRATR_LAST_SWIM",
    "XTRATR_MUSIC_START",
    "XTRATR_ON_BIKE",
    "XTRATR_ON_FOOT",
    "XTRATR_STOP",
    "XTRAYG_END",
    "XTRAYG_POSITION_COMPLETE",
    "XTRAYG_START",
    "MIC1_1ST_VAN",
    "MIC1_ALERTED",
    "MIC1_ARGUE_CS_SKIP",
    "MIC1_ARRIVED_CHURCH",
    "MIC1_DRIVE_TO_GRAVEYARD",
    "MIC1_FAIL",
    "MIC1_FIRST_TWO_DEAD",
    "MIC1_FLIGHT_ARRIVING",
    "MIC1_FLIGHT_LANDED",
    "MIC1_FLY_HOME_RT",
    "MIC1_GAMEPLAY_STARTS",
    "MIC1_GRAVE_CS",
    "MIC1_INTRO_CS_BEGINS",
    "MIC1_KIDNAPPED",
    "MIC1_LEFT_HOUSE",
    "MIC1_PRE_MISSION_MUSIC",
    "MIC1_READY_TO_FLY",
    "MIC1_SHOOTOUT_RT",
    "MIC1_SHOOTOUT_START",
    "MIC1_SKIPPED_TO_KIDNAP",
    "MIC1_TRAIN",
    "MIC1_TREVOR_PLANE",
    "MIC2_ABATTOIR_PROGRESS",
    "MIC2_ACID_BATH_OS",
    "MIC2_BACK_TO_FRANK",
    "MIC2_DEAD",
    "MIC2_FIGHT_BEGINS",
    "MIC2_FIGHT_BEGINS_RT",
    "MIC2_FIGHT_CONT",
    "MIC2_FIND_A_WAY",
    "MIC2_FIND_MIKE_RT",
    "MIC2_FRANK_SAVED",
    "MIC2_FRANK_VEH",
    "MIC2_HANGING_MICHAEL",
    "MIC2_HANGING_RT",
    "MIC2_LOSE_TRIADS",
    "MIC2_MICHAEL_ESCAPE_RT",
    "MIC2_MULCHED",
    "MIC2_OVER",
    "MIC2_RADIO_SETUP",
    "MIC2_SPINNING_BLADES",
    "MIC2_START",
    "MIC2_SWITCHED",
    "MIC2_TRIADS_CHASE_RT",
    "MIC2_TRIADS_LOST",
    "MIC2_VEHICLE_READY",
    "MIC3_CRASH",
    "MIC3_DAVE_ESCAPES_RESTART",
    "MIC3_ESCAPE",
    "MIC3_ESCAPE_RESTART",
    "MIC3_FIGHT_RESTART",
    "MIC3_FIGHT_START",
    "MIC3_FOUNTAIN_RESTART",
    "MIC3_FRANK_DOWN",
    "MIC3_HELI",
    "MIC3_INTRO",
    "MIC3_MEET",
    "MIC3_MISSION_FAIL",
    "MIC3_MISSION_START",
    "MIC3_MT_FIGHT_RESTART",
    "MIC3_SNIPE",
    "MIC3_STEVE_SHOT",
    "MIC3_STOP_TRACK",
    "MIC3_TREV_HELI_RESTART",
    "MIC3_VEHICLE_ESCAPE_RESTART",
    "MICHAELS_HOUSE",
    "MICHAELS_HOUSE_STOP",
    "MM1_FAIL",
    "MM1_STOP",
    "MM2_FAIL",
    "MM2_RESTART1",
    "MM2_START_FORA",
    "MM2_START_STA",
    "MM2_STOP",
    "MM3_FAIL",
    "MM3_RESTART1",
    "MM3_START_FORA",
    "MM3_START_STA",
    "MM3_STOP",
    "MM3_TRACTOR",
    "MP_DM_COUNTDOWN_30_SEC",
    "MP_DM_COUNTDOWN_30_SEC_FIRA",
    "MP_DM_COUNTDOWN_60_SEC_FIRA",
    "MP_DM_COUNTDOWN_KILL",
    "MP_DM_LAST",
    "MP_DM_START_ALL",
    "MP_DM_STOP_TRACK",
    "MP_GLOBAL_RADIO_FADE_IN",
    "MP_LTS",
    "MP_MC_ACTION_HPREP",
    "MP_MC_DANGERZONE",
    "MP_MC_DZ_FADE_OUT_RADIO",
    "MP_MC_DZ_FIRA",
    "MP_MC_FAIL",
    "MP_MC_GENERAL_1",
    "MP_MC_RADIO_FADE",
    "MP_MC_RADIO_OUT_SCORE_IN",
    "MP_MC_START",
    "MP_MC_START_BEYOND_4",
    "MP_MC_START_BURNING_BAR_8",
    "MP_MC_START_CAR_STEAL_CHIPS_2",
    "MP_MC_START_CHOP_8",
    "MP_MC_START_CITY",
    "MP_MC_START_CITY_8",
    "MP_MC_START_COCK_SONG_1",
    "MP_MC_START_COUNTRY",
    "MP_MC_START_DARK_ROBBERY_8",
    "MP_MC_START_DEBUNKED_8",
    "MP_MC_START_DIFRND_DIARY_8",
    "MP_MC_START_DR_DESTRUCTO_8",
    "MP_MC_START_DRAGONER_8",
    "MP_MC_START_EYE_IN_SKY_3",
    "MP_MC_START_FUNK_JAM_3",
    "MP_MC_START_FUNK_JAM_TWO_4",
    "MP_MC_START_GREYHOUND_8",
    "MP_MC_START_GUN_NOVEL_8",
    "MP_MC_START_HEIST_4",
    "MP_MC_START_HEIST_8",
    "MP_MC_START_HEIST_FIN_NEW",
    "MP_MC_START_HEIST_PREP_NEW",
    "MP_MC_START_MEATY_8",
    "MP_MC_START_MISSION_SEVEN_8",
    "MP_MC_START_NINE_BLURT_8",
    "MP_MC_START_NT_DEF_8",
    "MP_MC_START_NT_ELC_8",
    "MP_MC_START_NT_TKB_4",
    "MP_MC_START_PB1_8",
    "MP_MC_START_PB2_PUSSYFACE_8",
    "MP_MC_START_SCRAP_YARD_8",
    "MP_MC_START_SILVER_PUSSY_8",
    "MP_MC_START_STREETS_OF_FORTUNE_8",
    "MP_MC_START_TOUGHT_SEA_RACE_1",
    "MP_MC_START_TRACK_EIGHT_8",
    "MP_MC_START_VACUUM_8",
    "MP_MC_START_VINEGAR_TITS_8",
    "MP_MC_START_VODKA_8",
    "MP_MC_START_WAVERY_1",
    "MP_MC_STOP",
    "MP_MC_VEHICLE_CHASE_HFIN",
    "MP_PRE_COUNTDOWN_RADIO",
    "MP_RADIO_FADE_IN",
    "MP_RADIO_FADE_OUT",
    "NIGEL1C_END",
    "NIGEL1C_FAIL",
    "NIGEL1C_FORA",
    "NIGEL1C_START",
    "NIGEL2_JUMP",
    "OJBJ_JUMPED",
    "OJBJ_JUMPED_MA",
    "OJBJ_LANDED",
    "OJBJ_START",
    "OJBJ_STOP",
    "OJBJ_STOP_TRACK",
    "OJDA1_1ST_DROPPED",
    "OJDA1_2ND_DROPPED",
    "OJDA1_AIRBORNE",
    "OJDA1_HATCH_OPEN",
    "OJDA1_READY_2ND",
    "OJDA1_START",
    "OJDA1_TAXI",
    "OJDA2_1ST_DROPPED",
    "OJDA2_AIRBORNE",
    "OJDA2_HEAD_BACK",
    "OJDA2_READY_1ST",
    "OJDA2_START",
    "OJDA3_AIRBORNE",
    "OJDA3_BOMB_HIT",
    "OJDA3_HATCH",
    "OJDA3_LAST_ONE",
    "OJDA3_START",
    "OJDA4_1_LEFT",
    "OJDA4_AIRBORNE",
    "OJDA4_BOATS",
    "OJDA4_RETURN",
    "OJDA4_START",
    "OJDA4_TRAIN",
    "OJDA4_TRAIN_HIT",
    "OJDA5_AIRBORNE",
    "OJDA5_AT_BASE",
    "OJDA5_BASE_DESTROYED",
    "OJDA5_FIRST_BOMBS",
    "OJDA5_START",
    "OJDA_COMPLETE",
    "OJDA_STOP",
    "OJDG1_ENEMIES_DEAD",
    "OJDG1_GOING_LOST",
    "OJDG1_GOING_WANTED",
    "OJDG1_PACKAGE",
    "OJDG1_SAFE_PACKAGE",
    "OJDG1_START",
    "OJDG2_1ST_SET_DEAD",
    "OJDG2_FIRST_ENEMIES_DEAD",
    "OJDG2_MORE_DEAD",
    "OJDG2_MORE_ENEMIES",
    "OJDG2_PACKAGE_OBTAINED",
    "OJDG2_PACKAGE_STOLEN",
    "OJDG2_START",
    "OJDG2_TREV_FIRST",
    "OJDG_COMPLETE",
    "OJDG_STOP",
    "PAP2_CAR",
    "PAP2_CAR_RESTART",
    "PAP2_FAIL",
    "PAP2_SPOTTED",
    "PAP2_SPOTTED_RESTART",
    "PAP2_START",
    "PAP2_STOP",
    "PAP3_FAIL",
    "PAP3_START",
    "PAP3_START_FORA",
    "PAP3_STOP",
    "PENNED_IN_70_PERCENT",
    "PENNED_IN_START_MUSIC",
    "PENNED_IN_STOP_MUSIC",
    "PEYOTE_TRIPS_START",
    "PEYOTE_TRIPS_STOP",
    "PRE_MP_DM_COUNTDOWN_30_SEC",
    "PROLOGUE_TEST_AFTER_TRAIN",
    "PROLOGUE_TEST_BLAST_DOORS_EXPLODE",
    "PROLOGUE_TEST_BRAD_DOWN",
    "PROLOGUE_TEST_CAR_CHASE",
    "PROLOGUE_TEST_COLLECT_CASH",
    "PROLOGUE_TEST_COLLECT_MONEY",
    "PROLOGUE_TEST_COP_GUNFIGHT",
    "PROLOGUE_TEST_COP_GUNFIGHT_PROGRESS",
    "PROLOGUE_TEST_COP_GUNFIGHT_RT",
    "PROLOGUE_TEST_COVER_AT_BLAST_DOORS",
    "PROLOGUE_TEST_FAIL",
    "PROLOGUE_TEST_FINAL_CUTSCENE",
    "PROLOGUE_TEST_FINAL_CUTSCENE_MA",
    "PROLOGUE_TEST_FINALE_RT",
    "PROLOGUE_TEST_GETAWAY_CUTSCENE",
    "PROLOGUE_TEST_GETAWAY_RT",
    "PROLOGUE_TEST_GRAB_WOMAN",
    "PROLOGUE_TEST_GUARD_HOSTAGE",
    "PROLOGUE_TEST_GUARD_HOSTAGE_OS",
    "PROLOGUE_TEST_GUARD_HOSTAGE_RT",
    "PROLOGUE_TEST_GUARD_SWITCH",
    "PROLOGUE_TEST_HEAD_TO_GETAWAY_VEHICLE",
    "PROLOGUE_TEST_HEAD_TO_SECURITY_ROOM_MA",
    "PROLOGUE_TEST_HOSTAGES",
    "PROLOGUE_TEST_KILL_ONESHOT",
    "PROLOGUE_TEST_MISSION_CLEANUP",
    "PROLOGUE_TEST_MISSION_END",
    "PROLOGUE_TEST_MISSION_START",
    "PROLOGUE_TEST_POLICE_CAR_CHASE",
    "PROLOGUE_TEST_POLICE_CAR_CHASE_OS",
    "PROLOGUE_TEST_POLICE_CAR_CRASH",
    "PROLOGUE_TEST_POLICE_DRIVE_BY",
    "PROLOGUE_TEST_PRE_SAFE_EXPLOSION",
    "PROLOGUE_TEST_ROADBLOCK_WARNING",
    "PROLOGUE_TEST_SHUTTER_OPEN_OS",
    "PROLOGUE_TEST_TRAIN_CRASH",
    "PROP_INTRO_START",
    "PROP_INTRO_STOP",
    "PTP_START",
    "PTP_STOP",
    "RAMPAGE_1_OS",
    "RAMPAGE_1_START",
    "RAMPAGE_2_OS",
    "RAMPAGE_2_START",
    "RAMPAGE_3_OS",
    "RAMPAGE_3_START",
    "RAMPAGE_4_OS",
    "RAMPAGE_4_START",
    "RAMPAGE_5_OS",
    "RAMPAGE_5_START",
    "RAMPAGE_FAIL",
    "RAMPAGE_STOP",
    "RC18A_CS_SKIP_AFTER",
    "RC18A_CS_SKIP_BEFORE",
    "RC18A_END_OS",
    "RC18A_INCREASE",
    "RC18A_RESTART",
    "RC18A_START",
    "RC18A_STOP",
    "RC18B_END",
    "RC18B_START",
    "RC6A_FAIL",
    "RC6A_FINISH",
    "RC6A_START",
    "RE14A_FAIL",
    "RE14A_PIPES",
    "RE14A_SAFE",
    "RE14A_START",
    "RE20_END",
    "RE20_FADE_RADIO_OUT",
    "RE20_FAIL",
    "RE20_START",
    "RE28_OS",
    "RE35_OS",
    "RE51A_SHOP",
    "RE6_BOTH_DEAD",
    "RE6_BOTH_DEAD_OS",
    "RE6_END",
    "RE6_START",
    "RE9_SPOTTED",
    "RH1_FAIL",
    "RH1_RACE",
    "RH1_START",
    "RH2A_BANK_RESTART",
    "RH2A_CLUCK_ARRIVE",
    "RH2A_CLUCK_ARRIVE_RESTART",
    "RH2A_CLUCK_FIGHT_START",
    "RH2A_ENTER_BANK",
    "RH2A_ENTER_GATE",
    "RH2A_FENCE",
    "RH2A_FIGHT_MID",
    "RH2A_FIGHT_PAUSE",
    "RH2A_FIGHT_RAMP_UP",
    "RH2A_FIGHT_START",
    "RH2A_HELI_ARRIVE_RESTART",
    "RH2A_MISSION_FAIL",
    "RH2A_MISSION_START",
    "RH2A_MOVE_AWAY_MA",
    "RH2A_PAUSE_RESTART",
    "RH2A_PICK_UP",
    "RH2A_PLATFORM",
    "RH2A_POST_HELI_CRASH_MA",
    "RH2A_RADIO_ARRIVAL",
    "RH2A_RESCUE_RESTART",
    "RH2A_SHOOT_TANK",
    "RH2A_STOP_TRACK",
    "RH2A_SWITCH_1",
    "RH2A_SWITCH_1_RESTART",
    "RH2A_SWITCH_2",
    "RH2A_SWITCH_2_RESTART",
    "RH2A_SWITCH_3",
    "RH2A_TRAIN",
    "RH2A_TREV_DOOR",
    "RH2A_TREV_FACE",
    "RHP1_END",
    "RHP1_FAIL",
    "RHP1_START",
    "RHP1_TRUCK",
    "SOL1_1ST_ENEMY",
    "SOL1_AIR_TRAFFIC",
    "SOL1_ALMOST_CRASHED",
    "SOL1_APP_ACTIVE",
    "SOL1_BEGIN",
    "SOL1_BUS_JUMP",
    "SOL1_CHASE_PLANE_RT",
    "SOL1_CRASH",
    "SOL1_CRASHED_PLANE_RT",
    "SOL1_DRIVE_TO_OBS_RT",
    "SOL1_END",
    "SOL1_ENDS",
    "SOL1_ENGINE_HIT",
    "SOL1_FAIL",
    "SOL1_FIGHT_DONE",
    "SOL1_FIGHT_RT",
    "SOL1_FIST_FIGHT",
    "SOL1_FRANKLIN_STARTS",
    "SOL1_GAMEPLAY",
    "SOL1_GET_SOL_RT",
    "SOL1_GOT_IT",
    "SOL1_HELI_ROOF",
    "SOL1_SCARED_THEM",
    "SOL1_SHOOT_PLANE_RT",
    "SOL1_SNIPER_READY",
    "SOL1_START",
    "SOL1_START_FIGHT",
    "SOL1_STEALTH_RT",
    "SOL1_TAKE_OFF",
    "SOL1_TRAIN_JUMP",
    "SOL1_VEH",
    "SOL2_CAR",
    "SOL2_FAIL",
    "SOL2_RESTART1",
    "SOL2_START",
    "SOL2_STOP",
    "SOL5_AMANDA_SAVED",
    "SOL5_BACK_TO_TRACEY",
    "SOL5_BAD_GUYS",
    "SOL5_ENDING_CS",
    "SOL5_ENTER_HOUSE_RT",
    "SOL5_FAIL",
    "SOL5_FIGHT_BAD_RT",
    "SOL5_FRONT_DOORS",
    "SOL5_GAMEPLAY_RT",
    "SOL5_GAMEPLAY_STARTS",
    "SOL5_GROUND_FLOOR",
    "SOL5_HOSTAGE_DEAD",
    "SOL5_HOSTAGE_TAKER",
    "SOL5_IN_DRIVEWAY",
    "SOL5_LIMO_ENTERED",
    "SOL5_LIMO_RADIO",
    "SOL5_MICHAEL_CLOBBERED",
    "SOL5_MORE_MERRY",
    "SOL5_SAVE_A_RT",
    "SOL5_SAVE_T_RT",
    "SOL5_START",
    "START_ELECTRONIC",
    "START_RANDOM",
    "START_ROCK",
    "START_URBAN",
    "SWIM_UP",
    "TRV1_AT_CARAVAN",
    "TRV1_BIKERS_FLEE",
    "TRV1_CARAVAN_RT",
    "TRV1_CHASE_BIKERS_RT",
    "TRV1_CHASE_CS_SKIP",
    "TRV1_CHASE_STARTS",
    "TRV1_CHASING",
    "TRV1_DRIVE_TRAILER_RT",
    "TRV1_END_TRUCK",
    "TRV1_EXPLODE",
    "TRV1_FAIL",
    "TRV1_ORTEGA_RT",
    "TRV1_PUSH_TRAILER_RT",
    "TRV1_RAM_TRAILER",
    "TRV1_START",
    "TRV1_THREATEN",
    "TRV1_TRAILER",
    "TRV1_TRAILER_SMASHED",
    "TRV1_TRUCK",
    "TRV2_FIGHT_START",
    "TRV2_FLY",
    "TRV2_FLY_RESTART",
    "TRV2_GO_TO_RON",
    "TRV2_MISSION_END",
    "TRV2_MISSION_FAIL",
    "TRV2_MISSION_START",
    "TRV2_RACE",
    "TRV2_RACE_RESTART",
    "TRV2_SNIPE_RESTART",
    "TRV2_STEAL_PLANE_RESTART",
    "TRV2_TO_PLANE",
    "TRV2_TOWER_RESTART",
    "TRV2_WING_PLANE",
    "TRV2_WING_RESTART",
    "TRV3_FAIL",
    "TRV4_AIRPORT_ENTERED",
    "TRV4_CAR_ENTERED",
    "TRV4_CHASE",
    "TRV4_COPS_LOST",
    "TRV4_EVADE_RT",
    "TRV4_EXIT_CARS",
    "TRV4_FAIL",
    "TRV4_FOOT_CHASE_RT",
    "TRV4_GAMEPLAY_START",
    "TRV4_JET_ENTERED",
    "TRV4_LOSE_COPS",
    "TRV4_RUN",
    "TRV4_START",
    "TRV4_START_CS_SKIP",
    "TRV4_START_RT",
    "TRV4_SUCK_CS",
    "VAL2_COUNTDOWN_30S",
    "VAL2_COUNTDOWN_30S_KILL",
    "VAL2_FADE_IN_RADIO",
    "VAL2_PRE_COUNTDOWN_STOP"
}
local j = nil
local k = 0
local l = ""
local m = 0
local n = 500
local o = 500
local p = 500
local q = 360
local r = 360
local s = 360
local t
local function u(v)
    if not HasAnimDictLoaded(v) then
        RequestAnimDict(v)
        while not HasAnimDictLoaded(v) do
            Wait(0)
        end
    end
    return v
end
local function w()
    Citizen.CreateThread(
        function()
            while j do
                for x, y in ipairs(GetGamePool("CObject")) do
                    if GetEntityModel(y) == j then
                        SetEntityDrawOutline(y, true)
                    end
                end
                Citizen.Wait(0)
            end
        end
    )
end
local z = module("cfg/weapons")
RageUI.CreateWhile(
    1.0,
    true,
    function()
        if RageUI.Visible(RMenu:Get("devmenu", "main")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    if tXTRA.isDev() then
                        if not e then
                            pcall(
                                function()
                                    e = module("cfg/cfg_animations")
                                end
                            )
                        end
                    end
                    RageUI.Button(
                        "Get Customization [JSON]",
                        nil,
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                tXTRA.clientPrompt(
                                    "Customization [JSON]",
                                    json.encode(tXTRA.getCustomization()),
                                    function()
                                    end
                                )
                                notify("~g~Got Customization")
                            end
                        end
                    )
                    RageUI.Button(
                        "Set Customization [JSON]",
                        nil,
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                tXTRA.clientPrompt(
                                    "Customization [JSON]",
                                    "",
                                    function(D)
                                        tXTRA.setCustomization(json.decode(D))
                                        notify("~g~Set Customization")
                                    end
                                )
                            end
                        end
                    )
                    RageUI.Button(
                        "Spawn Vehicle By Name",
                        nil,
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                local E = tXTRA.getPlayerCoords()
                                tXTRA.clientPrompt(
                                    "Spawn Code",
                                    "",
                                    function(F)
                                        XTRA.spawnVehicle(
                                            F,
                                            E.x,
                                            E.y,
                                            E.z,
                                            GetEntityHeading(tXTRA.getPlayerPed()),
                                            true,
                                            true,
                                            true
                                        )
                                        notify("~g~Spawned Vehicle")
                                    end
                                )
                            end
                        end
                    )
                    RageUI.Button(
                        "Clear All",
                        nil,
                        "Dont Use It Deletes Everything",
                        true,
                        function(A, B, C)
                            if C then
                                TriggerServerEvent("XTRA:CleanAll")
                            end
                        end
                    )
                    RageUI.Button(
                        "Spawn Armour",
                        nil,
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                tXTRA.setArmour(100)
                                notify("~g~Spawned Armour")
                            end
                        end
                    )
                    RageUI.Button(
                        "Spawn Weapon",
                        nil,
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                tXTRA.clientPrompt(
                                    "Weapon:",
                                    "",
                                    function(G)
                                        if G ~= nil and G ~= "" then
                                            G = "WEAPON_" .. string.upper(G)
                                            tXTRA.giveWeapons({[G] = {ammo = 250}})
                                            notify("~g~Spawned Weapon:" .. G)
                                        end
                                    end
                                )
                            end
                        end
                    )
                    RageUI.Button(
                        "Clear Weapons",
                        nil,
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                RemoveAllPedWeapons(PlayerPedId(), false)
                                notify("~g~Cleared Weapons")
                            end
                        end
                    )
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "animations")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    RageUI.BackspaceMenuCallback(
                        function()
                            t = nil
                        end
                    )
                    for H, I in pairs(e) do
                        if IsControlJustPressed(0, 22) then
                            tXTRA.clientPrompt(
                                "Search for: ",
                                "",
                                function(J)
                                    if J ~= "" then
                                        t = string.lower(J)
                                    end
                                end
                            )
                        end
                        if t == nil then
                            RageUI.ButtonWithStyle(
                                H,
                                nil,
                                {},
                                true,
                                function(A, B, C)
                                    if C then
                                        RMenu:Get("devmenu", "animations2"):SetTitle(H)
                                        RMenu:Get("devmenu", "animations2").MetaData = {dict = H, anims = I}
                                    end
                                end,
                                RMenu:Get("devmenu", "animations2")
                            )
                        else
                            for c = 1, #I do
                                if string.match(t, I[c]) then
                                    RageUI.ButtonWithStyle(
                                        H .. " " .. I[c],
                                        nil,
                                        {},
                                        true,
                                        function(A, B, C)
                                            if C then
                                                u(H)
                                                TaskPlayAnim(tXTRA.getPlayerPed(), H, I[c], 1.0, -1, -1, 1, 0, 0, 0, 0)
                                                RemoveAnimDict(H)
                                            end
                                        end
                                    )
                                end
                            end
                        end
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "animations2")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function(K)
                    for c = 1, #K.anims do
                        RageUI.ButtonWithStyle(
                            K.anims[c],
                            nil,
                            {},
                            true,
                            function(A, B, C)
                                if C then
                                    u(K.dict)
                                    TaskPlayAnim(tXTRA.getPlayerPed(), K.dict, K.anims[c], 1.0, -1, -1, 1, 0, 0, 0, 0)
                                    RemoveAnimDict(K.dict)
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "ipls")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function()
                    for H, I in pairs(f) do
                        RageUI.ButtonWithStyle(
                            H,
                            nil,
                            {},
                            true,
                            function(A, B, C)
                                if C then
                                    RMenu:Get("devmenu", "ipls2"):SetTitle(H)
                                    RMenu:Get("devmenu", "ipls2").MetaData = {ipls = I}
                                end
                            end,
                            RMenu:Get("devmenu", "ipls2")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "tplocations")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function(K)
                    for H, I in pairs(g) do
                        RageUI.ButtonWithStyle(
                            H,
                            nil,
                            {},
                            true,
                            function(A, B, C)
                                if C then
                                    RMenu:Get("devmenu", "tplocations2").MetaData = {tps = I}
                                end
                            end,
                            RMenu:Get("devmenu", "tplocations2")
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "nativesounds")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function(K)
                    for H, I in pairs(h) do
                        RageUI.ButtonWithStyle(
                            I[1],
                            I[2],
                            {},
                            true,
                            function(A, B, C)
                                if C then
                                    StopSound(k)
                                    ReleaseSoundId(k)
                                    k = GetSoundId()
                                    PlaySoundFrontend(k, I[1], I[2], I[3])
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "musicevents")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function(K)
                    RageUI.BackspaceMenuCallback(
                        function()
                            TriggerMusicEvent("BST_STOP")
                        end
                    )
                    for H, I in pairs(i) do
                        RageUI.ButtonWithStyle(
                            I,
                            "",
                            {},
                            true,
                            function(A, B, C)
                                if C then
                                    tXTRA.notify("~g~Playing " .. I)
                                    PrepareMusicEvent(I)
                                    TriggerMusicEvent(I)
                                end
                            end
                        )
                    end
                end
            )
        end
        if RageUI.Visible(RMenu:Get("devmenu", "propplacement")) then
            RageUI.DrawContent(
                {header = true, glare = false, instructionalButton = false},
                function(K)
                    RageUI.ButtonWithStyle(
                        "Prop Name: " .. l,
                        "",
                        {},
                        true,
                        function(A, B, C)
                            if C then
                                tXTRA.clientPrompt(
                                    "Prop Name: ",
                                    "",
                                    function(J)
                                        l = J
                                    end
                                )
                            end
                        end
                    )
                    RageUI.List(
                        "Pos X",
                        b,
                        n,
                        nil,
                        {},
                        true,
                        function(A, B, C, L)
                            n = L
                            if B then
                                DeleteEntity(m)
                                m = AddPropToPlayer(l, 60309, b[n], b[o], b[p], d[q], d[r], d[s])
                            end
                        end,
                        function()
                        end
                    )
                    RageUI.List(
                        "Pos Y",
                        b,
                        o,
                        nil,
                        {},
                        true,
                        function(A, B, C, L)
                            o = L
                            if B then
                                DeleteEntity(m)
                                m = AddPropToPlayer(l, 60309, b[n], b[o], b[p], d[q], d[r], d[s])
                            end
                        end,
                        function()
                        end
                    )
                    RageUI.List(
                        "Pos Z",
                        b,
                        p,
                        nil,
                        {},
                        true,
                        function(A, B, C, L)
                            p = L
                            if B then
                                DeleteEntity(m)
                                m = AddPropToPlayer(l, 60309, b[n], b[o], b[p], d[q], d[r], d[s])
                            end
                        end,
                        function()
                        end
                    )
                    RageUI.List(
                        "Rot X",
                        d,
                        q,
                        nil,
                        {},
                        true,
                        function(A, B, C, L)
                            q = L
                            if B then
                                DeleteEntity(m)
                                m = AddPropToPlayer(l, 60309, b[n], b[o], b[p], d[q], d[r], d[s])
                            end
                        end,
                        function()
                        end
                    )
                    RageUI.List(
                        "Rot Y",
                        d,
                        r,
                        nil,
                        {},
                        true,
                        function(A, B, C, L)
                            r = L
                            if B then
                                DeleteEntity(m)
                                m = AddPropToPlayer(l, 60309, b[n], b[o], b[p], d[q], d[r], d[s])
                            end
                        end,
                        function()
                        end
                    )
                    RageUI.List(
                        "Rot Z",
                        d,
                        s,
                        nil,
                        {},
                        true,
                        function(A, B, C, L)
                            s = L
                            if B then
                                DeleteEntity(m)
                                m = AddPropToPlayer(l, 60309, b[n], b[o], b[p], d[q], d[r], d[s])
                            end
                        end,
                        function()
                        end
                    )
                end
            )
        end
    end
)
function AddPropToPlayer(M, N, O, P, Q, R, S, T)
    local U = PlayerPedId()
    local V, W, X = table.unpack(GetEntityCoords(U))
    tXTRA.loadModel(M)
    local Y = CreateObject(GetHashKey(M), V, W, X + 0.2, true, true, true)
    AttachEntityToEntity(Y, U, GetPedBoneIndex(U, N), O, P, Q, R, S, T, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(M)
    return Y
end
RegisterCommand(
    "devmenu",
    function()
        if tXTRA.isDev() then
            TriggerServerEvent("XTRA:SerDevMenu")
        end
    end,
    false
)
RegisterNetEvent("XTRA:CliDevMenu")
AddEventHandler(
    "XTRA:CliDevMenu",
    function()
        if tXTRA.isDev() then
            RageUI.Visible(RMenu:Get("devmenu", "main"), true)
        end
    end
)
function tXTRA.gridPositionSaver(Z, _, a0)
    tXTRA.notify("pick 1st coord, press Y when done")
    while not IsControlJustPressed(0, 246) do
        Wait(0)
    end
    local a1 = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    Wait(250)
    tXTRA.notify("pick 2nd coord, press Y when done")
    while not IsControlJustPressed(0, 246) do
        Wait(0)
    end
    local a2 = GetEntityCoords(PlayerPedId())
    Wait(250)
    tXTRA.notify("pick 3rd coord, press Y when done")
    while not IsControlJustPressed(0, 246) do
        Wait(0)
    end
    local a3 = GetEntityCoords(PlayerPedId())
    local a4 = {}
    for c = 0, a0 - 1, 1 do
        for a5 = 0, _ - 1, 1 do
            local a6 = a2 - a1
            local a7 = a3 - a1
            local a8 =
                a1 + vector3(a7.x / _ * a5, a7.y / _ * a5, a7.z / _ * a5) +
                vector3(a6.x / a0 * c, a6.y / a0 * c, a6.z / a0 * c)
            tXTRA.loadModel("a_m_m_fatlatin_01")
            local a9 = XTRA.spawnVehicle(Z, a8.x, a8.y, a8.z, heading, false, false, false)
            CreatePedInsideVehicle(a9, 0, "a_m_m_fatlatin_01", -1, false, false)
            SetModelAsNoLongerNeeded("a_m_m_fatlatin_01")
            table.insert(a4, a8)
        end
    end
    for c = 1, #a4, 1 do
        print("vector4(" .. a4[c].x .. "," .. a4[c].y .. "," .. a4[c].z .. "," .. heading .. "),")
    end
end
Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(0)
            if a then
                local aa = IsPedInAnyVehicle(PlayerPedId()) and GetVehiclePedIsIn(PlayerPedId(), false) or PlayerPedId()
                local V, W, X = table.unpack(GetEntityCoords(aa, true))
                roundx = tonumber(string.format("%.2f", V))
                roundy = tonumber(string.format("%.2f", W))
                roundz = tonumber(string.format("%.2f", X))
                tXTRA.DrawText(0.32, 0.00, "X:~s~ " .. roundx, 0.4)
                tXTRA.DrawText(0.38, 0.00, "Y:~s~ " .. roundy, 0.4)
                tXTRA.DrawText(0.445, 0.00, "Z:~s~ " .. roundz, 0.4)
                heading = GetEntityHeading(aa)
                roundh = tonumber(string.format("%.2f", heading))
                tXTRA.DrawText(0.50, 0.00, "H:~s~ " .. roundh, 0.4)
                local ab, ac, ad = table.unpack(GetEntityRotation(PlayerPedId(), 1))
                tXTRA.DrawText(0.38, 0.03, "RX:~s~ " .. tonumber(string.format("%.2f", ab)), 0.4)
                tXTRA.DrawText(0.44, 0.03, "RY:~s~ " .. tonumber(string.format("%.2f", ac)), 0.4)
                tXTRA.DrawText(0.495, 0.03, "RZ:~s~ " .. tonumber(string.format("%.2f", ad)), 0.4)
                speed = GetEntitySpeed(PlayerPedId())
                rounds = tonumber(string.format("%.2f", speed))
                tXTRA.DrawText(0.40, 0.92, "Player Speed: ~s~" .. rounds, 0.4)
                health = GetEntityHealth(PlayerPedId())
                tXTRA.DrawText(0.40, 0.95, "Player Health: ~s~" .. health, 0.4)
                camRotX = GetGameplayCamRot(2).x
                tXTRA.DrawText(0.36, 0.88, "CR X: ~s~" .. tonumber(string.format("%.2f", camRotX)), 0.4)
                camRotY = GetGameplayCamRot(2).y
                tXTRA.DrawText(0.44, 0.88, "CR Y: ~s~" .. tonumber(string.format("%.2f", camRotY)), 0.4)
                camRotZ = GetGameplayCamRot(2).z
                tXTRA.DrawText(0.51, 0.88, "CR Z: ~s~" .. tonumber(string.format("%.2f", camRotZ)), 0.4)
                veheng = GetVehicleEngineHealth(GetVehiclePedIsUsing(PlayerPedId()))
                vehbody = GetVehicleBodyHealth(GetVehiclePedIsUsing(PlayerPedId()))
                if IsPedInAnyVehicle(PlayerPedId(), 1) then
                    vehenground = tonumber(string.format("%.2f", veheng))
                    vehbodround = tonumber(string.format("%.2f", vehbody))
                    tXTRA.DrawText(0.015, 0.76, "Engine Health: ~s~" .. vehenground, 0.4)
                    tXTRA.DrawText(0.015, 0.73, "Body Health: ~s~" .. vehbodround, 0.4)
                    tXTRA.DrawText(
                        0.015,
                        0.70,
                        "Vehicle Fuel: ~s~" ..
                            tonumber(string.format("%.2f", GetVehicleFuelLevel(GetVehiclePedIsUsing(PlayerPedId())))),
                        0.4
                    )
                end
            end
        end
    end
)
local ae = {}
ae.moveSpeed = 50.0
ae.mouseSpeed = 500.0
ae.camera = nil
ae.min = nil
ae.max = nil
ae.selectedType = "NONE"
ae.selectedDistance = 0.0
local function af(ag, ah)
    local ai = 0.001
    local aj = {
        vector3(ag.x - ai, ag.y - ai, ag.z - ai),
        vector3(ah.x + ai, ag.y - ai, ag.z - ai),
        vector3(ah.x + ai, ah.y + ai, ag.z - ai),
        vector3(ag.x - ai, ah.y + ai, ag.z - ai),
        vector3(ag.x - ai, ag.y - ai, ah.z + ai),
        vector3(ah.x + ai, ag.y - ai, ah.z + ai),
        vector3(ah.x + ai, ah.y + ai, ah.z + ai),
        vector3(ag.x - ai, ah.y + ai, ah.z + ai)
    }
    return aj
end
local function ak(aj)
    local al = {
        {aj[3], aj[2], aj[1]},
        {aj[4], aj[3], aj[1]},
        {aj[5], aj[6], aj[7]},
        {aj[5], aj[7], aj[8]},
        {aj[3], aj[4], aj[7]},
        {aj[8], aj[7], aj[4]},
        {aj[1], aj[2], aj[5]},
        {aj[6], aj[5], aj[2]},
        {aj[2], aj[3], aj[6]},
        {aj[3], aj[7], aj[6]},
        {aj[5], aj[8], aj[4]},
        {aj[5], aj[4], aj[1]}
    }
    return al
end
local function am(al)
    for c, an in ipairs(al) do
        local ao = an[1].x
        local ap = an[1].y
        local aq = an[1].z
        local ar = an[2].x
        local as = an[2].y
        local at = an[2].z
        local au = an[3].x
        local av = an[3].y
        local aw = an[3].z
        DrawPoly(ao, ap, aq, ar, as, at, au, av, aw, c * 19, 255 - c * 19, 0, 200)
    end
end
local function ax(ag, ah)
    local aj = af(ag, ah)
    local al = ak(aj)
    am(al)
end
local function ay()
    local az = GetFrameTime()
    local aA, aB, aC, aD = GetCamMatrix(ae.camera)
    local aE = GetCamRot(ae.camera, 2)
    DisableControlAction(0, 32, true)
    if IsDisabledControlPressed(0, 32) then
        aD = aD + aB * ae.moveSpeed * az
    end
    DisableControlAction(0, 34, true)
    if IsDisabledControlPressed(0, 34) then
        aD = aD - aA * ae.moveSpeed * az
    end
    DisableControlAction(0, 33, true)
    if IsDisabledControlPressed(0, 33) then
        aD = aD - aB * ae.moveSpeed * az
    end
    DisableControlAction(0, 35, true)
    if IsDisabledControlPressed(0, 35) then
        aD = aD + aA * ae.moveSpeed * az
    end
    DisableControlAction(0, 22, true)
    if IsDisabledControlPressed(0, 22) then
        aD = aD + aC * ae.moveSpeed * az
    end
    DisableControlAction(0, 21, true)
    if IsDisabledControlPressed(0, 21) then
        aD = aD - aC * ae.moveSpeed * az
    end
    DisableControlAction(0, 1, true)
    local aF = -GetDisabledControlNormal(0, 1) * ae.mouseSpeed * az
    aE = aE + vector3(0.0, 0.0, aF)
    DisableControlAction(0, 2, true)
    local aG = -GetDisabledControlNormal(0, 2) * ae.mouseSpeed * az
    if math.abs(aE.x + aG) < 70.0 then
        aE = aE + vector3(aG, 0.0, 0.0)
    end
    SetCamCoord(ae.camera, aD.x, aD.y, aD.z)
    SetCamRot(ae.camera, aE.x, aE.y, aE.z, 2)
end
local function aH()
    DisableControlAction(0, 24, true)
    if IsDisabledControlPressed(0, 24) then
        if ae.selectedType == "NONE" then
            local aI, V, W = GetScreenCoordFromWorldCoord(ae.min.x, ae.min.y, ae.min.z)
            if aI and math.abs(V - 0.5) < 0.02 and math.abs(W - 0.5) < 0.05 then
                ae.selectedType = "MIN"
                ae.selectedDistance = #(GetCamCoord(ae.camera) - ae.min)
                return
            end
            local aI, V, W = GetScreenCoordFromWorldCoord(ae.max.x, ae.max.y, ae.max.z)
            if aI and math.abs(V - 0.5) < 0.02 and math.abs(W - 0.5) < 0.05 then
                ae.selectedType = "MAX"
                ae.selectedDistance = #(GetCamCoord(ae.camera) - ae.max)
                return
            end
        else
            local aA, aB, aC, aD = GetCamMatrix(ae.camera)
            if ae.selectedType == "MIN" then
                ae.min = aD + aB * ae.selectedDistance
            else
                ae.max = aD + aB * ae.selectedDistance
            end
        end
    else
        ae.selectedType = "NONE"
    end
    DisableControlAction(0, 177, true)
    if IsDisabledControlPressed(0, 177) then
        toggleBoundsEditor()
    end
end
local function aJ()
    DrawMarker(
        28,
        ae.min.x,
        ae.min.y,
        ae.min.z,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        3.0,
        3.0,
        3.0,
        0,
        0,
        255,
        255,
        false,
        false,
        2,
        false,
        nil,
        nil,
        false
    )
    DrawMarker(
        28,
        ae.max.x,
        ae.max.y,
        ae.max.z,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        3.0,
        3.0,
        3.0,
        0,
        0,
        255,
        255,
        false,
        false,
        2,
        false,
        nil,
        nil,
        false
    )
    ax(ae.min, ae.max)
end
local function aK()
    ay()
    aH()
    aJ()
end
function toggleBoundsEditor()
    if ae.camera then
        SetPlayerControl(PlayerId(), true, 0)
        RenderScriptCams(false, false, 0, false, false)
        SetCamActive(ae.camera, false)
        DestroyCam(ae.camera, false)
        ae.camera = nil
        tXTRA.clientPrompt(
            "Bounds",
            tostring(ae.min) .. ", " .. tostring(ae.max),
            function()
            end
        )
        RageUI.Visible(RMenu:Get("devmenu", "main"), false)
    else
        SetPlayerControl(PlayerId(), false, 0)
        local aL = PlayerPedId()
        local aM = GetEntityCoords(aL, true)
        ae.camera = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", aM.x, aM.y, aM.z, 0.0, 0.0, 0.0, 70.0, false, false)
        SetCamActive(ae.camera, true)
        RenderScriptCams(true, false, 0, false, false)
        ae.min = GetOffsetFromEntityInWorldCoords(aL, -10.0, -10.0, 0.0)
        ae.max = GetOffsetFromEntityInWorldCoords(aL, 10.0, 10.0, 20.0)
        Citizen.CreateThread(
            function()
                while ae.camera do
                    aK()
                    Citizen.Wait(0)
                end
            end
        )
        RageUI.Visible(RMenu:Get("devmenu", "main"), false)
    end
end
function tXTRA.createDebugObject(aN)
    local aO = tXTRA.loadModel(aN)
    local aP = GetEntityCoords(PlayerPedId())
    local aQ = CreateObject(aO, aP.x, aP.y, aP.z - 1, false, false, true)
    SetEntityInvincible(aQ, true)
    FreezeEntityPosition(aQ, true)
    SetEntityAlpha(aQ, 100, false)
    SetModelAsNoLongerNeeded(aO)
    local aR = true
    while aR do
        local aS = GetEntityCoords(aQ)
        local aT = GetEntityHeading(aQ)
        if IsControlPressed(0, 121) then
            SetEntityCoordsNoOffset(aQ, aS.x, aS.y, aS.z + 0.01)
        end
        if IsControlPressed(0, 178) then
            SetEntityCoordsNoOffset(aQ, aS.x, aS.y, aS.z - 0.01)
        end
        if IsControlPressed(0, 111) then
            SetEntityCoordsNoOffset(aQ, aS.x, aS.y + 0.01, aS.z)
        end
        if IsControlPressed(0, 110) then
            SetEntityCoordsNoOffset(aQ, aS.x, aS.y - 0.01, aS.z)
        end
        if IsControlPressed(0, 108) then
            SetEntityCoordsNoOffset(aQ, aS.x - 0.01, aS.y, aS.z)
        end
        if IsControlPressed(0, 107) then
            SetEntityCoordsNoOffset(aQ, aS.x + 0.01, aS.y, aS.z)
        end
        if IsControlPressed(0, 117) then
            SetEntityHeading(aQ, aT + 0.1)
        end
        if IsControlPressed(0, 118) then
            SetEntityHeading(aQ, aT - 0.1)
        end
        if IsControlJustPressed(0, 177) then
            print(aS, aT)
            SetEntityAlpha(aQ, 255, false)
            aR = false
        end
        Wait(0)
    end
end
