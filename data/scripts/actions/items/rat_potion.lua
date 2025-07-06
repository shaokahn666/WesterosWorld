local ratPotion = Action()

local pos1 = Position(1195,703,8)
local pos2 = Position(1211,718,8)

function ratPotion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:hasExhaustion("rat potion") then
		return true
	end

	local playerTile = Tile(player:getPosition())
	if playerTile and playerTile:getGround() and table.contains(swimmingTiles, playerTile:getGround():getId()) then
		player:say("you can't transform into a rat in water... that will kill you.", TALKTYPE_MONSTER_SAY)
		return true
	end
	
	if isMyselfInArea(player:getId(),pos1,pos2) then

		player:setMonsterOutfit("rat", 30*1000)
		item:remove(1)
		player:say("oh, look at you.. now you are a little rat.", TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
		player:setExhaustion("rat potion", 30 * 1)
	
	else
		player:sendCancelMessage("You cannot transform into a rat without being in alchemist tunnel.")
		player:setExhaustion("rat potion", 15 * 1)
	end
	return true
end

ratPotion:id(21188)
ratPotion:register()
