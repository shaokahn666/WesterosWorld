local setting = {
	-- At what level can do the quest?
	leverPos = {
		{fromPos = { x = 1466, y = 802, z = 5 }},
	},
	gatePosition = {
		{fromPos = { x = 1422, y = 872, z = 7 }},
	},
	idGate = {2263}
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local countLever = 0
	
	if item.itemid == 2772 then
		item:transform(2773)
		
		for i = 1, #setting.leverPos do
			if Tile(setting.leverPos[i].fromPos):getItemById(2773) ~= nil then
				local leverItem = Tile(setting.leverPos[i].fromPos):getItemById(2773)
				if leverItem ~= nil then
					countLever = countLever + 1
				end
			end
		end
			

		if countLever == 1 then
			player:say("You hear a noise far away... that's a pillar moving", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			local gateItem = Tile(setting.gatePosition[1].fromPos):getItemById(setting.idGate[1])
			if gateItem ~= nil then
				gateItem:getPosition():sendMagicEffect(CONST_ME_WHITE_SMOKE)
				player:say("creeeek!", TALKTYPE_MONSTER_SAY, true, player, gateItem:getPosition())
				gateItem:remove(1)
			else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A pedra ja foi movimentada.")
			end
		else
			player:say("Click", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end

		
	elseif item.itemid == 2773 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A alavanca ja foi puxada.")
			
	end
	return true
end

lever:aid(43003)
lever:register()
