local setting = {
	
	leverPos = {
		{fromPos = Position(240, 926, 13), toPos = {Position(192, 839, 8)}},
		{fromPos = Position(253, 936, 9), toPos = {Position(136, 838, 9)}},
		{fromPos = Position(171, 907, 10), toPos = {Position(149, 845, 10)}},
		{fromPos = Position(329, 926, 12), toPos = {Position(134, 846, 11)}},
	},	
	
	tileRemove = {
		{tileCrystal = 8877},
		{tileCrystal = 8874},
		{tileCrystal = 8876},
		{tileCrystal = 8875},
	}

}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if item.itemid == 8911 then
		
		if item.itemid ~= nil then
			for i = 1, #setting.leverPos do
				if item:getPosition() == setting.leverPos[i].fromPos then

					if Tile(setting.leverPos[i].toPos[1]):getItemById(setting.tileRemove[i].tileCrystal) ~= nil then
						print("aaa")
						local leverItem = Tile(setting.leverPos[i].toPos[1]):getItemById(setting.tileRemove[i].tileCrystal)
						player:say("Your hear the noise of a crystal pillar breaking far away...", TALKTYPE_MONSTER_SAY, true, player, leverItem:getPosition())
						leverItem:getPosition():sendMagicEffect(CONST_ME_WHITE_SMOKE)
						leverItem:remove(1)
						item:transform(8912)	
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

lever:aid(43001)
lever:register()
