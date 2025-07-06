local questSetStorage = TalkAction("/quest")

function questSetStorage.onSay(player, words, param)

	if param == "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Escreva um id de quest valido.")
		return false
	end
	
	local split = param:split(",")
	local boss = 1
	if boss ~= nil then
		player:setStorageValue(tonumber(split[1]), tonumber(split[2]))
		print(player:getStorageValue(tonumber(split[1])))
		return false
	end
		
	return false
end

questSetStorage:separator(" ")
questSetStorage:groupType("normal")
--questSetStorage:register()
