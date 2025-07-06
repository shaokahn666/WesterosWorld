local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)
condition:setFormula(-1, 0, -1, 0)
combat:addCondition(condition)

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()
	local min = (level / 5) + (skill + attack) / 3
	local max = (level / 5) + (skill + attack)
	return -min * 5.88, -max * 6.88 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	local manaUse = creature:getMaxMana()*0.15
	if creature:getMana() < manaUse then
		creature:sendCancelMessage("voce nao tem mana suficiente")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	
	end
	creature:addMana(-manaUse)
	creature:addManaSpent(manaUse)
	return combat:execute(creature, var) 
end



spell:group("attack")
spell:id(1001)
spell:name("Cranial Basher")
spell:words("exori bash")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_WHIRLWIND_THROW)
spell:level(50)
spell:mana(0)
spell:isPremium(false)
spell:range(5)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(6 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("miner;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true")
spell:register()
