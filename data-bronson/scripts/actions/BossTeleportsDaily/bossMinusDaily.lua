local setting = {
	bossesSettings = {
        {	--PutridBoss
            requiredLevel = 0,
            bossName = "Minus",
            bossesQuest = {Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld, 5},
            timeToFight = 20,
            centerBossRoomPosition = {x = 27, y = 1011, z = 7},
            bossPosition = {x = 27, y = 1016, z = 7},
            playersPositions = {x = 30, y = 999, z = 7},
			bossesTeleports = Position(1210, 719, 3),
			roomSize = {20,20},
			tpEffect = CONST_ME_HITBYFIRE,
        },
	}
}

local labPos = Position(75,958,7)

local wardrobePos = Position(1210,720,3)

local pos1 = Position(11,995,7)
local pos2 = Position(43,1027,7)

local pos3 = Position(55,928,7)
local pos4 = Position(132,985,7)

local centerLab = Position(95,955,7)
local centerBossQuest = Position (23,969,7)

local minusDaily = Action()

local function revertBridge(idPlayer)
	if isMyselfInArea(idPlayer,pos1,pos2) then
		local player = Player(idPlayer)
		player:teleportTo(wardrobePos)
	end
end

local function expellFromLab(idPlayer)
	if isMyselfInArea(idPlayer,pos3,pos4) then
		local player = Player(idPlayer)
		player:teleportTo(wardrobePos)
	end
end

function minusDaily.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if not player then
		return true
	end
	
	local idPlayer = player:getId()
	
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) >= 1 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) <= 3 then
		if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 1 then
			player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld, 2)
		end
		if player:isPzLocked() then	
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to enter in wardrobe with blood in your hands.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end	
		
		if roomIsOccupied(centerLab, true, 41, 41) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A player is already inside the Labyrinth.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end		

		if roomIsOccupied(centerBossQuest, true, 20, 20) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A player is already inside the Labyrinth.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end
		
		if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.timeWard) < os.time() then
			player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.timeWard, os.time() + 1200)

		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to enter in wardrobe. You need to wait 20 minutes from your last try.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end		
		
		player:teleportTo(labPos)
		addEvent(expellFromLab, 18*60000, idPlayer)
		return true
	end

	for key, value in pairs(setting.bossesSettings) do
		local boss = setting.bossesSettings[key]
		
		if boss.bossesTeleports == toPosition then
		
			if player and player:getLevel() < boss.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be level " .. boss.requiredLevel .. " or higher.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return true
			end
			
			if player:isPzLocked() then	
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to fight against this boss with blood in your hands.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return true
			end
			
			if not player:canFightBoss(boss.bossName) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need to wait more time to fight against " .. boss.bossName .. ".")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return true
			end			

			if  boss.bossesQuest[1] ~= 0 and player:getStorageValue(boss.bossesQuest[1]) ~= boss.bossesQuest[2] then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to fight against this boss. You need advance in some quest first.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return true
			end
			
			-- Checks if there are still players inside the room, if so, return true
			if roomIsOccupied(boss.centerBossRoomPosition, true, boss.roomSize[1], boss.roomSize[2]) then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A player is already inside the boss room.")
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				return true
			end
			
			if Position.removeMonster(boss.centerBossRoomPosition, boss.roomSize[1], boss.roomSize[2]) then

			end
			
			-- Create monsters
			if player then		

				Game.createMonster(boss.bossName, boss.bossPosition)

			end
			
			if player then
				player:teleportTo(boss.playersPositions)
				player:getPosition():sendMagicEffect(boss.tpEffect)
				player:setBossCooldown(boss.bossName, os.time() + boss.timeToFight * 3600)
				player:sendBosstiaryCooldownTimer()
				addEvent(revertBridge, 15*60000, idPlayer)
			else
				return false
			end	
	
			return true
		end
	end
	
end

minusDaily:uid(43024)
minusDaily:register()
