local frags = TalkAction("!frags", "!kills")

function frags.onSay(player, words, param)

	local exhaustion = player:getExhaustion("talkactions")
	if exhaustion > 0 then
		player:sendCancelMessage("You're exhausted and must wait " .. exhaustion .. " " .. (exhaustion > 1 and "seconds" or "second") .. " to use the command again.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:setExhaustion("talkactions", 5)

	local fragTime = configManager.getNumber(configKeys.FRAG_TIME)
	if fragTime <= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have any unjustified kill.")
		return false
	end

	local skullTime = player:getSkullTime()
	if skullTime <= 0 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have any unjustified kill.")
		return false
	end

	local kills = math.ceil(skullTime / fragTime)
	local remainingSeconds = math.floor(skullTime % fragTime)

	local hours = math.floor(remainingSeconds / 3600)
	local minutes = math.floor((remainingSeconds % 3600) / 60)
	local seconds = remainingSeconds % 60

	local message = "You have " .. kills .. " unjustified kill" .. (kills > 1 and "s" or "") .. ". The amount of unjustified kills will decrease after: "
	if hours ~= 0 then
		if hours == 1 then
			message = message .. hours .. " hour, "
		else
			message = message .. hours .. " hours, "
		end
	end

	if hours ~= 0 or minutes ~= 0 then
		if minutes == 1 then
			message = message .. minutes .. " minute and "
		else
			message = message .. minutes .. " minutes and "
		end
	end

	if seconds == 1 then
		message = message .. seconds .. " second."
	else
		message = message .. seconds .. " seconds."
	end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)

	return true
end

frags:groupType("normal")
frags:register()
