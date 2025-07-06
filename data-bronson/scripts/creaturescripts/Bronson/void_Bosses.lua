local config = {
	idGate = {19135, 25800},
	positionGate = {
		{ x = 2012, y = 482, z = 15 },
		{ x = 2067, y = 482, z = 15 },
		{ x = 2039, y = 458, z = 15 },
		{ x = 2039, y = 426, z = 15 },	
	},
	
	bossName = {
	"Rupture",
	"Eradicator",
	"Aftershock",
	"World Devourer",
	},
}


local function revertBridge(position)

	for i = 1, #config.idGate do
		Tile(position):addItem(config.idGate[i])
		if i == 2 then
			Tile(position):getPosition():sendMagicEffect(CONST_ME_BLUE_ENERGY_SPARK)
		end
	end
end


local voidBossesGate = CreatureEvent("voidBossesGate")

function voidBossesGate.onDeath(creature, corpse, killer, mostDamageKiller, lastHitUnjustified, mostDamageUnjustified)
	local targetMonster = creature:getMonster()
	if not targetMonster or targetMonster:getMaster() then
		return true
	end


	for key, value in pairs(config.bossName) do
		if value == creature:getName() then

			for j = 1, #config.idGate do
				if Tile(config.positionGate[key]):getItemById(config.idGate[j]) ~= nil then
				
					local gateItem = Tile(config.positionGate[key]):getItemById(config.idGate[j])
					
					if gateItem ~= nil then
					
						gateItem:getPosition():sendMagicEffect(CONST_ME_WHITE_SMOKE)
						gateItem:remove(1)
						
					end
				end
			end
		
			local gatePosition = config.positionGate[key]
			addEvent(function() revertBridge(gatePosition) end, 2 * 60 * 1000)
		
		end	
	end
	
		onDeathForDamagingPlayers(creature, function(creature, player)
			player:say("You now have 2 minutes to exit this room through the teleport, or you will be imprisioned forever in void!", TALKTYPE_MONSTER_SAY)
		end)

	return true
end

voidBossesGate:register()
