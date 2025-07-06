local setting = {
	-- At what level can do the quest?
	requiredLevel = 2,
	posTeleport = {
		{fromPos = { x = 1603, y = 337, z = 12 }}, {toPos = { x = 1071, y = 1716, z = 9 }},
	},
	altarMove = { {pos = {x = 995, y = 703, z = 8}}, {pos = {x = 1002, y = 703, z = 8}}, {pos = {x = 983, y = 701, z = 8}}  },
	idTable = {2345},
}

local bingen = MoveEvent()

local function revertBridge(position)

	local tableM = Tile(setting.altarMove[1].pos):getItemById(setting.idTable[1])
		if not tableM then
			Game.createItem(setting.idTable[1], 1, setting.altarMove[1].pos)
		end
	
	local tableS = Tile(setting.altarMove[2].pos):getItemById(25054)
		if tableS then
			tableS:remove(1)
		end

	local tableZ = Tile(position):getItemById(436)
		if tableZ then
			tableZ:setUniqueId(43017)
		end	
	
	return false

end


function bingen.onStepIn(creature, item, position, fromPosition)
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
	
	local tableM = Tile(setting.altarMove[1].pos):getItemById(setting.idTable[1])
		if tableM then
			tableM:remove(1)
			tableM:getPosition():sendMagicEffect(CONST_ME_POFF)
		end

	item:setUniqueId(100)
	player:say("<Click...>", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	Game.createItem(25054, 1, setting.altarMove[2].pos):setActionId(43018)
	addEvent(revertBridge, 1 * 10 * 1000, position)
	
	return true
end

bingen:type("stepin")
bingen:uid(43017)
bingen:register()