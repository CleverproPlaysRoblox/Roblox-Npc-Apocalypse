local npc = game.Workspace.gerald -- replace "NPC" with the name of your NPC

local waitingForResponse = false
local responseTable = {
  ["hello"] = "Hi there!",
  ["how are you?"] = "I'm doing well, thank you for asking.",
  ["goodbye"] = "Goodbye!",
  ["I love you"] = "Really?",
}

game.Players.PlayerAdded:Connect(function(player)
  player.Chatted:Connect(function(message)
    message = string.lower(message)
    if waitingForResponse then
      local response = responseTable[message]
      if response then
        npc:Speak(response)
        waitingForResponse = false
      else
        npc:Speak("What?")
            npc:Speak("I don't understand")
      end
    else
      if responseTable[message] then
        npc:Speak(responseTable[message])
      end
      waitingForResponse = true
    end
  end)
end)



--or another code


-- create a new NPC object
local npc = game.Workspace.NPC

-- create a new StringValue object to store the previous message sent by the player
local prevMessage = Instance.new("StringValue")
prevMessage.Name = "PreviousMessage"
prevMessage.Parent = npc

-- define a function to handle the conversation
local function onPromptTriggered(prompt, player)
    -- check if the player has already sent a message
    if prevMessage.Value == "" then
        -- if not, respond with a greeting
        npc.Talk("Hello, how can I help you?")
    else
        -- if yes, check if the new message is the same as the previous one
        local message = prompt:GetObject()
        if message ~= prevMessage.Value then
            -- if not, respond with a new message
            npc.Talk("I'm sorry, I didn't understand. Could you please rephrase that?")
        end
    end
    -- store the new message as the previous message
    prevMessage.Value = prompt:GetObject()
end

-- create a new ProximityPrompt object
local prompt = Instance.new("ProximityPrompt")
prompt.ActionText = "Talk"
prompt.Parent = npc

-- connect the function to the prompt's triggered event
prompt.Triggered:Connect(onPromptTriggered)





--or i think better code

local function onPlayerChatted(player, msg)
	-- Check if the player chatted the specific word or sentence
	if msg == "hello" or msg == "hi" or msg == "hey" then
		-- Store the message to check later
		player:SetAttribute("previousMessage", msg)
		-- Reply to the player
		game:GetService("Chat"):Chat(player.Character.Head, "Hello! How may I assist you?")
	elseif player:GetAttribute("previousMessage") ~= nil and string.lower(player:GetAttribute("previousMessage")) == "hello" or "hi" or "hey" then
		-- If the previous message was "hello" and the player chatted again, reply
		game:GetService("Chat"):Chat(player.Character.Head, "You already said hello! How may I assist you now?")
	end
end

-- Create the NPC
local npc = game:GetService("Workspace"):FindFirstChild("NPC")
if not npc then
	npc = Instance.new("Part")
	npc.Name = "NPC"
	npc.Anchored = true
	npc.Size = Vector3.new(2, 2, 2)
	npc.Position = Vector3.new(0, 5, 0)
	npc.Parent = game:GetService("Workspace")
end

-- Register the chat event
game:GetService("Players").PlayerAdded:Connect(function(player)
	player.Chatted:Connect(function(message)
		onPlayerChatted(player, message)
	end)
end)
