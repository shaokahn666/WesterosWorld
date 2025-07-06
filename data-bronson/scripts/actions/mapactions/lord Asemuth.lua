local setting = {
	-- At what level can do the quest?
	requiredLevel = 2,
	posTeleport = {
		{fromPos = { x = 1603, y = 337, z = 12 }}, {toPos = { x = 1071, y = 1716, z = 9 }},
	},
	altarMove = { {pos = {x = 1376, y = 366, z = 8}}, {pos = {x = 1376, y = 367, z = 8}},},
}

local asemuth = MoveEvent()


function asemuth.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	if player and player:getLevel() < setting.requiredLevel then	
		return false
	end
	
	if  player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) < 3 then
		return true
	end
	
	if player:isPzLocked() then	
		return false
	end	

	if player then
		if item.itemid == 410 then
			player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
			player:teleportTo(setting.altarMove[1].pos)
			player:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
		else
			player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
			player:teleportTo(setting.altarMove[2].pos)
			player:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)			
		end
	
	else
		return false
	end	
	
	return true
end

asemuth:type("stepin")
asemuth:aid(43020)
asemuth:register()