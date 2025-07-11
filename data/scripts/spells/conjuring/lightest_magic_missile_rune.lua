local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	return creature:conjureItem(3147, 3174, 10, CONST_ME_MAGIC_BLUE)
end

spell:name("Lightest Magic Missile")
spell:words("adori dis min vis")
spell:group("support")
spell:vocation("sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true")
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(1)
spell:mana(5)
spell:soul(0)
spell:needLearn(true)
spell:register()
