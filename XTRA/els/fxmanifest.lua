


fx_version "bodacious"
games { "gta5" }
lua54 "yes"
is_cfxv2 "yes"
use_fxv2_oal "yes"
ui_page 'dist/ui.html'
files { 
	"config.json", 
	"patterns/*.json", 
	"xmls/vcfs.json", 
	"xmls/vcf/*.xml",
	'dist/ui.html'
}

client_scripts { 
	"shared/events.lua", 
	"client/*.lua",
	"dist/client.js" 
}

server_scripts { 
	"shared/events.lua", 
	"server/*.lua",
	"dist/server.js"
}
