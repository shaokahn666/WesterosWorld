local config = { 
    idGate = {34111},
    positionGate = {
        { telePos = { x = 1228, y = 1101, z = 11 }, teleDest = { x = 1123, y = 1155, z = 13 } },
        { telePos = { x = 1196, y = 1065, z = 11 }, teleDest = { x = 1426, y = 986, z = 14 } },
        { telePos = { x = 1251, y = 1128, z = 11 }, teleDest = { x = 1207, y = 1155, z = 12 } },
        { telePos = { x = 1286, y = 1096, z = 11 }, teleDest = { x = 1092, y = 1126, z = 15 } },
        { telePos = { x = 1286, y = 1096, z = 11 }, teleDest = { x = 1092, y = 1126, z = 15 } },
        { telePos = { x = 1251, y = 1060, z = 11 }, teleDest = { x = 1253, y = 1059, z = 12 } },
        { telePos = { x = 1158, y = 1091, z = 11 }, teleDest = { x = 1164, y = 1055, z = 12 } },
    },
    
    questSet = {
        Storage.Quest.U01_24.Inquisition.SecondInquisition,
		Storage.Quest.U01_24.Inquisition.bossDrag,
    },
    
    bossName = {
        "Thawing Dragon Lord",
    },
    needItem = {8197,5942,3459},	
	
}


local ThawingDrag = CreatureEvent("ThawingDrag")


function ThawingDrag.onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
    local targetMonster = creature:getMonster()
    if not targetMonster or targetMonster:getMaster() then
        return true
    end
	local playersQuest = {}
	local othersAttk = {}
	local trapfail = {}	

	
    for key, value in pairs(config.bossName) do
        if value == creature:getName() then
			for key, value in pairs(creature:getDamageMap()) do
				table.insert(trapfail, key)
				local player = Player(key)
				if player then
					if player:getStorageValue(config.questSet[2]) == 0 then
						table.insert(playersQuest,player)
						print("aa")
					end
				else
					table.insert(othersAttk, key)
				end
			end
			
            onDeathForDamagingPlayers(creature, function(creature, player)
				if not player then
					return false
				end
				if player:getStorageValue(config.questSet[1]) == 2 and player:getStorageValue(config.questSet[2]) == 0 then
					creature:say("ROOOOOOOOOARRRRRRRR!!!", TALKTYPE_MONSTER_SAY)
					player:say("Finally! This will be suficient to Lawrence! With that i can grab a new mission!", TALKTYPE_MONSTER_SAY)
					player:setStorageValue(config.questSet[2], 1)
				
				else
					return true					
				end

            end)
        
        end    
    end

    return true
end

ThawingDrag:register()
