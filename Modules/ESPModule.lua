-- sob story about how i need to turn my original thing into a module

local ESPEnabled = false
local lplr = game.Players.LocalPlayer
local debounce = false
local module = {}

 function module.ShowESP()
	for _, player in ipairs(game.Players:GetPlayers()) do
		local esp = Instance.new("Highlight")
		esp.Parent = player.Character
		esp.Enabled = true
	end
end

 function module.DisableESP()
	for _, player in ipairs(game.Players:GetPlayers()) do
		for _, v in ipairs(player.Character:GetChildren()) do
			if v:IsA("Highlight") then
				v:Destroy()
			end
		end
	end
end

return module
