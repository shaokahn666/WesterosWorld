local setting = {
	bossesSettings = {
        {	--PutridBoss
            requiredLevel = 0,
            bossName = "Weakned Minus",
            bossesQuest = {Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld, 2},
            timeToFight = 20,
            centerBossRoomPosition = {x = 23, y = 969, z = 7},
            bossPosition = {x = 23, y = 974, z = 7},
            playersPositions = {x = 26, y = 957, z = 7},
			bossesTeleports = Position(83, 961, 7),
			roomSize = {20,20},
			tpEffect = CONST_ME_HITBYFIRE,
        },
	}
}
local wardrobePos = Position(1210,720,3)

local pos1 = Position(5,952,7)
local pos2 = Position(40,987,7)

local function revertBridge(idPlayer)
	if isMyselfInArea(idPlayer,pos1,pos2) then
		local player = Player(idPlayer)
		player:teleportTo(wardrobePos)
	end
end


local minusBossTp = MoveEvent()

function minusBossTp.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local idPlayer = player:getId()

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
			
			--if not player:canFightBoss(boss.bossName) then
			--	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need to wait more time to fight against " .. boss.bossName .. ".")
			--	player:teleportTo(fromPosition)
			--	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			--	return true
			--end			

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
			
			-- Create monsters
			if player then		

				Game.createMonster(boss.bossName, boss.bossPosition)

			end
			
			if creature and creature:isPlayer() then
				creature:teleportTo(boss.playersPositions)
				creature:getPosition():sendMagicEffect(boss.tpEffect)
				addEvent(revertBridge, 15*60000, idPlayer)

			else
				return false
			end	
	
			return true
		end
	end
	
end

minusBossTp:uid(43023)
minusBossTp:register()
