local TreinerImortal = CreatureEvent("TreinerImortal")
function TreinerImortal.onThink(creature)
	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if hp < 75 then
		life = (creature:getMaxHealth()-creature:getHealth())
		creature:addHealth(life)
	end
	return true
end

TreinerImortal:register()
