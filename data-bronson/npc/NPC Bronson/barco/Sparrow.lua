local internalNpcName = "Sparrow"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}
local destinations = dofile("data-bronson/npc/NPC Bronson/barco/world_locations.lua")
local npcDestinations = { "ered" }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 151,
	lookHead = 116,
	lookBody = 68,
	lookLegs = 60,
	lookFeet = 116,
	lookAddons = 1,
}

npcConfig.flags = {
	floorchange = false,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

-- Travel
local function addTravelKeyword(keyword, cost, destination, condition)
	if condition then
		keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "I'm sorry but I don't sail there." }, condition)
	end

	local travelKeyword = keywordHandler:addKeyword({ keyword }, StdModule.say, { npcHandler = npcHandler, text = "Voce quer embarcar e ir para " .. keyword:titleCase() .. " por |TRAVELCOST|?", cost = cost, discount = "postman" })
	travelKeyword:addChildKeyword({ "yes" }, StdModule.travel, { npcHandler = npcHandler, premium = false, cost = cost, discount = "postman", destination = destination })
	travelKeyword:addChildKeyword({ "no" }, StdModule.say, { npcHandler = npcHandler, text = "Quem sabe na proxima.", reset = true })
end

-- destinations

for _, name in ipairs(npcDestinations) do
	local travel = destinations[name]
	if travel then
		addTravelKeyword(travel.name, travel.cost, Position(travel.position.x, travel.position.y, travel.position.z))
	end
end


-- Basic
keywordHandler:addKeyword({ "viajar" }, StdModule.say, { npcHandler = npcHandler, text = "Aqui pegamos um bote apenas para {Ered} por uma pequena taxa." })



npcHandler:setMessage(MESSAGE_GREET, "Bem vindo!, |PLAYERNAME|. Vamos se aventurar em {Ered} dessa vez?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Quando quiser uma aventura, volte aqui!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Eh Capitao!")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)