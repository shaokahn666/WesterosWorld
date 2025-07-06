local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3195, 3)
end

spell:name("Soulfire Rune")
spell:words("adevo res flam")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(27)
spell:mana(420)
spell:soul(1)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
