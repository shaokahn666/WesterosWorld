local doorId = {}
local keyLockedDoor = {}
local keyUnlockedDoor = {}


for index, value in ipairs(KeyDoorTable) do
	if not table.contains(doorId, value.closedDoor) then
		table.insert(doorId, value.closedDoor)
	end
	if not table.contains(doorId, value.lockedDoor) then
		table.insert(doorId, value.lockedDoor)
	end
	if not table.contains(doorId, value.openDoor) then
		table.insert(doorId, value.openDoor)
	end
	if not table.contains(keyLockedDoor, value.lockedDoor) then
		table.insert(keyLockedDoor, value.lockedDoor)
	end
	if not table.contains(keyUnlockedDoor, value.closedDoor) then
		table.insert(keyUnlockedDoor, value.closedDoor)
	end
end

for index, value in pairs(keysID) do
	if not table.contains(doorId, value) then
		table.insert(doorId, value)
	end
end

local keyDoor = Action()
function keyDoor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	-- It is locked msg
	if table.contains(keyLockedDoor, item.itemid) or (table.contains(keyUnlockedDoor, item.itemid) and table.contains({ 1001, 101 }, item.actionid)) then
		player:sendTextMessage(MESSAGE_LOOK, "It is locked.")
		return true
	end

	-- onUse unlocked key door
	for index, value in ipairs(KeyDoorTable) do
		if value.closedDoor == item.itemid then
			item:transform(value.openDoor)
			item:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_OPEN_DOOR)
			return true
		end
	end
	for index, value in ipairs(KeyDoorTable) do
		if value.openDoor == item.itemid then
			if Creature.checkCreatureInsideDoor(player, toPosition) then
				return false
			end
			item:transform(value.closedDoor)
			item:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_CLOSE_DOOR)
			return true
		end
	end

	-- Key use on door (locked key door)
	if target.actionid > 0 then
		if table.contains(keysBronsonId, item.itemid) then
			if keysBronson[item.itemid] and keysBronson[item.itemid][1] ~= nil then
				for index, value in ipairs(KeyDoorTable) do
					if keysBronson[item.itemid][1] ~= target.actionid and table.contains({value.lockedDoor, value.openDoor, value.closedDoor}, target.itemid) then
						player:sendCancelMessage("The key does not match.")
						return true
					end
					if keysBronson[item.itemid][1] == target.actionid then
						if value.lockedDoor == target.itemid then
							target:transform(value.openDoor)
							item:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_OPEN_DOOR)
							if table.contains(keysBronsonUniq, item.itemid) then
								item:remove(1)
								toPosition:sendMagicEffect(CONST_ME_WHITE_SMOKE)
								player:say("Snap! Crack! Clink...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
								player:sendCancelMessage("The key broked inside the lock.")
							end
							return true
							
						elseif table.contains({ value.openDoor, value.closedDoor }, target.itemid) then
							if value.openDoor == item.itemid then
								item:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_CLOSE_DOOR)
							end
						
							target:transform(value.lockedDoor)
							return true
						end
					end
				end
			else
				player:sendCancelMessage("apperly this key doesn't have a function.")
			end
		else
			player:sendCancelMessage("Sorry this isn't a key.")
		end	
	end
	return false
end

for key, value in pairs(doorId) do
	keyDoor:id(value)
end

keyDoor:register()
