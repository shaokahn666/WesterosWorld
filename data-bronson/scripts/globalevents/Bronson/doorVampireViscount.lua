local bossTable = {
    positionGate = {
        { telePos = { x = 1812, y = 535, z = 7 }, teleDest = { x = 1123, y = 1155, z = 13 } },
        { telePos = { x = 1812, y = 536, z = 7 }, teleDest = { x = 1426, y = 986, z = 14 } },
    },
	idGate = {22549}
}

local doorVampire = GlobalEvent("door.vampire.onThink")
local current_time = os.date("*t").min -- Get the current time table

local function revertBridge()
		for i = 1, #bossTable.positionGate do

			local item = Tile(bossTable.positionGate[i].telePos):getItemById(bossTable.idGate[1])
			if item == nil then
				Game.createItem(bossTable.idGate[1], 1, bossTable.positionGate[i].telePos)
			end
			
		end
end

function doorVampire.onThink(interval, lastExecution)
	local timeVamp = getWorldTime()
	local hours = math.floor(timeVamp / 60)

	if hours == 0 then
		for i = 1, #bossTable.positionGate do

			local item = Tile(bossTable.positionGate[i].telePos):getItemById(bossTable.idGate[1])
			if item ~= nil then
				item:getPosition():sendMagicEffect(CONST_ME_STONES)
				item:remove(1)
			end
			
		end
		
		addEvent(revertBridge, 2.5 * 60 * 1000)
	end
		
	return true
	
end		

doorVampire:interval(1*30*1000)
doorVampire:register()