queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)


if game.PlaceId == 13864667823  then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Games/Breakin2.lua", true))()
elseif game.PlaceId == 13864661000 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Games/breakin2lobby.lua",true))()
elseif game.PlaceId == 3956818381 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Games/NinjaLegends.lua", true))()
else
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Universal.lua", true))()
end

-- queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Tropxzz/Terror/main/Checker.lua', true))()")
