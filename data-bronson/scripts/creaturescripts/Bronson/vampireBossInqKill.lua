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
        Storage.Quest.U01_24.Inquisition.TheInquisition,
		Storage.Quest.U01_24.Inquisition.bossVamp,
    },
    
    bossName = {
        "The Lord of Dunedain",
    },
    needItem = {8197,5942,3459},	
	
}


local vampireBossInqKill = CreatureEvent("vampireBossInqKill")


function vampireBossInqKill.onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
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
					if player:getStorageValue(config.questSet[2]) ~= 1 then
						table.insert(playersQuest,player)
					end
					
					for i = 1, #config.needItem do

						if player:getItemCount(config.needItem[i]) < 1 then
							table.insert(playerSemItem, player)
							break
						end
					end
				else
					table.insert(othersAttk, key)
				end
			end
			
			if #playerSemItem > 0 then
				local monster = creature
				for key, value in pairs(playerSemItem) do
					playerSemItem[key]:say("I need certain itens to kill that vampire, maybe i need to get those first!", TALKTYPE_MONSTER_SAY)
				end
				creature:say("HAHAHAH! YOU CAN'T KILL ME I'M IMORTAAL!!", TALKTYPE_MONSTER_SAY)
				creature:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
				creature:getPosition():sendMagicEffect(CONST_ME_BATS)
				creature:remove(1)
				return true
			
			else
				if #othersAttk > 0 and #playerSemItem == 0 then
					creature:say("HAHAHAH! Maybe you need some more weapons to kill me!", TALKTYPE_MONSTER_SAY)
					creature:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
					creature:getPosition():sendMagicEffect(CONST_ME_BATS)
					creature:remove(1)
					return true
				end
			end

			if #trapfail == 0 then
				creature:say("HAHAHAH! You can't kill me without help? Poor girl!", TALKTYPE_MONSTER_SAY)
				creature:getPosition():sendMagicEffect(CONST_ME_BLACKSMOKE)
				creature:getPosition():sendMagicEffect(CONST_ME_BATS)
				creature:remove(1)
				return true
			end
			
            onDeathForDamagingPlayers(creature, function(creature, player)
				if not player then
					return false
				end
                if player:getStorageValue(config.questSet[2]) ~= 1 then
					player:say("I need to wake up my own vampire to prove my bravery!", TALKTYPE_MONSTER_SAY)
					player:getPosition():sendMagicEffect(CONST_ME_POFF)
                    return true
                else
					if player:getStorageValue(config.questSet[1]) ~= 5 and player:getStorageValue(config.questSet[1]) == 4 then
						creature:say("You exterminated the vampire lord with a stake into heart...", TALKTYPE_MONSTER_SAY)
						player:say("Finally! The Dunedain is safety now! I need go back to Henricus to report that!", TALKTYPE_MONSTER_SAY)
						player:setStorageValue(config.questSet[1], 5)
					
					else
						player:say("Kill that vampire without a purpose was a bad ideia...", TALKTYPE_MONSTER_SAY)
						return true					
					end
                end
            end)
        
        end    
    end

    return true
end

vampireBossInqKill:register()
