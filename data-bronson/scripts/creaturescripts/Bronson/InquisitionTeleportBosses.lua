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
        Storage.Quest.U01_24.Inquisition.TheDarkPath,
        Storage.Quest.U01_24.Inquisition.TheCrystalCaves,
        Storage.Quest.U01_24.Inquisition.TheBloodHalls,
        Storage.Quest.U01_24.Inquisition.TheVats,
        Storage.Quest.U01_24.Inquisition.TheVats, 
        Storage.Quest.U01_24.Inquisition.TheArcanum,
        Storage.Quest.U01_24.Inquisition.TheHive,
        Storage.Quest.U01_24.Inquisition.ShadowNexus,
    },
    
    bossName = {
        "Ushuriel",
        "Zugurosh",
        "Madareth",
        "Latrivan",
        "Golgordan",
        "Annihilon",
        "Hellgorak",
    },
}

local function revertBridge(position, key)
		local item = Tile(position):getItemById(config.idGate[1])
		if item ~= nil then
			item:getPosition():sendMagicEffect(CONST_ME_BLUE_ENERGY_SPARK)
			item:remove(1)
		end
end

local InquisitionTeleportBosses = CreatureEvent("InquisitionTeleportBosses")

function InquisitionTeleportBosses.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
    local targetMonster = creature:getMonster()
    if not targetMonster or targetMonster:getMaster() then
        return true
    end

    for key, value in pairs(config.bossName) do
        if value == creature:getName() then
            
            if value == "Latrivan" or value == "Golgordan" then
                local varC = 0
                for i = 4, 5 do
                    local monsterCheck = Creature(config.bossName[i])
                    if not monsterCheck then
                        varC = varC + 1
                    end
                end
                
                if varC < 1 then
                    return false
                end            
            end
            
            onDeathForDamagingPlayers(creature, function(creature, player)
                player:say("You now have 1 minute to exit this room through the teleport, or you will need kill the boss again.", TALKTYPE_MONSTER_SAY)
                if player:getStorageValue(config.questSet[key]) == 2 then
                    return true
                else
                    player:setStorageValue(config.questSet[key], 2)
                    player:setStorageValue(config.questSet[key+1], 1)
                end
            end)
            
            
            local item = Game.createItem(config.idGate[1], 1, config.positionGate[key].telePos)
            if item and item:isTeleport() then
                item:setDestination(config.positionGate[key].teleDest)
            end
            
            local gatePosition = config.positionGate[key].telePos
            addEvent(function() revertBridge(gatePosition, key) end, 1 * 60 * 1000)
        
        end    
    end

    return true
end

InquisitionTeleportBosses:register()
