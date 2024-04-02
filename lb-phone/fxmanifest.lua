fx_version "cerulean"
game "gta5"
lua54 "yes"

version "1.4.3"

client_script "client/custom/hooks.lua"

shared_script {
    "config/*.lua",
    "shared/**/*.lua"
}

client_script "client/**/*.lua"

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/**/*.lua",
}

files {
    "ui/dist/**/*",
    "ui/components.js",
    "config/**/*"
}

ui_page "ui/dist/index.html"

dependencies {

}

escrow_ignore {
    "config/**/*",

    "client/apps/framework/**/*.lua",
    "server/apps/framework/**/*.lua",
    "shared/*.lua",

    "client/custom/**/*.lua",
    "server/custom/**/*.lua",

    "client/misc/debug.lua",
    "server/misc/debug.lua",

    "server/apiKeys.lua",
}

dependency '/assetpacks'