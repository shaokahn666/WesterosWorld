local internalNpcName = "Denethor II"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 97,
	lookBody = 57,
	lookLegs = 0,
	lookFeet = 58,
	lookAddons = 3
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

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local messageLower = message:lower()
	local playerGuid = player:getGuid()

	if messageLower == "yes" or messageLower == "sim" then
		if (getPlayerVocation(cid) >= 17 and getPlayerVocation(cid) <= 27 ) or (getPlayerVocation(cid) >= 34 and getPlayerVocation(cid) <= 44 ) or getPlayerVocation(cid) == 45 then
			npcHandler:say('Voce nao e bem vindo aqui.', npc, player)
			return true
		end		
		
		doPlayerSetTown(cid, 13)
		npcHandler:say("Seja bem vindo a Minas Tirith.", npc, player)
		return true

	else
		local topic = npcHandler:getTopic(playerGuid)
		if topic and topic > 0 then
			npcHandler:say("Adeus Forasteiro..", npc, player)
			messageCache[playerGuid] = nil
			npcHandler:setTopic(playerGuid, 0)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ola! Eu sou o Rei de Gondor, voce gostaria de morar na cidade de Minas Tirith?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
