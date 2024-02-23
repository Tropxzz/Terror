-- not developed yet
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()


local Window = Fluent:CreateWindow({
	Title = "Terror" .. Fluent.Version,
	SubTitle = "by Jimmy/Tropxz",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 460),
	Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
	Theme = "Light",
	MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
	Main = Window:AddTab({ Title = "Welcome", Icon = "home" }),
	Combat = Window:AddTab({ Title = "Combat", Icon = "swords" }),
	Trolling = Window:AddTab({ Title = "Trolling", Icon = "venetian-mask" }),
	Commands = Window:AddTab({ Title = "Commands", Icon = "terminal-square" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- interface settings
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
