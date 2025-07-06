local setting = {
	coffinClose = {2474,2475},
	coffinOpen = {167,163},
	posBlood = { {pos = {x = 833, y = 551, z = 8}}, {pos = {x = 833, y = 552, z = 8}} },
	
}

local function revertBridge(toPosition)

	for i = 1, #setting.coffinClose do
	local coffin = Tile(setting.posBlood[i].pos):getItemById(setting.coffinOpen[i])
		if coffin then
			coffin:transform(setting.coffinClose[i])
			coffin:getPosition():sendMagicEffect(CONST_ME_POFF)
		end

	end
	
	local lever = Tile(toPosition):getItemById(2773)
	
	if lever then
		lever:transform(2772)
	end
	
	return false

end

local becnhwood = Action()

function becnhwood.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if item.itemid == 2772 then
		for i = 1, #setting.coffinClose do
		local coffin = Tile(setting.posBlood[i].pos):getItemById(setting.coffinClose[i])
			if coffin then
				coffin:transform(setting.coffinOpen[i])
				coffin:getPosition():sendMagicEffect(CONST_ME_POFF)
				coffin:getPosition():sendMagicEffect(CONST_ME_BATS)
			end
			
		end
		player:say("<Click...>", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		player:say("A strange mechanism operate and you hear a noise in east...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		addEvent(revertBridge, 1 * 60 * 1000, toPosition)
		item:transform(2773)
	end
	return false
end	
	
becnhwood:aid(43019)
becnhwood:register()
