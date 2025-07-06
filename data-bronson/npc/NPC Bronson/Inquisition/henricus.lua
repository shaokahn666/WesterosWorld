local internalNpcName = "Henricus"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 132,
	lookHead = 79,
	lookBody = 0,
	lookLegs = 96,
	lookFeet = 0,
	lookAddons = 0,
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
	elseif MsgContains(message, "join") then
		if player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) < 1 then
			npcHandler:say("Do you want to join the inquisition?", npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
	elseif MsgContains(message, "blessing") or MsgContains(message, "bless") then
		local missing = Blessings.getInquisitionPrice(player)
		if player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) == 2 then --if quest is done
			if missing > 0 then
				npcHandler:say("Do you want to receive the blessing of the inquisition - which means " .. (missing == 5 and "all five available" or missing) .. " blessings - for " .. totalBlessPrice .. " gold?", npc, creature)
				npcHandler:setTopic(playerId, 7)
			else
				npcHandler:say("You already are protected by blessings of all five Gods.", npc, creature)
			end
		else
			npcHandler:say("You cannot get this blessing unless you have completed The Inquisition Quest.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "mission") or MsgContains(message, "report") or MsgContains(message, "missao") then
		if player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) < 1 then
			if player:getLevel() >= 300 then
				npcHandler:say("Do you want to join the inquisition?", npc, creature)
				npcHandler:setTopic(playerId, 2)
			else
				npcHandler:say("You can't join to be Inquisitor, you must have level 300 or more.", npc, creature)
			end
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) == 1 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) < 1 then
			npcHandler:say({
				"Let's see if you are worthy. Take your path to Dunedain to investigate the rumor of a bunch of vampire attacks...",
			}, npc, creature)
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition, 1) -- The Inquisition Questlog- "Mission 1: Interrogation"
			npcHandler:setTopic(playerId, 0)
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) == 2 then
			npcHandler:say({"Oh, the rumours are real? We need to take an attitude to execute the evil!",
							"There is a old friend in nearby Bree who can help with this situation. His name is Van Helsing. He can help you with all stuff needed.",}, npc, creature)			
			npcHandler:setTopic(playerId, 0)
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition, 3)
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) == 4 then
			npcHandler:say("Did you encounter my old friend? Maybe you need to find the hideout for this vampire. Try to follow the path near the corpse...", npc, creature)
			npcHandler:setTopic(playerId, 0)
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.TheInquisition) == 5 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition) < 1 then
			npcHandler:say({
				"You shown your bravery with mastery! Follow your path to be the new inquisitor! Now you need to visit Lawrence ... he will promote you to a inquisitor, but him need some help first!",
			}, npc, creature)
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.SecondInquisition, 1)
			npcHandler:setTopic(playerId, 0)
			
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.ShadowNexus) == 2 and player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) == 1 then
			npcHandler:say({
				"You proved your honour defeating all these bosses and destroying the nexus! You we consider you as one of us! Take care, Inquisitor! You now can access the chamber of fortune! Choose with wisdom!",
			}, npc, creature)
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine, 2)
			player:setStorageValue(Storage.Quest.U01_24.Inquisition.rewardRoom, 1)
			player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			npcHandler:setTopic(playerId, 0)
			
		elseif player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) == 2 then
			npcHandler:say({
				"There is no missions avaible, Inquisitor! You can rest some time.",
			}, npc, creature)
			npcHandler:setTopic(playerId, 0)
			
		else
			npcHandler:say("Sorry! i don't have any missions today!", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end	
		
	elseif MsgContains(message, "yes") or MsgContains(message, "sim") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 300 then
				npcHandler:say("So be it. Now you are a member of the inquisition. You might ask me for a {mission} to raise in my esteem.", npc, creature)
				player:setStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine, 1)
				npcHandler:setTopic(playerId, 0)
			else
				npcHandler:say("You can't join to be Inquisitor, you must have level 300 or more.", npc, creature)
			end
		elseif npcHandler:getTopic(playerId) == 7 then
			if missing == 0 then
				npcHandler:say("You already have been blessed!", npc, creature)
			elseif player:removeMoneyBank(totalBlessPrice) then
				npcHandler:say("You have been blessed by all of five gods!, |PLAYERNAME|.", npc, creature)
				player:addMissingBless(false)
				player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
			else
				npcHandler:say("Come back when you have enough money.", npc, creature)
			end
		end

	elseif MsgContains(message, "no") then
		if npcHandler:getTopic(playerId) > 0 then
			npcHandler:say("Then no.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "outfit") then
		if player:getStorageValue(Storage.Quest.U01_24.Inquisition.QuestLine) == 2 then
			npcHandler:say("Here is the full addon of demon hunter outfit. Congratulations!", npc, creature)
			player:addOutfit(288, 0)
			player:addOutfit(289, 0)
			player:addOutfitAddon(288, 1)
			player:addOutfitAddon(289, 1)
			player:addOutfitAddon(288, 2)
			player:addOutfitAddon(289, 2)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			player:addAchievement("Demonbane")
			npcHandler:setTopic(playerId, 0)
		end
	end
	
	return true
end

keywordHandler:addKeyword({ "paladin" }, StdModule.say, { npcHandler = npcHandler, text = "It's a shame that only a few paladins still use their abilities to further the cause of the gods of good. Too many paladins have become selfish and greedy." })
keywordHandler:addKeyword({ "knight" }, StdModule.say, { npcHandler = npcHandler, text = "Nowadays, most knights seem to have forgotten the noble cause to which all knights were bound in the past. Only a few have remained pious, serve the gods and follow their teachings." })
keywordHandler:addKeyword({ "sorcerer" }, StdModule.say, { npcHandler = npcHandler, text = "Those who wield great power have to resist great temptations. We have the burden to eliminate all those who give in to the temptations." })
keywordHandler:addKeyword({ "druid" }, StdModule.say, { npcHandler = npcHandler, text = "The druids here still follow the old rules. Sadly, the druids of Carlin have left the right path in the last years." })
keywordHandler:addKeyword({ "gods" }, StdModule.say, { npcHandler = npcHandler, text = "We owe to the gods of good our creation and continuing existence. If it weren't for them, we would surely fall prey to the minions of the vile and dark gods." })
keywordHandler:addKeyword({ "church" }, StdModule.say, { npcHandler = npcHandler, text = "The churches of the gods united to fight heresy and dark magic. They are the shield of the true believers, while the inquisition is the sword that fights all enemies of virtuousness." })
keywordHandler:addKeyword({ "inquisitor" }, StdModule.say, { npcHandler = npcHandler, text = "The churches of the gods entrusted me with the enormous and responsible task to lead the inquisition. I leave the field work to inquisitors who I recruit from fitting people that cross my way." })
keywordHandler:addKeyword({ "believer" }, StdModule.say, { npcHandler = npcHandler, text = "Belive on the gods and they will show you the path." })
keywordHandler:addKeyword({ "lawrence" }, StdModule.say, { npcHandler = npcHandler, text = "My right arm in Inquisitor's Guild, now he is retired in falcon fortress." })
keywordHandler:addKeyword({ "van helsing" }, StdModule.say, { npcHandler = npcHandler, text = "Oh, that guy could kill every monster in this world, maybe you should look nearby bree for some help." })
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "By edict of the churches I'm the Lord Inquisitor." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I'm Henricus, the Lord Inquisitor." })
npcHandler:setMessage(MESSAGE_GREET, "Greetings, fellow {believer} |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_FAREWELL, "Always be on guard, |PLAYERNAME|!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "This ungraceful haste is most suspicious!")

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "holy water", clientId = 133, buy = 200000 },
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

-- npcType registering the npcConfig table
npcType:register(npcConfig)
