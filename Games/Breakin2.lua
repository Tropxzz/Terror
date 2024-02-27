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

function TeleportTo(c)
	player.Character.HumanoidRootPart.CFrame = c
end

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

   Ingame:AddParagraph({
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

   Ingame:AddParagraph({
        Title = "Section 2",
	Content = "This section contains  NPC Exploits"
})

Ingame:AddButton({
	Title = "Get all NPCS",
	Description = "gets all npcs.",
	Callback = function()
		local function GiveItem(Item)
			if Item == "Armor" then
				Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(game.Players.LocalPlayer), 1)
			else
				Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
			end
		end
		
		local function GetDog()
			for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Assets.Note.Note.Note:GetChildren()) do
				if v.Name:match("Circle") and v.Visible == true then
					GiveItem(tostring(v.Name:gsub("Circle", "")))
					task.wait(.1)
					player.Backpack:WaitForChild(tostring(v.Name:gsub("Circle", ""))).Parent = player.Character
					TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637, -0.238445505, 7.71292363e-09, 0.971155882, 1.2913591e-10, 1, -7.91029819e-09, -0.971155882, -1.76076387e-09, -0.238445505))
					task.wait(.5)
					Events:WaitForChild("CatFed"):FireServer(tostring(v.Name:gsub("Circle", "")))
				end
			end
			task.wait(2)
			for i = 1, 3 do
				TeleportTo(CFrame.new(-203.533081, 30.4500484, -790.901428, -0.0148558766, 8.85941187e-09, -0.999889672, 2.65695732e-08, 1, 8.46563175e-09, 0.999889672, -2.64408779e-08, -0.0148558766) + Vector3.new(0, 5, 0))
				task.wait(.1)
			end
		end

		local function GetAgent()
			GiveItem("Louise")
			task.wait(.1)
			player.Backpack:WaitForChild("Louise").Parent = player.Character
			Events:WaitForChild("LouiseGive"):FireServer(2)
		end	

		local function GetUncle()
			GiveItem("Key")
			task.wait(.1)
			player.Backpack:WaitForChild("Key").Parent = player.Character
			wait(.5)
			Events.KeyEvent:FireServer()
		end
		
		GetUncle()
		task.wait(3)
		GetDog()
		task.wait(3)
		GetAgent()
	end,
})

   Ingame:AddParagraph({
        Title = "Section 3",
	Content = "This section contains  item Exploits"
})

  local pizzagoldyes = Ingame:AddToggle("Inf gold pizza fr", {Title = "freegoldpizza", Default = false })

    pizzagoldyes:OnChanged(function()
	while pizzagoldyes.Value == true do
		local function GiveItem(Item)
			if Item == "Armor" then
				Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(player), 1)
			else	
				Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
			end
		end

		GiveItem("Gold Pizza")
	wait(0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)	
	end
end)

--[[

]]

    local Weapons = Ingame:AddDropdown("Dropdown", {
        Title = "Weapons",
        Values = {},
        Multi = false,
        Default = "",
})
if game.PlaceId == 13864667823 then
		for i,v in pairs(game.ReplicatedStorage.Vending.Weapons:GetDescendants()) do
 if v:IsA("Model") then
   table.insert(Weapons.Values, v.Name)
	end
	end
end


   Weapons:OnChanged(function(Value)
	-- if the github account hello-n-bye steals this im suing 😎 HE FUCKING MADE THE 0 DOLLAR IDEA
		local args = {
    [1] = 3,
    [2] = Value,
    [3] = "Weapons",
    [4] = "jopzllwastaken",
    [6] = 0
	}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Vending"):FireServer(unpack(args))
end)
	
	 


local Items = Ingame:AddDropdown("Items", {
        Title = "Items",
        Values = {"Gold Pizza", "Armor", "MedKit"},
        Multi = false,
        Default = 1,
})

  Items:OnChanged(function(Value)
 		local function GiveItem(Item)
			if Item == "Armor" then
				Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(player), 1)
			else
				Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
			end
		end

		GiveItem(Value)
    end)

local core = game:GetService("CoreGui")
for _,v in ipairs(core:GetDescendants()) do
if v.ClassName == "TextLabel" then
if v.Text == "Weapons" or v.Text == "Items" then
local newLabel = v.Parent.Parent.TextButton.TextLabel
newLabel.Text = "Select One"
end
end
end



-- settings

	InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Settings)

	Dialog.yellow("The Script Terror has loaded")


