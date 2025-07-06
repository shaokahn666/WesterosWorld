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


function killProcessInq(creature)

    local targetMonster = creature:getMonster()
    if not targetMonster or targetMonster:getMaster() then
        return true
    end
	
	
	local playersQuest = {}
	local playerSemItem = {}
	
    for key, value in pairs(config.bossName) do

        if value == creature:getName() then
			
			for key, value in pairs(creature:getDamageMap()) do
				print("aa")
				local player = Player(key)
				if player:getStorageValue(config.questSet[2]) ~= 1 then
					table.insert(playersQuest,player)
				end
				
				for i = 1, #config.needItem do
					print("needitem")
					if player:getItemCount(config.needItem[i]) < 1 then
						table.insert(playerSemItem, player)
						break
					end
				end
				
			end
			if #playerSemItem > 0 then
				local monster = creature
				for key, value in pairs(playerSemItem) do
					playerSemItem[key]:say("I need certain itens to kill that vampire, maybe i need to get those first!", TALKTYPE_MONSTER_SAY)
				end
				return true
			end
		end
	end
	
end




function SendImmunoVamp(monster)
	monster:registerEvent("vampInqImmu")
end

function removeImmunoVamp(monster)
	monster:unregisterEvent("vampInqImmu")
end