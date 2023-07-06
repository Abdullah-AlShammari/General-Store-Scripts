dependency "vrp"
fx_version 'bodacious'
games { 'gta5' }

resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page "html/index.html"
    
server_scripts {
    '@vrp/lib/utils.lua',
    'src/server.lua',
    "sv_Config.lua"
}

client_scripts {
    'lib/Tunnel.lua',
    'lib/Proxy.lua',
    "src/cl_notify.lua"
}

files {
    "html/index.html",
    "html/pNotify.js",
    "html/noty.js",
    "html/noty.css",
    "html/themes.css",
    "html/sound-example.wav"
}