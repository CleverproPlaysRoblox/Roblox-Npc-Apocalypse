





while true do
  game:GetService("RunService").Heartbeat:Wait() -- waits for every process to finish

  local player = game.Players:GetPlayerFromCharacter(part.Parent) -- gets the player who said the message
  local message = string.lower(chat.Message) -- converts message to lower case for easy comparison
  
  if message == "hello" then
    npc:Chat("Hi there!")
  elseif message == "how are you?" then
    npc:Chat("I'm doing well, thank you for asking.")
  elseif message == "goodbye" then
    npc:Chat("Goodbye!")
  elseif message == "weather" then
    npc:Chat("It's a beautiful day outside!")
  elseif message == "how old are you?" then
    npc:Chat("I am ageless, for I am but an NPC in a virtual world.")
  end

  repeat
    game:GetService("RunService").Heartbeat:Wait() -- waits for every process to finish
    message = string.lower(chat.Message) -- converts new message to lower case for easy comparison
  until string.find(message, "%a+") == string.find(chat.Message, "%a+") -- waits until the new message starts with the same word as the previous message

  if message == "hello" then
    npc:Chat("Hello again!")
  elseif message == "how are you?" then
    npc:Chat("I'm still doing well, thanks!")
  elseif message == "goodbye" then
    npc:Chat("Farewell!")
  elseif message == "weather" then
    npc:Chat("Still beautiful outside!")
  elseif message == "how old are you?" then
    npc:Chat("I'm still ageless, my friend.")
  end
end




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


previous_input = ""

while true do
    player_input = game:GetService("Chat"):GetChatForPlayerAsync(player, 10)  -- Get player input
    
    if string.lower(player_input) == "hello" then
        game:GetService("Chat"):Chat(game.Workspace.NPC.HumanoidRootPart, "Hi there!")  -- Respond to player
        previous_input = "hello"
    elseif string.lower(player_input) == previous_input .. " world" then
        game:GetService("Chat"):Chat(game.Workspace.NPC.HumanoidRootPart, "Hello again!")  -- Respond to player
    end
end

function GetCurrentTime()
  local lighting = game:GetService("Lighting")
  local minutesAfterMidnight = lighting:GetMinutesAfterMidnight()
  local currentHour = math.floor(minutesAfterMidnight / 60)
  local currentMinute = minutesAfterMidnight % 60
  return string.format("%02d:%02d", currentHour, currentMinute)
end
function getCurrentTime() local time = game:GetService("Lighting").TimeOfDay return time end

function getCurrentTimeOfDay()
  local success, timeOfDay = pcall(function()
    return game.Lighting:GetMinutesAfterMidnight()
  end)
  
  if not success or timeOfDay == nil then
    return "Error: Could not get time of day in game world."
  else
    return timeOfDay
  end
end


