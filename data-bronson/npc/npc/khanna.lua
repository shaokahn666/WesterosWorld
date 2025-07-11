local internalNpcName = "Khanna"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 138,
	lookHead = 59,
	lookBody = 70,
	lookLegs = 93,
	lookFeet = 76,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "If you need runes, this is the market stall for you!" },
	{ text = "I'm selling magic equipment. Come and have a look." },
}

local itemsTable = {
	["runes"] = {
		{ itemName = "animate dead rune", clientId = 3203, buy = 375 },
		{ itemName = "avalanche rune", clientId = 3161, buy = 64 },
		{ itemName = "blank rune", clientId = 3147, buy = 20 },
		{ itemName = "chameleon rune", clientId = 3178, buy = 210 },
		{ itemName = "convince creature rune", clientId = 3177, buy = 80 },
		{ itemName = "cure poison rune", clientId = 3153, buy = 65 },
		{ itemName = "destroy field rune", clientId = 3148, buy = 15 },
		{ itemName = "desintegrate rune", clientId = 3197, buy = 26 },
		{ itemName = "energy field rune", clientId = 3164, buy = 38 },
		{ itemName = "energy wall rune", clientId = 3166, buy = 85 },
		{ itemName = "energy bomb rune", clientId = 3149, buy = 203 },
		{ itemName = "explosion rune", clientId = 3200, buy = 31 },
		{ itemName = "fire bomb rune", clientId = 3192, buy = 147 },
		{ itemName = "fire field rune", clientId = 3188, buy = 28 },
		{ itemName = "fire wall rune", clientId = 3190, buy = 61 },
		{ itemName = "fireball rune", clientId = 3189, buy = 30 },
		{ itemName = "great fireball rune", clientId = 3191, buy = 64 },
		{ itemName = "heavy magic missile rune", clientId = 3198, buy = 12 },
		{ itemName = "holy missile rune", clientId = 3182, buy = 16 },
		{ itemName = "icicle rune", clientId = 3158, buy = 30 },
		{ itemName = "intense healing rune", clientId = 3152, buy = 95 },
		{ itemName = "light magic missile rune", clientId = 3174, buy = 4 },
		{ itemName = "magic wall rune", clientId = 3180, buy = 116 },
		{ itemName = "paralyze rune", clientId = 3165, buy = 700 },
		{ itemName = "poison bomb rune", clientId = 3173, buy = 85 },
		{ itemName = "poison field rune", clientId = 3172, buy = 21 },
		{ itemName = "poison wall rune", clientId = 3176, buy = 52 },
		{ itemName = "stalagmite rune", clientId = 3179, buy = 12 },
		{ itemName = "stone shower rune", clientId = 3175, buy = 41 },
		{ itemName = "sudden death rune", clientId = 3155, buy = 162 },
		{ itemName = "thunderstorm rune", clientId = 3202, buy = 52 },
		{ itemName = "ultimate healing rune", clientId = 3160, buy = 175 },
		{ itemName = "wild growth rune", clientId = 3156, buy = 160 },
	},
	["wands"] = {
		{ itemName = "hailstorm rod", clientId = 3067, buy = 15000 },
		{ itemName = "moonlight rod", clientId = 3070, buy = 1000 },
		{ itemName = "necrotic rod", clientId = 3069, buy = 5000 },
		{ itemName = "northwind rod", clientId = 8083, buy = 7500 },
		{ itemName = "snakebite rod", clientId = 3066, buy = 500 },
		{ itemName = "springsprout rod", clientId = 8084, buy = 18000 },
		{ itemName = "terra rod", clientId = 3065, buy = 10000 },
		{ itemName = "wand of cosmic energy", clientId = 3073, buy = 10000 },
		{ itemName = "wand of decay", clientId = 3072, buy = 5000 },
		{ itemName = "wand of draconia", clientId = 8093, buy = 7500 },
		{ itemName = "wand of dragonbreath", clientId = 3075, buy = 1000 },
		{ itemName = "wand of inferno", clientId = 3071, buy = 15000 },
		{ itemName = "wand of starstorm", clientId = 8092, buy = 18000 },
		{ itemName = "wand of voodoo", clientId = 8094, buy = 22000 },
		{ itemName = "wand of vortex", clientId = 3074, buy = 500 },
	},
	["exercise weapons"] = {
		{ itemName = "durable exercise rod", clientId = 35283, buy = 1250000, count = 1800 },
		{ itemName = "durable exercise wand", clientId = 35284, buy = 1250000, count = 1800 },
		{ itemName = "exercise rod", clientId = 28556, buy = 347222, count = 500 },
		{ itemName = "exercise wand", clientId = 28557, buy = 347222, count = 500 },
		{ itemName = "lasting exercise rod", clientId = 35289, buy = 10000000, count = 14400 },
		{ itemName = "lasting exercise wand", clientId = 35290, buy = 10000000, count = 14400 },
	},
	["creature products"] = {
		{ itemName = "bashmu fang", clientId = 36820, sell = 600 },
		{ itemName = "bashmu feather", clientId = 36820, sell = 350 },
		{ itemName = "bashmu tongue", clientId = 36820, sell = 400 },
		{ itemName = "blue goanna scale", clientId = 31559, sell = 230 },
		{ itemName = "crystal ball", clientId = 3076, buy = 650 },
		{ itemName = "fafnar symbol", clientId = 31443, sell = 950 },
		{ itemName = "goanna claw", clientId = 31561, sell = 950 },
		{ itemName = "goanna meat", clientId = 31560, sell = 190 },
		{ itemName = "lamassu hoof", clientId = 31441, sell = 330 },
		{ itemName = "lamassu horn", clientId = 31442, sell = 240 },
		{ itemName = "life crystal", clientId = 3061, sell = 85 },
		{ itemName = "lizard heart", clientId = 31340, sell = 530 },
		{ itemName = "manticore ear", clientId = 31440, sell = 310 },
		{ itemName = "manticore tail", clientId = 31439, sell = 220 },
		{ itemName = "mind stone", clientId = 3062, sell = 170 },
		{ itemName = "old girtablilu carapace", clientId = 36972, sell = 570 },
		{ itemName = "red goanna scale", clientId = 31558, sell = 270 },
		{ itemName = "scorpion charm", clientId = 36822, sell = 620 },
		{ itemName = "sphinx feather", clientId = 31437, sell = 470 },
		{ itemName = "sphinx tiara", clientId = 31438, sell = 360 },
	},
	["shields"] = {
		{ itemName = "spellbook", clientId = 3059, buy = 150 },
		{ itemName = "spellbook of enlightenment", clientId = 8072, sell = 4000 },
		{ itemName = "spellbook of lost souls", clientId = 8075, sell = 19000 },
		{ itemName = "spellbook of mind control", clientId = 8074, sell = 13000 },
		{ itemName = "spellbook of warding", clientId = 8073, sell = 8000 },
	},
	["others"] = {
		{ itemName = "spellwand", clientId = 651, sell = 299 },
	},
}

npcConfig.shop = {}
for _, categoryTable in pairs(itemsTable) do
	for _, itemTable in ipairs(categoryTable) do
		table.insert(npcConfig.shop, itemTable)
	end
end

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

local items = {
	[VOCATION.BASE_ID.SORCERER] = 3074,
	[VOCATION.BASE_ID.DRUID] = 3066,
}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local categoryTable = itemsTable[message:lower()]
	local itemId = items[player:getVocation():getBaseId()]
	if MsgContains(message, "first rod") or MsgContains(message, "first wand") then
		if player:isMage() then
			if player:getStorageValue(Storage.FirstMageWeapon) == -1 then
				npcHandler:say("So you ask me for a {" .. ItemType(itemId):getName() .. "} to begin your adventure?", npc, creature)
				npcHandler:setTopic(playerId, 1)
			else
				npcHandler:say("What? I have already gave you one {" .. ItemType(itemId):getName() .. "}!", npc, creature)
			end
		else
			npcHandler:say("Sorry, you aren't a druid either a sorcerer.", npc, creature)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			player:addItem(itemId, 1)
			npcHandler:say("Here you are young adept, take care yourself.", npc, creature)
			player:setStorageValue(Storage.FirstMageWeapon, 1)
		end
		npcHandler:setTopic(playerId, 0)
	elseif MsgContains(message, "no") and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Ok then.", npc, creature)
		npcHandler:setTopic(playerId, 0)
	elseif categoryTable then
		local remainingCategories = npc:getRemainingShopCategories(message:lower(), itemsTable)
		npcHandler:say("Of course, just browse through my wares. You can also look at " .. remainingCategories .. ".", npc, player)
		npc:openShopWindowTable(player, categoryTable)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. Or do you want to look only at " .. GetFormattedShopCategoryNames(itemsTable) .. ".")
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
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
