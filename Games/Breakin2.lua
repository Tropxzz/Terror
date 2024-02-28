local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local Dialog = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/TerrorDialog.lua", true))()
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")

local player = game.Players.LocalPlayer
_G.FreeHealthenabled = false

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
		_G.FreeHealthenabled = pizzagoldyes.Value 

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
local a = {}

if game.PlaceId == 13864667823  then
	for _, v in pairs(game.ReplicatedStorage.Vending.Weapons:GetDescendants()) do
        if v:IsA("Model") then
            table.insert(a, v.Name)
        end
    end
end

local Weapons = Ingame:AddDropdown("Dropdown", {
    Title = "Weapons",
    Values = a,
    Multi = false,
    Default = "",
})




   Weapons:OnChanged(function(Value)
	-- if the github account hello-n-bye steals this im suing 😎 HE FUCKING MADE THE 0 DOLLAR IDEA
		local args = {
    [1] = 3,
    [2] = Value,
    [3] = "Weapons",
    [4] = player.Name,
    [6] = 0
	}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Vending"):FireServer(unpack(args))
end)

local Items = Ingame:AddDropdown("Items", {
        Title = "Items",
        Values = {"Gold Pizza", "Armor", "MedKit", "Golden Apple"},
        Multi = false,
        Default = "",
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
local b = {}

if game.PlaceId == 13864667823  then
	for _, v in pairs(game.ReplicatedStorage.Vending.Food:GetDescendants()) do
        if v:IsA("Model") then
            table.insert(b, v.Name)
        end
    end
end
	

local Food = Ingame:AddDropdown("Food	", {
        Title = "Food",
        Values = b,
        Multi = false,
        Default = "",
})

   Food:OnChanged(function(Value)
	-- if the github account hello-n-bye steals this im suing 😎 HE FUCKING MADE THE 0 DOLLAR IDEA
local ohNumber1 = 3
local ohString2 = Value
local ohString3 = "Food"
local ohString4 = player.Name
local ohNumber6 = 0

game:GetService("ReplicatedStorage").Events.Vending:FireServer(ohNumber1, ohString2, ohString3, ohString4, ohNumber6)
end)

local c = {}

if game.PlaceId == 13864667823  then
	for _, v in pairs(game.ReplicatedStorage.Vending.Drinks:GetDescendants()) do
        if v:IsA("Model") then
            table.insert(c, v.Name)
        end
    end
end
	

local Drinks = Ingame:AddDropdown("Drinks	", {
        Title = "Drinks",
        Values = c,
        Multi = false,
        Default = "",
})

   Drinks:OnChanged(function(Value)
	-- if the github account hello-n-bye steals this im suing 😎 HE FUCKING MADE THE 0 DOLLAR IDEA
	local ohNumber1 = 3
local ohString2 = Value
local ohString3 = "Drinks"
local ohString4 = player.Name
local ohNumber6 = 0

game:GetService("ReplicatedStorage").Events.Vending:FireServer(ohNumber1, ohString2, ohString3, ohString4, ohNumber6)
end)

   Ingame:AddParagraph({
        Title = "Section 4",
	Content = "Random stuff since im lazy to do sections"
})

local Toggle = Ingame:AddToggle("MyToggle", {Title = "Outside Walk", Default = false })

    Toggle:OnChanged(function(v)
        local args = {
    [1] = Toggle.Value
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SetWalkAnim"):FireServer(unpack(args))
end)

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide


Ingame:AddButton({
	Title = "Pancake",
	Description = "mAKES U fat and thicc.",
	Callback = function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MakePancake"):FireServer()
	end,
})

Ingame:AddButton({
	Title = "Remove hail",
	Description = "bye hail.",
	Callback = function()
				game.Workspace.Hails:Destroy()
	end,
})

Ingame:AddButton({
	Title = "No Slipping",
	Description = "bye slipping.",
	Callback = function()
						Events:WaitForChild("IceSlip"):Destroy()
	end,
})

Ingame:AddButton({
	Title = "Get outside items",
	Description = "Pizza and drinks .",
	Callback = function()
	player.Character.HumanoidRootPart.CFrame = CFrame.new(-224.763199, 30.0589485, -633.617065, 0.124574468, -5.21031751e-08, -0.992210269, -7.69339223e-08, 1, -6.21714733e-08, 0.992210269, 8.40796091e-08, 0.124574468
)

wait(1)

player.Character.HumanoidRootPart.CFrame = CFrame.new(-195.332428, 29.4477024, -650.818726, -0.466665894, -2.15619433e-08, -0.884433687, -3.11930393e-09, 1, -2.27334969e-08, 0.884433687, -7.85013032e-09, -0.466665894
)

wait(1)

player.Character.HumanoidRootPart.CFrame = CFrame.new(-273.579376, 29.4477005, -610.291992, -0.660557449, 5.30939985e-08, 0.750775516, -1.06497593e-08, 1, -8.00888884e-08, -0.750775516, -6.08988913e-08, -0.660557449
)

wait(1)

player.Character.HumanoidRootPart.CFrame = CFrame.new(-288.84845, 29.4477024, -637.664001, 0.829492629, -3.87782872e-09, 0.558517694, 6.79486245e-10, 1, 5.93392091e-09, -0.558517694, -4.54263871e-09, 0.829492629
)

wait(1)

player.Character.HumanoidRootPart.CFrame = CFrame.new(-206.448456, 30.4567528, -789.332031, 0.151315138, 3.55166598e-08, 0.988485575, -2.40290987e-09, 1, -3.55625467e-08, -0.988485575, 3.00590974e-09, 0.151315138)
	end,
})

-- settings

	InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Settings)

	Dialog.yellow("The Script Terror has loaded")
 
