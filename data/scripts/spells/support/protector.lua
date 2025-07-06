local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local skill = Condition(CONDITION_ATTRIBUTES)
skill:setParameter(CONDITION_PARAM_SUBID, AttrSubId_BloodRageProtector)
skill:setParameter(CONDITION_PARAM_TICKS, 1 * 10 * 1000)
skill:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, 150)
skill:setParameter(CONDITION_PARAM_BUFF_DAMAGEDEALT, 50)
skill:setParameter(CONDITION_PARAM_BUFF_DAMAGERECEIVED, 85)
skill:setParameter(CONDITION_PARAM_BUFF_SPELL, true)
combat:addCondition(skill)

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if creature:getCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, AttrSubId_BloodRageProtector) then
		creature:removeCondition(CONDITION_ATTRIBUTES, CONDITIONID_COMBAT, AttrSubId_BloodRageProtector)
	end
	return combat:execute(creature, variant)
end

spell:name("Protector")
spell:words("utamo tempo")
spell:group("support", "focus")
spell:vocation("weaponsmith;true", "artisan weaponsmith;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_PROTECTOR)
spell:id(132)
spell:cooldown(15 * 1000)
spell:groupCooldown(2 * 1000, 2 * 1000)
spell:level(101)
spell:mana(200)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(true)
spell:needLearn(false)
spell:register()
