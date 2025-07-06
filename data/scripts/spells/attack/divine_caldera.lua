local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HOLYAREA)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, attack, maglevel, factor)
	local level = player:getLevel()
	local min = ((level*1.05)+(50)+(attack/2)+(maglevel*7.5)-130)*1.05
	local max = ((level*1.05)+(50)+(attack/2)+(maglevel*9)-105)*1.22
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(124)
spell:name("Divine Caldera")
spell:words("exevo mas san")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_DIVINE_CALDERA)
spell:level(50)
spell:mana(160)
spell:isPremium(true)
spell:isSelfTarget(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("royal archer;true", "sharpshooter;true", "ethereal avanger;true")
spell:register()
