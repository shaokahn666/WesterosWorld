
local function bossAliveStart(bossToDeath)
local query = "SELECT bossId FROM bosses_alive WHERE bossname = ".. db.escapeString(bossToDeath).." AND boss_alive = 1"
local queryBossAlive = db.storeQuery(query)

	if queryBossAlive then
		local bossId = Result.getNumber(queryBossAlive,"bossId") -- Pega o ID do boss encontrado
		Result.free(bossId) -- Libera o resultado da query
		
		local updateQuery = string.format("UPDATE bosses_alive SET boss_alive = 0 WHERE bossId = %d", bossId)
		db.query(updateQuery)
		Result.free(updateQuery)
		
	end
	Result.free(queryBossAlive)
end

local bossesAlive = CreatureEvent("bossesAlive")

function bossesAlive.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local targetMonster = creature:getMonster()
    if not targetMonster or targetMonster:getMaster() then
        return true
    end
            
	onDeathForDamagingPlayers(creature, function(creature, player)

		bossAliveStart(targetMonster:getName())

	end)
	
    return true
end

bossesAlive:register()
