local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_HEALING)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

function onGetFormulaValues(player, level, magicLevel)
	local min = ((player:getMaxHealth() - player:getHealth())/2.5)
	local max = ((player:getMaxHealth() - player:getHealth())/2)
	return min, max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)

	local manaUse = creature:getMaxMana()*0.05
	if creature:getMana() < manaUse then
		creature:sendCancelMessage("voce nao tem mana suficiente.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	
	end
	
	creature:addMana(-manaUse)
	creature:addManaSpent(manaUse)
	
	return combat:execute(creature, variant)
end

spell:name("Knight Salvation")
spell:words("exura mort")
spell:group("healing")
spell:vocation("knight;true", "elite knight;true", "templar knight;true", "chaos knight;true")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_ULTIMATE_HEALING)
spell:id(1003)
spell:cooldown(1 * 1000)
spell:groupCooldown(1 * 1000)
spell:level(30)
spell:mana(0)
spell:isSelfTarget(true)
spell:isAggressive(false)
spell:needLearn(false)
--spell:register()
