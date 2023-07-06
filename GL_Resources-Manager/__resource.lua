dependency "vrp"
fx_version 'bodacious'
games { 'gta5' }

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

    
server_scripts {
    '@vrp/lib/utils.lua',
    "Don't Edit/server.lua",
    "Config.lua"
}

client_scripts {
    'lib/Tunnel.lua',
    'lib/Proxy.lua'
}