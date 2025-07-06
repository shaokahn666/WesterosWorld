local setting = {
	stepTeleport = { {posItem = Position(1916, 453, 13), fromPos = {x = 1969, y = 463, z = 13}, toPos = {x = 1969, y = 463, z = 13}},
		{posItem = Position(1922, 497, 13), fromPos = {x = 1912, y = 461, z = 13}, toPos = {x = 1912, y = 461, z = 13}},
		{posItem = Position(1883, 483, 13), fromPos = {x = 1927, y = 443, z = 14}, toPos = {x = 1927, y = 443, z = 14}},
		{posItem = Position(1913, 429, 14), fromPos = {x = 1900, y = 431, z = 14}, toPos = {x = 1900, y = 431, z = 14}},
		{posItem = Position(1884, 495, 14), fromPos = {x = 1878, y = 420, z = 15}, toPos = {x = 1878, y = 420, z = 15}},
		{posItem = Position(1914, 460, 15), fromPos = {x = 1887, y = 424, z = 15}, toPos = {x = 1887, y = 424, z = 15}},
		{posItem = Position(1887, 421, 15), fromPos = {x = 2031, y = 491, z = 15}, toPos = {x = 2031, y = 491, z = 15}},
	},
}

local voidStep = MoveEvent()

function voidStep.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end
	
    for i = 1, #setting.stepTeleport do
		local tp = setting.stepTeleport[i]
			
		if item:getPosition() == tp.posItem then

			if player ~= nil and tp.toPos ~= nil then
				player:getPosition():sendMagicEffect(CONST_ME_SPARKLING)
				player:teleportTo(tp.toPos)
				player:getPosition():sendMagicEffect(CONST_ME_BLUE_ENERGY_SPARK)
				player:say("The vortex send you to another part of the void...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
				break
			end		
			
		end   
	end
	
	return true
end

voidStep:type("stepin")
voidStep:aid(43015)
voidStep:register()