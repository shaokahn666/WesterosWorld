local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3166, 4)
end

spell:name("Energy Wall Rune")
spell:words("adevo mas grav vis")
spell:group("support")
spell:vocation("master sorcerer;true", "archmage;true", "arcane wizard;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(41)
spell:mana(1000)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
