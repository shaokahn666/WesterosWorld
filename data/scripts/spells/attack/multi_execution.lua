local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SPECTRALBOLT)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 3)

function onGetFormulaValues(player, skill, attack, factor)
	local levelTotal = player:getLevel() / 5
	return -(((2 * skill + attack / 2500) * 1.70) + (levelTotal/1.3) + 7), -(((2 * skill + attack / 1875) * 2.00) + (levelTotal/1.2) + 13)
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local tripliciExori = function(varSet, playerId)

	local player = Player(playerId)
	if not player then
		return
	end
	
	local var = {}
	var.instantName = "Multi Execution Instant"
	var.runeName = ""
	var.type = 1 -- VARIANT_POSITION
	var.number = varSet
	combat:execute(player, var)
end

function onTargetCreature(creature, target)
	addEvent(tripliciExori, 150, target:getId(), creature:getId())
	addEvent(tripliciExori, 450, target:getId(), creature:getId())
	addEvent(tripliciExori, 650, target:getId(), creature:getId())
	addEvent(tripliciExori, 1000, target:getId(), creature:getId())	
	return true
end

local combatSpell = Combat()
combatSpell:setCallback(CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)

	return combatSpell:execute(creature, var)
end

spell:group("attack")
spell:id(1005)
spell:name("Multi Execution")
spell:words("exori con multi")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
spell:impactSound(SOUND_EFFECT_TYPE_SPELL_STRONG_ETHEREAL_SPEAR)
spell:level(180)
spell:mana(320)
spell:isPremium(true)
spell:range(9)
spell:needTarget(true)
spell:blockWalls(true)
spell:cooldown(3 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("sharpshooter;true", "ethereal avanger;true")
spell:register()
