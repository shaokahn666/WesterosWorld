local internalNpcName = "Azahul"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 724,--141
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 401,
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

	
	if MsgContains(message, "profession") then
		npcHandler:say("I'm a powerful sorcerer. I wan't to become a alchemist too.", npc, creature)
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") then
		if player:getLevel() >= 50 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.QuestLine) == -1 then
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.QuestLine) == -1 then
				npcHandler:say({"Oh, i have a good mission for you! I need a excepcional help to make a rat potion. Could you help me?",}, npc, creature)		
					npcHandler:setTopic(playerId, 2)
				else
					npcHandler:say("There is no missions for you, my little child.", npc, creature)
				end
			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 3 then
				npcHandler:say({
					"I really don't need that potion, that's was only to test you. Could you do a another little mission for me?",}, npc, creature)
				npcHandler:setTopic(playerId, 3)
			else
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) > 0 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) < 4 then
					npcHandler:say("You are in a mission, no?", npc, creature)
					npcHandler:setTopic(playerId, 0)
				else
					npcHandler:say("Sorry, I can't help you now.", npc, creature)
					npcHandler:setTopic(playerId, 0)
				end
			end	
		else
			npcHandler:say("Sorry, I don't have a mission for you. Maybe try to increase your level.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.QuestLine) == -1 then
				npcHandler:say("Okay! Please visit Trailblazer in purgatorio, he are a experient Alchemist! He could help with the potion.", npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.QuestLine, 1)
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 1)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 3 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 3 and player:getItemCount(21188) >= 1 then
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 4)
				npcHandler:say({"I appreciate your help! Please find a way to enter in Alchemist Tower, is a large tower near to Dol Guldur.",
				"You rat potion will be useful to this task."}, npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		end

	elseif MsgContains(message, "no") then
		if npcHandler:getTopic(playerId) > 0 then
			npcHandler:say("Then no.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end
	
	return true
end

keywordHandler:addKeyword({ "Alchemist" }, StdModule.say, { npcHandler = npcHandler, text = "It's is a antique pratice to produce a several kind of potions." })
keywordHandler:addKeyword({ "Potions" }, StdModule.say, { npcHandler = npcHandler, text = "Do you want to know the mistery of Powerful Potions?" })
keywordHandler:addKeyword({ "Time" }, StdModule.say, { npcHandler = npcHandler, text = "Its time to learn Alchemy." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I'm a wizard! a powerful one!" })
npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! Do you wanna know the secrets of alchemy? Maybe you need a {mission}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Don't trust in anyone here, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Rude!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	--player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

-- npcType registering the npcConfig table
npcType:register(npcConfig)
