local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
justloaded = true

local Window = Fluent:CreateWindow({
	Title = "Terror 1.0 - Break in 2 Lobby",
	SubTitle = "by Jimmy/Tropxz",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

	if not isfolder("Terror") then
	    makefolder("Terror")
	end
	if not isfile("Terror/Theme.txt") then
	    writefile("Terror/Theme.txt", "")
	end
	if isfolder("Terror") and isfile("Terror/Theme.txt") then
	    if readfile("Terror/Theme.txt") == "" then
	        Fluent:SetTheme("Dark")
	    else
	                Fluent:SetTheme(tostring(readfile("Terror/Theme.txt")))
	    end
	end

-- gahhh why am i making it so organized 

local Lobby = Window:AddTab({ Title = "Lobby", Icon = "egg" })
local Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
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
        if game:GetService("ReplicatedStorage").RemoteEvents:FindFirstChild("OutsideRole") then
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
        if game:GetService("ReplicatedStorage").RemoteEvents:FindFirstChild("OutsideRole") then
            local Event = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("OutsideRole")
            Event:FireServer(A_1)
        end
    end
})

Lobby:AddButton({
    Title = "SoloGame",
    Description = "teleports u ingame with no players",
    Callback = function()
        game["Teleport Service"]:Teleport(13864667823, game.Players.LocalPlayer)
    end
})

Lobby:AddButton({
    Title = "Go into truck one",
    Description = "teleports u into truck one",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(87.4349976, 7.86999941, 108.889984, 8.10623169e-05, 1, 8.10623169e-05, -8.10623169e-05, -8.10623169e-05, 1, 1, -8.10623169e-05, 8.10623169e-05)
    end
})

Lobby:AddButton({
    Title = "Go into truck two",
    Description = "teleports u into truck two",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(87.4349976, 7.86999941, 147.389984, 8.10623169e-05, 1, 8.10623169e-05, -8.10623169e-05, -8.10623169e-05, 1, 1, -8.10623169e-05, 8.10623169e-05)
    end
})

local asdasdasdsadasdasdasdasdasd = Settings:AddDropdown("Dropdown", {
	    Title = "Choose your theme",
	    Values = {"Dark","Darker","Light","Aqua", "Amethyst", "Rose"},
	    Multi = false,
	    Default = "Choose one",
	})
	asdasdasdsadasdasdasdasdasd:OnChanged(function(Value)
	    if not justloaded then
	        Fluent:SetTheme(Value)
	        delfile("Terror/Theme.txt")
	        writefile("Terror/Theme.txt", tostring(Value))
	    end
end)

justloaded = false
