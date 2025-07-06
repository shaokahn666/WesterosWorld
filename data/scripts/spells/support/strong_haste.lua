local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, 0)

local condition = Condition(CONDITION_HASTE)
condition:setParameter(CONDITION_PARAM_TICKS, 22000)
condition:setFormula(1.7, 40, 1.7, 40)
combat:addCondition(condition)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local summons = creature:getSummons()
	if summons and type(summons) == "table" and #summons > 0 then
		for i = 1, #summons do
			local summon = summons[i]
			local summon_t = summon:getType()
			if summon_t and summon_t:familiar() then
				local deltaSpeed = math.max(creature:getBaseSpeed() - summon:getBaseSpeed(), 0)
				local FamiliarSpeed = ((summon:getBaseSpeed() + deltaSpeed) * 0.7) - 56
				local FamiliarHaste = Condition(CONDITION_HASTE)
				FamiliarHaste:setParameter(CONDITION_PARAM_TICKS, 22000)
				FamiliarHaste:setParameter(CONDITION_PARAM_SPEED, FamiliarSpeed)
				summon:addCondition(FamiliarHaste)
			end
		end
	end
	return combat:execute(creature, var)
end

spell:name("Strong Haste")
spell:words("utani gran hur")
spell:group("support")
spell:vocation("barbarian;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true", "miner;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true", "druid;true", "elder druid;true", "celtic druid;true", "spirit healer;true", "paladin;true", "royal archer;true", "sharpshooter;true", "ethereal avanger;true", "sorcerer;true", "master sorcerer;true", "archmage;true", "arcane wizard;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_STRONG_HASTE)
spell:id(39)
spell:cooldown(2 * 1000)
spell:groupCooldown(2 * 1000)
spell:level(20)
spell:mana(100)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:isPremium(false)
spell:needLearn(false)
spell:register()
