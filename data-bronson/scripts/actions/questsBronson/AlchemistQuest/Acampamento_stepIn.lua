
local acampStep = MoveEvent()

function acampStep.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == 1 then
		player:say("Nao sobrou quase nada do acampamento, me parece que todos que estavam aqui estao mortos.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist, 2)
	elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == 2 and position == Position(125,335,8) then
		player:say("Este pedaco do terreno estava instavel e voce caiu para dentro da caverna.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		player:getPosition():sendMagicEffect(CONST_ME_STONES)
		player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist, 3)
		player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.doorSpiritofNature, 1)	
	end

	return true
end

acampStep:type("stepin")
acampStep:aid(43025)
acampStep:register()