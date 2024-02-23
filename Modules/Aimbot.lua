local Aimbot = {}

local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Use constants instead of global variables
local AIMBOT_ENABLED = true
Aimbot.TEAM_CHECK = false
local AIM_PART = "Head"
local SENSITIVITY = 0.1 -- Adjust this value to your preference

function Aimbot.GetClosestPlayer()
    local MaximumDistance = math.huge
    local Target = nil

    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and (not TEAM_CHECK or v.Team ~= LocalPlayer.Team) then
            local Character = v.Character
            if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Humanoid") and Character.Humanoid.Health > 0 then
                local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
                local ScreenPoint = Camera:WorldToScreenPoint(HumanoidRootPart.Position)
                local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                if VectorDistance < MaximumDistance then
                    Target = v
                    MaximumDistance = VectorDistance
                end
            end
        end
    end

    return Target
end

function Aimbot.StartAimbot()
    UserInputService.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Holding = true
        end
    end)

    UserInputService.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton2 then
            Holding = false
        end
    end)

    RunService.RenderStepped:Connect(function()
        if Holding and AIMBOT_ENABLED then
            local closestPlayer = Aimbot.GetClosestPlayer()
            if closestPlayer and closestPlayer.Character and closestPlayer.Character[AIM_PART] then
                local targetPosition = closestPlayer.Character[AIM_PART].Position
                local targetCFrame = CFrame.new(Camera.CFrame.Position, targetPosition)
                local tweenInfo = TweenInfo.new(SENSITIVITY, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
                TweenService:Create(Camera, tweenInfo, {CFrame = targetCFrame}):Play()
            end
        end
    end)
end

return Aimbot
