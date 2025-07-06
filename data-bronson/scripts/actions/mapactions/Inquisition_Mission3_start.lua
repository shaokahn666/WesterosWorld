local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1603, y = 337, z = 12 }}, {toPos = { x = 1071, y = 1716, z = 9 }},
	},
}

local inqStep = MoveEvent()

function inqStep.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	if player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheDarkPath) == -1 then
		player:setStorageValue(Storage.Quest.U01_24.Inquisition.TheDarkPath,1)
		player:getPosition():sendMagicEffect(CONST_ME_YALAHARIGHOST)
		player:say("You feel that's is the correct way...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	end
	return true
end

inqStep:type("stepin")
inqStep:aid(43016)
inqStep:register()