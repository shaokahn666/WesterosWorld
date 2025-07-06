local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1208, y = 717, z = 8 }}, {toPos = { x = 1208, y = 719, z = 8 }},
	},
    bossesQuest = {Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 5},	
}

local AlchemistWallclick = Action()

function AlchemistWallclick.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) < 6 then
		if  setting.bossesQuest[1] ~= 0 and player:getStorageValue(setting.bossesQuest[1]) ~= setting.bossesQuest[2] then
			player:say("This is a wall, and there is no significate for you...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			return true
		end
		
		if player:getOutfit().lookType ~= 21 then
			player:say("Maybe you need to be transformed into a rat to access that tunnel.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			return true
		end
	end
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.WallAlchemist) < os.time() then
		if (player:getPosition().y + 1) == toPosition.y then 

			player:teleportTo(setting.posTeleport[2].toPos)
			player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.WallAlchemist, os.time() + 15)
			player:getPosition():sendMagicEffect(CONST_ME_BATS)
			player:say("You sneak into tower...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 5 then
				player:say("Now you no longer need a rat potion to access.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 6)
			end
		elseif (player:getPosition().y - 1) == toPosition.y then 
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.WallAlchemist, os.time() + 15)
			player:getPosition():sendMagicEffect(CONST_ME_BATS)
			player:say("You sneak into the cave...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		end
	else
		player:say("You need to wait more before use that shortcut...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		player:getPosition():sendMagicEffect(CONST_ME_POFF)

	end
	return false
end

AlchemistWallclick:uid(43021)
AlchemistWallclick:register()
