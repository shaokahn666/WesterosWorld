local internalNpcName = "Yonan"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1200,
	lookHead = 76,
	lookBody = 49,
	lookLegs = 10,
	lookFeet = 0,
	lookAddons = 1,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.shop = {
	{ itemName = "amber with a bug", clientId = 32624, sell = 41000 },
	{ itemName = "amber with a dragonfly", clientId = 32625, sell = 56000 },
	{ itemName = "amber", clientId = 32626, sell = 20000 },
	{ itemName = "ancient coin", clientId = 24390, sell = 350 },
	{ itemName = "black pearl", clientId = 3027, buy = 560, sell = 280 },
	{ itemName = "blue crystal shard", clientId = 16119, sell = 1500 },
	{ itemName = "blue crystal splinter", clientId = 16124, sell = 400 },
	{ itemName = "bronze goblet", clientId = 5807, buy = 2000 },
	{ itemName = "brown crystal splinter", clientId = 16123, sell = 400 },
	{ itemName = "brown giant shimmering pearl", clientId = 282, sell = 3000 },
	{ itemName = "coral brooch", clientId = 24391, sell = 750 },
	{ itemName = "crunor idol", clientId = 30055, sell = 30000 },
	{ itemName = "cyan crystal fragment", clientId = 16125, sell = 800 },
	{ itemName = "dragon figurine", clientId = 30053, sell = 45000 },
	{ itemName = "gemmed figurine", clientId = 24392, sell = 3500 },
	{ itemName = "giant amethyst", clientId = 32622, sell = 60000 },
	{ itemName = "giant emerald", clientId = 30060, sell = 90000 },
	{ itemName = "giant ruby", clientId = 30059, sell = 70000 },
	{ itemName = "giant sapphire", clientId = 30061, sell = 50000 },
	{ itemName = "giant topaz", clientId = 32623, sell = 80000 },
	{ itemName = "gold ingot", clientId = 9058, sell = 5000 },
	{ itemName = "gold nugget", clientId = 3040, sell = 850 },
	{ itemName = "golden amulet", clientId = 3013, buy = 6600 },
	{ itemName = "golden goblet", clientId = 5805, buy = 5000 },
	{ itemName = "greater guardian gem", clientId = 44604, sell = 10000 },
	{ itemName = "greater marksman gem", clientId = 44607, sell = 10000 },
	{ itemName = "greater mystic gem", clientId = 44613, sell = 10000 },
	{ itemName = "greater sage gem", clientId = 44610, sell = 10000 },
	{ itemName = "green crystal fragment", clientId = 16127, sell = 800 },
	{ itemName = "green crystal shard", clientId = 16121, sell = 1500 },
	{ itemName = "green crystal splinter", clientId = 16122, sell = 400 },
	{ itemName = "green giant shimmering pearl", clientId = 281, sell = 3000 },
	{ itemName = "guardian gem", clientId = 44603, sell = 5000 },
	{ itemName = "lesser guardian gem", clientId = 44602, sell = 1000 },
	{ itemName = "lesser marksman gem", clientId = 44605, sell = 1000 },
	{ itemName = "lesser mystic gem", clientId = 44611, sell = 1000 },
	{ itemName = "lesser sage gem", clientId = 44608, sell = 1000 },
	{ itemName = "lion figurine", clientId = 33781, sell = 10000 },
	{ itemName = "marksman gem", clientId = 44606, sell = 5000 },
	{ itemName = "mystic gem", clientId = 44612, sell = 5000 },
	{ itemName = "onyx chip", clientId = 22193, sell = 400 },
	{ itemName = "opal", clientId = 22194, sell = 500 },
	{ itemName = "ornate locket", clientId = 30056, sell = 18000 },
	{ itemName = "prismatic quartz", clientId = 24962, sell = 450 },
	{ itemName = "red crystal fragment", clientId = 16126, sell = 800 },
	{ itemName = "ruby necklace", clientId = 3016, buy = 3560 },
	{ itemName = "sage gem", clientId = 44609, sell = 5000 },
	{ itemName = "silver goblet", clientId = 5806, buy = 3000 },
	{ itemName = "skull coin", clientId = 32583, sell = 12000 },
	{ itemName = "small amethyst", clientId = 3033, buy = 400, sell = 200 },
	{ itemName = "small diamond", clientId = 3028, buy = 600, sell = 300 },
	{ itemName = "small emerald", clientId = 3032, buy = 500, sell = 250 },
	{ itemName = "small enchanted amethyst", clientId = 678, sell = 200 },
	{ itemName = "small enchanted emerald", clientId = 677, sell = 250 },
	{ itemName = "small enchanted ruby", clientId = 676, sell = 250 },
	{ itemName = "small enchanted sapphire", clientId = 675, sell = 250 },
	{ itemName = "small ruby", clientId = 3030, buy = 500, sell = 250 },
	{ itemName = "small sapphire", clientId = 3029, buy = 500, sell = 250 },
	{ itemName = "small topaz", clientId = 9057, sell = 200 },
	{ itemName = "tiger eye", clientId = 24961, sell = 350 },
	{ itemName = "unicorn figurine", clientId = 30054, sell = 50000 },
	{ itemName = "violet crystal shard", clientId = 16120, sell = 1500 },
	{ itemName = "wedding ring", clientId = 3004, buy = 990 },
	{ itemName = "white pearl", clientId = 3026, buy = 320, sell = 160 },
	{ itemName = "white silk flower", clientId = 34008, sell = 9000 },
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


npcHandler:setMessage(MESSAGE_WALKAWAY, "Well, bye then.")

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType:register(npcConfig)
