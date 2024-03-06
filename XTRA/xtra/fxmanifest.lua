fx_version 'cerulean'
games {  'gta5' }
ui_page "ui/index.html"
minify "yes"
shared_scripts {
  "sharedcfg/*",
  --"cfg/cfg_*.lua",
  "shared/*.lua",
  "pma/shared.lua",
}
lua54 'yes'
-- client files
files{
  "cfg/client.lua",
  "cfg/cfg_*.lua",
  "cfg/events/cfg_*.lua",
  "cfg/weapons.lua",
  "cfg/blips_markers.lua",
  "cfg/atms.lua",
  "ui/index.html",
  "ui/design.css",
  "ui/main.js",
  "ui/ProgressBar.js",
  "ui/WPrompt.js",
  "ui/RequestManager.js",
  "ui/AnnounceManager.js",
  "ui/Div.js",
  "ui/dynamic_classes.js",
  "ui/fonts/Pdown.woff",
  "ui/fonts/GTA.woff",
  'ui/sounds/*',
  "ui/index.css",
  "ui/index.js",
  "ui/SoundManager.js",
  "ui/pnc/js/index.js",
  "ui/pnc/js/fine_types.js",
  "ui/pnc/css/index.css",
  "ui/fortniteui/*.js",
  "ui/fortniteui/*.css",
  "ui/fortniteui/*.png",
  "ui/fingerprintHacking/*",
  "ui/pnc/css/modal.css",
  "ui/pnc/fonts/modes.ttf",
  "ui/pnc/img/tax.png",
  "ui/pnc/img/plates.png",
  "ui/playerlist_images/*.png",
  "ui/killfeed/img/*.png",
  "ui/killfeed/font/stratum2-bold-webfont.woff",
  "ui/killfeed/index.js",
  "ui/killfeed/style.css",
  "ui/pnc/components/*.js",
  "ui/pnc/components/*.html",
  "ui/progress/*",
  "ui/radios/index.js",
  "ui/radios/index.css",
  "ui/speedometer/index.js",
  "ui/speedometer/index.css",
  "ui/money/img/*.png",
  "ui/money/index.js",
  "ui/money/index.css",
  "ui/radialmenu/index.js",
  "ui/radialmenu/RadialMenu.js",
  "ui/radialmenu/index.css",
  "ui/radialmenu/RadialMenu.css",
  "ui/skin/img/*.png",
  "ui/skin/img/heritage/*.jpg",
  "ui/skin/front.js",
  "ui/skin/script.js",
  "ui/skin/*.css",
  'ui/pma/*.ogg',
  'ui/pma/css/*.css',
  'ui/pma/js/*.js',
  "cfg/peds.meta",
	'audio/dlcvinewood_amp.dat10',
	'audio/dlcvinewood_amp.dat10.nametable',
	'audio/dlcvinewood_amp.dat10.rel',
	'audio/dlcvinewood_game.dat151',
	'audio/dlcvinewood_game.dat151.nametable',
	'audio/dlcvinewood_game.dat151.rel',
	'audio/dlcvinewood_mix.dat15',
	'audio/dlcvinewood_mix.dat15.nametable',
	'audio/dlcvinewood_mix.dat15.rel',
	'audio/dlcvinewood_sounds.dat54',
	'audio/dlcvinewood_sounds.dat54.nametable',
	'audio/dlcvinewood_sounds.dat54.rel',
	'audio/dlcvinewood_speech.dat4',
	'audio/dlcvinewood_speech.dat4.nametable',
	'audio/dlcvinewood_speech.dat4.rel',
	'audio/sfx/dlc_vinewood/casino_general.awc',
	'audio/sfx/dlc_vinewood/casino_interior_stems.awc',
	'audio/sfx/dlc_vinewood/casino_slot_machines_01.awc',
	'audio/sfx/dlc_vinewood/casino_slot_machines_02.awc',
	'audio/sfx/dlc_vinewood/casino_slot_machines_03.awc',
	'audio/sfx/dlc_vinewood/*.awc',
}
-- client scripts
client_scripts{
  "client_prod/cl_spawn.lua",
  "rageui/RMenu.lua",
	"rageui/menu/RageUI.lua",
	"rageui/menu/Menu.lua",
	"rageui/menu/MenuController.lua",
	"rageui/components/*.lua",
	"rageui/menu/elements/*.lua",
	"rageui/menu/items/*.lua",
	"rageui/menu/panels/*.lua",
	"rageui/menu/windows/*.lua",
  'pma/client/utils/*',
	'pma/client/init/proximity.lua',
	'pma/client/init/init.lua',
	'pma/client/init/main.lua',
	'pma/client/init/submix.lua',
	'pma/client/module/*.lua',
  'pma/client/*.lua',
  'dpclothing/Functions.lua', 		-- Global Functions / Events / Debug and Locale start.
	'dpclothing/en.lua', 				-- Locales.
	'dpclothing/Config.lua',			-- Configuration.
	'dpclothing/Variations.lua',		-- Variants, this is where you wanan change stuff around most likely.
	'dpclothing/Clothing.lua',
	'dpclothing/GUI.lua',		-- GUI, this is where you wanan change stuff around most likely.
  "lib/cl_mouse.lua",
  "lib/cl_thread.lua",
  "lib/cl_cache.lua",
  "lib/utils.lua",
  "client_prod/Tunnel.lua",
  "client_prod/Proxy.lua",
  "client_prod/base.lua",
  "client_prod/player_state.lua",
  "client_prod/survival.lua",
  "client_prod/admin.lua",
  "utils/cl_*.lua",
  "client_prod/iplloader.lua",
  "client_prod/cl_lscustomsmenu.lua",
  "client_prod/gui.lua",
  "client_prod/identity.lua",
  "client_prod/admin.lua",
  "client_prod/enumerators.lua",
  "client_prod/adminmenu.lua",
  "client_prod/cl_*.lua",
  "cfg/client.lua",
}
-- server scripts
server_scripts{ 
  'modules/ghmattimysql-server.js',
  'modules/ghmattimysql-server.lua',
  "lib/utils.lua",
  "base.lua",
  "modules/gui.lua",
  "modules/group.lua",
  "modules/admin.lua",
  "modules/survival.lua",
  "modules/player_state.lua",
  "modules/map.lua",
  "modules/inventory.lua",
  "modules/basic_items.lua",
  "modules/server_commands.lua",
  "modules/sv_*.lua",
  "modules/webhooks.lua", 
  "cfg/discordroles.lua",
  'pma/server/**/*.lua',
	'pma/server/**/*.js',
  "bot.js"
}



provides {
	'mumble-voip',
    'tokovoip',
    'toko-voip',
    'tokovoip_script'
}


server_exports { 
    "GetDiscordRoles",
    "GetRoleIdFromRoleName",
    "GetDiscordAvatar",
    "GetDiscordName",
    "IsDiscordEmailVerified",
    "GetDiscordNickname",
    "GetGuildIcon",
    "GetGuildSplash",
    "GetGuildName",
    "GetGuildDescription",
    "GetGuildMemberCount",
    "GetGuildOnlineMemberCount",
    "GetGuildRoleList",
    "ResetCaches",
    "CheckEqual",
    "SetNickname",
    'dmUser',
    'storedm'
}

convar_category 'PMA-Voice' {
  "PMA-Voice Configuration Options",
  {
  { "Use native audio", "$voice_useNativeAudio", "CV_BOOL", "false" },
{ "Use 2D audio", "$voice_use2dAudio", "CV_BOOL", "false" },
{ "Use sending range only", "$voice_useSendingRangeOnly", "CV_BOOL", "false" },
{ "Enable UI", "$voice_enableUi", "CV_INT", "0" },
{ "Enable F11 proximity key", "$voice_enableProximityCycle", "CV_INT", "1" },
{ "Proximity cycle key", "$voice_defaultCycle", "CV_STRING", "F11" },
{ "Voice radio volume", "$voice_defaultRadioVolume", "CV_INT", "30" },
{ "Voice call volume", "$voice_defaultCallVolume", "CV_INT", "60" },
{ "Enable radios", "$voice_enableRadios", "CV_INT", "1" },
{ "Enable calls", "$voice_enableCalls", "CV_INT", "1" },
{ "Enable submix", "$voice_enableSubmix", "CV_INT", "1" },
{ "Enable radio animation", "$voice_enableRadioAnim", "CV_INT", "0" },
{ "Radio key", "$voice_defaultRadio", "CV_STRING", "LALT" },
{ "UI refresh rate", "$voice_uiRefreshRate", "CV_INT", "200" },
{ "Allow players to set audio intent", "$voice_allowSetIntent", "CV_INT", "1" },
{ "External mumble server address", "$voice_externalAddress", "CV_STRING", "" },
{ "External mumble server port", "$voice_externalPort", "CV_INT", "0" },
{ "Voice debug mode", "$voice_debugMode", "CV_INT", "0" },
{ "Disable players being allowed to join", "$voice_externalDisallowJoin", "CV_INT", "0" },
{ "Hide server endpoints in logs", "$voice_hideEndpoints", "CV_INT", "1" },
  }
}
data_file "PED_METADATA_FILE" "cfg/peds.meta"
data_file 'AUDIO_GAMEDATA' 'audio/dlcvinewood_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/dlcvinewood_sounds.dat'
data_file 'AUDIO_DYNAMIXDATA' 'audio/dlcvinewood_mix.dat'
data_file 'AUDIO_SYNTHDATA' 'audio/dlcVinewood_amp.dat'
data_file 'AUDIO_SPEECHDATA' 'audio/dlcvinewood_speech.dat'
data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_vinewood'
server_export "getCurrentGameType"
server_export "getCurrentMap"
server_export "changeGameType"
server_export "changeMap"
server_export "doesMapSupportGameType"
server_export "getMaps"
server_export "roundEnded"
export 'getRandomSpawnPoint'
export 'spawnPlayer'
export 'addSpawnPoint'
export 'removeSpawnPoint'
export 'loadSpawns'
export 'setAutoSpawn'
export 'setAutoSpawnCallback'
export 'forceRespawn'
resource_type 'map' { gameTypes = { fivem = true } }
map 'map.lua'
