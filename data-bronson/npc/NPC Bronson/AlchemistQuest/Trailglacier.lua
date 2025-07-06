local internalNpcName = "Trailglacier"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 11,
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
		npcHandler:say("I'm the guardian of knowledge about Alchemy! I can teach you some potions recipes.", npc, creature)
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") or MsgContains(message, "help") then
		if player:getLevel() >= 50 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1  and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld) == 5 then
				npcHandler:say({"Finally, i was waiting a long time to find a curious adventurer like you... do you want to listen to a {history}?",}, npc, creature)		
					npcHandler:setTopic(playerId, 2)
				end

			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == 1 then
				npcHandler:say({
					"What you are waiting? Your next stop will be in beleghost.",}, npc, creature)
				npcHandler:setTopic(playerId, 0)
			end	
		else
			npcHandler:say("Sorry, I don't have a mission for you. Maybe try to increase your level.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		
	elseif MsgContains(message, "history") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				npcHandler:say({"That occurred 3.000 years ago, when i was a single drop in ocean... a powerful alchemist was trying to transform water into crystals. He conducted some experiments with lifes crystals in ocean.",
				"His experiments was growing and being better at some point...",
				"When he tried to transform the northern ocean into a crystal, a failure in the procedure combined with the suffer and fear present in the ocean, generated a strange {life form}, me..."}, npc, creature)
				npcHandler:setTopic(playerId, 3)
			end
		end
		
	elseif MsgContains(message, "life form") then
		if npcHandler:getTopic(playerId) == 3 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				npcHandler:say({"Yes... I was created by an accident. So i started to follow him and made he my master. I went in incredible expedtions with him, one time we went to purgatory.. that was AMAZING...",
				"So he moved to purgatory for many years... i suffered with all heat... After he new experiments, they bring a new form of life... the Trailblazer, my brother. But that ins't a accident like me. He always loved the fire...",
				"After 300 years, we moved to {Dol'guldur}. But the Trailblazer won't came with us, because all citizens will be afraid of a fire monster..."}, npc, creature)
				npcHandler:setTopic(playerId, 4)
			end
		end
		
	elseif MsgContains(message, "Dol'guldur") then
		if npcHandler:getTopic(playerId) == 4 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				npcHandler:say({"When we moved to this tower, he was to close to city... And started to frequent the city with all those humans... He become different, only want to being with humans and let me here alone...",
				"When he started to fall in love with Azahul things got worse. He left me to marry with Azahul and they had a baby... Trailbone, my little brother...",
				"So she started to acting like a crazy... She wouldn't let him to visit his antique tower. In a midnight he prepared a forgetfulness potion and let to she {drink}..."}, npc, creature)
				npcHandler:setTopic(playerId, 5)
			end
		end
		
	elseif MsgContains(message, "drink") then
		if npcHandler:getTopic(playerId) == 5 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				npcHandler:say({"He got some time to flee to our tower, that was a dreamy day. I was with my master a one more time... for 2.000 years we lived here...",
				"But all good things end... He started a new expedition but wouldn't let me go. He asked to stay here and take care of my brother... He gone and  wouldn't return, that was 500 years ago...",
				"The {potion} given to witch are fadding down, and she regain her memories... She are trying to sneak into the tower... I don't know why..."}, npc, creature)
				npcHandler:setTopic(playerId, 6)
			end
		end
		
	elseif MsgContains(message, "potion") then
		if npcHandler:getTopic(playerId) == 6 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				npcHandler:say({"When he gone, i started to learn alchemy and become a master in that skill... But i won't find all his antiques recipes...",
				"I remember his last expedition, was to explore a nature element in Beleghost... He never came back... I wish to visit him one more time...",
				"Do you want to start a {expedition} and find clues about my master?"}, npc, creature)
				npcHandler:setTopic(playerId, 7)
			end
		end
		
	elseif MsgContains(message, "expedition") then
		if npcHandler:getTopic(playerId) == 7 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist, 1)
				npcHandler:say("Adjust your route to Beleghost... This will be a excelent trip.", npc, creature)
				npcHandler:setTopic(playerId, 0)
			end
		end
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") or MsgContains(message, "special") or MsgContains(message, "reward") then
	
		if npcHandler:getTopic(playerId) == 7 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist) == -1 then
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist, 1)
				npcHandler:say("Adjust your route to Beleghost... This will be a excelent trip.", npc, creature)
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

keywordHandler:addKeyword({ "Trailblazer" }, StdModule.say, { npcHandler = npcHandler, text = "Just my little brother, please don't bother him." })
keywordHandler:addKeyword({ "Trailbone" }, StdModule.say, { npcHandler = npcHandler, text = "Do you find my brother down stairs, huh? Ask him to pay me, please..." })
keywordHandler:addKeyword({ "Alchemist" }, StdModule.say, { npcHandler = npcHandler, text = "It's is a antique pratice to produce a several kind of potions." })
keywordHandler:addKeyword({ "Potions" }, StdModule.say, { npcHandler = npcHandler, text = "Do you want to know the mistery of Powerful Potions?" })
keywordHandler:addKeyword({ "Time" }, StdModule.say, { npcHandler = npcHandler, text = "Try to find a clock... or just look in the sky." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I'm the guardian of all knowledge about alchemy." })
npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! What you are looking for?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Be careful, |PLAYERNAME|. Don't slip in ice!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Rude for a fragile meat sack!")

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
