local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3180, 3)
end

spell:name("Magic Wall Rune")
spell:words("adevo grav tera")
spell:group("support")
spell:vocation("master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(35)
spell:mana(750)
spell:soul(1)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
