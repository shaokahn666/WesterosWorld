local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(0, 3449, 10, CONST_ME_MAGIC_BLUE)
end

spell:name("Conjure Explosive Arrow")
spell:words("exevo con flam")
spell:group("support")
spell:vocation("paladin;true", "royal archer;true", "sharpshooter;true", "ethereal avanger;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_CONJURE_EXPLOSIVE_ARROW)
spell:id(49)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(25)
spell:mana(200)
spell:soul(1)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
