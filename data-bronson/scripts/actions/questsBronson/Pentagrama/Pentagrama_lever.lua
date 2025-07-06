local setting = {
	-- At what level can do the quest?
	leverPos = {
		{fromPos = { x = 1698, y = 846, z = 14 }},
		{fromPos = { x = 1679, y = 833, z = 14 }},
		{fromPos = { x = 1686, y = 807, z = 14 }},
		{fromPos = { x = 1711, y = 807, z = 14 }},
		{fromPos = { x = 1718, y = 833, z = 14 }},
	},
	gatePosition = {
		{fromPos = { x = 1699, y = 824, z = 13 }},
	},
	idGate = {5732}
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
			

		if countLever == 5 then
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
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ainda e necessario acionar ".. 5 - countLever .. " alavancas.")
			player:say("Click", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end

		
	elseif item.itemid == 2773 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A alavanca ja foi puxada, verifique as demais alavancas.")
			
	end
	return true
end

lever:aid(30027)
lever:register()
