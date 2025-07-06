local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 21351, 4)
end

spell:name("Light Stone Shower Rune")
spell:words("adori infir mas tera")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(1)
spell:mana(6)
spell:soul(3)
spell:isAggressive(false)
spell:needLearn(true)
spell:register()
