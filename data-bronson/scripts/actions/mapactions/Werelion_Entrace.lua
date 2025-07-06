local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1116, y = 1694, z = 7 }}, {toPos = { x = 1550, y = 269, z = 10 }},
	},
	
}

local lionEntrace = Action()

function lionEntrace.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	if  player:getLevel() >= 200 then
		toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
		player:getPosition():sendMagicEffect(CONST_ME_FIREATTACK)
		player:teleportTo(setting.posTeleport[2].toPos)
		player:getPosition():sendMagicEffect(CONST_ME_BATS)
		player:say("A strange magical force teleported to werelions basement...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	end
	
	return false
end

lionEntrace:uid(43010)
lionEntrace:register()
