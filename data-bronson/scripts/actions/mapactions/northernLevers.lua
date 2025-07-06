local setting = {
	-- At what level can do the quest?
	leverPos = {
		{fromPos = { x = 1481, y = 101, z = 8 }},
		{fromPos = { x = 1598, y = 97, z = 9 }},
		{fromPos = { x = 1535, y = 157, z = 10 }},
	},
	gatePosition = {
		{fromPos = { x = 1541, y = 112, z = 10 }},
	},
	idGate = {5732}
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local countLever = 0
	
	if item.itemid == 8913 then
		item:transform(8914)
		
		for i = 1, #setting.leverPos do
			if Tile(setting.leverPos[i].fromPos):getItemById(8914) ~= nil then
				local leverItem = Tile(setting.leverPos[i].fromPos):getItemById(8914)
				if leverItem ~= nil then
					countLever = countLever + 1
				end
			end
		end
			

		if countLever == 3 then
			player:say("You hear a noise far away... that's is a gate oppening", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			local gateItem = Tile(setting.gatePosition[1].fromPos):getItemById(setting.idGate[1])
			if gateItem ~= nil then
				gateItem:getPosition():sendMagicEffect(CONST_ME_WHITE_SMOKE)
				player:say("rrreeeeeeeechh....", TALKTYPE_MONSTER_SAY, true, player, gateItem:getPosition())
				gateItem:transform(5734)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A porta ja esta aberta.")
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ainda e necessario acionar ".. 3 - countLever .. " alavancas.")
			player:say("Click", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end

		
	elseif item.itemid == 8914 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A alavanca ja foi puxada, verifique as demais alavancas.")
			
	end
	return true
end

lever:aid(43002)
lever:register()
