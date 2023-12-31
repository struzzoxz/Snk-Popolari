fx_version 'adamant'

game 'gta5'
author 'struzzoxz'
description 'Snk Popolari 1.1, con gridsystem'
version '1.1'
lua54 'yes'
shared_script '@es_extended/imports.lua'
client_scripts { 'client.lua', 'config.lua' }
server_scripts {'server.lua', 'config.lua'}

dependencies {
    'gridsystem',
    'ox_inventory'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/js/*.js',
    'nui/css/*.css',
    'nui/img/*',
    'nui/fonts/*'
}
