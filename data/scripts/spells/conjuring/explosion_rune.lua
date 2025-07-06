local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3200, 6)
end

spell:name("Explosion Rune")
spell:words("adevo mas hur")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(31)
spell:mana(570)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
