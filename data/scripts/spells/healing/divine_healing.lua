local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(_player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = ((level*4.7)+(magicLevel*8.5)+30)*1
	local max = ((level*5.8)+(magicLevel*10.5))*1.03
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Divine Healing")
spell:words("exura san")
spell:group("healing")
spell:vocation("paladin;true", "royal archer;true", "sharpshooter;true", "ethereal avanger;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_DIVINE_HEALING)
spell:id(125)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(35)
spell:mana(130)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
