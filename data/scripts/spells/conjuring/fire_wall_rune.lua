local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3190, 4)
end

spell:name("Fire Wall Rune")
spell:words("adevo mas grav flam")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(33)
spell:mana(780)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
