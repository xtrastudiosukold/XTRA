fx_version 'bodacious'

game 'gta5'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/static/css/app.css',
	'html/static/js/app.js',
	'html/static/js/manifest.js',
	'html/static/js/vendor.js',

	'html/static/config/config.json',
	
	-- Coque
	'html/static/img/coque/no_cover.png',

	
	-- Background
	'html/static/img/background/back001.jpg',
	'html/static/img/background/back002.jpg',
	'html/static/img/background/color.jpg',
	'html/static/img/background/humo.jpg',
	'html/static/img/background/iluminacion.jpg',
	'html/static/img/background/neon.jpg',
	'html/static/img/background/oscuridad.jpg',
	'html/static/img/background/paisajes.jpg',
	'html/static/img/background/playa.jpg',
	'html/static/img/background/tokio.jpg',
	
	'html/static/img/icons_app/call.png',
	'html/static/img/icons_app/contacts.png',
	'html/static/img/icons_app/ff.png',
	'html/static/img/icons_app/itunes.svg',
	'html/static/img/icons_app/lsfd.png',
	'html/static/img/icons_app/sms.png',
	'html/static/img/icons_app/settings.png',
	'html/static/img/icons_app/menu.png',
	'html/static/img/icons_app/bourse1.png',
	'html/static/img/icons_app/tchat.png',
	'html/static/img/icons_app/photo.png',
	'html/static/img/icons_app/policia.png',
	'html/static/img/icons_app/reddit.png',
	'html/static/img/icons_app/notes.png',
	'html/static/img/icons_app/banco.png',
	'html/static/img/icons_app/wifi.png',
	'html/static/img/icons_app/9gag.png',
	'html/static/img/icons_app/global.png',
	'html/static/img/icons_app/borrado.png',
	'html/static/img/icons_app/valet.png',
	
	'html/static/img/app_bank/fleeca_tar.png',
	'html/static/img/app_bank/tarjetas.png',

	'html/static/img/app_tchat/reddit.png',

	'html/static/img/global/bird.png',
	'html/static/img/global/default_profile.png',
	'html/static/sound/Global_Sound_Effect.ogg',

	'html/static/fonts/fontawesome-webfont.eot',
	'html/static/fonts/fontawesome-webfont.ttf',
	'html/static/fonts/fontawesome-webfont.woff',
	'html/static/fonts/fontawesome-webfont.woff2',

	'html/static/sound/*.ogg',

}

client_script {
	"locales/en.lua",
	"config.lua",
	"client/animation.lua",
	"client/client.lua",
	"client/photo.lua",
	"client/app_tchat.lua",
	"client/bank.lua",
	"client/global.lua"
}

server_script {
	'@xtra/lib/utils.lua',
	"locales/en.lua",
	"config.lua",
	"server/server.lua",
	"server/app_tchat.lua",
	"server/global.lua",
}
