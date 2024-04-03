fx_version 'bodacious'
games { 'gta5' }
description "RP module/framework"
ui_page "ui/index.html"
-- client scripts
client_scripts{
    "@xtra/lib/utils.lua",
    "client/*.lua",
}
-- client files
files{
    "ui/*.ttf",
    "ui/*.otf",
    "ui/*.woff",
    "ui/*.woff2",
    "ui/*.css",
    "ui/*.png",
    "ui/main.js",
    "ui/index.html",
    "ui/index.html",
    "images/*.png",
    "ui/*.otf",
    "ui/*.mp3",
    -- Loading Screen
    'loading/**',
}
loadscreen 'loading/index.html'
loadscreen_manual_shutdown "yes"
