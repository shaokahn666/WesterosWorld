local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 08/03/21(m/d/y)
	local min = (level * 0.5 + magicLevel * 4) + 45
	local max = (level * 0.6 + magicLevel * 8.95) + 71
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Wound Cleansing")
spell:words("exura ico")
spell:group("healing")
spell:vocation("knight;true", "elite knight;true", "templar knight;true", "chaos knight;true", "barbarian;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_WOUND_CLEANSING)
spell:id(123)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(15)
spell:mana(40)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:register()
