local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1098, y = 1692, z = 4 }}, {toPos = { x = 1071, y = 1716, z = 9 }},
	},
}

local falconFortress = MoveEvent()

function falconFortress.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	if player:getItemCount(20054) >= 1 then
		player:say("You are loyalt to the falcons! You can pass!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		position:sendMagicEffect(CONST_ME_SMOKE)
		player:teleportTo(setting.posTeleport[1].fromPos)
		player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
	end
	
	return true
end

falconFortress:type("stepin")
falconFortress:aid(43012)
falconFortress:register()