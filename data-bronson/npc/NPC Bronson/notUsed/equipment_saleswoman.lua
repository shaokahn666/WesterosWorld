local internalNpcName = "Equipment Saleswoman"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}
local tool_others = dofile("data-bronson/npc/NPC Bronson/shopItems/tool_others.lua")

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 155,
	lookHead = 95,
	lookBody = 21,
	lookLegs = 23,
	lookFeet = 114,
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

	if MsgContains(messageLower, "football") or MsgContains(messageLower, "Footballs") then
		npcHandler:say("Do you want to buy a football for 111 gold?", npc, player)
		npcHandler:setTopic(playerId, 1)
	elseif MsgContains(messageLower, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			if player:getTotalMoney() >= 111 then
				npcHandler:say("Here it is.", npc, player)
				player:addItem(2990, 1)
				player:removeMoneyBank(111)
			else
				npcHandler:say("You don't have enough money.", npc, player)
			end
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

keywordHandler:addKeyword({ "equipment" }, StdModule.say, { npcHandler = npcHandler, text = "I sell equipment for your adventure! Just ask me for a {trade} to see my wares." })

npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What can I do for you? If you need adventure equipment, ask me for a {trade}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye, |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. {Footballs} have to be purchased separately.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = tool_others

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
