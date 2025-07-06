local setting = {
	-- At what level can do the quest?
	requiredLevel = 150,
	-- Can it be done daily? true = yes, false = no
	daily = false,
	-- Do not change from here down
	centerDemonRoomPosition = { x = 1699, y = 830, z = 14 },
	centerDemonRoomPosition2 = { x = 1699, y = 827, z = 13 },
	demonsPositions = {
		{ x = 1699, y = 830, z = 14 },
	},
	playersPositions = {
		{ fromPos = { x = 1623, y = 854, z = 14 }, toPos = { x = 1697, y = 826, z = 14 } },
		{ fromPos = { x = 1622, y = 854, z = 14 }, toPos = { x = 1698, y = 826, z = 14 } },
		{ fromPos = { x = 1624, y = 854, z = 14 }, toPos = { x = 1699, y = 826, z = 14 } },
		{ fromPos = { x = 1625, y = 854, z = 14 }, toPos = { x = 1700, y = 826, z = 14 } },
		{ fromPos = { x = 1621, y = 854, z = 14 }, toPos = { x = 1701, y = 826, z = 14 } },
	},
	CountPlayers = {},
	leverPos = {
		{fromPos = { x = 1698, y = 846, z = 14 }},
		{fromPos = { x = 1679, y = 833, z = 14 }},
		{fromPos = { x = 1686, y = 807, z = 14 }},
		{fromPos = { x = 1711, y = 807, z = 14 }},
		{fromPos = { x = 1718, y = 833, z = 14 }},
	},
	gatePosition = {
		{fromPos = { x = 1699, y = 824, z = 14 }},
		{fromPos = { x = 1699, y = 824, z = 13 }},
	},
	idGate = {5734, 5733},
	idKeys = {2970},
	
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	setting.CountPlayers = {}
	
	if item.itemid == 2772 then
		for i = 1, 5 do
			local creature = Tile(setting.playersPositions[i].fromPos):getTopCreature()
			
			if creature ~= nil and creature:isPlayer() then
				table.insert(setting.CountPlayers, {fromPos = setting.playersPositions[i].fromPos, toPos = setting.playersPositions[i].toPos})
			end			
		end

		if #setting.CountPlayers < 1 then
			return true
		end

		-- Checks if you have the 4 players and if they have the required level
		for i = 1, #setting.CountPlayers do
			local creature = Tile(setting.CountPlayers[i].fromPos):getTopCreature()

			if #setting.CountPlayers < 4 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Atleast four players are required to start the quest.")
				return true
			end
			
			if creature and creature:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. setting.requiredLevel .. " or higher.")
				return true
			end
			
			if creature:getStorageValue(Storage.Quest.U01_24.Pentagrama.InTheHellWithDevil) ~= -1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A member from your party already completed this quest.")
				return true
				
			end			
		end

		-- Checks if there are still players inside the room, if so, return true
		if roomIsOccupied(setting.centerDemonRoomPosition, true, 23, 23) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
			return true
		end
		
		if roomIsOccupied(setting.centerDemonRoomPosition2, true, 7, 7) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
			return true
		end
		
		if not roomIsOccupied(setting.centerDemonRoomPosition, true, 23, 23) then
			for i = 1, #setting.leverPos do
				if Tile(setting.leverPos[i].fromPos):getItemById(2773) ~= nil then
					local leverItem = Tile(setting.leverPos[i].fromPos):getItemById(2773)
					if leverItem ~= nil then
						leverItem:transform(2772)
					end
				end
			end
			
			for i = 1, #setting.gatePosition do
				for j = 1, #setting.idGate do
					if Tile(setting.gatePosition[i].fromPos):getItemById(setting.idGate[j]) ~= nil then
						local leverItem = Tile(setting.gatePosition[i].fromPos):getItemById(setting.idGate[j])
						if leverItem ~= nil then
							leverItem:transform(5732)
						end
					end
				end	
			end					
			
		end	

		-- Create monsters
		for i = 1, #setting.demonsPositions do
			Game.createMonster("Gothmog", setting.demonsPositions[i])
		end

		-- Get players from the tiles "playersPositions" and teleport to the demons room if all of the above requirements are met
		for i = 1, #setting.CountPlayers do
			local creature = Tile(setting.CountPlayers[i].fromPos):getTopCreature()
			if creature and creature:isPlayer() then
				creature:teleportTo(setting.CountPlayers[i].toPos)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:setStorageValue(Storage.Quest.U01_24.Pentagrama.InTheHellWithDevil, 1)
				creature:setStorageValue(Storage.Quest.U01_24.Pentagrama.QuestLine, 1)
				local keyRemove = Player(creature:getName()):getItemCount(setting.idKeys[1])
				Player(creature:getName()):removeItem(setting.idKeys[1], keyRemove)
				item:transform(2773)
			else
				return false
			end
		end
		
	elseif item.itemid == 2773 then
		-- If it has "daily = true" then it will execute this function
		if setting.daily then
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return true
		end
		-- Not be able to push the lever back if someone is still inside the monsters room
		if roomIsOccupied(setting.centerDemonRoomPosition, true, 23, 23) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
			return true
		end
		
		if roomIsOccupied(setting.centerDemonRoomPosition2, true, 7, 7) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
			return true
		end		
		
		-- Removes all monsters so that the next team can enter
		if Position.removeMonster(setting.centerDemonRoomPosition, 23, 23) then
			return true
		end

		for i = 1, #setting.leverPos do
			if Tile(setting.leverPos[i].fromPos):getItemById(2773) ~= nil then
				local leverItem = Tile(setting.leverPos[i].fromPos):getItemById(2773)
				if leverItem ~= nil then
					leverItem:transform(2772)
				end
			end
		end
		
		item:transform(2772)
	end
	return true
end

lever:uid(30026)
lever:register()
