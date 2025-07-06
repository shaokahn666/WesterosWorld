local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 366, y = 1088, z = 7 }},
	},
	idWater = 133,
	requiredLevel = 150,
}

local shadowNexus = Action()

local function revertBridge(toPosition)

	local tableM = Tile(toPosition):getItemById(7925)
		if tableM then
			tableM:transform(7931)
			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			toPosition:sendMagicEffect(CONST_ME_PURPLEENERGY)
		end
	
	return false

end



function shadowNexus.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 43018 and target.itemid == 7931 then
		if item.itemid ~= nil and item.itemid == setting.idWater then
			item:remove(1)
			
			if player and (player:getLevel() < setting.requiredLevel or player:getStorageValue(Storage.Quest.U01_24.Inquisition.ShadowNexus) ~= 1) then
				player:say("The shadow nexus won't react to you.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return true
			end			
			player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
			toPosition:sendMagicEffect(CONST_ME_HOLYAREA)
			player:say("The shadow nexus was purified! Now you can leave.", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			target:transform(7925)
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.ShadowNexus, 2)
			addEvent(revertBridge, 1 * 20 * 1000, toPosition)			
		
		end
	end
	
	return false
end

shadowNexus:id(133)
shadowNexus:register()
