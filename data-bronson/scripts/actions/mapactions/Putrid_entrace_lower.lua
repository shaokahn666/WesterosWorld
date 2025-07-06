local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1116, y = 1694, z = 7 }}, {toPos = { x = 1687, y = 492, z = 9 }},
	},
    bossesQuest = {0, 0},	
}

local mummyEntrace = Action()

function mummyEntrace.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	if  setting.bossesQuest[1] ~= 0 and player:getStorageValue(setting.bossesQuest[1]) ~= setting.bossesQuest[2] then
		player:say("This is a wall, and there is no significate for you...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		return true
	end

	if (player:getPosition().y - 1) == toPosition.y then 
		if  player:getLevel() >= 2 then
			player:teleportTo(setting.posTeleport[2].toPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
			player:say("A strange magical force was activated when you touch the wave sign...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		end
	end
	return false
end

mummyEntrace:uid(43019)
mummyEntrace:register()
