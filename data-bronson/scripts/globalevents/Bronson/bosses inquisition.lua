local bossTable = {
    {boss = "Ushuriel", pos = {x=1220, y=1101, z=11}, priority = 1, spawnChance = 33},
	{boss = "Zugurosh", pos = {x=1193, y=1065, z=11}, priority = 1, spawnChance = 33},
	{boss = "Madareth", pos = {x=1251, y=1130, z=11}, priority = 1, spawnChance = 33},
	{boss = "Latrivan", pos = {x=1282, y=1101, z=11}, priority = 1, spawnChance = 33},
	{boss = "Golgordan", pos = {x=1291, y=1101, z=11}, priority = 1, spawnChance = 33},
	{boss = "Annihilon", pos = {x=1251, y=1063, z=11}, priority = 1, spawnChance = 33},
	{boss = "Hellgorak", pos = {x=1158, y=1095, z=11}, priority = 1, spawnChance = 33},
}

local serverSaveTime = GetNextOccurrence(configManager.getString(configKeys.GLOBAL_SERVER_SAVE_TIME))
local stopExecutionAt = serverSaveTime - ParseDuration("1h") / ParseDuration("1s") -- stop rolling raids 1 hour before server save

local bossInqSpawn = GlobalEvent("boss.inq.spawn.onThink")
local current_time = os.date("*t").min -- Get the current time table

function bossInqSpawn.onThink(interval, lastExecution)
	local bossNeeded1 = {}
	
	for _, s in pairs(bossTable) do
		local monster = Creature(s.boss)
		if monster == nil then
			if s.priority == 1 then
				table.insert(bossNeeded1, _)
				print(s.boss)
			end
		end

	end

	if #bossNeeded1 == 0 then
		return true
	end
	
	if #bossNeeded1 > 0 then
		for _, s in pairs(bossNeeded1) do
			local bossRespawn = Game.createMonster(bossTable[s].boss, bossTable[s].pos, true, true)
			
			if bossRespawn then
				print(bossTable[s].boss)
			end
		end
		
	end
		
	return true
	
end		

bossInqSpawn:interval(720*60*1000)
bossInqSpawn:register()