game.Players.PlayerAdded:Connect(function(Player)
	local chatbot = script.Parent
	
	Player.Chatted:Connect(function(msg)
		if msg == "Hello" then
			wait(2)
			game:GetService("Chat"):Chat(chatbot.Head, "Oh.. Hey", Enum.ChatColor.Red)
     if msg == "Wdym"
		elseif msg == "Hey?" then
			wait(2)
			game:GetService("Chat"):Chat(chatbot.Head, "yes?", Enum.ChatColor.Red)
		elseif msg == "what are you doing here?" then
			wait(2)
			game:GetService("Chat"):Chat(chatbot.Head, "nothing!", Enum.ChatColor.Red)
		end
   end
	end)
end)
