local internalNpcName = "Quevedo"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 1078,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
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
	local totalBlessPrice = 200000
	
	if MsgContains(message, "inquisitor") then
		npcHandler:say("The churches of the gods entrusted me with the enormous and responsible task to lead the inquisition. I leave the field work to inquisitors who I recruit from fitting people that cross my way.", npc, creature)
	elseif MsgContains(message, "blessing") or MsgContains(message, "bless") or  MsgContains(message, "bencao") then
		local missing = Blessings.getInquisitionPrice(player)
		
		if missing > 0 then
			blessprice = player:getLevel()*50*missing
			if blessprice > 120000 then
				blessprice = 120000
			end
			npcHandler:say("Do you want to receive all pending blesses for " .. (blessprice) .. " gold?", npc, creature)
			npcHandler:setTopic(playerId, 1)
		else
			npcHandler:say("You already are protected by blessings of all five Gods.", npc, creature)
		end

		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") then
		if npcHandler:getTopic(playerId) == 1 then
			if missing == 0 then
				npcHandler:say("You already have been blessed!", npc, creature)
			elseif player:removeMoneyBank(tonumber(blessprice)) then
				npcHandler:say("You have been blessed by all of five gods!, |PLAYERNAME|.", npc, creature)
				player:addMissingBless(false)
				player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			else
				npcHandler:say("Come back when you have enough money.", npc, creature)
			end
		end

	elseif MsgContains(message, "no") or MsgContains(message, "nao") then
		if npcHandler:getTopic(playerId) > 0 then
			npcHandler:say("Then no.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end
	
	return true
end

keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "By edict of the churches I'm a Priest!" })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I'm Quevedo, the sheep of Lord." })
npcHandler:setMessage(MESSAGE_GREET, "Greetings, fellow adventurer |PLAYERNAME|! Do you need a {bless}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "God bless you, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "To rude for a intruder")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

--npcConfig.shop = {
--	{ itemName = "holy water", clientId = 133, buy = 200000 },
--}
-- On buy npc shop message

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	--npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	--player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

-- npcType registering the npcConfig table
npcType:register(npcConfig)
