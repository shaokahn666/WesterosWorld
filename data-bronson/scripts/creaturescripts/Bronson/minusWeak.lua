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
        Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld,
    },
    
    bossName = {
        "Weakned Minus",
    },
    needItem = {8197,5942,3459},	
	
}


local minusWeak = CreatureEvent("minusWeak")


function minusWeak.onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
    local targetMonster = creature:getMonster()
    if not targetMonster or targetMonster:getMaster() then
        return true
    end
	local playersQuest = {}
	local playerSemItem = {}
	local othersAttk = {}
	local trapfail = {}	
	
    for key, value in pairs(config.bossName) do
        if value == creature:getName() then
			for key, value in pairs(creature:getDamageMap()) do
				table.insert(trapfail, key)
				local player = Player(key)
				if player then
					if player:getStorageValue(config.questSet[1]) == 2 then
						table.insert(playersQuest,player)
					end
				else
					table.insert(othersAttk, key)
				end
			end

			if #playersQuest == 0 then
				creature:say("MUAHAHA! You need to damage me to count a kill!", TALKTYPE_MONSTER_SAY)
				creature:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
				creature:remove(1)
				return true
			end

			if #trapfail == 0 then
				creature:say("MUAHAHA! You need to damage me to count a kill!", TALKTYPE_MONSTER_SAY)
				creature:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
				creature:remove(1)
				return true
			end
			
            onDeathForDamagingPlayers(creature, function(creature, player)
				if not player then
					return false
				end
                if player:getStorageValue(config.questSet[1]) ~= 2 then
                    return true
                else
					if player:getStorageValue(config.questSet[1]) == 2 then
						creature:say("You exterminated the weakned minus! Now go back to Trailbone!", TALKTYPE_MONSTER_SAY)
						player:setStorageValue(config.questSet[1], 4)
					end
                end
            end)
        
        end    
    end

    return true
end

minusWeak:register()
