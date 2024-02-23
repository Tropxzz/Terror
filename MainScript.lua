	-- ui varibles
	local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
	local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
	local ESPModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/ESPModule.lua", true))()
	local AimbotModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/Aimbot.lua", true))()

-- varibles
	local PlaceId = game.PlaceId
	local JobId = game.JobId
	local player = game.Players.LocalPlayer
	-- main script

	local Window = Fluent:CreateWindow({
		Title = "Terror" .. Fluent.Version,
		SubTitle = "by Jimmy/Tropxz",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
		Theme = "Light",
		MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
	})

		Main = Window:AddTab({ Title = "Welcome", Icon = "home" })
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

	-- interface settings
	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:BuildInterfaceSection(Settings)

