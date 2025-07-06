local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITBYFIRE)
combat:setArea(createCombatArea(AREA_CIRCLE5X5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 9)
	local max = (level / 5) + (maglevel * 13)
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:group("attack", "focus")
spell:id(24)
spell:name("Hell's Core")
spell:words("exevo gran mas flam")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_HELL_SCORE)
spell:level(65)
spell:mana(1100)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:cooldown(25 * 1000)
spell:groupCooldown(2 * 1000, 10 * 1000)
spell:needLearn(false)
spell:vocation("master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:register()
