
local AlchemistStep = MoveEvent()

function AlchemistStep.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 4 and player:getItemCount(21188) >= 1 then
		player:say("You find the basement of Alchemist Tower, try to transform into a rat and go trought wall.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 5)
	end

	position:sendMagicEffect(CONST_ME_SMOKE)
	player:getPosition():sendMagicEffect(CONST_ME_STONES)

	return true
end

AlchemistStep:type("stepin")
AlchemistStep:uid(43020)
AlchemistStep:register()