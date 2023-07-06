
local Tunnel = module('vrp', 'lib/Tunnel') -- call Tunnel from vrp
local Proxy = module('vrp', 'lib/Proxy') -- call Proxy from vrp
vRP = Proxy.getInterface('vRP') -- call vRP functions using Proxy
vRPclient = Tunnel.getInterface("vRP","General_GPS-V1")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_menu")
BMclient = Tunnel.getInterface("vRP_basic_menu","General_GPS-V1")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")


function sendWebHook(webhook,msg)
  local connect = {
        {
            ["color"] = color,
            ["title"] = "[---- GPS LOG V1 ----]",
            ["description"] = "" .. msg .. "",
            ["footer"] = {
                ["text"] = "Made by General Store | Time [ " .. os.date("%x | %X") .. " ]",
                ["icon_url"] = ""
            },
        }
    }
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
end


function GPS(Player, ch)
  local user_id = vRP.getUserId({Player})
  for k, v in pairs(GL.Locatins) do
    if v.MenuName == ch then
      vRPclient.setGPS(Player,{v.GPS_xyz[1],v.GPS_xyz[2],v.GPS_xyz[3]})
      TriggerClientEvent("pNotify:SendNotification",Player,{text = "<span style='color:white;text-align: center;font-weight: 900'><h1><h2>"..GL.General['notifyMassgge'].."<h3 style='color:green'></span>",
      type = "success",
      timeout = ("2500"),
      open = "gta_effects_open",
      close = "gta_effects_close",
      killer = false,
      layout = "centerRight",
      sounds = {
      sources = {"https://cdn.discordapp.com/attachments/881254583630962698/906692849024766032/NotifySound.mp3"},
      volume = 0.5, -- حجم الصوت
      conditions = {"docVisible"}
      }})
      sendWebHook(GL.General['log'],"```➤ ID : "..user_id.."\n➤ Locate on : "..v.MenuName.."```")
    end
  end
end

local function GPS_Locatins(player,choice)
  vRP.buildMenu({"GPS_Locatins", {player = player}, function(menu)
      menu.name = "GPS_Locatins"
      menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
      menu.onclose = function(player) vRP.openMainMenu({player}) end
      local user_id = vRP.getUserId({player})
      for k, v in pairs(GL.Locatins) do
        menu[""..v.MenuName..""] = {GPS}
      end
          vRP.openMenu({player,menu})
  end})
end

vRP.registerMenuBuilder({"main", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
      local choices = {}
            choices[""..GL.General['MenuName']..""] = {GPS_Locatins,'Made By General Store'}
      add(choices)
  end
end})

-----------------------------------------------------------------------------------------------