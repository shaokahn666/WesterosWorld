local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3179, 6)
end

spell:name("Stalagmite Rune")
spell:words("adori gran tera")
spell:group("support")
spell:vocation("druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(115)
spell:mana(600)
spell:soul(1)
spell:isAggressive(false)
spell:needLearn(false)
spell:register()
