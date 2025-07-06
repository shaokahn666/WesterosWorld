local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_WEAPONTYPE)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)

function onGetFormulaValues(player, skill, attack, factor)
	local skillTotal = skill * attack
	local levelTotal = player:getLevel() / 5
	return -999999999, -99999999 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local varExoriAdonai = false


local spell = Spell("instant")

function spell.onCastSpell(creature, var)

    local target = Creature(var:getNumber()) -- Extrai o alvo a partir de var
    if not target:isPlayer() then
        creature:sendCancelMessage("Você deve atacar apenas jogadores com esta magia.")
        creature:getPosition():sendMagicEffect(CONST_ME_POFF)
        return false
	else
		if target:getHealth() > target:getMaxHealth()*0.10 then
			creature:sendCancelMessage("O alvo ainda nao esta preparado para ser executado.")
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)		
			local condition = Condition(CONDITION_SPELLCOOLDOWN, CONDITIONID_DEFAULT, 1002)
			condition:setTicks((10 * 1000) / configManager.getFloat(configKeys.RATE_SPELL_COOLDOWN))
			creature:addCondition(condition)
			return false
		end
		
    end

	local manaUse = creature:getMaxMana()
	if creature:getMana() < manaUse then
		creature:sendCancelMessage("voce nao tem mana suficiente.")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	
	end
	
	creature:addMana(-manaUse)
	creature:addManaSpent(manaUse)
	return combat:execute(creature, var) 
end

spell:group("attack")
spell:id(1002)
spell:name("Adonai Execution")
spell:words("exori adonai")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_ANNIHILATION)
spell:level(101)
spell:mana(0)
spell:isPremium(true)
spell:range(1)
spell:needTarget(true)
spell:blockWalls(true)
spell:needWeapon(true)
spell:cooldown(180 * 1000)
spell:groupCooldown(4 * 1000)
spell:needLearn(false)
spell:vocation("elite knight;true", "templar knight;true", "chaos knight;true")
--spell:register()
