local promoAdd = TalkAction("/promoAdd") -- 'local' should be lowercase

function promoAdd.onSay(player, words, param)
	local levelplayer = player:getLevel()
	local playerid = player:getId()
	local vocplayer = player:getVocation():getId()
	print(getPromotedVocation(vocplayer))
	local split = param:split(",")
	if levelplayer > 0 then

		player:setVocation(Vocation(tonumber(split[1])))

	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Você não tem level para promover.")
	end
end

promoAdd:separator(" ")
promoAdd:groupType("normal")
--promoAdd:register()