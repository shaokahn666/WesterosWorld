local config = { 
    questSet = {
        Storage.Quest.U01_24.Inquisition.TheInquisition,
		Storage.Quest.U01_24.Inquisition.bossVamp,


    },
    
    bossName = {
		{boss = "The Lord of Dunedain", pos = {x=1872, y=609, z=10}},
    },
}

local vampInqBoss = Action()

function vampInqBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	if  player:getLevel() >= 200 then
		
		if player:getStorageValue(config.questSet[1]) == 4 and player:getStorageValue(config.questSet[2]) ~= 1 then
		
			local vampCheck = Creature(config.bossName[1].boss)
			if vampCheck then
				player:say("Maybe there is a vampire to kill, no?", TALKTYPE_MONSTER_SAY)
				return true
			end
			
			Game.createMonster(config.bossName[1].boss, config.bossName[1].pos, true, true)
			toPosition:sendMagicEffect(CONST_ME_BLACKSMOKE)
			player:setStorageValue(config.questSet[2], 1)
			
		end

	end
	
	return false
end

vampInqBoss:uid(43015)
vampInqBoss:register()
