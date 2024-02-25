local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Dialog = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/TerrorDialog.lua", true))()
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")

local player = game.Players.LocalPlayer

local Window = Fluent:CreateWindow({
		Title = "Terror 1.0 - Break in 2",
		SubTitle = "by Jimmy/Tropxz",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Lobby = Window:AddTab({ Title = "Lobby", Icon = "egg" })
local Ingame = Window:AddTab({ Title = "Ingame", Icon = "egg" })
local Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })



Window:SelectTab(1)

-- Lobby

   Lobby:AddParagraph({
        Title = "Section 1",
	Content = "This section contains Role Exploits"
})

 Lobby:AddButton({
        Title = "Nerd",
        Description = 'Makes ur Role "Nerd".',
        Callback = function()
           local A_1 = "Book"
		if game:GetService("ReplicatedStorage").RemoteEvents:FindFirstChild("OutsideRole") ~= nil  then
			local Event = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("OutsideRole")
			Event:FireServer(A_1)
		end
        end
    })


Lobby:AddButton({
        Title = "Hacker",
        Description = 'Makes ur Role "Hacker".',
        Callback = function()
           local A_1 = "Phone"
		if game:GetService("ReplicatedStorage").RemoteEvents:FindFirstChild("OutsideRole") ~= nil  then
			local Event = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("OutsideRole")
			Event:FireServer(A_1)
		end
        end
    })



-- Ingame

   Lobby:AddParagraph({
        Title = "Section 1",
	Content = "This section contains Speed/Strength Exploits"
})

Ingame:AddButton({
        Title = "Max Speed",
        Description = 'Maxes out your speed.',
        Callback = function()
          	local function Train(Ability)
			Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
		end
		local a = 0
		while wait(1) do
			a = a + 1
			if a ~= 5 then
				Train("Strength")
			end
		end
	end,
})



Ingame:AddButton({
        Title = "Max Strength",
        Description = 'Maxes out ur strength.',
        Callback = function()
               	local function Train(Ability)
			Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
		end
		local a = 0
		while wait(1) do
			a = a + 1
			if a ~= 5 then
				Train("Speed")
			end
		end
	end,
})

Ingame:AddButton({
        Title = "+1 Strength",
        Description = 'Adds one strength point.',
        Callback = function()
               	local function Train(Ability)
			Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
		end
		Train("Strength")
	end,
})

Ingame:AddButton({
        Title = "+1 Speed",
        Description = 'Adds one Speed point.',
        Callback = function()
               	local function Train(Ability)
			Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
		end
		Train("Speed")
	end,
})

   Lobby:AddParagraph({
        Title = "Section 2",
	Content = "This section contains  NPC Exploits"
})


-- settings

	InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Settings)

	Dialog.yellow("The Script Terror has loaded")
