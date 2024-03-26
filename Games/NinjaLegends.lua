		local loaded

		local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
		local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
		local justloaded = true
		local Dialog = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/Terror/main/Modules/TerrorDialog.lua", true))()

		local Window = Fluent:CreateWindow({
				Title = "Terror 1.0 - Ninja Legends",
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

		local Islands = Window:AddTab({ Title = "Islands", Icon = "landmark" })
		local Items = Window:AddTab({ Title = "Items", Icon = "hammer" })
		local S1tats = Window:AddTab({ Title = "Stats", Icon = "bar-chart-4" })
		local Chests = Window:AddTab({ Title = "Chests", Icon = "package" })
		local Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
		local player = game.Players.LocalPlayer
		local char = player.Character
		local hrp = char.HumanoidRootPart	
		local islandUnlockPoints = workspace.islandUnlockParts
		local islandparts

			local function notify(head, content)
			    Window:Dialog({
			        Title = head,
			        Content = content,
			        Buttons = {
			            {
			                Title = "Okay",
			                Callback = function()
			                    print("Confirmed")
			                end,
			            }
			        }
			    })
			end

			local air = "hi"

			local function Confirmation(head, content, cb)
			    Window:Dialog({
			        Title = head,
			        Content = content,
			        Buttons = {
			            {
			                Title = "Okay",
			                Callback = cb
			            },
			            {
			                Title = "No",
			                Callback = function()
			                    return air
			                end,
			            },
			        }
			    })
		end

			Window:SelectTab(1)



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

		  local AutoBuySword = Items:AddToggle("MyToggle", {Title = "AutoBuySword", Default = false })

		AutoBuySword:OnChanged(function()
		    while AutoBuySword.Value == true do
		      local args = {
		    [1] = "buyAllSwords",
		    [2] = "Blazing Vortex Island"
		}

		game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))

		wait(0.00001)
		    end
		end)

		  local Autobuybelts = Items:AddToggle("MyToggle", {Title = "Autobuybelts", Default = false })

		Autobuybelts:OnChanged(function()
		    while Autobuybelts.Value == true do
		      local args = {
		    [1] = "buyAllBelts",
		    [2] = "Blazing Vortex Island"
		}

		game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
		wait(0.00001)
		    end
		end)
		-- stats
			
			S1tats:AddButton({
		    Title = "Collect all chi for 2 minutes",
		    Description = "Chinese black white thing with a circle, I think",
		    Callback = function()
		        notify("Collecting", "This will take a few moments.")

		        local names = {"Blue Chi Crate", "Pink Chi Crate", "Chi Crate"}
		        local startTime = tick()  -- Record the start time
		        
		        while tick() - startTime < 120 do  -- Continue collecting for 2 minutes
		            for _, name in ipairs(names) do
		                for _, v in pairs(workspace.spawnedCoins.Valley:GetChildren()) do
		                    if v.Name == name then
		                        hrp.CFrame = v.CFrame
		                    end
		                end
		            end
		            wait()  -- Wait for a short duration before checking again
		        end
		        
		        -- After 2 minutes, kick the player
		        player:Kick('This kick is to stop the loop for "Collect all chi for 2 minutes". Rejoin the experience and continue to use "Terror"')
		    end
		})


		local AFS = S1tats:AddToggle("MyToggle", {Title = "AutoFarm Click", Default = false })

		AFS:OnChanged(function()
		    for i,v in pairs(player.Character:GetChildren()) do
		        if v:IsA("Tool") then
		            while AFS.Value == true do
		                local args = {
		                    [1] = "swingKatana"
		                }

		                game:GetService("Players").LocalPlayer:WaitForChild("ninjaEvent"):FireServer(unpack(args))
		                task.wait(0.000000000000000000000000000000000000000000000000000000000000000000000000000000001)
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

	local TweenService = game:GetService("TweenService")

	local Autohoop = S1tats:AddToggle("MyToggle", {Title = "Auto claim hoop ⭕⚽", Default = false })

	function after(secs, func)
		wait(secs)
		func()
	end

	Autohoop:OnChanged(function()
	        for i, hoop in	 pairs(workspace.Hoops:GetChildren()) do
	 		 while Autohoop.Value  == true do
				if hoop.Transparency ~=  1 then
					 local targetCFrame = hoop.CFrame
				hrp.CFrame = targetCFrame
				hoop.Transparency = 1
				        wait(1) -- Adjust the wait time as needed
				after(62, function()
					hoop.Transparency = 0
				end)
	        end
				end
	    end
	end)



		    local Autosell = S1tats:AddToggle("MyToggle", {Title = "AutoSell", Default = false })

		Autosell:OnChanged(function()
		    while Autosell.Value == true do
		        game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		        wait(0.0000000000000000000000000000000000000000000000000000001)
		        game:GetService("Workspace").sellAreaCircles.sellAreaCircle16.circleInner.CFrame = CFrame.new(0,0,0)
		        wait(0.0000000000000000000000000000000000000000000000000000001)
		    end
		end)

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
			Dialog.yellow("The Script Terror has loaded")
