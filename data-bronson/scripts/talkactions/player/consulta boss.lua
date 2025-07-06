local consultaBoss = TalkAction("/boss")

function consultaBoss.onSay(player, words, param)

	if param == "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Escreva um nome de um boss valido.")
		return false
	end
	
	local split = param:split(",")
	local boss = player:getBossCooldown(split[1])

	if boss ~= nil then
		player:setBossCooldown(split[1], (os.time()+(tonumber(split[2])*60*60)))
		return false
	end
		
	return false
end

consultaBoss:separator(" ")
consultaBoss:groupType("normal")

--consultaBoss:register()
