local condition = Condition(CONDITION_POISON, CONDITIONID_COMBAT)
condition:setParameter(CONDITION_PARAM_DELAYED, true)
condition:setParameter(CONDITION_PARAM_MINVALUE, 20)
condition:setParameter(CONDITION_PARAM_MAXVALUE, 70)
condition:setParameter(CONDITION_PARAM_STARTVALUE, 50)
condition:setParameter(CONDITION_PARAM_TICKINTERVAL, 6000)
condition:setParameter(CONDITION_PARAM_FORCEUPDATE, true)

local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1051, y = 1709, z = 8 }}, {toPos = { x = 1071, y = 1716, z = 9 }},
	},
}

local falconEntrace = MoveEvent()

function falconEntrace.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	if item.itemid == 5069 then
		position:sendMagicEffect(CONST_ME_MAGIC_POWDER)
		player:teleportTo(setting.posTeleport[2].toPos)
		player:getPosition():sendMagicEffect(CONST_ME_BLUE_ENERGY_SPARK)
		player:say("A powerful magic field move you to another dimension!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	
	elseif item.itemid == 5068 then
		position:sendMagicEffect(CONST_ME_MAGIC_POWDER)
		player:teleportTo(setting.posTeleport[1].fromPos)
		player:getPosition():sendMagicEffect(CONST_ME_BLUE_ENERGY_SPARK)
		player:say("Aaaah! I can't remember if that was real... These infernal monsterss, maybe that was a hallucionation...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	end
	
	return true
end

falconEntrace:type("stepin")
falconEntrace:aid(43011)
falconEntrace:register()