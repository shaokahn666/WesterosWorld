local internalNpcName = "Lawrence"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 57,
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

	
	if MsgContains(message, "inquisitor") then
		npcHandler:say("I'm the trully Inquisitor, the chosen by God to judge the evil and profane.", npc, creature)
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") then
		if player:getLevel() >= 300 then
			if player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) == 2 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.finishDrago) == 1 then
				if player:getLevel() >= 300 then
				npcHandler:say({"Oh, there is a special mission for you! Henricus told me was raising a new inquisitor and he will search for some help.",
								"Do you face the Lord of Dunedain? There is more vampires like this one, do you want to help me to find 16 Vampire Lord Tokens?",}, npc, creature)		
					npcHandler:setTopic(playerId, 2)
				else
					npcHandler:say("There is no missions for you, my little child.", npc, creature)
				end
			elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) == 1 then
				npcHandler:say({
					"For sure! I need some help with a dragon. This disgusting dragon is inside Falcon Fortress, his shouts are giving headache. Please kill that piece of shit.",
				}, npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition, 2)
				npcHandler:setTopic(playerId, 0)
			elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) == 2 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.bossDrag) == 1  and player:getStorageValue(Storage.Quest.U01_24.Inquisition.finishDrago) == 0 then
				npcHandler:say({
					"Thanks! My head are much more quiet now. Now you can ask for new missions.",
				}, npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.Inquisition.finishDrago, 1)
				npcHandler:setTopic(playerId, 0)
				
			elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) == 3 then
				if player:getItemCount(8192) > 15 then
				npcHandler:say({ "Do you have all vampire lord token i requested?",}, npc, creature)					
					npcHandler:setTopic(playerId, 3)
				else
				npcHandler:say({
					"I don't see in your inventory 16 vampire tokens. Go get some more.",}, npc, creature)
				npcHandler:setTopic(playerId, 0)
				end
				
			else
				if player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) > 1 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) < 4 then
					npcHandler:say("To get more missions you need to finish your mission first!", npc, creature)
					npcHandler:setTopic(playerId, 0)
				end
			end	
		else
			npcHandler:say("Please, try to increase your level first!", npc, creature)
		end
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 300 then
				npcHandler:say("Okay! There is four vampire lords to hunt. These monsters are hidding inside their tombs. Do you need to find where is located. But we know there is some attacks nearby bree, esgaroth, moria and forochel.", npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition, 3)
				npcHandler:setTopic(playerId, 0)
			else
				npcHandler:say("Sorry! You don't have level to face these vampires.", npc, creature)
			end
		elseif npcHandler:getTopic(playerId) == 3 then
			if player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) == 3 and player:getItemCount(8192) > 15 then
				player:removeItem(8192, 16)
				player:setStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition, 4)
				npcHandler:say("Thanks for your contribution! Now you can go further and investigate The Inquisition!", npc, creature)				
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

keywordHandler:addKeyword({ "gods" }, StdModule.say, { npcHandler = npcHandler, text = "We owe to the gods of good our creation and continuing existence. If it weren't for them, we would surely fall prey to the minions of the vile and dark gods." })
keywordHandler:addKeyword({ "church" }, StdModule.say, { npcHandler = npcHandler, text = "The churches of the gods united to fight heresy and dark magic. They are the shield of the true believers, while the inquisition is the sword that fights all enemies of virtuousness." })
keywordHandler:addKeyword({ "inquisitor" }, StdModule.say, { npcHandler = npcHandler, text = "The churches of the gods entrusted me with the enormous and responsible task to lead the inquisition. I leave the field work to inquisitors who I recruit from fitting people that cross my way." })
keywordHandler:addKeyword({ "believer" }, StdModule.say, { npcHandler = npcHandler, text = "Belive on the gods and they will show you the path." })
keywordHandler:addKeyword({ "van helsing" }, StdModule.say, { npcHandler = npcHandler, text = "Oh, that guy could kill every monster in this world, maybe you should look nearby bree for some help." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I'm retired now! But i was a important one day." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I'm Lawrence, The Trully Inquisitor" })
keywordHandler:addKeyword({ "vampire" }, StdModule.say, { npcHandler = npcHandler, text = "You need to find these vampires! There is four locations. Nearby Bree, Forochel, Esgaroth and Moria! Take care, these monster's are strong." })
npcHandler:setMessage(MESSAGE_GREET, "Greetings, my son |PLAYERNAME|! Do you want a {mission}?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Don't trust in anyone here, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Rude!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

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
