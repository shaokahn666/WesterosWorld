local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, 1)
combat:setParameter(COMBAT_PARAM_USECHARGES, 1)
combat:setArea(createCombatArea(AREA_SQUARE1X1))

function onGetFormulaValues(player, skill, attack, factor)
	local level = player:getLevel()

	local min = (level / 5) + (skill*1.2 + 1.35*attack) * 1.7
	local max = (level / 5) + (skill*1.5 + 1.45*attack) * 2.7

	return -min * 1.1, -max * 1.1 -- TODO : Use New Real Formula instead of an %
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:group("attack")
spell:id(80)
spell:name("Berserk")
spell:words("exori")
spell:castSound(SOUND_EFFECT_TYPE_SPELL_BERSERK)
spell:level(35)
spell:mana(115)
spell:isPremium(true)
spell:needWeapon(true)
spell:cooldown(4 * 1000)
spell:groupCooldown(2 * 1000)
spell:needLearn(false)
spell:vocation("elite knight;true", "templar knight;true", "chaos knight;true", "blacksmith;true", "weaponsmith;true", "artisan weaponsmith;true", "barbarian ravager;true", "berserker;true", "barbarian warmonger;true")
spell:register()
