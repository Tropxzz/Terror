	-- ui varibles
	local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
	local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

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



	-- interface settings
	InterfaceManager:SetLibrary(Fluent)
	InterfaceManager:BuildInterfaceSection(Settings)

