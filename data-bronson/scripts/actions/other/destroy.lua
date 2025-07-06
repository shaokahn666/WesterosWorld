local destroy = Action()

local actionsUniq = {
	[43006] = {toPos = Position(1008, 339,7), 
	text = "The fountain recognize your weapon was purified, you can enter now in purgatory...", 
	effect1 = CONST_ME_MAGIC_RED,
	effect2 = CONST_ME_HITBYFIRE}
}

function destroy.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- Tibia tales quest, Aritos task
	if actionsUniq[target.uid] then
	
		toPosition:sendMagicEffect(CONST_ME_YALAHARIGHOST)
		player:say(actionsUniq[target.uid].text, TALKTYPE_MONSTER_SAY, false, player, toPosition)
		player:getPosition():sendMagicEffect(actionsUniq[target.uid].effect1)
		player:teleportTo(actionsUniq[target.uid].toPos)
		player:getPosition():sendMagicEffect(actionsUniq[target.uid].effect2)
	else
		return onDestroyItem(player, item, fromPosition, target, toPosition, isHotkey)
	end
end

for id = 3264, 3292 do
	destroy:id(id)
end
for id = 3296, 3303 do
	destroy:id(id)
end
for id = 3305, 3307 do
	destroy:id(id)
end
for id = 3309, 3341 do
	destroy:id(id)
end
destroy:id(3294)

destroy:register()
