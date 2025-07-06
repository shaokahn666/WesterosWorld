local internalNpcName = "Arieh"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 128,
	lookHead = 58,
	lookBody = 19,
	lookLegs = 68,
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

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local playerId = player:getId()
	local messageLower = message:lower()

		return true
end

keywordHandler:addKeyword({ "ammo" }, StdModule.say, { npcHandler = npcHandler, text = "Ola. Como posso te ajudar, |PLAYERNAME|?. Se Precisar de algo, diga {trade}." })

npcHandler:setMessage(MESSAGE_GREET, "Ola. Eu vendo bolsas. Se Precisar de alguma, diga {trade}, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Ate mais, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Isso mesmo, continue com suas bolsas da shein, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Da uma olhada no meu estoque.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
   { itemName = "backpack", clientId = 2854, buy = 20 },
	{ itemName = "green bag", clientId = 2857, buy = 25 },
{ itemName = "yellow bag", clientId = 2858, buy = 25 },
{ itemName = "red bag", clientId = 2859, buy = 25 },
{ itemName = "purple bag", clientId = 2860, buy = 25 },
{ itemName = "blue bag", clientId = 2861, buy = 25 },
{ itemName = "grey bag", clientId = 2862, buy = 25 },
{ itemName = "golden bag", clientId = 2863, buy = 25 },
{ itemName = "camouflage bag", clientId = 2864, buy = 25 },
{ itemName = "green backpack", clientId = 2865, buy = 50 },
{ itemName = "yellow backpack", clientId = 2866, buy = 50 },
{ itemName = "red backpack", clientId = 2867, buy = 50 },
{ itemName = "purple backpack", clientId = 2868, buy = 50 },
{ itemName = "blue backpack", clientId = 2869, buy = 50 },
{ itemName = "grey backpack", clientId = 2870, buy = 50 },
{ itemName = "golden backpack", clientId = 2871, buy = 50 },
{ itemName = "camouflage backpack", clientId = 2872, buy = 50 },
}


-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end

-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
