local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
	Title = "Terror 1.0 - Break in 2 Lobby",
	SubTitle = "by Jimmy/Tropxz",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

-- gahhh why am i making it so organized 

local Lobby = Window:AddTab({ Title = "Lobby", Icon = "egg" })

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
        game["Teleport Service"]:Teleport(13864667823, player)
    end
})
