local chatService = game:GetService('TextChatService')

local hook = {
	isOld = function()
		if chatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
			return 'Legacy'
		else
			return 'Modern'
		end
	end
}

return hook

-- made by the beautiful guy that made me make this beautiful message because he sue me (MIT)
-- headlined on discord
-- <3 Headlined please dont sue me 🙏 
