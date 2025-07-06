local internalNpcName = "The Oracled"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookTypeEx = 2031,
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

local vocation = {}

local config = { vocs = {["Royal Archer"] = VOCATION.ID.ARCHER, 
["Medieval Archer"] = VOCATION.ID.MEDIEVAL_ARCHER,
["Executioner"] = VOCATION.ID.EXECUTIONER, }}

local function creatureSayCallback(npc, creature)
	local playerId = creature:getId()
	local player = Player(creature)
	local level = player:getLevel()
	local playervoc = player:getVocation():getId()

	--keywordHandler:addKeyword({ "kick" }, StdModule.kick, { npcHandler = npcHandler, destination = { Position(32384, 31815, 6), Position(32387, 31815, 6), Position(32390, 31815, 6) } })

		if npcHandler:getTopic(playerId) == 1 then
			if level <= 35 then
				npcHandler:say("Voce e fraco! Volte quando adquirir mais experiencia...", npc, creature)
				npcHandler:resetNpc(creature)
				return false
			elseif level >= 35 and level <= 100 then
				npcHandler:say("Olá! Você gostaria de receber uma promoção para Royal Archer?", npc, creature)
				npcHandler:setTopic(playerId, 2)
				if playervoc ~= 3 then
					npcHandler:say("Desculpe nao sera possivel lhe promover!", npc, creature)
					return false
				end
			end
		end

		if npcHandler:getTopic(playerId) == 2 then
			if MsgContains(message, "yes") or MsgContains(message, "sim") then
				npcHandler:say("SO BE IT!", npc, creature)
				player:setVocation(Vocation(7))
				return true
			end
		end 

		return true
	
end


npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_FAREWELL, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "COME BACK WHEN YOU ARE PREPARED TO FACE YOUR DESTINY!")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
