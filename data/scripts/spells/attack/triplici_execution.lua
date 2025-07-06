local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_POWERBOLT)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 3)

function onGetFormulaValues(player, skill, attack, factor)
	local levelTotal = player:getLevel()
	return -((((0.74*skill)+attack)*1.15)+(levelTotal*1.2)-60), -((((0.85*skill)+attack)*1.60)+(levelTotal*1.35)-60)
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local tripliciExori = function(varSet, playerId)

	local player = Player(playerId)
	if not player then
		return
	end
	
	local var = {}
	var.instantName = "Triplici Execution Instant"
	var.runeName = ""
	var.type = 1 -- VARIANT_POSITION
	var.number = varSet
	combat:execute(player, var)
end

function onTargetCreature(creature, target)
	addEvent(tripliciExori, 150, target:getId(), creature:getId())
	addEvent(tripliciExori, 450, target:getId(), creature:getId()) -- Passamos o ID da criatura e var corretamente
	addEvent(tripliciExori, 700, target:getId(), creature:getId()) -- Mesma coisa aqui
	return true
end

local combatSpell = Combat()
combatSpell:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)

	return combatSpell:execute(creature, var)
end

spell:group("attack")
spell:id(1004)
spell:name("Triplici Execution")
spell:words("exori con triplici")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_STRONG_ETHEREAL_SPEAR)
spell:level(35)
spell:mana(170)
spell:isPremium(true)
spell:range(8)
spell:needTarget(true)
spell:blockWalls(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("royal archer;true", "sharpshooter;true", "ethereal avanger;true")
spell:register()
