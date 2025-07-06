local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3150, 3)
end

spell:name("Dharmas Chaos Rune")
spell:words("adori mort dharmas")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(101)
spell:mana(1000)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
