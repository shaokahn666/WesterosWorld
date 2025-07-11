local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel) -- already compared to the official tibia | compared date: 05/07/19(m/d/y)
	local min = (level * 0.5 + magicLevel * 1.4) + 8
	local max = (level * 0.5 + magicLevel * 1.9) + 11
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Light Healing")
spell:words("exura")
spell:group("healing")
spell:vocation("miner;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true", "paladin;true", "royal archer;true", "sharpshooter;true", "ethereal avanger;true", "sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "knight;true", "elite knight;true", "templar knight;true", "chaos knight;true", "barbarian;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_LIGHT_HEALING)
spell:id(1)
spell:cooldown(1000)
spell:groupCooldown(1000)
spell:level(7)
spell:mana(20)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
