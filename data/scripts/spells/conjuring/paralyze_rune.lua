local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3165, 1)
end

spell:name("Paralyze Rune")
spell:words("adana ani")
spell:group("support")
spell:vocation("elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(65)
spell:mana(1400)
spell:soul(1)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
