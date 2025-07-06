local internalNpcName = "Archery"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 683,
	lookHead = 97,
	lookBody = 0,
	lookLegs = 96,
	lookFeet = 114,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Come into my tavern and share some stories!" },
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

local itemsTable = {
	["exercise weapons"] = {
		{ itemName = "exercise bow", clientId = 28555, buy = 262500, count = 500 },
		{ itemName = "durable exercise bow", clientId = 35282, buy = 945000, count = 1800 },
		{ itemName = "lasting exercise bow", clientId = 35288, buy = 7560000, count = 14400 },
	},
	["arrows"] = {
		{ itemName = "arrow", clientId = 3447, buy = 3 },
		{ itemName = "burst arrow", clientId = 3449, buy = 15 },
		{ itemName = "crystalline arrow", clientId = 15793, buy = 20 },
		{ itemName = "diamond arrow", clientId = 35901, buy = 100 },
		{ itemName = "earth arrow", clientId = 774, buy = 5 },
		{ itemName = "envenomed arrow", clientId = 16143, buy = 12 },
		{ itemName = "flaming arrow", clientId = 763, buy = 5 },
		{ itemName = "flash arrow", clientId = 761, buy = 5 },
		{ itemName = "onyx arrow", clientId = 7365, buy = 7 },
		{ itemName = "shiver arrow", clientId = 762, buy = 5 },
		{ itemName = "sniper arrow", clientId = 7364, buy = 5 },
		{ itemName = "tarsal arrow", clientId = 14251, buy = 6 },
	},
	["bolts"] = {
		{ itemName = "bolt", clientId = 3446, buy = 4 },
		{ itemName = "drill bolt", clientId = 16142, buy = 12 },
		{ itemName = "infernal bolt", clientId = 6528, buy = 13 },
		{ itemName = "piercing bolt", clientId = 7363, buy = 5 },
		{ itemName = "power bolt", clientId = 3450, buy = 7 },
		{ itemName = "prismatic bolt", clientId = 16141, buy = 20 },
		{ itemName = "spectral bolt", clientId = 35902, buy = 70 },
		{ itemName = "vortex bolt", clientId = 14252, buy = 6 },
	},
	["bows"] = {
		{ itemName = "bow", clientId = 3350, buy = 400 },
	},
	["crossbows"] = {
		{ itemName = "crossbow", clientId = 3349, buy = 500 },
	},
	["spears"] = {
		{ itemName = "spear", clientId = 3277, buy = 9 },
		{ itemName = "hunting spear", clientId = 3347, buy = 25 },
		{ itemName = "royal spear", clientId = 7378, buy = 15 },
		{ itemName = "enchanted spear", clientId = 7367, buy = 30 },
	},
	["stars"] = {
		{ itemName = "throwing star", clientId = 3287, buy = 42 },
		{ itemName = "assassin star", clientId = 7368, buy = 100 },
		{ itemName = "royal star", clientId = 25759, buy = 110 },
	},
	["quivers"] = {
		{ itemName = "blue quiver", clientId = 35848, buy = 400 },
		{ itemName = "quiver", clientId = 35562, buy = 400 },
		{ itemName = "red quiver", clientId = 35849, buy = 400 },
	},
}

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local formattedCategoryNames = {}
	for categoryName, _ in pairs(itemsTable) do
		table.insert(formattedCategoryNames, "{" .. categoryName .. "}")
	end

	local messageLower = message:lower()
	local categoryTable = itemsTable[messageLower]
	if MsgContains(messageLower, "shop options") then
		npcHandler:say("I sell a selection of " .. table.concat(formattedCategoryNames, ", "), npc, player)
	elseif categoryTable then
		npcHandler:say("Here are the items for the category " .. messageLower, npc, player)
		npc:openShopWindowTable(player, categoryTable)
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to Archery's shop, say {trade} to see all the offers or would you prefer to see just {exercise weapons}, {arrows}, {bolts}, {bows}, {crossbows}, {spears}, {stars}, {quivers}? I'm always at your {shop options}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Please come back from time to time.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Please come back from time to time.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse my products. Or do you want to look at just {exercise weapons}, {arrows}, {bolts}, {bows}, {crossbows}, {spears}, {stars}, {quivers}? I'm always at your {shop options}.")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

local tradeTable = {}
for _, categoryTable in pairs(itemsTable) do
	for _, itemTable in pairs(categoryTable) do
		table.insert(tradeTable, itemTable)
	end
end

npcConfig.shop = tradeTable

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

--npcType:register(npcConfig)
