local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1603, y = 337, z = 12 }}, {toPos = { x = 1071, y = 1716, z = 9 }},
	},
}

local lionStep = MoveEvent()

function lionStep.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	--if player:getItemCount(20054) >= 1 then
	--end
	position:sendMagicEffect(CONST_ME_SMOKE)
	player:teleportTo(setting.posTeleport[1].fromPos)
	player:getPosition():sendMagicEffect(CONST_ME_STONES)
	player:say("You find a shortcut to exit... you squeeze in this little hole", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())

	
	return true
end

lionStep:type("stepin")
lionStep:uid(43009)
lionStep:register()