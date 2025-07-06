local setting = {
	requiredLevel = 200,
	daily = false,
	bossName = {
	"Rupture",
	"Eradicator",
	"Aftershock",
	"World Devourer",
	},
	timeToFight = 20,
	centerBossRoomPosition = {
		{ x = 2003, y = 482, z = 15 },
		{ x = 2058, y = 482, z = 15 },
		{ x = 2030, y = 449, z = 15 },
		{ x = 2030, y = 425, z = 15 },
		{ x = 1996, y = 424, z = 15 },
	},
	bossPosition = {
		{ x = 2003, y = 474, z = 15 },
		{ x = 2066, y = 482, z = 15 },
		{ x = 2030, y = 457, z = 15 },
		{ x = 2030, y = 417, z = 15 },
	},
	
	playersPositions = {
		{ fromPos = { x = 2031, y = 484, z = 15 }, toPos = { x = 2001, y = 490, z = 15 } },
		{ fromPos = { x = 2031, y = 485, z = 15 }, toPos = { x = 2002, y = 490, z = 15 } },
		{ fromPos = { x = 2031, y = 486, z = 15 }, toPos = { x = 2003, y = 490, z = 15 } },
		{ fromPos = { x = 2031, y = 487, z = 15 }, toPos = { x = 2004, y = 490, z = 15 } },
		{ fromPos = { x = 2031, y = 488, z = 15 }, toPos = { x = 2005, y = 490, z = 15 } },
	},
	CountPlayers = {},
}

local voidLever = Action()

function voidLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	setting.CountPlayers = {}
	
	if item.itemid == 8911 then
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
			
			if not creature:canFightBoss(setting.bossName[1]) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A member from your party needs to wait more time to fight against " .. setting.bossName[1] .. ".")
				return true
				
			end			
		end

		for i = 1, #setting.centerBossRoomPosition do
			if roomIsOccupied(setting.centerBossRoomPosition[i], true, 15, 15) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the boss room.")
				return true
			end
		end

		-- Create monsters
		if #setting.CountPlayers > 0 then		
			for i = 1, #setting.bossPosition do
				Game.createMonster(setting.bossName[i], setting.bossPosition[i])
			end
		end
		
		-- Get players from the tiles "playersPositions" and teleport to the demons room if all of the above requirements are met
		for i = 1, #setting.CountPlayers do
			local creature = Tile(setting.CountPlayers[i].fromPos):getTopCreature()
			if creature and creature:isPlayer() then
				creature:teleportTo(setting.CountPlayers[i].toPos)
				creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				for i = 1, #setting.bossName do
					creature:setBossCooldown(setting.bossName[i], os.time() + setting.timeToFight * 3600)
					creature:sendBosstiaryCooldownTimer()
				end
				
				item:transform(8912)
			else
				return false
			end
		end
		
		
	elseif item.itemid == 8912 then	

		for i = 1, #setting.centerBossRoomPosition do
			if roomIsOccupied(setting.centerBossRoomPosition[i], true, 15, 15) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A team is already inside the boss room.")
				return true
			end
		end
		
		for i = 1, #setting.centerBossRoomPosition do
			if Position.removeMonster(setting.centerBossRoomPosition[i], 15, 15) then
				return true
			end
		end		
		item:transform(8911)
	end
	return true
end

voidLever:uid(43014)
voidLever:register()
