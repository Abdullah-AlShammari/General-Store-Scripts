local Tunnel = module('vrp', 'lib/Tunnel') -- call Tunnel from vrp
local Proxy = module('vrp', 'lib/Proxy') -- call Proxy from vrp
vRP = Proxy.getInterface('vRP') -- call vRP functions using Proxy
vRPclient = Tunnel.getInterface("vRP","GL_Resources-Manager")
vRPclient = Tunnel.getInterface("vRP","vRP_basic_menu")
BMclient = Tunnel.getInterface("vRP_basic_menu","GL_Resources-Manager")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")


function sendWebHook(webhook,msg)
  local connect = {
        {
            ["color"] = 007168,
            ["title"] = "Resources Manager",
            ["description"] = "" .. msg .. "",
            ["footer"] = {
                ["text"] = "Made by !General | Time [ " .. os.date("%x | %X") .. " ]",
            },
        }
    }
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = connect }), { ['Content-Type'] = 'application/json' })
end

function StopServer(player,choice)
  local user_id = vRP.getUserId({player})
  vRP.request({player, "هل انت متأكد من اطفاء السيرفر ؟", 15, function(player, ok)
    if ok then
      local PassCodeGenerate = math.random(1000,3500)
      vRP.prompt({player , "اكتب الرقم الموجود بين القوسين للتأكيد ("..PassCodeGenerate..")", "", function(player, PassCode)
        PassCode = parseInt(PassCode)
        if PassCode == PassCodeGenerate then
          local OOOO = vRP.getUsers({})
          for b,g in pairs(OOOO) do
            local nplayer = vRP.getUserSource({g})
            Wait(GL.AlertTime)
            sendWebHook(GL.StopServerWebHook,"```ايقاف تشغيل السيرفر```\n**ID: "..GetPlayerName(player).." [ "..user_id.." ]**")
            Wait(550)
            DropPlayer(g, GL.DropPlayerSbb)
            Wait(550)
            os.exit(-1)
          end
        end
      end})
    end
  end})
end

function start(player,choice)
  local user_id = vRP.getUserId({player})
  vRP.prompt({player ,"حط اسم السكربت هنا :","", function(player, Name)
      StartResource(Name)
      sendWebHook(GL.StartRWebhook,"```تشغيل سكربت```\n**ID: "..GetPlayerName(player).." [ "..user_id.." ]**\n**Resource Name:** `"..Name.."`")
  end})
end

function stop(player,choice)
  local user_id = vRP.getUserId({player})
  vRP.prompt({player ,"حط اسم السكربت هنا :","", function(player, Name)
    StopResource(Name)
    sendWebHook(GL.StopRWebhook,"```ايقاف تشغيل سكربت```\n**ID: "..GetPlayerName(player).." [ "..user_id.." ]**\n**Resource Name:** `"..Name.."`")
  end})
end

function restart(player,choice)
  local user_id = vRP.getUserId({player})
  vRP.prompt({player ,"حط اسم السكربت هنا :","", function(player, Name)
    StopResource(Name)
    StartResource(Name)
    sendWebHook(GL.ReStartRWebhook,"```اعادة تشغيل سكربت```\n**ID: "..GetPlayerName(player).." [ "..user_id.." ]**\n**Resource Name:** `"..Name.."`")
  end})
end

local function ResourceOPmenu(player,choice)
  vRP.buildMenu({"ResourceManager", {player = player}, function(menu)
      menu.name = "ResourceManager"
      menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
      menu.onclose = function(player) vRP.openMainMenu({player}) end
      local user_id = vRP.getUserId({player})
        if vRP.hasPermission({user_id,GL.StartRperm}) then
          menu[""..GL.StartRMenuName..""] = {start}
        end
        if vRP.hasPermission({user_id,GL.StopRperm}) then
          menu[""..GL.StopRMenuName..""] = {stop}
        end
        if vRP.hasPermission({user_id,GL.ReStartRperm}) then
          menu[""..GL.ReStartRMenuName..""] = {restart}
        end
        if vRP.hasPermission({user_id,GL.StopServerPerm}) then
          menu[""..GL.StopServerMenu..""] = {StopServer}
        end
      vRP.openMenu({player,menu})
    end})
  end

vRP.registerMenuBuilder({"admin", function(add, data)
  local user_id = vRP.getUserId({data.player})
  if user_id ~= nil then
      local choices = {}
            if vRP.hasPermission({user_id,GL.StartRperm}) or
            vRP.hasPermission({user_id,GL.StopRperm}) or
            vRP.hasPermission({user_id,GL.ReStartRperm}) or
            vRP.hasPermission({user_id,GL.StopServerPerm})
            then
            choices[""..GL.menuName..""] = {ResourceOPmenu,'Made By : !General'}
  end
      add(choices)
  end
end})

-----------------------------------------------------------------------------------------------
