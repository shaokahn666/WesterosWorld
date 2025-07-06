local internalNpcName = "Soft Restorer"
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
	lookHead = 40,
	lookBody = 37,
	lookLegs = 116,
	lookFeet = 95,
	lookAddons = 3,
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

	if table.contains({ "soft boots", "repair", "soft", "boots" }, messageLower) then
		npcHandler:say("Do you want to repair your worn soft boots for 10000 gold coins?", npc, player)
		npcHandler:setTopic(playerGuid, 1)

	elseif MsgContains(messageLower, "yes") and npcHandler:getTopic(playerGuid) == 1 then
		npcHandler:setTopic(playerGuid, 0)
		if player:getItemCount(6530) == 0 then
			npcHandler:say("Sorry, you don't have the item.", npc, player)
			return true
		end

		if not player:removeMoneyBank(10000) then
			npcHandler:say("Sorry, you don't have enough gold.", npc, player)
			return true
		end

		player:removeItem(6530, 1)
		player:addItem(6529, 1)
		npcHandler:say("Here you are.", npc, player)

	elseif MsgContains(messageLower, "no") and npcHandler:getTopic(playerGuid) == 1 then
		npcHandler:setTopic(playerGuid, 0)
		npcHandler:say("Ok then.", npc, player)

	end

	return true
end

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
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)
