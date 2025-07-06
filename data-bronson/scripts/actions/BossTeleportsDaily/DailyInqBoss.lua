local setting = {
	requiredLevel = 2,
	daily = false,
	bossName = {
	"Lord Baalsec",
	"Lord Benchwood",
	"Lord Hildegaar Bingen",
	"Lord Asemuth"
	},
	
	timeToFight = 20,
	centerBossRoomPosition = {
	{posCenter = {x = 551, y = 86, z = 9 }}, 
	{posCenter = {x = 808, y = 552, z = 9 }},
	{posCenter = {x = 995, y = 691, z = 9 }},
	{posCenter = {x = 1354, y = 362, z = 9 }},
	},
	
	bossPosition = {
		{ x = 555, y = 88, z = 9 }, 
		{ x = 804, y = 551, z = 9 }, 
		{ x = 992, y = 688, z = 9 }, 
		{ x = 1355, y = 364, z = 9 },
	},
	
	playersPositions = {
		{toPos = { x = 549, y = 86, z = 9 } },
		{toPos = { x = 814, y = 551, z = 9 } },
		{toPos = { x = 995, y = 696, z = 9 } },
		{toPos = { x = 1355, y = 369, z = 9 } },		
	},
	
	bossesTeleports = {
		Position(552, 87, 8 ),
		Position(847, 550, 9 ),
		Position(1002, 703, 8 ),
		Position(1388, 367, 8 )
		}
}

local dailyInq = MoveEvent()

function dailyInq.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
	local varSetLoc = 0
	for key, value in pairs(setting.bossesTeleports) do
		if value == position then
			varSetLoc = key
		end
	end

	if player and player:getLevel() < setting.requiredLevel then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be level " .. setting.requiredLevel .. " or higher.")
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
	
	if not player:canFightBoss(setting.bossName[varSetLoc]) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you need to wait more time to fight against " .. setting.bossName[varSetLoc] .. ".")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end			

	if player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) < 3 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not allowed to fight against this boss. You need advance in some quest first.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	-- Checks if there are still players inside the room, if so, return true
	if roomIsOccupied(setting.centerBossRoomPosition[varSetLoc].posCenter, true, 11, 11) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "A player is already inside the boss room.")
		player:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		return true
	end
	
	if Position.removeMonster(setting.centerBossRoomPosition, 12, 12) then

	end
	
	-- Create monsters
	if player then		

		Game.createMonster(setting.bossName[varSetLoc], setting.bossPosition[varSetLoc])

	end
	
	if creature and creature:isPlayer() then
		creature:teleportTo(setting.playersPositions[varSetLoc].toPos)
		creature:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
		creature:setBossCooldown(setting.bossName[varSetLoc], os.time() + setting.timeToFight * 3600)
		creature:sendBosstiaryCooldownTimer()
	else
		return false
	end
	return true
end

dailyInq:aid(43018)
dailyInq:register()
