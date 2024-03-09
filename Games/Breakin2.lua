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
local Trolling = Window:AddTab({ Title = "Trolling", Icon = "angry" })
local Items = Window:AddTab({ Title = "Items", Icon = "hammer" })
local NPC = Window:AddTab({ Title = "NPCS", Icon = "users" })
local Buffs = Window:AddTab({ Title = "Buffs", Icon = "hand-metal" })
local Randomstuff = Window:AddTab({ Title = "RandomShit", Icon = "help-circle" })
local Money = Window:AddTab({ Title = "Money", Icon = "piggy-bank" })
local Plrr = Window:AddTab({ Title = "Player", Icon = "user" })
local Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })

function TeleportTo(c)
	player.Character.HumanoidRootPart.CFrame = c
end

function Remove(p)
	-- thanks headlined for coming up with this feature
local Events = game:GetService("ReplicatedStorage"):WaitForChild("Events")
Events.OnDoorHit:FireServer(p)
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

Lobby:AddButton({
        Title = "SoloGame",
        Description = "teleports u ingame with no players",
        Callback = function()
                      game["Teleport Service"]:Teleport(13864667823, player)
        end
    })


-- Ingame
Buffs:AddButton({
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



Buffs:AddButton({
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

Buffs:AddButton({
        Title = "+1 Strength",
        Description = 'Adds one strength point.',
        Callback = function()
               	local function Train(Ability)
			Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
		end
		Train("Strength")
	end,
})

Buffs:AddButton({
        Title = "+1 Speed",
        Description = 'Adds one Speed point.',
        Callback = function()
               	local function Train(Ability)
			Events:WaitForChild("RainbowWhatStat"):FireServer(Ability)
		end
		Train("Speed")
	end,
})

NPC:AddButton({
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

NPC:AddButton({
	Title = "Get dog",
	Description = "gets wtv the dog is called.",
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
		GetDog()
	end,
})

NPC:AddButton({
	Title = "Get Agent",
	Description = "gets the agent.",
	Callback = function()
		
				local function GiveItem(Item)
			if Item == "Armor" then
				Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(game.Players.LocalPlayer), 1)
			else
				Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
			end
		end
		
				local function GetAgent()
			GiveItem("Louise")
			task.wait(.1)
			player.Backpack:WaitForChild("Louise").Parent = player.Character
			Events:WaitForChild("LouiseGive"):FireServer(2)
		end	
			
		GetAgent()
	end,
})

NPC:AddButton({
	Title = "Get Uncle Pete",
	Description = "gets Uncle pete the rich dude.",
	Callback = function()
		
				local function GiveItem(Item)
			if Item == "Armor" then
				Events:WaitForChild("Vending"):FireServer(3, "Armor2", "Armor", tostring(game.Players.LocalPlayer), 1)
			else
				Events:WaitForChild("GiveTool"):FireServer(tostring(Item:gsub(" ", "")))
			end
		end
		
			local function GetUncle()
			GiveItem("Key")
			task.wait(.1)
			player.Backpack:WaitForChild("Key").Parent = player.Character
			wait(.5)
			Events.KeyEvent:FireServer()
		end
			
		GetUncle()
	end,
})


  local pizzagoldyes = Items:AddToggle("Inf gold pizza fr", {Title = "freegoldpizza", Default = false })

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
	task.wait(0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001)	
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

local Weapons = Items:AddDropdown("Dropdown", {
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

local Item1s = Items:AddDropdown("Items", {
        Title = "Items",
        Values = {"Gold Pizza", "Armor", "MedKit", "Golden Apple"},
        Multi = false,
        Default = "",
})
  Item1s:OnChanged(function(Value)
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
	

local Food = Items:AddDropdown("Food	", {
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
	

local Drinks = Items:AddDropdown("Drinks	", {
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

local Toggle = Randomstuff:AddToggle("MyToggle", {Title = "Outside Walk", Default = false })

    Toggle:OnChanged(function(v)
        local args = {
    [1] = Toggle.Value
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SetWalkAnim"):FireServer(unpack(args))
end)

-- This script was generated by Hydroxide's RemoteSpy: https://github.com/Upbolt/Hydroxide


Trolling:AddButton({
	Title = "Pancake",
	Description = "mAKES U fat and thicc.",
	Callback = function()
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("MakePancake"):FireServer()
	end,
})

Trolling:AddButton({
	Title = "Remove others",
	Description = "Legit serversided 💀.",
	Callback = function()
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Name ~= player.Name and v:IsA("Player") then
				Remove(v)
			end
		end
	end,
})






Trolling:AddButton({
	Title = "Remove Tv Screen",
	Description = "Legit serversided 💀.",
	Callback = function()
		Remove(workspace.TheHouse.Projector)
	end,	
})

Trolling:AddButton({
	Title = "Remove map",
	Description = "Legit serversided 💀.",
	Callback = function()
		Remove(workspace.Terrain)
	end,
})


local asdlaksd= {}

for i,v in pairs(game.Players:GetPlayers()) do
	if v.Name ~= player.Name then
		table.insert(asdlaksd, v)
	end
end

local KickPlayer = Trolling.Main:AddDropdown("Dropdown", {
        Title = "Kick Player",
        Values = asdlaksd,
        Multi = false,
        Default = "Select Player",
})

    KickPlayer:OnChanged(function(Value)
	for i,v in pairs(game.Players:GetPlayers()) do
		if v.Name == Value then
			Remove(v)
	    end
    end
 end)



--[[
Trolling:AddButton({
	Title = "Kill others",
	Description = "Legit serversided 💀.",
	Callback = function()
		
	end,
})
]]

Randomstuff:AddButton({
	Title = "Remove hail",
	Description = "bye hail.",
	Callback = function()
				game.Workspace.Hails:Destroy()
	end,
})

Randomstuff:AddButton({
	Title = "No Slipping",
	Description = "bye slipping.",
	Callback = function()
						Events:WaitForChild("IceSlip"):Destroy()
	end,
})

Randomstuff:AddButton({
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

-- player

 
   Plrr:AddSlider("Slider", {
        Title = "Speed",
        Description = "Speeds you up",
        Default = 16,
        Min = 16,
        Max = 250,
        Rounding = 1,
        Callback = function(Value)
            player.Character.Humanoid.WalkSpeed = Value
        end
    })

-- money

Money:AddButton({
	Title = "Pickup all dollars",
	Description = "Pickup all the cash on the floor. made by headlined",
	Callback = function()
			 local old = player.Character.HumanoidRootPart.CFrame

            for _,v in ipairs(workspace:GetChildren()) do
                if (v.Name) == "Money3" then
                    player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
                    task.wait(0.15)
                end
            end

            player.Character.HumanoidRootPart.CFrame = old

            for _,v in ipairs(workspace:GetChildren()) do
                if (v.Name) == "Money3" then
                    v:Destroy()
                end
            end
	end,
})

  local asdasd = Money:AddToggle("Auto Farm", {Title = "Auto Farm", Default = false })

asdasd:OnChanged(function()		
		while asdasd.Value == true do
		local badguys = game.Workspace.BadGuys
for i, v in pairs(badguys:GetDescendants()) do
    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
            local virtualUser = game:GetService("VirtualUser")
            virtualUser:CaptureController()
            virtualUser:ClickButton1(Vector2.new(0.458, 0,0.437, 0))
        end
		end
		wait(0.0000000001)
		end
    end)

Money:AddButton({
	Title = "Go Fighting Arena",
	Description = "Go Fighting Arena",
	Callback = function()
		player.Character.HumanoidRootPart.CFrame = CFrame.new(-265.661835, 62.711586, -726.972473, -0.370746523, -0.00020653024, 0.928734064, 3.07532682e-05, 1, 0.000234654784, -0.928734124, 0.000115559051, -0.370746493)
	end,
})

if game.PlaceId == 13864667823  then
	 local sadasdsadsadas = Money:AddToggle("Bring Enimes", {Title = "Bring badguys By Breaking BLitz", Default = false })

sadasdsadsadas:OnChanged(function()		
		
	
	if sadasdsadsadas.Value == true then
		local function BringAllEnemies()
		pcall(function()
			for i, v in pairs(game:GetService("Workspace").BadGuys:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			for i, v in pairs(game:GetService("Workspace").BadGuysBoss:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
			
			for i, v in pairs(game:GetService("Workspace").BadGuysFront:GetChildren()) do
				v.HumanoidRootPart.Anchored = true
				v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
			end
		end)
	end
						BringAllEnemies()
wait(0.0001)
		end	
    end)
end

local function tween(pos)
    game.TweenService:Create(player.Character.HumanoidRootPart, TweenInfo.new(
        0.5,
        Enum.EasingStyle.Sine
    ), {
        CFrame = pos
    }):Play()
end

local oldPos_Farming = nil

local function get()
    local character = workspace[player.Name]
    local backpack = player.Backpack

    local lollipop = (backpack:FindFirstChild("Lollipop")) or (character:FindFirstChild("Lollipop"))
    local drink = (backpack:FindFirstChild("Bottle")) or (character:FindFirstChild("Bottle"))

    local bat = (backpack:FindFirstChild("Bat")) or (character:FindFirstChild("Bat"))
    local medkit = (backpack:FindFirstChild("MedKit")) or (character:FindFirstChild("MedKit"))

    local phone = (backpack:FindFirstChild("Phone")) or (character:FindFirstChild("Phone"))
    local book = (backpack:FindFirstChild("Book")) or (character:FindFirstChild("Book"))

    if (lollipop) then
        return "The Hyper"
    elseif (drink) then
        return "The Sporty"
    elseif (bat) then
        return "The Protector"
    elseif (medkit) then
        return "The Medic"
    elseif (phone) then
        return "The Hacker"
    elseif (book) then
        return "The Nerd"
    end
end


  local BetterFarm = Money:AddToggle("Auto Farm", {Title = "Better Auto Farm (Manually click)", Default = false })

local combatZone = game:GetService("Workspace"):FindFirstChild("EvilArea"):FindFirstChild("Rug"):FindFirstChild("PartTex")
local badGuys = workspace:FindFirstChild("BadGuys")


    BetterFarm:OnChanged(function()
  local value = BetterFarm.Value
	
 	       if BetterFarm.Value == true then
            if not (oldPos_Farming) then
                oldPos_Farming = player.Character.HumanoidRootPart.CFrame
            end

            tween(CFrame.new(-259.504608, 60.9477654, -745.243408, -0.999818861, 7.66576136e-08, 0.0190321952, 7.65230581e-08, 1, -7.79803688e-09, -0.0190321952, -6.34022257e-09, -0.999818861))

            task.wait(0.8)
            
            while BetterFarm.Value == true do
                if (get() == "The Nerd") or (get() == "The Hyper") or (get() == "The Sporty") then
                    tween(combatZone.CFrame + Vector3.new(0, 2.4, 0))
                else
                    tween(combatZone.CFrame + Vector3.new(0, 3.78, 0))
                end

                if (badGuys) then
                    for _,v in ipairs(badGuys:GetChildren()) do
                        local newRoot = v:FindFirstChild("HumanoidRootPart")
                        if (newRoot) then
                            if (get() == "The Nerd") or (get() == "The Hyper") or (get() == "The Sporty") then
							newRoot.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
							 local virtualUser = game:GetService("VirtualUser")
            virtualUser:CaptureController()
            virtualUser:ClickButton1(Vector2.new(0.458, 0,0.437, 0))
                            else
                                newRoot.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position + Vector3.new(0, 6, 0))
                            end
                        end
				end
				
                end
                task.wait()
            end
        else
            if (oldPos_Farming) == nil then
                print("ERROR")
            else
                task.wait(0.5)

                tween(oldPos_Farming)
                oldPos_Farming = nil
            end
        end
    end)

-- settings

	InterfaceManager:SetLibrary(Fluent)
InterfaceManager:BuildInterfaceSection(Settings)

	Dialog.yellow("The Script Terror has loaded")
