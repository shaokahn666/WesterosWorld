local savePlayer = TalkAction("!save")

function savePlayer.onSay(player, words, param)

	local exhaustion = player:getExhaustion("save")
	if exhaustion > 0 then
		player:sendCancelMessage("You're exhausted and must wait " .. exhaustion .. " " .. (exhaustion > 1 and "seconds" or "second") .. " to use the command again.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:setExhaustion("save", 180)

	player:save()
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your player is saved ...")
	player:getPosition():sendMagicEffect(CONST_ME_SOUND_YELLOW)

	return true
end

savePlayer:groupType("normal")
--savePlayer:register()
