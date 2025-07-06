local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local position = creature:getPosition()
	position:sendMagicEffect(CONST_ME_POFF)

	local tile = Tile(position)
	if not tile:isRopeSpot() then
		creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		return false
	end

	tile = Tile(position:moveUpstairs())
	if not tile then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHROOM)
		return false
	end

	creature:teleportTo(position, false)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

spell:name("Magic Rope")
spell:words("exani tera")
spell:group("support")
spell:vocation("miner;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true", "paladin;true", "royal archer;true", "sharpshooter;true", "ethereal avanger;true", "sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true", "knight;true", "elite knight;true", "templar knight;true", "chaos knight;true", "barbarian;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_MAGIC_ROPE)
spell:id(76)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(9)
spell:mana(20)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
