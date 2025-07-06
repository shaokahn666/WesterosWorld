local internalNpcName = "Trailblazer"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 242,
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

local itensNeed = {21838,3995,169}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end
	
	if MsgContains(message, "profession") then
		npcHandler:say("I'm an incredible Alchemist! My specialty? Rat potions.", npc, creature)
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") or MsgContains(message, "help") or MsgContains(message, "azahul") then
		if player:getLevel() >= 50 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 1 then
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 1 then
				npcHandler:say({"Hahah, my magic friend. Azahul ask to find me here? So maybe you need a help with a {potion}, huh?",}, npc, creature)		
					npcHandler:setTopic(playerId, 2)
				else
					npcHandler:say("There is no missions for you, my little child.", npc, creature)
				end
			elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 2 then
				npcHandler:say({
					"Do you have all ingredients i asked for, tell me if you want the {potion}?",}, npc, creature)
				npcHandler:setTopic(playerId, 3)
			else
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 2 then
					npcHandler:say("You are in a mission, no?", npc, creature)
					npcHandler:setTopic(playerId, 0)
				elseif player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 3 then
					npcHandler:say("Do you lost the potion? I can craft one more for 60.000gps.", npc, creature)
					npcHandler:setTopic(playerId, 4)
				end
			end	
		else
			npcHandler:say("Sorry, I don't have a mission for you. Maybe try to increase your level.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") or MsgContains(message, "potion") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 1 then
				npcHandler:say("Okay! I will help you, but first, i need some itens to produce the potion. Could give to me a {scarab cheese}, {a vial of distilled water} and {a dead rat}.", npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 2)
				npcHandler:setTopic(playerId, 0)
			end
		elseif npcHandler:getTopic(playerId) == 3 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 2 then
				local idCount = 0
				for i in #itensNeed do
					if player:getItemCount(itensNeed[i]) > 1 then
						idCount = idCount + 1
					end
				end
				
				if idCount == 3 then
					for i in #itensNeed do
						player:removeItem(itensNeed[i], 1)
					end
					player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic, 3)
					npcHandler:say("Here is your rat potion! Bring back to Azahul.", npc, creature)
					player:addItem(21188, 1)
					npcHandler:setTopic(playerId, 0)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
				end
			end
		elseif npcHandler:getTopic(playerId) == 4 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 3 then
				if player:getMoney() + player:getBankBalance() >= 60000 then
					player:removeMoneyBank(60000)
					npcHandler:say("Here is your rat potion! Bring back to Azahul.", npc, creature)
					player:addItem(21188, 1)
					npcHandler:setTopic(playerId, 0)
					player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
				end
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

keywordHandler:addKeyword({ "scarab cheese" }, StdModule.say, { npcHandler = npcHandler, text = "A soft cheese made from scarab milk, try to find one in dunedain sourounds." })
keywordHandler:addKeyword({ "a vial of distilled water" }, StdModule.say, { npcHandler = npcHandler, text = "A purely water, made using a vial of water into a distilling machine. Maybe you find one in belfallas blueberries camp." })
keywordHandler:addKeyword({ "a dead rat" }, StdModule.say, { npcHandler = npcHandler, text = "oh, that is just a common rat. You will find one in cities sewer, like dunedain." })
keywordHandler:addKeyword({ "Alchemist" }, StdModule.say, { npcHandler = npcHandler, text = "It's is a antique pratice to produce a several kind of potions." })
keywordHandler:addKeyword({ "Potions" }, StdModule.say, { npcHandler = npcHandler, text = "Do you want to know the mistery of Powerful Potions?" })
keywordHandler:addKeyword({ "Time" }, StdModule.say, { npcHandler = npcHandler, text = "Its time to learn Alchemy." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I'm a Powerful Alchemist! Ask me a question about alchemy..." })
npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! How i can {help} you today?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Don't trust in anyone here, |PLAYERNAME|!")
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
