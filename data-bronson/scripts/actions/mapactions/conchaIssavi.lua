local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 2276, y = 207, z = 8 }},
	},
}

local golden = Action()

function golden.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 5679 then
		if item.itemid ~= nil then
			
			player:say("The magic shell teleport you to a exotic world", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:getPosition():sendMagicEffect(CONST_ME_BUBBLES)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_BUBBLES)
		
		end
	end
	
	return false
end

golden:aid(43004)
golden:register()
