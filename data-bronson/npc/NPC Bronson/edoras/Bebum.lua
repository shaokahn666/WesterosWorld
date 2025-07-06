local internalNpcName = "Bebum"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 40
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 130,
	lookHead = 39,
	lookBody = 117,
	lookLegs = 11,
	lookFeet = 96,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 50000,
	chance = 50,
	{ text = "shiiuUu, CalmA gAtaa, jA te conToo DenovO, peRaa QuE teM genTE ViNdo...", yell = false },
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

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local playerId = player:getId()
	local messageLower = message:lower()

		return true
end


npcHandler:setMessage(MESSAGE_GREET, "Que fOi pooO... Não tA vEnDo QueuTo CoNversAndoo coMm a dAmA aQui!?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Ta tchAuu, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Cara xaRoPe.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Não venDoo nadA AmigãOo, só QuErO bEbe.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)


-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
