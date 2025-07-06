local config = { 
    idGate = {2164,1294},
    positionGate = {
        { wall = { x = 1295, y = 1105, z = 11 }},
        { wall = { x = 1295, y = 1104, z = 11 }},
        { wall = { x = 1295, y = 1103, z = 11 }},
        { wall = { x = 1295, y = 1102, z = 11 }},
        { wall = { x = 1295, y = 1101, z = 11 }},
        { wall = { x = 1295, y = 1100, z = 11 }},
        { wall = { x = 1295, y = 1099, z = 11 }},
        { wall = { x = 1295, y = 1098, z = 11 }},
        { wall = { x = 1295, y = 1097, z = 11 }},
    },
}

local function revertWall()
	if Tile(config.positionGate[1].wall):getItemById(config.idGate[2]) then
		for i = 1, #config.positionGate do
			local wall = Tile(config.positionGate[i].wall):getItemById((config.idGate[2]))
			
			if wall then
				wall:transform(config.idGate[1])
			end
		end
	end
end

local function revertLever(position)
	local leverItem = Tile(position):getItemById(2773)
	if leverItem then
		leverItem:transform(2772)
	end
end

local leverLatrivan = Action()
function leverLatrivan.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if item.itemid ~= 2772 then
		return false
	end

	if Tile(config.positionGate[1].wall):getItemById(config.idGate[1]) then
		for i = 1, #config.positionGate do
			local wall = Tile(config.positionGate[i].wall):getItemById(config.idGate[1])
			
			if wall then
				wall:transform(config.idGate[2])
			end
		end
	end
	player:say("Click.", TALKTYPE_MONSTER_SAY, false, player, toPosition)
	item:transform(2773)
	addEvent(revertWall, 1 * 30 * 1000)
	
	addEvent(revertLever, 1 * 60 * 1000, toPosition)
	return true
end

leverLatrivan:uid(1009)
leverLatrivan:register()
