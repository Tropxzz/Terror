local chatService = game:GetService('TextChatService')
local starterGui = game:GetService('StarterGui')

local console = {}

if chatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
	console.red = function(content)
		starterGui:SetCore('ChatMakeSystemMessage', {
			Text = '<font color="rgb(200, 0, 0)">{Terror}</font> <font color="rgb(255, 0, 0)">' .. tostring(content) .. '</font>',
			Font = Enum.Font.SourceSansBold
		})
	end

	console.green = function(content)
		starterGui:SetCore('ChatMakeSystemMessage', {
			Text = '<font color="rgb(0, 200, 0)">{Terror}</font> <font color="rgb(0, 255, 0)">' .. tostring(content) .. '</font>',
			Font = Enum.Font.SourceSansBold
		})
	end
	
	console.blue = function(content)
		starterGui:SetCore('ChatMakeSystemMessage', {
			Text = '<font color="rgb(0,0,200)">{Terror}</font> <font color="rgb(0,0,200)">' .. tostring(content) .. '</font>',
			Font = Enum.Font.SourceSansBold
		})
	end
	
	console.yellow = function(content)
		starterGui:SetCore('ChatMakeSystemMessage', {
			Text = '<font color="rgb(219, 219, 110)">{Terror}</font> <font color="rgb(207, 255, 112)">' .. tostring(content) .. '</font>',
			Font = Enum.Font.SourceSansBold
		})
	end
else
	local channels = chatService:WaitForChild('TextChannels')
	local RBXGeneral = channels:WaitForChild('RBXGeneral')

	console.red = function(content)
		RBXGeneral:DisplaySystemMessage('<font color="rgb(200, 0, 0)">{Terror}</font> <font color="rgb(255, 0, 0)">' .. tostring(content) .. '</font>')
	end

	console.green = function(content)
		RBXGeneral:DisplaySystemMessage('<font color="rgb(0, 200, 0)">{Terror}</font> <font color="rgb(0, 255, 0)">' .. tostring(content) .. '</font>')
	end

	console.yellow = function(content)
		RBXGeneral:DisplaySystemMessage('<font color="rgb(219, 219, 110)">{Terror}</font> <font color="rgb(207, 255, 112)">' .. tostring(content) .. '</font>')
	end
	
	console.blue = function(content)
		RBXGeneral:DisplaySystemMessage('<font color="rgb(0,0,200)">{Terror}</font> <font color="rgb(0,0,200)">' .. tostring(content) .. '</font>')
	end
end

return console
