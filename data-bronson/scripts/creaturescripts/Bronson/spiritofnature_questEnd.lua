local config = { 
    
    questSet = {
        Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist,
    },
   
    bossName = {
        "Spirit of nature",
    },
}

local sptofnature = CreatureEvent("sptofnature")

function sptofnature.onPrepareDeath(creature, lastHitKiller, mostDamageKiller)
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
					if player:getStorageValue(config.questSet[1]) >= 3 then
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
                if player:getStorageValue(config.questSet[1]) ~= 3 then
                    return true
                else
					if player:getStorageValue(config.questSet[1]) == 3 then
						creature:say("Voce exterminou o espirito da natureza, volte a trailglacier para contar este feito!", TALKTYPE_MONSTER_SAY)
						player:setStorageValue(config.questSet[1], 4)
					end
                end
            end)
        
        end    
    end

    return true
end

sptofnature:register()
