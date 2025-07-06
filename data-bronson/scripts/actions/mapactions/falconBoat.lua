local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1116, y = 1694, z = 7 }}, {toPos = { x = 1124, y = 1676, z = 7 }},
	},
	
}

local falconBoat = Action()

function falconBoat.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 4980 then

		if item:getPosition() == Position(1116, 1693, 7) then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:getPosition():sendMagicEffect(CONST_ME_WATER_DROP)
			player:teleportTo(setting.posTeleport[2].toPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
			player:say("A short boat ride... aaaah! wonderful day!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		
		end
	elseif item.itemid == 4972 then	
		if  item:getPosition() == Position(1123, 1677, 7) then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:getPosition():sendMagicEffect(CONST_ME_WATER_DROP)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
			player:say("Back to Falcon Bastion! Maybe i need to take care of myself!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		
		end
		
	end
	
	return false
end

falconBoat:aid(43010)
falconBoat:register()
