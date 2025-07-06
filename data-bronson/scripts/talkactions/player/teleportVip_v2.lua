local teleportVip = TalkAction("/ir")
local teleportLocations = dofile("data-bronson/scripts/talkactions/player/TeleportLocations.lua")


-- Função opcional para gerar lista de cidades automaticamente
local function getCityList()
	local list = {}
	for name, _ in pairs(teleportLocations) do
		table.insert(list, name)
	end
	return table.concat(list, ", ")
end

function teleportVip.onSay(player, words, param)
	local inPz = player:getTile():hasFlag(TILESTATE_PROTECTIONZONE)

	if param == "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "As cidades que voce pode ir sao: " .. getCityList())
		return true
	end
		
	local a = teleportLocations[param]
	local positionP = player:getPosition()

	if player:hasCondition(CONDITION_INFIGHT) and not inPz then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce nao pode teleportar em combate")
		return true
	end
		
	if a then
		local coord = a.pos
		if positionP.x == coord[1] and positionP.y == coord[2] and positionP.z == coord[3] then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voce ja esta no local")
		else	
			player:getPosition():sendMagicEffect(CONST_ME_GREENSMOKE)
			player:teleportTo(Position(coord[1], coord[2], coord[3]), true)
			player:getPosition():sendMagicEffect(CONST_ME_GREEN_ENERGY_SPARK)
		end
	else 
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Cidade Invalida")
	end
	return true
end

teleportVip:separator(" ")
teleportVip:groupType("normal")
teleportVip:register()