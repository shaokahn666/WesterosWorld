local internalNpcName = "Trailbone"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 130,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
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

local itensNeed = {21838,3995,169}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	
	if MsgContains(message, "profession") then
		npcHandler:say("I'm a professor in Alchemy! Do you want to learn alchemy?", npc, creature)
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") or MsgContains(message, "help") then
		if player:getLevel() >= 50 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == -1 then
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == -1 then
				npcHandler:say({"Oh adventurer, how did you get in here? This is a magic tower. How is it possible? The {witch} in Dol Guldur didn't help you... right?",}, npc, creature)		
					npcHandler:setTopic(playerId, 2)
				end

			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 1 then
				npcHandler:say({
					"Please, first try to investigate the wardrobe next to me...",}, npc, creature)
				npcHandler:setTopic(playerId, 0)
			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 2 or player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 3 then
				npcHandler:say({
					"Do you need any help with the {labyrinth}? Because that is too simple to complete.",}, npc, creature)
				npcHandler:setTopic(playerId, 3)
			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 4 then
				npcHandler:say("That was AMAZING!! How do you killed that minotaur? Incredible! So you proof your goodness.", npc, creature)
				npcHandler:say("Accept my {Reward} for doing this great job.", npc, creature)
				npcHandler:setTopic(playerId, 4)
			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 5 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				npcHandler:say("My Adventurer |PLAYERNAME|, you did the last mission with great mastery! Do you wanna to know the mistery about Alchemy? ", npc, creature)
				npcHandler:setTopic(playerId, 5)
			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 5 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) ~= -1 then
				npcHandler:say("Sorry! I don't have any missions for you today. ", npc, creature)
				npcHandler:setTopic(playerId, 0)
			end	
		else
			npcHandler:say("Sorry, I don't have a mission for you. Maybe try to increase your level.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		
	elseif MsgContains(message, "witch") or MsgContains(message, "labyrinth") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == -1 then
				npcHandler:say({"I told for her to stop bringing adventurer's inside MY TOWER... GRR..",
				"But now is late... So... Do you are interest into give me some help in a {special} task?"}, npc, creature)
				npcHandler:setTopic(playerId, 3)
			end
		end
		
		if npcHandler:getTopic(playerId) == 3 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 2 then
				npcHandler:say({"You need to pass throught the labyrinth, but there is a technique for that.",
				"Stay in safe spots and wait until the walls move to block minus observer vision."}, npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		end
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") or MsgContains(message, "special") or MsgContains(message, "reward") then
		if npcHandler:getTopic(playerId) == 3 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == -1 then
				npcHandler:say({"Thanks! My wardrobe is shining a strong light throught the key hole... That's is weird. ",
				"Could you please, investigate my wardrobe next to me."}, npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld, 1)
				npcHandler:setTopic(playerId, 0)
			end
			
		elseif npcHandler:getTopic(playerId) == 4 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 4 then
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld, 5)
				player:addExperience(500600, true)
				player:addMoney(10000)
				npcHandler:setTopic(playerId, 0)
			end
			
		elseif npcHandler:getTopic(playerId) == 5 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 5 then
				npcHandler:say("Okay! Now you can go further in Alchemy, so visit the Trailglacier in upstairs.", npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist, 1)
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

keywordHandler:addKeyword({ "Trailblazer" }, StdModule.say, { npcHandler = npcHandler, text = "Just my brother, please don't bother him." })
keywordHandler:addKeyword({ "minus" }, StdModule.say, { npcHandler = npcHandler, text = "That isn't a myth! Minus is a powerful creature imprisioned into a labyrinth!" })
keywordHandler:addKeyword({ "Alchemist" }, StdModule.say, { npcHandler = npcHandler, text = "It's is a antique pratice to produce a several kind of potions." })
keywordHandler:addKeyword({ "Potions" }, StdModule.say, { npcHandler = npcHandler, text = "Do you want to know the mistery of Powerful Potions?" })
keywordHandler:addKeyword({ "Time" }, StdModule.say, { npcHandler = npcHandler, text = "Its time to learn Alchemy." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I'm a Powerful Alchemist! Ask me a question about alchemy..." })
npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! aaah, wonderful Alchemist Day!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Don't fall in stairs, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Rude!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

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
