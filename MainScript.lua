			
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
				RPS = Window:AddTab({ Title = "RSP", Icon = "database" })
		      -- the fact i might've called it skid haven
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
		Title = "Screenshot",
		Description = "Takes a screenshot.",
		Callback = function()
				return game.CoreGui:TakeScreenshot()
			end
		})

		Main:AddButton({
			Title = "Serverhop",
			Description = "Join another server easily.",
			Callback = function()
				game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceId, player)
			end
})


Main:AddButton({
	Title = "AntiClientKick",
	Description = "Cant get kicked by the client. MADE BY IY",
	Callback = function()
			if not hookmetamethod then 
		return Dialog.red("Your executor doesn't support hookmetamethod")
	end
	local TeleportService = game["Teleport Service"]
	local oldhmmi
	local oldhmmnc
	oldhmmi = hookmetamethod(game, "__index", function(self, method)
		if self == TeleportService then
			if method:lower() == "teleport" then
				return error("Expected ':' not '.' calling member function Kick", 2)
			elseif method == "TeleportToPlaceInstance" then
				return error("Expected ':' not '.' calling member function TeleportToPlaceInstance", 2)
			end
		end
		return oldhmmi(self, method)
	end)
	oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
		if self == TeleportService and getnamecallmethod():lower() == "teleport" or getnamecallmethod() == "TeleportToPlaceInstance" then
			return
		end
		return oldhmmnc(self, ...)
	end)
	     end
		})

		-- Player

		Plr:AddSlider("Ws", {
			Title = "WalkSpeed",
			Description = "Speeds up your Player",
			Default = 16,
			Min = 16,
			Max = 1000,
			Rounding = 1,
			Callback = function(Value)
				player.Character.Humanoid.WalkSpeed = Value
			end
		});

		Plr:AddSlider("JP", {
			Title = "JUMPPOWER",
			Description = "Makes your character Jump Higher",
			Default = 50,
			Min = 50,
			Max = 1000,
			Rounding = 1,
			Callback = function(Value)
				player.Character.Humanoid.JumpPower = Value
			end
		});

		Plr:AddSlider("HipHeight", {
			Title = "HipHeight",
			Description = "Makes your character Float",
			Default = 1.9980254173278809,
			Min = 1.9980254173278809,
			Max = 250,
			Rounding = 1,
			Callback = function(Value)
				player.Character.Humanoid.HipHeight = Value
			end
});

local spinSpeed = 1
local s = Plr:AddToggle("Spin", {Title = "Spin", Default = false })

s:OnChanged(function()
	if s.Value == true then
		 for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
	else
		for i,v in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	end
    end)

    local Input = Plr:AddInput("SpinSpeed", {
        Title = "SpinSpeed",
        Default = "1",
        Placeholder = "1",
        Numeric = true, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
                    spinSpeed = Value
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

local Spectate = Combat:AddDropdown("Spectate", {
	Title = "Spectate",
	Values = {},
	Multi = false,
	Default = player.Name,
})

local names = {}
local players = game.Players:GetPlayers()
for i, player in ipairs(players) do
	table.insert(names, player.Name)
end
	Spectate:SetValues(names)

	Spectate:OnChanged(function(Value)
		if game.Players:FindFirstChild(Value) then
			workspace.CurrentCamera.CameraSubject = game.Players[Value].Character
		end
end)
-- Trolling

		local SF = Combat:AddToggle("SF", {Title = "Spinfling by JackMcJagger15 (R15)", Default = false })

		SF:OnChanged(function()
			
					if SF.Value == false  then
		for i,v in ipairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
			if v:IsA("BodyThrust") then
				v:Destroy()
			end
		end
			elseif SF.Value == true  then
				local power = 500 -- change this to make it more or less powerful

game:GetService('RunService').Stepped:connect(function()
game.Players.LocalPlayer.Character.Head.CanCollide = false
game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
end)
wait(.1)
local bambam = Instance.new("BodyThrust")
bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
bambam.Force = Vector3.new(power,0,power)
bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			end
end)

-- interface settings
			InterfaceManager:SetLibrary(Fluent)
			InterfaceManager:BuildInterfaceSection(Settings)


		-- put code above this not under 👑😭🙏 



			Dialog.yellow("The Script Terror has loaded")
		
		
