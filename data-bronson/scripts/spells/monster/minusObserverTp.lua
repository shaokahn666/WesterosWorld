local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_FIRE)

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 0.4) + 3
	local max = (level / 5) + (maglevel * 0.7) + 5
	return -0, -0
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local function teleport(var)
	local target = var
	local target = Creature(target:getNumber())
    if target then
		target:teleportTo(Position(78,954,7))
		
	end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local target = Creature(var:getNumber())
	combat:execute(creature, var)
	teleport(var)
	target:getPosition():sendMagicEffect(CONST_ME_GREEN_ENERGY_SPARK)
	return true
	--return true
end

spell:name("minusObserverTp")
spell:words("###590")
spell:range(7)
spell:needCasterTargetOrDirection(true)
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:register()
