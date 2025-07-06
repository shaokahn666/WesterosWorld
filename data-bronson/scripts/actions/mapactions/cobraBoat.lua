local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1773, y = 450, z = 7 }}, {toPos = { x = 2040, y = 499, z = 7 }},
	},
	
}

local boatCobra = Action()

function boatCobra.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 4997 then

		if item:getPosition() ~= Position(2040, 498, 7) then
			player:say("The journey was exausting, you can't see a paddle again...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:getPosition():sendMagicEffect(CONST_ME_WATER_DROP)
			player:teleportTo(setting.posTeleport[2].toPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
		
		end
		
		if  item:getPosition() == Position(2040, 498, 7) then
			player:say("A wonderful time to back to home!", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:getPosition():sendMagicEffect(CONST_ME_WATER_DROP)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
		
		end
		
	end
	
	return false
end

boatCobra:aid(43009)
boatCobra:register()
