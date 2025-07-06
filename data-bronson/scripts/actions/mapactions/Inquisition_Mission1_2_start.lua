local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 2276, y = 207, z = 8 }},
	},
}

local women = Action()

function women.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 4247 then
	
		if player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) == 1 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) == 1 then
			player:say("This corpse is from a citizen of Dunedain! There is a two tooth bite in her neck...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:say("I need go back to Henricus fast as posible!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())			
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition, 2)
		end
	end
	
	return false
end

women:uid(43016)
women:register()
