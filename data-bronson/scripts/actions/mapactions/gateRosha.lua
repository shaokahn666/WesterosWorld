local setting = {
	-- At what level can do the quest?
	gatePosition = {
		{fromPos = { x = 326, y = 1258, z = 7 }},
		{fromPos = { x = 327, y = 1258, z = 7 }},
		{fromPos = { x = 328, y = 1258, z = 7 }},
		{fromPos = { x = 329, y = 1258, z = 7 }},
		{fromPos = { x = 326, y = 1258, z = 6 }},
		{fromPos = { x = 327, y = 1258, z = 6 }},
		{fromPos = { x = 328, y = 1258, z = 6 }},
		{fromPos = { x = 329, y = 1258, z = 6 }},
		{fromPos = { x = 326, y = 1258, z = 5 }},
		{fromPos = { x = 327, y = 1258, z = 5 }},
		{fromPos = { x = 328, y = 1258, z = 5 }},
		{fromPos = { x = 329, y = 1258, z = 5 }},
	},

	idGate = {12201,8294}
}

local gate = Action()

function gate.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if item.itemid == 9110 then
		item:transform(9111)
		item:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		for i = 1, #setting.gatePosition do
			for j = 1, #setting.idGate do
				if Tile(setting.gatePosition[i].fromPos):getItemById(setting.idGate[j]) ~= nil then
					local gateItem = Tile(setting.gatePosition[i].fromPos):getItemById(setting.idGate[j])
					if gateItem ~= nil then
						gateItem:getPosition():sendMagicEffect(CONST_ME_WHITE_SMOKE)
						gateItem:remove(1)
					end
				end
			end
		end
		
		if player ~= nil then
			player:say("Click....!", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:say("you hear from far way a rust gate openning...", TALKTYPE_MONSTER_SAY, true, player, player:getPosition())
			
		end
		
	elseif item.itemid == 9111 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Os portoes do inferno ja foram abertos! E assim permanecerao!")
			
	end
	return true
end

gate:uid(43004)
gate:register()
