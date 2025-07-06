local setting = {
	-- At what level can do the quest?
	tpPosition = {
		{fromPos = { x = 1574, y = 479, z = 7 }},
	},
}

local gate = Action()

function gate.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if item.itemid == 8911 then
		if not player:isPzLocked() then
			item:transform(8912)
			item:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
			
			if player then
				player:getPosition():sendMagicEffect(CONST_ME_WHITE_ENERGY_SPARK)
				player:teleportTo(setting.tpPosition[1].fromPos)
				player:getPosition():sendMagicEffect(CONST_ME_WHITE_ENERGY_SPARK)
				player:say("Click....!", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			else
				return false
			end
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "voce fede a sangue fresco. Nao sera permitido sua passagem!")
			return false
		end
			
		
	elseif item.itemid == 8912 then
		item:transform(8911)
		player:say("you turn back the lever to original position....!", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			
	end
	return true
end

gate:uid(43005)
gate:register()
