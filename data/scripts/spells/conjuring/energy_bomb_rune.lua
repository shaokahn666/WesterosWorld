local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3149, 2)
end

spell:name("Energy Bomb Rune")
spell:words("adevo mas vis")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(35)
spell:mana(500)
spell:soul(1)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
