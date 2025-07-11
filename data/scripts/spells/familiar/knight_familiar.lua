local spell = Spell("instant")
local spellId = 194

function spell.onCastSpell(player, variant)
	return player:CreateFamiliarSpell(spellId)
end

spell:group("support")
spell:id(spellId)
spell:name("Knight familiar")
spell:words("utevo gran res eq")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_SUMMON_KNIGHT_FAMILIAR)
spell:level(200)
spell:mana(1000)
spell:cooldown(0) -- calculated in CreateFamiliarSpell
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:isAggressive(false)
spell:isPremium(true)
spell:vocation("artisan weaponsmith;true", "chaos knight;true", "barbarian warmonger;true")
spell:register()
