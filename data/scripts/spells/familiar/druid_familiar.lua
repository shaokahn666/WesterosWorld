local spell = Spell("instant")
local spellId = 197

function spell.onCastSpell(player, variant)
	return player:CreateFamiliarSpell(spellId)
end

spell:group("support")
spell:id(spellId)
spell:name("Druid familiar")
spell:words("utevo gran res dru")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_SUMMON_DRUID_FAMILIAR)
spell:level(200)
spell:mana(3000)
spell:cooldown(0) -- calculated in CreateFamiliarSpell
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:vocation("spirit healer;true")
spell:register()
