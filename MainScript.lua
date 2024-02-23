	
-- ui varibles
	local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
	local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
	local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/ESPModule.lua", true))()
	local AimbotModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/Aimbot.lua", true))()
	local Dialog = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/TerrorDialog.lua", true))()
-- varibles
	local PlaceId = game.PlaceId
	local JobId = game.JobId
	local player = game.Players.LocalPlayer
	-- main script

	local Window = Fluent:CreateWindow({
		Title = "Terror 1.0",
		SubTitle = "by Jimmy/Tropxz",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
	})

		Main = Window:AddTab({ Title = "Welcome", Icon = "home" })
		Plr = Window:AddTab({ Title = "Player", Icon = "user" })
		Combat = Window:AddTab({ Title = "Combat", Icon = "swords" })
		Trolling = Window:AddTab({ Title = "Trolling", Icon = "venetian-mask" })
		Commands = Window:AddTab({ Title = "Commands", Icon = "terminal-square" })
		Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })

	  Main:AddParagraph({
		Title = "Welcome",
		Content = "Welcome "..game.Players.LocalPlayer.DisplayName.." This script was made By Tropxz/Jimmy Were the same person if u couldnt tell"
	})

	Main:AddButton({
		Title = "Rejoin",
		Description = "Rejoin the server.",
		Callback = function()
			game["Teleport Service"]:TeleportToPlaceInstance(PlaceId, JobId, player)
		end
})

Main:AddButton({
	Title = "Serverhop",
	Description = "Join another server easily.",
	Callback = function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, player)
	end
})

-- Combat


local ESP = Combat:AddToggle("ESP", {Title = "ESP", Default = false })

ESP:OnChanged(function()
	if ESP.Value == false  then
		ESPModule.DisableESP()
	elseif ESP.Value == true  then
		ESPModule.ShowESP()
	end
end)
-- lesson learnt never add a debounce to a toggle in a ui library lmfao (fyi it broke)
-- Alr hmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm lets do 👑 Aimbot 👑
-- yo bros my old module things got me covered :fire:
-- ima just upload it to my github and were done basically

Combat:AddButton({
	Title = "Aimbot",
	Description = "Automatically aims when u hold RB.",
	Callback = function()
		AimbotModule.StartAimbot()
	end
})
_G.TracersVisible = false
local Toggle = Combat:AddToggle("Tracers by Exunys", {Title = "Tracers by Exunys", Default = false })
local tracescriptenabled = false
Toggle:OnChanged(function()
	if tracescriptenabled == false then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/ExternalScripts/EnuxysTracers", true))()
		tracescriptenabled = true
	end
	if Toggle.Value == false then
		_G.TracersVisible = false
	else
		_G.TracersVisible = true
	end
end)


local Noclip = Combat:AddToggle("Noclip", {Title = "Noclip", Default = false })

Noclip:OnChanged(function()
	for i,v in ipairs(player.Character:GetDescendants()) do
		if v:IsA("MeshPart") or v:IsA("Part") then
			if Noclip.Value == false  then
              v.CanCollide = true
			elseif Noclip.Value == true  then
				v.CanCollide = false
			end
		end
	end
end)
	-- interface settings
	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:BuildInterfaceSection(Settings)


-- put code above this not under 👑😭🙏



	Dialog.yellow("The Script Terror has loaded")
