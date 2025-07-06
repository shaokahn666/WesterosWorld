local setting = {
	-- At what level can do the quest? 27667,27668,27669,27670
	torchPtPos = {
		{fromPos = { x = 1663, y = 430, z = 7 }},
		{fromPos = { x = 1667, y = 430, z = 7 }},
		{fromPos = { x = 1663, y = 434, z = 7 }},
		{fromPos = { x = 1667, y = 434, z = 7 }},
	},
	gatePosition = {{fromPos = { x = 1664, y = 431, z = 8 }},
	},
	idGate = {27670,27669,27668,27667},
	idTorch = {27667,27668,27669,27670}
}

local torchPt = Action()

function torchPt.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local counttorchPt = 0
	
	if item ~= nil then

		if item.itemid == 27670 then
			item:transform(27667)
		else
			local itemCode = (item.itemid + 1)
			item:transform(itemCode)
		end
	end
	
	for i = 1, #setting.torchPtPos do
		if Tile(setting.torchPtPos[i].fromPos):getItemById(setting.idGate[i]) ~= nil then
			counttorchPt = counttorchPt + 1
		end
	end

	if counttorchPt == 4 then
		player:say("<POOFFFF!>", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		player:getPosition():sendMagicEffect(CONST_ME_WHITE_SMOKE)
		for i = 1, #setting.torchPtPos do
			local valueTorch = Tile(setting.torchPtPos[i].fromPos):getItemById(setting.idGate[i])
			
			if valueTorch ~= nil then
				valueTorch:transform(27669)
			end
		end
		player:teleportTo(setting.gatePosition[1].fromPos)
		player:say("You fall into a tomb after touchied the torch...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())		
		Position(setting.gatePosition[1].fromPos):sendMagicEffect(CONST_ME_STONE_STORM)
	end

	return true
end

torchPt:aid(43022)
torchPt:register()
