local internalNpcName = "Fluidhea"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 129,
	lookHead = 96,
	lookBody = 41,
	lookLegs = 39,
	lookFeet = 97,
	lookAddons = 0,
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

npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|, eu vendo mana potions, strong mana potions e great mana potions")
npcHandler:setMessage(MESSAGE_FAREWELL, "Ate mais, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Aiai, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "So trabalho com coisa boa, |PLAYERNAME|.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
   	{ itemName = "empty potion flask", clientId = 283, sell = 5 },
		{ itemName = "empty potion flask", clientId = 284, sell = 5 },
		{ itemName = "empty potion flask", clientId = 285, sell = 5 },
		{ itemName = "great mana potion", clientId = 238, buy = 144 },
		{ itemName = "great spirit potion", clientId = 7642, buy = 228 },
		{ itemName = "mana potion", clientId = 268, buy = 56 },
		{ itemName = "strong mana potion", clientId = 237, buy = 93 },
		{ itemName = "ultimate spirit potion", clientId = 23374, buy = 438 },
		{ itemName = "vial", clientId = 2874, sell = 5 },
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
