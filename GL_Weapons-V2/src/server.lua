local Tunnel = module('vrp', 'lib/Tunnel') -- call Tunnel from vrp
local Proxy = module('vrp', 'lib/Proxy') -- call Proxy from vrp
vRP = Proxy.getInterface('vRP') -- call vRP functions using Proxy
vRPclient = Tunnel.getInterface("vRP","GL_Weapons-V2")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_menu")
BMclient = Tunnel.getInterface("vRP_basic_menu","GL_Weapons-V2")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")


function sendWebHook1(webhook,msg)
  local connect = {
        {
            ["color"] = 007168,
            ["title"] = ""..GL.Weapons1.Name.." | Weapons V2",
            ["description"] = "" .. msg .. "",
            ["footer"] = {
                ["text"] = "Made by !General | Time [ " .. os.date("%x | %X") .. " ]",
            },
        }
    }
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
end
function sendWebHook2(webhook,msg)
    local connect = {
          {
              ["color"] = 007168,
              ["title"] = ""..GL.Weapons2.Name.." | Weapons V2",
              ["description"] = "" .. msg .. "",
              ["footer"] = {
                  ["text"] = "Made by !General | Time [ " .. os.date("%x | %X") .. " ]",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
  end
  function sendWebHook3(webhook,msg)
    local connect = {
          {
              ["color"] = 007168,
              ["title"] = ""..GL.Weapons3.Name.." | Weapons V2",
              ["description"] = "" .. msg .. "",
              ["footer"] = {
                  ["text"] = "Made by !General | Time [ " .. os.date("%x | %X") .. " ]",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
  end
  function sendWebHook4(webhook,msg)
    local connect = {
          {
              ["color"] = 007168,
              ["title"] = ""..GL.Weapons4.Name.." | Weapons V2",
              ["description"] = "" .. msg .. "",
              ["footer"] = {
                  ["text"] = "Made by !General | Time [ " .. os.date("%x | %X") .. " ]",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
  end
  function sendWebHook5(webhook,msg)
    local connect = {
          {
              ["color"] = 007168,
              ["title"] = ""..GL.Weapons5.Name.." | Weapons V2",
              ["description"] = "" .. msg .. "",
              ["footer"] = {
                  ["text"] = "Made by !General | Time [ " .. os.date("%x | %X") .. " ]",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
  end

  local function TakeWeapons1(player)
      local user_id = vRP.getUserId({player})
      for z, x in pairs(GL.Weapons1.TheWeapons) do
        vRPclient.giveWeapons(player, {{[z] = {ammo = x[1]}}, false})
      end
      sendWebHook1(GL.Weapons1.Log, "``` user_id : "..GetPlayerName(player).." ("..user_id..") \n Action : اخذ اسلحة ```")
  end

  local function TakeWeapons2(player)
    local user_id = vRP.getUserId({player})
    for z, x in pairs(GL.Weapons2.TheWeapons) do
      vRPclient.giveWeapons(player, {{[z] = {ammo = x[1]}}, false})
    end
    sendWebHook2(GL.Weapons2.Log, "``` user_id : "..GetPlayerName(player).." ("..user_id..") \n Action : اخذ اسلحة ```")
  end

  local function TakeWeapons3(player)
    local user_id = vRP.getUserId({player})
    for z, x in pairs(GL.Weapons3.TheWeapons) do
      vRPclient.giveWeapons(player, {{[z] = {ammo = x[1]}}, false})
    end
    sendWebHook3(GL.Weapons3.Log, "``` user_id : "..GetPlayerName(player).." ("..user_id..") \n Action : اخذ اسلحة ```")
  end

  local function TakeWeapons4(player)
    local user_id = vRP.getUserId({player})
    for z, x in pairs(GL.Weapons4.TheWeapons) do
      vRPclient.giveWeapons(player, {{[z] = {ammo = x[1]}}, false})
    end
    sendWebHook4(GL.Weapons4.Log, "``` user_id : "..GetPlayerName(player).." ("..user_id..") \n Action : اخذ اسلحة ```")
  end

  local function TakeWeapons5(player)
    local user_id = vRP.getUserId({player})
    for z, x in pairs(GL.Weapons5.TheWeapons) do
      vRPclient.giveWeapons(player, {{[z] = {ammo = x[1]}}, false})
    end
    sendWebHook5(GL.Weapons5.Log, "``` user_id : "..GetPlayerName(player).." ("..user_id..") \n Action : اخذ اسلحة ```")
  end

  vRP.registerMenuBuilder({"main", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
        local choices = {}
            if vRP.hasPermission({user_id, GL.Weapons1.Permission}) and GL.Weapons1.status == true then
              choices[""..GL.Weapons1.Name..""] = {TakeWeapons1,'Made By : !General#7935'}
            end
        add(choices)
    end
  end})

  vRP.registerMenuBuilder({"main", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
        local choices = {}
            if vRP.hasPermission({user_id, GL.Weapons2.Permission}) and GL.Weapons2.status == true then
              choices[""..GL.Weapons2.Name..""] = {TakeWeapons2,'Made By : !General#7935'}
            end
        add(choices)
    end
  end})

  vRP.registerMenuBuilder({"main", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
        local choices = {}
            if vRP.hasPermission({user_id, GL.Weapons3.Permission}) and GL.Weapons3.status == true then
              choices[""..GL.Weapons3.Name..""] = {TakeWeapons3,'Made By : !General#7935'}
            end
        add(choices)
    end
  end})

  vRP.registerMenuBuilder({"main", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
        local choices = {}
            if vRP.hasPermission({user_id, GL.Weapons4.Permission}) and GL.Weapons4.status == true then
              choices[""..GL.Weapons4.Name..""] = {TakeWeapons4,'Made By : !General#7935'}
            end
        add(choices)
    end
  end})

  vRP.registerMenuBuilder({"main", function(add, data)
    local user_id = vRP.getUserId({data.player})
    if user_id ~= nil then
        local choices = {}
            if vRP.hasPermission({user_id, GL.Weapons5.Permission}) and GL.Weapons5.status == true then
              choices[""..GL.Weapons5.Name..""] = {TakeWeapons5,'Made By : !General#7935'}
            end
        add(choices)
    end
  end})