local internalNpcName = "Van Helsing"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 289,
	lookHead = 0,
	lookBody = 114,
	lookLegs = 114,
	lookFeet = 0,
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

local flaskCost = 1000

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	--local missing = Blessings.getInquisitionPrice(player)
	local totalBlessPrice = 500000
	
	if MsgContains(message, "inquisitor") then
		npcHandler:say("Yes! I'm a inquisitor and a hunter! Do you mind if let me alone?", npc, creature)
		npcHandler:setTopic(playerId, 0)
		
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") then
		if player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) == 3 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) > 0 then
			npcHandler:say({"Oh, crap! Maybe you should kill that vampire! I have a nicely kit for this situation, but that have a cost. Do you like to see the {kit}?",
							"In exchange i can teach you how to burst the heart of that vampire!",}, npc, creature)			
			npcHandler:setTopic(playerId, 1)
			
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) == 4 then
			npcHandler:say("Maybe you need ask to Henricus how to find the vampire! Or just follow the blood.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		else
			npcHandler:say("Sorry! i don't have any missions today!", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end	
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") or MsgContains(message, "kit") then
		if npcHandler:getTopic(playerId) == 1 then
			npcHandler:say("My last vampire hunter kit! That will cost 500.000 gps, this kit count with a clear instructions to kill that vampire! you agree to pay for this kit?", npc, creature)
			npcHandler:setTopic(playerId, 2)
			
		elseif npcHandler:getTopic(playerId) == 2 then

			if player:removeMoneyBank(totalBlessPrice) then
				player:setStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition, 4)
				player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
				player:addItem(8197, 5)
				player:addItem(5942, 1)
				player:addItem(3459, 1)
				npcHandler:say("Thanks, my friend! Take this kit and do what needs to be done!", npc, creature)				
			else
				npcHandler:say("Come back when you have enough money.", npc, creature)
			end
		end

	elseif MsgContains(message, "no") or MsgContains(message, "nao") then
		if npcHandler:getTopic(playerId) > 0 then
			npcHandler:say("Please, do not waste my time!", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end
	
	return true
end


keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "My job is hunt monsters and execute all of them!" })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I'm Van Helsing, one of the Inquisitor and monster hunter." })
npcHandler:setMessage(MESSAGE_GREET, "Hello, poor creature |PLAYERNAME|. What brings you here?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Be always alert, |PLAYERNAME|. The evil won't sleep!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "A courward! That's is you!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "badger boots", clientId = 22086, sell = 7500 },
	{ itemName = "basket", clientId = 2855, buy = 6 },
	{ itemName = "bottle", clientId = 2875, buy = 3 },
	{ itemName = "bucket", clientId = 2873, buy = 4 },
	{ itemName = "candelabrum", clientId = 2911, buy = 8 },
	{ itemName = "candlestick", clientId = 2917, buy = 2 },
	{ itemName = "closed trap", clientId = 3481, buy = 280, sell = 75 },
	{ itemName = "crowbar", clientId = 3304, buy = 260, sell = 50 },
	{ itemName = "crusher", clientId = 46627, buy = 500 },
	{ itemName = "fishing rod", clientId = 3483, buy = 150, sell = 40 },
	{ itemName = "fox paw", clientId = 27462, sell = 100 },
	{ itemName = "fur armor", clientId = 22085, sell = 5000 },
	{ itemName = "hand auger", clientId = 31334, buy = 25 },
	{ itemName = "machete", clientId = 3308, buy = 35, sell = 6 },
	{ itemName = "net", clientId = 31489, buy = 50 },
	{ itemName = "pick", clientId = 3456, buy = 50, sell = 15 },
	{ itemName = "present", clientId = 2856, buy = 10 },
	{ itemName = "rope", clientId = 3003, buy = 50, sell = 15 },
	{ itemName = "scythe", clientId = 3453, buy = 50, sell = 10 },
	{ itemName = "shovel", clientId = 3457, buy = 50, sell = 8 },
	{ itemName = "torch", clientId = 2920, buy = 2 },
	{ itemName = "watch", clientId = 2906, buy = 20, sell = 6 },
	{ itemName = "werebadger claws", clientId = 22051, sell = 160 },
	{ itemName = "werebadger skull", clientId = 22055, sell = 185 },
	{ itemName = "werebear fur", clientId = 22057, sell = 185 },
	{ itemName = "werebear skull", clientId = 22057, sell = 195 },
	{ itemName = "wereboar hooves", clientId = 22053, sell = 175 },
	{ itemName = "wereboar loincloth", clientId = 22087, sell = 1500 },
	{ itemName = "werebadger trophy", clientId = 22101, sell = 9000 },
	{ itemName = "wereboar trophy", clientId = 22102, sell = 10000 },
	{ itemName = "werebear trophy", clientId = 22103, sell = 11000 },
	{ itemName = "wereboar tusk", clientId = 22054, sell = 165 },
	{ itemName = "werefox tail", clientId = 27463, sell = 200 },
	{ itemName = "werewolf amulet", clientId = 22060, sell = 3000 },
	{ itemName = "werewolf fang", clientId = 22052, sell = 180 },
	{ itemName = "werewolf fur", clientId = 10317, sell = 380 },
	{ itemName = "wooden hammer", clientId = 3459, sell = 15 },
	{ itemName = "worm", clientId = 3492, buy = 1 },
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

--npcConfig.shop = {
--	{ itemName = "holy water", clientId = 133, buy = 1000 },
--}
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

-- npcType registering the npcConfig table
npcType:register(npcConfig)
