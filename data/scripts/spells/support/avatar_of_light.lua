local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({ lookType = 1594 }) -- Avatar of Light lookType

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature or not creature:isPlayer() then
		return false
	end

	local grade = creature:revelationStageWOD("Avatar of Light")
	if grade == 0 then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local duration = 15000
	condition:setTicks(duration)
	creature:getPosition():sendMagicEffect(CONST_ME_AVATAR_APPEAR)
	creature:addCondition(condition)
	creature:avatarTimer((os.time() * 1000) + duration)
	creature:reloadData()
	addEvent(ReloadDataEvent, duration, creature:getId())
	return true
end

spell:group("support")
spell:id(265)
spell:name("Avatar of Light")
spell:words("uteta res sac")
spell:level(300)
spell:mana(1500)
spell:isPremium(true)
spell:cooldown(2 * 60 * 60 * 1000) -- Default cooldown = 2 hours
spell:groupCooldown(2 * 1000)
spell:vocation("ethereal avanger;true")
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(true)
spell:register()
