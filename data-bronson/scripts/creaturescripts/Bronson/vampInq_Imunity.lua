local vampInqImmunity = CreatureEvent("vampInqImmu")

function vampInqImmunity.onHealthChange(creature, attacker, primaryDamage, primaryType, secondaryDamage, secondaryType, origin)
	if creature and creature:isMonster() then
		creature:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
	end
	return true
end

vampInqImmunity:register()
