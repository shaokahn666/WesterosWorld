local setting = {
	-- At what level can do the quest?
	requiredLevel = 100,
	-- Can it be done daily? true = yes, false = no
	daily = false,
	-- Do not change from here down
	centerDemonRoomPosition = { x = 1006, y = 622, z = 13 },
	demonsPositions = {
		{ x = 1004, y = 620, z = 13 },
		{ x = 1006, y = 620, z = 13 },
		{ x = 1005, y = 624, z = 13 },
		{ x = 1007, y = 624, z = 13 },
		{ x = 1008, y = 622, z = 13 },
		{ x = 1009, y = 622, z = 13 },
	},
	playersPositions = {
		{ fromPos = { x = 1004, y = 622, z = 12 }, toPos = { x = 1004, y = 622, z = 13 } },
		{ fromPos = { x = 1005, y = 622, z = 12 }, toPos = { x = 1005, y = 622, z = 13 } },
		{ fromPos = { x = 1006, y = 622, z = 12 }, toPos = { x = 1006, y = 622, z = 13 } },
		{ fromPos = { x = 1007, y = 622, z = 12 }, toPos = { x = 1007, y = 622, z = 13 } },
	},
}

local lever = Action()

function lever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid == 2772 then
		-- Checks if you have the 4 players and if they have the required level
		for i = 1, #setting.playersPositions do
			local creature = Tile(setting.playersPositions[i].fromPos):getTopCreature()

			if not creature or not creature:isPlayer() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Four players are required to start the quest.")
				return true
			end
			if creature and creature:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. setting.requiredLevel .. " or higher.")
				return true
				
			end
			
			if creature:getStorageValue(Storage.Quest.U01_24.Annihilator.TheTrueHero) ~= -1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A member from your party already completed this quest.")
				return true
				
			end			
		end

		-- Checks if there are still players inside the room, if so, return true
		if roomIsOccupied(setting.centerDemonRoomPosition, true, 4, 4) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
			return true
		end

		-- Create monsters
		for i = 1, #setting.demonsPositions do
			Game.createMonster("Demon", setting.demonsPositions[i])
		end

		-- Get players from the tiles "playersPositions" and teleport to the demons room if all of the above requirements are met
		for i = 1, #setting.playersPositions do
			local creature = Tile(setting.playersPositions[i].fromPos):getTopCreature()
			if creature and creature:isPlayer() then
				creature:teleportTo(setting.playersPositions[i].toPos)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:setStorageValue(Storage.Quest.U01_24.Annihilator.TheTrueHero, 1)
				creature:setStorageValue(Storage.Quest.U01_24.Annihilator.QuestLine, 1)
			else
				return false
			end
		end
		item:transform(2773)
	elseif item.itemid == 2773 then
		-- If it has "daily = true" then it will execute this function
		if setting.daily then
			player:sendCancelMessage(RETURNVALUE_NOTPOSSIBLE)
			return true
		end
		-- Not be able to push the lever back if someone is still inside the monsters room
		if roomIsOccupied(setting.centerDemonRoomPosition, true, 4, 4) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the quest room.")
			return true
		end
		-- Removes all monsters so that the next team can enter
		if Position.removeMonster(setting.centerDemonRoomPosition, 4, 4) then
			return true
		end
		item:transform(2772)
	end
	return true
end

lever:uid(30025)
lever:register()
