local setting = {
	bossesSettings = {
        {	--PutridBoss
            requiredLevel = 80,
            bossName = "Mahrdis",
            bossesQuest = {0, 0},
            timeToFight = 20,
            centerBossRoomPosition = {x = 1702, y = 436, z = 9},
            bossPosition = {x = 1703, y = 430, z = 9},
            playersPositions = {x = 1703, y = 437, z = 9},
			bossesTeleports = Position(1701, 465, 9),
			roomSize = {15,15},
			tpEffect = CONST_ME_HOLYAREA,
        },
        {	--WereBadgers
            requiredLevel = 2,
            bossName = "Sharpclaw",
            bossesQuest = {0, 0},
            timeToFight = 20,
            centerBossRoomPosition = {x = 643, y = 416, z = 8},
            bossPosition = {x = 647, y = 416, z = 8},
            playersPositions = {x = 639, y = 416, z = 8},
			bossesTeleports = Position(636, 440, 8),
			roomSize = {10,10},
			tpEffect = CONST_ME_HITBYFIRE,
        },
        {	--WereBoar
            requiredLevel = 2,
            bossName = "bloodback",
            bossesQuest = {0, 0},
            timeToFight = 20,
            centerBossRoomPosition = {x = 743, y = 428, z = 9},
            bossPosition = {x = 737, y = 429, z = 9},
            playersPositions = {x = 747, y = 429, z = 9},
			bossesTeleports = Position(700, 440, 9),
			roomSize = {12,12},
			tpEffect = CONST_ME_HITBYPOISON,
        },
        {	--Werebear
            requiredLevel = 2,
            bossName = "Shadowpelt",
            bossesQuest = {0, 0},
            timeToFight = 20,
            centerBossRoomPosition = {x = 669, y = 473, z = 10},
            bossPosition = {x = 664, y = 474, z = 10},
            playersPositions = {x = 676, y = 474, z = 10},
			bossesTeleports = Position(719, 464, 10),
			roomSize = {15,15},
			tpEffect = CONST_ME_PURPLEENERGY,
        },
        {	--Werewolf
            requiredLevel = 2,
            bossName = "Darkfang",
            bossesQuest = {0, 0},
            timeToFight = 20,
            centerBossRoomPosition = {x = 786, y = 401, z = 11},
            bossPosition = {x = 792, y = 400, z = 11},
            playersPositions = {x = 779, y = 401, z = 11},
			bossesTeleports = Position(782, 424, 11),
			roomSize = {15,15},
			tpEffect = CONST_ME_MORTAREA,
        },
        {	--spirit of nature
            requiredLevel = 50,
            bossName = "Spirit of Nature",
            bossesQuest = {Storage.Quest.U01_24.TheAlchemistQuest.doorSpiritofNature, 1},
            timeToFight = 20,
            centerBossRoomPosition = {x = 26, y = 335, z = 8},
            bossPosition = {x = 20, y = 340, z = 8},
            playersPositions = {x = 29, y = 333, z = 8},
			bossesTeleports = Position(132, 255, 8),
			roomSize = {15,15},
			tpEffect = CONST_ME_GREENSMOKE,
        },
	}
}



local dailyBossGeneral = MoveEvent()

function dailyBossGeneral.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	for key, value in pairs(setting.bossesSettings) do
		local boss = setting.bossesSettings[key]
		
		if boss.bossesTeleports == position then
		
			if player and player:getLevel() < boss.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be level " .. boss.requiredLevel .. " or higher.")
				player:teleportTo(fromPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			
			if player:isPzLocked() then	
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to fight against this boss with blood in your hands.")
				player:teleportTo(fromPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			
			if not player:canFightBoss(boss.bossName) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need to wait more time to fight against " .. boss.bossName .. ".")
				player:teleportTo(fromPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end			

			if  boss.bossesQuest[1] ~= 0 and player:getStorageValue(boss.bossesQuest[1]) ~= boss.bossesQuest[2] then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to fight against this boss. You need advance in some quest first.")
				player:teleportTo(fromPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			
			-- Checks if there are still players inside the room, if so, return true
			if roomIsOccupied(boss.centerBossRoomPosition, true, boss.roomSize[1], boss.roomSize[2]) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A player is already inside the boss room.")
				player:teleportTo(fromPosition)
				player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			
			if Position.removeMonster(boss.centerBossRoomPosition, boss.roomSize[1], boss.roomSize[2]) then

			end
			
			if player then
				Game.createMonster(boss.bossName, boss.bossPosition)
			end
			
			if creature and creature:isPlayer() then
				creature:teleportTo(boss.playersPositions)
				creature:getPosition():sendMagicEffect(boss.tpEffect)
				creature:setBossCooldown(boss.bossName, os.time() + boss.timeToFight * 3600)
				creature:sendBosstiaryCooldownTimer()
			else
				return false
			end	
	
			return true
		end
	end
	
end

dailyBossGeneral:aid(43023)
dailyBossGeneral:register()
