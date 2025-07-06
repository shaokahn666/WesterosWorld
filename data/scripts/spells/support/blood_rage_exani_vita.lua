local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_SUBID, AttrSubId_BloodRageProtector)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)
condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, 130)
condition:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 115)
condition:setParameter(CONDITION_PARAM_DISABLE_DEFENSE, true)
condition:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, AttrSubId_BloodRageProtector) then
		creature:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, AttrSubId_BloodRageProtector)
	end
	return combat:execute(creature, var)
end

spell:name("Dwarf Rage")
spell:words("exani vita")
spell:group("support", "focus")
spell:vocation("weaponsmith;true", "artisan weaponsmith;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true" )
spell:castSound(SOUND_EFFECT_TYPE_SPELL_BLOOD_RAGE)
spell:id(133)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(70)
spell:mana(300)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
--spell:register()
