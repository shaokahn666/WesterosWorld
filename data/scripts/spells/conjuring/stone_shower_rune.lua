local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3175, 4)
end

spell:name("Stone Shower Rune")
spell:words("adori mas tera")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(28)
spell:mana(430)
spell:soul(1)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
