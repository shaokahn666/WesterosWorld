local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
combat:setArea(createCombatArea(AREA_CIRCLE2X2))

function onTargetCreature(creature, target)
	return doChallengeCreature(creature, target)
end

combat:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end

spell:name("Challenge")
spell:words("exeta res")
spell:group("support")
spell:vocation("knight;true", "elite knight;true", "templar knight;true", "chaos knight;true", "miner;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true", "barbarian;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_CHALLENGE)
spell:id(93)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(25)
spell:mana(150)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
