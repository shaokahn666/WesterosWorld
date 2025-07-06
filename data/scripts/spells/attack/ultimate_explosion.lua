local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICAL)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 18)
	local max = (level / 5) + (maglevel * 23)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack", "focus")
spell:id(1008)
spell:name("Ultimate Explosion")
spell:words("exevo gran mas vis")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_RAGE_OF_THE_SKIES)
spell:level(250)
spell:mana(4000)
spell:isSelfTarget(true)
spell:isPremium(true)
spell:cooldown(120 * 1000)
spell:groupCooldown(4 * 1000, 10 * 1000)
spell:needLearn(false)
spell:vocation("master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:register()
