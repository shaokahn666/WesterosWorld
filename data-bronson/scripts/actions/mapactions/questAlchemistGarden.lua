
local allLists = {
    {
        Position(83, 952, 7), Position(83, 944, 7), Position(86, 952, 7), Position(86, 941, 7), Position(89, 941, 7),
        Position(89, 956, 7), Position(92, 956, 7), Position(92, 941, 7), Position(95, 956, 7), Position(102, 939, 7),
        Position(98, 942, 7), Position(102, 942, 7), Position(98, 945, 7), Position(108, 945, 7), Position(98, 948, 7),
        Position(108, 948, 7), Position(98, 951, 7), Position(108, 951, 7), Position(98, 954, 7), Position(108, 954, 7),
        Position(98, 957, 7), Position(108, 957, 7), Position(108, 959, 7), Position(108, 962, 7), Position(93, 959, 7),
        Position(102, 966, 7), Position(99, 964, 7), Position(96, 965, 7), Position(93, 965, 7), Position(90, 965, 7),
		Position(87, 965, 7), Position(87, 958, 7), Position(89, 959, 7)
    },	
}
local wallList = {1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,0}

local wallRandom = {
	{1,1,0,0,1,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,1,0,1,0,0,0,1,0,0,0,1,0},
	{0,1,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,1,1,0,1,0,1,0,0,1,0,0,0},
	{1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0},
	{1,0,1,0,1,1,0,1,0,1,0,0,0,1,1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0},
	{0,1,0,1,0,0,1,0,0,0,0,0,1,0,0,0,1,1,1,0,1,1,1,0,0,0,0,0,1,1,1,1,0},
	{0,0,1,1,1,0,1,0,0,0,1,0,0,1,1,1,0,1,0,1,0,0,0,1,0,1,0,0,0,0,0,0,1},
}

local pos1 = Position(55,928,7)
local pos2 = Position(132,985,7)

local idWall = {1273,1275}
local wardrobePos = Position(1210,720,3)
local gardenEventTime = 15 * 60 
local elapsedTime = 0
local cycleDelay = 5 
local k = 0

local function revertBridge(k, idPlayer)
    for i = 1, #allLists[1] do
        if wallRandom[k][i] == 1 then
			if not Tile(allLists[1][i]):getItemById(1273) or not Tile(allLists[1][i]):getItemById(1275) then
				if wallList[i] == 1 then
					Game.createItem(1273, 1, allLists[1][i])
				else
					Game.createItem(1275, 1, allLists[1][i])
				end
				allLists[1][i]:sendMagicEffect(CONST_ME_GROUNDSHAKER)
			end
        else
			for j = 1, 2 do
				local idRemove = Tile(allLists[1][i]):getItemById(idWall[j])
				if idRemove then
					idRemove:remove(1)
				end
			end
		end
    end

	if not idPlayer then

		for i = 1, #allLists[1] do
			for j = 1, 2 do
				local idRemove = Tile(allLists[1][i]):getItemById(idWall[j])
				if idRemove then
					idRemove:remove(1)
				end
			end
		end
		elapsedTime = gardenEventTime
	else
		if not isMyselfInArea(idPlayer,pos1,pos2) then
			for i = 1, #allLists[1] do
				for j = 1, 2 do
					local idRemove = Tile(allLists[1][i]):getItemById(idWall[j])
					if idRemove then
						idRemove:remove(1)
					end
				end
			end
			elapsedTime = gardenEventTime
		end
		
	end


    elapsedTime = elapsedTime + cycleDelay
    if elapsedTime < gardenEventTime then
		--print(elapsedTime/60)
        k = k + 1
        if k > #wallRandom then
            k = 1
        end
        addEvent(revertBridge, cycleDelay * 1000, k,idPlayer) -- continua chamando
    else
	    for i = 1, #allLists[1] do
			for j = 1, 2 do
				local idRemove = Tile(allLists[1][i]):getItemById(idWall[j])
				if idRemove then
					idRemove:remove(1)
				end
			end
		end
		if isMyselfInArea(idPlayer, pos1, pos2) then
			local player = Player(idPlayer)
			player:teleportTo(wardrobePos)
			player:say("Time finished.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		end
    end
end

local minusGarden = MoveEvent()

function minusGarden.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end
	local idPlayer = player:getId()
	if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.timeLab) < os.time() then
		player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.timeLab, os.time() + 900)
		player:say("Time Started: 15 minutes to finish the labyrinth.", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())

		elapsedTime = 0
		addEvent(revertBridge, 5 * 1000, 1, idPlayer)
	end

    return true
end

minusGarden:type("stepin")
minusGarden:uid(43022)
minusGarden:register()
