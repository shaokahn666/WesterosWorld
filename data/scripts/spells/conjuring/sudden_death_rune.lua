local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3155, 4)
end

spell:name("Sudden Death Rune")
spell:words("adori gran mort")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(45)
spell:mana(800)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
