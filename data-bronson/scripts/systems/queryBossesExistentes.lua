local function checkBaseBosses(bossCountSql)
    -- Consulta os bosses existentes na tabela `bosses_alive`
    local bossQuery = db.storeQuery("SELECT COUNT(bossId) AS total FROM bosses_alive")
    local existingBosses = {}

    if bossQuery then
		local totalBosses = Result.getNumber(bossQuery, 'total')
		if totalBosses then
			table.insert(bossCountSql,totalBosses)
		end
		Result.free(bossQuery)
    end
end	

local function bossAliveStart(bossIdsGreaterThanZero)
local query = "SELECT bossId FROM bosses_alive WHERE boss_alive = 1"
local queryBossAlive = db.storeQuery(query)

-- Table to store the fetched bossId values
	if queryBossAlive then

		repeat
			local bossId = Result.getNumber(queryBossAlive, "bossId")
			
			if bossId > 0 then
				table.insert(bossIdsGreaterThanZero, bossId)
			end
		until not Result.next(queryBossAlive)
		Result.free(queryBossAlive)
	end
end

local bossStartUp = GlobalEvent("bossStartUp")

function bossStartUp.onStartup()
	dofile("data-bronson/scripts/globalevents/Bronson/bossesTable.lua") 
 -- Criar a tabela se não existir
	db.query([[
		CREATE TABLE IF NOT EXISTS `bosses_alive` (
			`bossname` TEXT,
			`boss_x` INT NOT NULL DEFAULT 0,  -- Valor padrão corrigido para 0
			`boss_y` INT NOT NULL DEFAULT 0,  -- Valor padrão corrigido para 0
			`boss_z` INT NOT NULL DEFAULT 0,  -- Valor padrão corrigido para 0
			`boss_alive` INT NOT NULL DEFAULT 0,  -- Valor padrão corrigido para 0
			`bossId` INT NOT NULL DEFAULT 0,
			PRIMARY KEY (`bossId`)
		)
	]])
	local bossIdsGreaterThanZero = {}
	local bossCountSql = {}
	-- Tente carregar o arquivo
	local status, err = pcall(function()
		bossTable = dofile("data-bronson/scripts/globalevents/Bronson/bossesTable.lua")
	end)

	if not status then
		print("[ERROR] Erro ao carregar bossesTable.lua: " .. err)
	end
	
	checkBaseBosses(bossCountSql)
	bossAliveStart(bossIdsGreaterThanZero)
	
    if #bossTable > bossCountSql[1] then
		db.query("DELETE FROM bosses_alive;")
		for _, boss in ipairs(bossTable) do
		-- Verificar se o boss já está na tabela

			local insertAliveQuery = string.format(
				"INSERT INTO bosses_alive (bossname, boss_x, boss_y, boss_z, bossId) VALUES (%s, %d, %d, %d, %d)",
				db.escapeString(boss.boss), boss.pos.x, boss.pos.y, boss.pos.z, boss.bossId
			)
			db.query(insertAliveQuery)

			print("[INFO] Boss adicionado à database:", boss.boss)
		end
	end
	
	for value, boss in ipairs(bossIdsGreaterThanZero) do
		local bossRespawn = Game.createMonster(bossTable[boss].boss, bossTable[boss].pos, true, true)
	end
	
    return true
end

bossStartUp:register()
