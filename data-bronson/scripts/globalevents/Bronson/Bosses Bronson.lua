local bossTable = {
    {boss = "Smaug", pos = {x=1404, y=382, z=3}, priority = 2, bossId = 1},
	{boss = "Laracna", pos = {x=980, y=866, z=12}, priority = 1, bossId = 2},
	{boss = "son of ancalagon", pos = {x=955, y=369, z=8}, priority = 1, bossId = 3},
	{boss = "son of ancalagon", pos = {x=1651, y=615, z=12}, priority = 1, bossId = 4},
	{boss = "Wormageddon", pos = {x=331, y=390, z=8}, priority = 1, bossId = 5},
	{boss = "olog-hai", pos = {x=1664, y=1141, z=8}, priority = 1, bossId = 6},
	{boss = "olog-hai", pos = {x=507, y=835, z=10}, priority = 1, bossId = 7},
	{boss = "scatha", pos = {x=1394, y=210, z=9}, priority = 1, bossId = 8},
	{boss = "valaraukar", pos = {x=554, y=295, z=1}, priority = 1, bossId = 9},
	{boss = "valaraukar", pos = {x=332, y=508, z=4}, priority = 1, bossId = 10},
    {boss = "ferumbras", pos = {x=1865, y=811, z=0}, priority = 2, bossId = 11},
	{boss = "jormungand", pos = {x=616, y=518, z=9}, priority = 1, bossId = 12},
	{boss = "adramelech", pos = {x=1659, y=517, z=11}, priority = 2, bossId = 13},
	{boss = "ancalagon", pos = {x=1630, y=851, z=14}, priority = 2, bossId = 14},
    {boss = "eddie", pos = {x=1636, y=458, z=11}, priority = 1, bossId = 15},
	{boss = "the necromancer", pos = {x=557, y=315, z=0}, priority = 2, bossId = 16},
	{boss = "baalrog", pos = {x=553, y=761, z=9}, priority = 2, bossId = 17},
	{boss = "Emelianenko", pos = {x=1206, y=766, z=11}, priority = 2, bossId = 18},
	{boss = "khel thuzad", pos = {x=1788, y=453, z=15}, priority = 2, bossId = 19},
	{boss = "ungoliant", pos = {x=1790, y=374, z=6}, priority = 2, bossId = 20},
	{boss = "saruman", pos = {x=959, y=983, z=1}, priority = 2, bossId = 21},
    {boss = "cerberus", pos = {x=1779, y=355, z=12}, priority = 2, bossId = 22},
	{boss = "scatha", pos = {x=1104, y=1183, z=0}, priority = 1, bossId = 23},
	{boss = "azaka", pos = {x=537, y=196, z=6}, priority = 1, bossId = 24},
	{boss = "Melkors Summon", pos = {x=1540, y=94, z=13}, priority = 2, bossId = 25},
	{boss = "Avari Leader", pos = {x=978, y=1341, z=8}, priority = 2, bossId = 26},
	{boss = "Azazel", pos = {x=374, y=182, z=9}, priority = 2, bossId = 27},
	{boss = "The Necromancer", pos = {x=337, y=706, z=1}, priority = 2, bossId = 28},
	{boss = "Wormageddon", pos = {x=274, y=832, z=9}, priority = 1, bossId = 29},
	{boss = "Melkors Summon", pos = {x=309, y=846, z=9}, priority = 2, bossId = 30},
	{boss = "Lord of The Elements", pos = {x=127, y=818, z=13}, priority = 2, bossId = 31},
	{boss = "deathstrike", pos = {x=1431, y=484, z=9}, priority = 2, bossId = 32},
	{boss = "Obujos", pos = {x=651, y=1153, z=13}, priority = 2, bossId = 33},
    {boss = "Jaul", pos = {x=775, y=1162, z=13}, priority = 2, bossId = 34},
    {boss = "Evancing", pos = {x=777, y=1514, z=12}, priority = 2, bossId = 35},
	{boss = "Glooth Fairy", pos = {x=535, y=1491, z=7}, priority = 2, bossId = 36},
	{boss = "Zamulosh", pos = {x=1848, y=352, z=13}, priority = 2, bossId = 37},
	{boss = "Sauron", pos = {x=1630, y=1142, z=8}, priority = 2, bossId = 38}
}

local function bossCreateCreature(bossToDeath)
local query = "SELECT bossId FROM bosses_alive WHERE bossId = ".. bossToDeath.." AND boss_alive = 0"
local queryBossAlive = db.storeQuery(query)

	if queryBossAlive then
		local updateQuery = string.format("UPDATE bosses_alive SET boss_alive = 1 WHERE bossId = %d", bossToDeath)
		db.query(updateQuery)
		Result.free(updateQuery)
		
	end
	Result.free(queryBossAlive)
end

local serverSaveTime = GetNextOccurrence(configManager.getString(configKeys.GLOBAL_SERVER_SAVE_TIME))
local stopExecutionAt = serverSaveTime - ParseDuration("1h") / ParseDuration("1s") -- stop rolling raids 1 hour before server save
local bossSpawn = GlobalEvent("boss.spawn.onThink")
local current_time = os.date("*t").min -- Get the current time table

function bossSpawn.onThink(interval, lastExecution)
	local current_time = os.date("*t").min -- Get the current time table
	local sleepTime = os.time() -- Get the current timestamp
	local bossNeeded1 = {}
	local bossNeeded2 = {}
	
	for _, s in pairs(bossTable) do
		local monster = Creature(s.boss)
		if monster == nil then
			if s.priority == 1 then
				table.insert(bossNeeded1, _)
				
			elseif s.priority == 2 then
				table.insert(bossNeeded2, _)	
			end
		end
	
	end
	
	if #bossNeeded1 == 0 and #bossNeeded2 == 0 then
		return true
	end
	
	if #bossNeeded1 > 0 then
		local rand = bossNeeded1[math.random(1, #bossNeeded1)]
		local bossRespawn = Game.createMonster(bossTable[rand].boss, bossTable[rand].pos, true, true)
		
		print(bossTable[rand].boss)
		bossCreateCreature(bossTable[rand].bossId)
		
	end
	
	if #bossNeeded2 > 0 then
		local rand2 = bossNeeded2[math.random(1, #bossNeeded2)]
		local bossRespawn = Game.createMonster(bossTable[rand2].boss, bossTable[rand2].pos, true, true)
		print(bossTable[rand2].boss)
		bossCreateCreature(bossTable[rand2].bossId)
		
	end
		
	return true
	
end		

bossSpawn:interval(30*60*1000)
bossSpawn:register()