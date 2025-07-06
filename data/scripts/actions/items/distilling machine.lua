local distillingMachine = Action()

local function machineFunction(playerId, toPosition)
	local player = Player(playerId)
	if player then
		player:addItem(21838,1)
		if toPosition and player then
			toPosition:sendMagicEffect(CONST_ME_SMOKE)
			player:say("<fuuuh>... <fuuuuh>.. <fuuuuh>..", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
	end
end

function distillingMachine.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if not player then
		return false
	end
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 2 then
		
		if player:getItemCount(2874,1) >= 1 and player:getItemCount(5467,1) >= 1 then
			player:say("You insert water in machine and wait to turn into a distilled water.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			toPosition:sendMagicEffect(CONST_ME_POFF)
			player:removeItem(2874,1)
			player:say("Wrrr... Wrrrrr. Wrrr....", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			addEvent(machineFunction, 1 * 3 * 1000, player:getId(), toPosition)
		else
			player:say("To operate this machine you will need a Fire Bug and a Vial of Water.", TALKTYPE_MONSTER_SAY, false, player, toPosition)
		end
	else
		player:sendCancelMessage("You don't know how to operate that.")
	end
	
	return true
end

distillingMachine:id(5469,5468)
distillingMachine:register()
