local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3197, 3)
end

spell:name("Disintegrate Rune")
spell:words("adito tera")
spell:group("support")
spell:vocation("master sorcerer;true", "archmage;true", "arcane wizard;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(35)
spell:mana(200)
spell:soul(1)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
