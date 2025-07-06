local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1116, y = 1694, z = 7 }}, {toPos = { x = 737, y = 918, z = 8 }},
	},
	
}

local baneBook = Action()

function baneBook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player then
		return true
	end
	
	if  player:getLevel() >= 200 then
		item:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:getPosition():sendMagicEffect(CONST_ME_HITBYFIRE)
		player:teleportTo(setting.posTeleport[2].toPos)
		player:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
		player:say("The evil jailed in the book has escape...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		player:say("You feel a dark energy touching your body and teleporting you to a evil local.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	else
		player:say("You feel so pure to touch a evil book...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
	end
	
	return false
end

baneBook:uid(43012)
baneBook:register()
