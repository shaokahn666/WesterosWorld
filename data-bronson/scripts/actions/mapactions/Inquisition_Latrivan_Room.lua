local config = { 
    idGate = {2162,1295},
    positionGate = {
        { wall = { x = 1280, y = 1108, z = 11 }},
        { wall = { x = 1281, y = 1108, z = 11 }},
        { wall = { x = 1282, y = 1108, z = 11 }},
        { wall = { x = 1283, y = 1108, z = 11 }},
        { wall = { x = 1284, y = 1108, z = 11 }},
        { wall = { x = 1285, y = 1108, z = 11 }},
        { wall = { x = 1286, y = 1108, z = 11 }},
        { wall = { x = 1287, y = 1108, z = 11 }},
        { wall = { x = 1288, y = 1108, z = 11 }},
        { wall = { x = 1289, y = 1108, z = 11 }},
        { wall = { x = 1290, y = 1108, z = 11 }},
        { wall = { x = 1291, y = 1108, z = 11 }},
        { wall = { x = 1292, y = 1108, z = 11 }},
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

leverLatrivan:uid(1008)
leverLatrivan:register()
