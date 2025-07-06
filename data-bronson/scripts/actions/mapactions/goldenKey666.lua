local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 517, y = 541, z = 8 }},
	},
	idGoldenKey = 2972
}

local golden = Action()

function golden.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 43000 then
		if item.itemid ~= nil and item.itemid == setting.idGoldenKey then

			toPosition:sendMagicEffect(CONST_ME_YALAHARIGHOST)
			player:say("The statue recognize the golden key... letting your passage.", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:getPosition():sendMagicEffect(CONST_ME_GREEN_ENERGY_SPARK)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_GREEN_ENERGY_SPARK)
		
		end
	end
	
	return false
end

golden:id(2972)
golden:register()
