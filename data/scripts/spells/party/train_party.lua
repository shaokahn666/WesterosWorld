local combat = Combat()
combat:setArea(createCombatArea(AREA_CIRCLE5X5))
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, 1)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, 1)
condition:setParameter(CONDITION_PARAM_TICKS, 3 * 60 * 1000)
condition:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
condition:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
condition:setParameter(CONDITION_PARAM_SKILL_SHIELD, 20)

local baseMana = 60

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local position = creature:getPosition()

	local party = creature:getParty()
	if not party then
		creature:sendCancelMessage("No party members in range.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local membersList = party:getMembers()
	membersList[#membersList + 1] = party:getLeader()
	if membersList == nil or type(membersList) ~= "table" or #membersList <= 1 then
		creature:sendCancelMessage("No party members in range.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local affectedList = {}
	for _, targetPlayer in ipairs(membersList) do
		if targetPlayer:getPosition():getDistance(position) <= 36 then
			affectedList[#affectedList + 1] = targetPlayer
		end
	end

	local tmp = #affectedList
	if tmp <= 1 then
		creature:sendCancelMessage("No party members in range.")
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	local mana = math.ceil((0.9 ^ (tmp - 1) * baseMana) * tmp)
	if creature:getMana() < mana then
		creature:sendCancelMessage(RETURNVALUE_NOTENOUGHMANA)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	if not combat:execute(creature, var) then
		creature:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
		position:sendMagicEffect(CONST_ME_POFF)
		return false
	end

	creature:addMana(-(mana - baseMana), false)
	creature:addManaSpent((mana - baseMana))

	for _, targetPlayer in ipairs(affectedList) do
		targetPlayer:addCondition(condition)
	end

	return true
end

spell:name("Train Party")
spell:words("utito mas sio")
spell:group("support")
spell:vocation("miner;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_TRAIN_PARTY)
spell:id(126)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(32)
spell:mana(60)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
