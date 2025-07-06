local setting = {
	requiredLevel = 200,
	daily = false,
	bossName = "Faceless Bane",
	timeToFight = 20,
	centerBossRoomPosition = { x = 714, y = 920, z = 8 },
	bossPosition = {
		{ x = 714, y = 916, z = 8 },
	},
	
	playersPositions = {
		{ fromPos = { x = 735, y = 920, z = 8 }, toPos = { x = 710, y = 925, z = 8 } },
		{ fromPos = { x = 736, y = 920, z = 8 }, toPos = { x = 712, y = 925, z = 8 } },
		{ fromPos = { x = 737, y = 920, z = 8 }, toPos = { x = 714, y = 925, z = 8 } },
		{ fromPos = { x = 738, y = 920, z = 8 }, toPos = { x = 716, y = 925, z = 8 } },
		{ fromPos = { x = 739, y = 920, z = 8 }, toPos = { x = 718, y = 925, z = 8 } },
	},
	CountPlayers = {},
}

local baneLever = Action()

function baneLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	setting.CountPlayers = {}
	
	if item.itemid == 9110 then
		for i = 1, 5 do
			
			local creature = Tile(setting.playersPositions[i].fromPos):getTopCreature()
			if creature ~= nil and creature:isPlayer() then
				table.insert(setting.CountPlayers, {fromPos = setting.playersPositions[i].fromPos, toPos = setting.playersPositions[i].toPos})
			end			
		end
		
		-- Checks if you have the 4 players and if they have the required level
		for i = 1, #setting.CountPlayers do
			local creature = Tile(setting.CountPlayers[i].fromPos):getTopCreature()

			if #setting.CountPlayers < 1 then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Atleast one player need to be in tile.")
				return true
			end
			
			if creature and creature:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "All the players need to be level " .. setting.requiredLevel .. " or higher.")
				return true
			end
			
			if not creature:canFightBoss(setting.bossName) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A member from your party needs to wait more time to fight against " .. setting.bossName .. ".")
				return true
				
			end			
		end

		-- Checks if there are still players inside the room, if so, return true
		if roomIsOccupied(setting.centerBossRoomPosition, true, 10, 10) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the boss room.")
			return true
		end

		if #setting.CountPlayers > 0 then
			for i = 1, #setting.bossPosition do
				Game.createMonster(setting.bossName, setting.bossPosition[i])
			end
		end
		-- Get players from the tiles "playersPositions" and teleport to the demons room if all of the above requirements are met
		for i = 1, #setting.CountPlayers do
			local creature = Tile(setting.CountPlayers[i].fromPos):getTopCreature()
			if creature and creature:isPlayer() then
				creature:teleportTo(setting.CountPlayers[i].toPos)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				creature:setBossCooldown(setting.bossName, os.time() + setting.timeToFight * 3600)
				creature:sendBosstiaryCooldownTimer()
				
			else
				return false
			end
		end
		item:transform(9111)
		
	elseif item.itemid == 9111 then	

		if roomIsOccupied(setting.centerBossRoomPosition, true, 10, 10) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't pull the lever with a team inside the boss.")
			return true
		end
		
		-- Removes all monsters so that the next team can enter
		if Position.removeMonster(setting.centerBossRoomPosition, 10, 10) then
			return true
		end
		
		item:transform(9110)
	end
	return true
end

baneLever:uid(43013)
baneLever:register()
