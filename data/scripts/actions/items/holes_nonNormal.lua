local holesNon = MoveEvent()
local holesNew = {967,7550}

function holesNon.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return false
	end
	
	if table.contains(holesNew, item.itemid) then
		position.z = position.z + 1
	end

	if player:isPzLocked() and Tile(fromPosition):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:sendCancelMessage(RETURNVALUE_PLAYERISPZLOCKED)
		return true
	end

	player:teleportTo(position, true)
	return true
end

holesNon:id(967,7550)
holesNon:register()
