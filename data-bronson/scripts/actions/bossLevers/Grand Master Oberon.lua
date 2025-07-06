local setting = {
	requiredLevel = 200,
	daily = false,
	bossName = "Grand Master Oberon",
	timeToFight = 20,
	centerBossRoomPosition = { x = 1106, y = 1702, z = 9 },
	bossPosition = {
		{ x = 1105, y = 1697, z = 9 },
	},
	
	playersPositions = {
		{ fromPos = { x = 1104, y = 1728, z = 9 }, toPos = { x = 1103, y = 1701, z = 9 } },
		{ fromPos = { x = 1105, y = 1728, z = 9 }, toPos = { x = 1109, y = 1701, z = 9 } },
		{ fromPos = { x = 1106, y = 1728, z = 9 }, toPos = { x = 1106, y = 1702, z = 9 } },
		{ fromPos = { x = 1107, y = 1728, z = 9 }, toPos = { x = 1103, y = 1704, z = 9 } },
		{ fromPos = { x = 1108, y = 1728, z = 9 }, toPos = { x = 1109, y = 1704, z = 9 } },
	},
	CountPlayers = {},
}

local oberonLever = Action()

function oberonLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	setting.CountPlayers = {}
	
	if item.itemid == 2772 then
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
		if roomIsOccupied(setting.centerBossRoomPosition, true, 8, 8) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the boss room.")
			return true
		end

		-- Create monsters
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
				item:transform(2773)
			else
				return false
			end
		end
		
		
	elseif item.itemid == 2773 then	

		if roomIsOccupied(setting.centerBossRoomPosition, true, 8, 8) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't pull the lever with a team inside the boss.")
			return true
		end
		
		-- Removes all monsters so that the next team can enter
		if Position.removeMonster(setting.centerBossRoomPosition, 8, 8) then
			return true
		end
		
		item:transform(2772)
	end
	return true
end

oberonLever:uid(43011)
oberonLever:register()
