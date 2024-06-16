fx_version 'cerulean'
game 'gta5'

description 'Admin Item Spawn Menu for ESX using ox_lib by d3thethird'

lua54 'yes'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    '@ox_lib/init.lua',
    'client.lua'
}

dependencies {
    'es_extended',
    'ox_lib'
}
