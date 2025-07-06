local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1817, y = 536, z = 7 }, toPos = { x = 1818, y = 536, z = 7 }},
	},
	idGate = {30991},
	posBlood = { {pos = {x = 1818, y = 535, z = 7}} },
	
}

local function revertBridge()

	local item = Tile(setting.posTeleport[1].toPos):getItemById(setting.idGate[1])
	if item ~= nil then

		item:getPosition():sendMagicEffect(CONST_ME_STONES)
		item:remove(1)
		local ad = Tile(setting.posTeleport[1].fromPos):getItemById(566)
		ad:transform(9856)
		Game.createItem(setting.idGate[1], 1, setting.posTeleport[1].fromPos):setActionId(43017)

	end


end

local viscountEntrace = Action()

function viscountEntrace.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	if  player:getLevel() >= 1 then
		local posBlood = Tile(setting.posBlood[1].pos):getItemById(2874,5)
		if posBlood then
			posBlood:getPosition():sendMagicEffect(CONST_ME_DRAWBLOOD)
			posBlood:remove(1)
			player:say("<Cliiinkkk...Craaank...Uhmm...>", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			toPosition:sendMagicEffect(CONST_ME_STONES)
			local item = Tile(setting.posTeleport[1].fromPos):getItemById(setting.idGate[1])
			if item ~= nil then
				item:remove(1)
				Game.createItem(setting.idGate[1], 1, setting.posTeleport[1].toPos)
				local ad = Tile(setting.posTeleport[1].fromPos):getItemById(9856)
				if ad then
					ad:transform(566)
				end
			end
			player:getPosition():sendMagicEffect(CONST_ME_BATS)
			player:say("A strange mechanism push the coffin to forward, in trade of some blood...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			
			addEvent(revertBridge, 1 * 15 * 1000)
		end
	end
	
	return false
end

viscountEntrace:aid(43017)
viscountEntrace:register()
