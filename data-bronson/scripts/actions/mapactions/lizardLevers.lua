local setting = {
	
	leverPos = {
		{fromPos = Position(255, 308, 0), toPos = {Position(288, 310, 6),  Position(289, 310, 6)}},
		{fromPos = Position(288, 309, 0), toPos = {Position(326, 310, 6),  Position(327, 310, 6)}},
		{fromPos = Position(326, 309, 0), toPos = {Position(326, 280, 6),  Position(327, 280, 6)}},
		{fromPos = Position(326, 279, 0), toPos = {Position(288, 279, 6),  Position(289, 279, 6)}},
		{fromPos = Position(288, 278, 0), toPos = {Position(328, 251, 6),  Position(329, 251, 6)}},
		{fromPos = Position(328, 250, 0), toPos = {Position(358, 251, 6),  Position(359, 251, 6)}},
		{fromPos = Position(358, 250, 0), toPos = {Position(360, 222, 6),  Position(361, 222, 6)}},
		{fromPos = Position(360, 221, 0), toPos = {Position(365, 218, 0)}, },
	},	

	gatePosition = {
		{fromPos = { x = 1699, y = 824, z = 13 }},
	},
	idGate = 8873,
	idPedraUT = 8873
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local countLever = 0
	
	if item.itemid == 8911 then
		
		if item.itemid ~= nil then
			for i = 1, #setting.leverPos do
				if item:getPosition() == setting.leverPos[i].fromPos then
					for j = 1, #setting.leverPos[i].toPos do
						if Tile(setting.leverPos[i].toPos[j]):getItemById(setting.idGate) ~= nil then
							local leverItem = Tile(setting.leverPos[i].toPos[j]):getItemById(setting.idGate)
							player:say("Your hear a big pillar moving far away...", TALKTYPE_MONSTER_SAY, true, player, leverItem:getPosition())
							leverItem:remove(1)
							item:transform(8912)	
						end
						
					end
				end
			
			end
			player:say("Click", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end
		
	elseif item.itemid == 8912 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Esta alavanca ja foi puxada, verifique as demais alavancas.")
			
	end
	return true
end

lever:aid(43000)
lever:register()
