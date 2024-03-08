local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local justloaded = true

	local Window = Fluent:CreateWindow({
		Title = "Terror 1.0 - Ninja Legends",
		SubTitle = "by Jimmy/Tropxz",
		TabWidth = 160,
		Size = UDim2.fromOffset(580, 460),
		Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
		Theme = "Dark",
		MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Islands = Window:AddTab({ Title = "Islands", Icon = "landmark" })
local Items = Window:AddTab({ Title = "Items", Icon = "hammer" })
local S1tats = Window:AddTab({ Title = "Stats", Icon = "bar-chart-4" })
local Chests = Window:AddTab({ Title = "Chests", Icon = "package" })
local player = game.Players.LocalPlayer
local islandUnlockPoints = workspace.islandUnlockParts
local islandparts


-- Islands

function unlockAll()
    local islandsVisited = {}

    while true do	
        local allIslandsVisited = false  -- Assume all islands are visited initially
        
        for _, part in pairs(islandUnlockPoints:GetDescendants()) do
            if part:IsA("Part") and not islandsVisited[part.Name] then
                player.Character.HumanoidRootPart.CFrame = part.CFrame
                table.insert(islandsVisited, part.Name)
                wait(1)
                allIslandsVisited = true  -- At least one island is not visited
            end
        end
        
        wait(1)
        
        -- Exit the loop if all islands are visited
        if allIslandsVisited then
            break
        end
    end
end

    Islands:AddButton({
        Title = "Unlock All islands",
        Description = "Unlock, every, single, island",
        Callback = function()
            Window:Dialog({
                Title = "Unlocking",
                Content = "This might take 10-20 seconds",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
		})
		
		unlockAll()
        end
})

local test = {}
local test2 = {}

for _, part in pairs(islandUnlockPoints:GetDescendants()) do
    if part:IsA("MeshPart") then
	table.insert(test, part.Name)
	end
end

local Tpislands = Islands:AddDropdown("Dropdown", {
    Title = "Teleportto",
    Values = test,
    Multi = false,
    Default = "Astral Island",
})

Tpislands:OnChanged(function(Value)
    if not justloaded then
        for _, part in pairs(islandUnlockPoints:GetDescendants()) do
            if part:IsA("Part") then
				if part.Parent.Name == Value then
					player.Character.HumanoidRootPart.CFrame = part.CFrame
                break
				end
            end
        end
    end
end)

-- Items
local AFS = Items:AddToggle("MyToggle", {Title = "AutoFarm Click", Default = false })

AFS:OnChanged(function()
    for i,v in pairs(player.Character:GetChildren()) do
        if v:IsA("Tool") then
            while AFS.Value == true do
                local args = {
                    [1] = "swingKatana"
                }

                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                task.wait(0.00001)
            end
        else
            for i,v in pairs(player.Backpack:GetChildren()) do
                if v:IsA("Tool") then
                    v.Parent = player.Character
                    while AFS.Value == true do
                        local args = {
                            [1] = "swingKatana"
                        }

                        game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
                        task.wait(0.00001)
                    end
                end
            end
        end
    end
end)


    local Autosell = Items:AddToggle("MyToggle", {Title = "AutoSell", Default = false })

Autosell:OnChanged(function()
    while Autosell.Value == true do
        game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        wait(0.0000000000000000000000000000000000000000000000000000001)
        game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner.CFrame = CFrame.new(0,0,0)
        wait(0.0000000000000000000000000000000000000000000000000000001)
    end
end)


justloaded = false
