local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3201, 6)
end

spell:name("Great Magic Missile Rune")
spell:words("adori gran vis")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(101)
spell:mana(600)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
