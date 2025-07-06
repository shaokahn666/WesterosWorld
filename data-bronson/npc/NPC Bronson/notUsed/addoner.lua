local internalNpcName = "Addoner"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 472,
	lookHead = 59,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 1
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

local addonInfo = {
	['first citizen addon'] = {cost = 0, items = {{5878, 100}}, outfit_female = 136, outfit_male = 128, addon = 1, achievement = "Exemplary Citizen", bonusExtraHealth = 15},
	['second citizen addon'] = {cost = 0, items = {{5890, 100}, {5902, 50}, {3374, 1}}, outfit_female = 136, outfit_male = 128, addon = 2, achievement = "Exemplary Citizen", bonusExtraHealth = 15},

	['first hunter addon'] = {cost = 0, items = {{5876, 100}, {5948, 100}, {5891, 5}, {5887, 1}, {5889, 1}, {5888, 1}, {5947, 1}}, outfit_female = 137, outfit_male = 129, addon = 1, achievement = "Hunting with Style"},
	['second hunter addon'] = {cost = 0, items = {{5875, 1}}, outfit_female = 137, outfit_male = 129, addon = 2, achievement = "Hunting with Style"},

	['first knight addon'] = {cost = 0, items = {{5880, 100}, {5892, 1}}, outfit_female = 139, outfit_male = 131, addon = 1, achievement = "In Shining Armor"},
	['second knight addon'] = {cost = 0, items = {{5893, 100}, {5924, 1}, {5885, 1}, {5887, 1}}, outfit_female = 139, outfit_male = 131, addon = 2, achievement = "In Shining Armor"},

	['male first mage addon'] = {cost = 0, items = {{3074, 1}, {3075, 1}, {3072, 1}, {3073, 1}, {3071, 1}, {3066, 1}, {3070, 1}, {3069, 1}, {3065, 1}, {3067, 1}, {5904, 10}, {3077, 20}, {5809, 1}}, outfit_female = 141, outfit_male = 130, addon = 1, achievement = "Alumni"},
	['male second mage addon'] = {cost = 0, items = {{5903, 1}}, outfit_female = 141, outfit_male = 130, addon = 2, achievement = "Alumni"},

	['female first mage addon'] = {cost = 0, items = {{5958, 1}}, outfit_female = 138, outfit_male = 133, addon = 1, achievement = "Ritualist"},
	['female second mage addon'] = {cost = 0, items = {{5894, 70}, {5911, 20}, {5883, 40}, {5922, 35}, {5886, 10}, {5881, 60}, {5882, 40}, {5904, 15}, {5905, 30}}, outfit_female = 138, outfit_male = 133, addon = 2, achievement = "Ritualist"},

	['male first summoner addon'] = {cost = 0, items = {{5958, 1}}, outfit_female = 138, outfit_male = 133, addon = 1, achievement = "Ritualist"},
	['male second summoner addon'] = {cost = 0, items = {{5894, 70}, {5911, 20}, {5883, 40}, {5922, 35}, {5886, 10}, {5881, 60}, {5882, 40}, {5904, 15}, {5905, 30}}, outfit_female = 138, outfit_male = 133, addon = 2, achievement = "Ritualist"},

	['female first summoner addon'] = {cost = 0, items = {{3074, 1}, {3075, 1}, {3072, 1}, {3073, 1}, {3071, 1}, {3066, 1}, {3070, 1}, {3069, 1}, {3065, 1}, {3067, 1}, {5904, 10}, {3077, 20}, {5809, 1}}, outfit_female = 141, outfit_male = 130, addon = 1, achievement = "Alumni"},
	['female second summoner addon'] = {cost = 0, items = {{5903, 1}}, outfit_female = 141, outfit_male = 130, addon = 2, achievement = "Alumni"},

	['first barbarian addon'] = {cost = 0, items = {{5880, 100}, {5892, 1}, {5893, 50}, {5876, 50}}, outfit_female = 147, outfit_male = 143, addon = 1, achievement = "Brutal Politeness"},
	['second barbarian addon'] = {cost = 0, items = {{5884, 1}, {5885, 1}, {5910, 50}, {5911, 50}, {5886, 10}}, outfit_female = 147, outfit_male = 143, addon = 2, achievement = "Brutal Politeness"},

	['first druid addon'] = {cost = 0, items = {{5896, 50}, {5897, 50}}, outfit_female = 148, outfit_male = 144, addon = 1, achievement = "Of Wolves and Bears"},
	['second druid addon'] = {cost = 0, items = {{5906, 100}, {3012, 1}}, outfit_female = 148, outfit_male = 144, addon = 2, achievement = "Of Wolves and Bears"},

	['first nobleman addon'] = {cost = 150000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, achievement = "Aristocrat"},
	['second nobleman addon'] = {cost = 150000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, achievement = "Aristocrat"},

	['first noblewoman addon'] = {cost = 150000, items = {}, outfit_female = 140, outfit_male = 132, addon = 1, achievement = "Aristocrat"},
	['second noblewoman addon'] = {cost = 150000, items = {}, outfit_female = 140, outfit_male = 132, addon = 2, achievement = "Aristocrat"},

	['first oriental addon'] = {cost = 0, items = {{5945, 1}}, outfit_female = 150, outfit_male = 146, addon = 1, achievement = "One Thousand and One"},
	['second oriental addon'] = {cost = 0, items = {{5883, 100}, {5895, 100}, {5891, 2}, {5912, 100}}, outfit_female = 150, outfit_male = 146, addon = 2, achievement = "One Thousand and One"},

	['first warrior addon'] = {cost = 0, items = {{5925, 100}, {5899, 100}, {5884, 1}, {5919, 1}}, outfit_female = 142, outfit_male = 134, addon = 1, achievement = "Wild Warrior"},
	['second warrior addon'] = {cost = 0, items = {{5880, 100}, {5887, 1}}, outfit_female = 142, outfit_male = 134, addon = 2, achievement = "Wild Warrior"},

	['first wizard addon'] = {cost = 0, items = {{5922, 50}}, outfit_female = 149, outfit_male = 145, addon = 1, achievement = "Warlock"},
	['second wizard addon'] = {cost = 0, items = {{3436, 1}, {3386, 1}, {3382, 1}, {3006, 1}}, outfit_female = 149, outfit_male = 145, addon = 2, achievement = "Warlock"},

	['first assassin addon'] = {cost = 0, items = {{5912, 50}, {5910, 50}, {5911, 50}, {5913, 50}, {5914, 50}, {5909, 50}, {5886, 10}}, outfit_female = 156, outfit_male = 152, addon = 1, achievement = "Swift Death"},
	['second assassin addon'] = {cost = 0, items = {{5804, 1}, {5930, 1}}, outfit_female = 156, outfit_male = 152, addon = 2, achievement = "Swift Death"},

	['first beggar addon'] = {cost = 20000, items = {{5883, 100}}, outfit_female = 157, outfit_male = 153, addon = 1, achievement = "Life on the Streets"},
	['second beggar addon'] = {cost = 0, items = {{6107, 1}}, outfit_female = 157, outfit_male = 153, addon = 2, achievement = "Life on the Streets"},

	['first pirate addon'] = {cost = 0, items = {{6098, 100}, {6126, 100}, {6097, 100}}, outfit_female = 155, outfit_male = 151, addon = 1, achievement = "Swashbuckler"},
	['second pirate addon'] = {cost = 0, items = {{6101, 1}, {6102, 1}, {6100, 1}, {6099, 1}}, outfit_female = 155, outfit_male = 151, addon = 2, achievement = "Swashbuckler"},

	['first shaman addon'] = {cost = 0, items = {{3348, 5}, {3403, 5}}, outfit_female = 158, outfit_male = 154, addon = 1, achievement = "Way of the Shaman"},
	['second shaman addon'] = {cost = 0, items = {{5014, 1}, {3002, 5}}, outfit_female = 158, outfit_male = 154, addon = 2, achievement = "Way of the Shaman"},

	['first norseman addon'] = {cost = 0, items = {{7290, 5}}, outfit_female = 252, outfit_male = 251, addon = 1, achievement = "Out in the Snowstorm"},
	['second norseman addon'] = {cost = 0, items = {{7290, 10}}, outfit_female = 252, outfit_male = 251, addon = 2, achievement = "Out in the Snowstorm"},

	['first norsewoman addon'] = {cost = 0, items = {{7290, 5}}, outfit_female = 252, outfit_male = 251, addon = 1, achievement = "Out in the Snowstorm"},
	['second norsewoman addon'] = {cost = 0, items = {{7290, 10}}, outfit_female = 252, outfit_male = 251, addon = 2, achievement = "Out in the Snowstorm"},

	['first elementalist addon'] = {cost = 0, items = {{12599, 1}}, outfit_female = 433, outfit_male = 432, addon = 1, achievement = "Mystic Fabric Magic"},
	['second elementalist addon'] = {cost = 0, items = {{12803, 1}}, outfit_female = 433, outfit_male = 432, addon = 2, achievement = "Mystic Fabric Magic"},

	['first brotherhood addon'] = {cost = 0, items = {{6499, 500}}, outfit_female = 279, outfit_male = 278, addon = 1, achievement = "Skull and Bones"},
	['second brotherhood addon'] = {cost = 0, items = {{6499, 1000}}, outfit_female = 279, outfit_male = 278, addon = 2, achievement = "Skull and Bones"},

	['first nightmare addon'] = {cost = 0, items = {{6499, 500}}, outfit_female = 269, outfit_male = 268, addon = 1, achievement = "Nightmare Walker"},
	['second nightmare addon'] = {cost = 0, items = {{6499, 1000}}, outfit_female = 269, outfit_male = 268, addon = 2, achievement = "Nightmare Walker"}

	--[[ colocar 
	https://www.tibiawiki.com.br/wiki/Afflicted_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Battle_Mage_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Citizen_of_Issavi_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Dream_Warden_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Festive_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Hand_of_the_Inquisition_Outfits

	se tiver matado o boss = https://www.tibiawiki.com.br/wiki/Poltergeist_Outfits_Quest
	se tiver matado o boss = https://www.tibiawiki.com.br/wiki/Rascoohan_Outfits_Quest
	se tiver matado o boss = https://www.tibiawiki.com.br/wiki/Revenant_Outfits_Quest

	https://www.tibiawiki.com.br/wiki/Rift_Warrior_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Royal_Costume_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Warmaster_Outfits_Quest
	https://www.tibiawiki.com.br/wiki/Wayfarer_Outfits_Quest
	
	]]--
}

local outfits = {'citizen', 'hunter', 'knight', 'mage', 'barbarian', 'druid', 'nobleman', 'oriental', 'summoner', 'warrior', 'wizard', 'assassin', 'beggar', 'pirate', 'shaman', 'norseman', 'elementalist', 'brotherhood', 'nightmare', 'golden'}
local messageCache = {}

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local messageLower = message:lower()

	if messageLower == "first mage addon" then
		if player:getSex() == PLAYERSEX_FEMALE then
			messageLower = "female first mage addon"
		else
			messageLower = "male first mage addon"
		end
	elseif messageLower == "second mage addon" then
		if player:getSex() == PLAYERSEX_FEMALE then
			messageLower = "female second mage addon"
		else
			messageLower = "male second mage addon"
		end
	elseif messageLower == "first summoner addon" then
		if player:getSex() == PLAYERSEX_FEMALE then
			messageLower = "female first summoner addon"
		else
			messageLower = "male first summoner addon"
		end
	elseif messageLower == "second summoner addon" then
		if player:getSex() == PLAYERSEX_FEMALE then
			messageLower = "female second summoner addon"
		else
			messageLower = "male second summoner addon"
		end
	end

	local playerGuid = player:getGuid()

	local requiredAddon = addonInfo[messageLower]
	if requiredAddon then
		local tableNecessaryItems = requiredAddon.items
		local listTextNecessaryItems = ""
		local maxValueTableItems = table.maxn(tableNecessaryItems)

		if player:hasOutfit(requiredAddon.outfit_female, requiredAddon.addon) or player:hasOutfit(requiredAddon.outfit_male, requiredAddon.addon) then
			npcHandler:say("You already have this addon in this outfit!", npc, player)
			npcHandler:resetNpc(player)
			return true

		elseif maxValueTableItems > 0 then
			local item
			for i = 1, maxValueTableItems do
				item = tableNecessaryItems[i]
				listTextNecessaryItems = listTextNecessaryItems .. item[2] .. " " .. ItemType(item[1]):getName()
				if i == (maxValueTableItems - 1) and requiredAddon.cost == 0 then
					listTextNecessaryItems = listTextNecessaryItems .. " and "
				elseif i ~= maxValueTableItems then
					listTextNecessaryItems = listTextNecessaryItems .. ", "
				end
			end
		end

		local text = ""
		if requiredAddon.cost > 0 and maxValueTableItems == 0 then
			text = requiredAddon.cost .. " gold coins"
		elseif maxValueTableItems > 0 and requiredAddon.cost == 0 then
			text = listTextNecessaryItems
		elseif requiredAddon.cost > 0 and maxValueTableItems > 0 then
			text = listTextNecessaryItems .. " and " .. requiredAddon.cost .. " gold coins"
		end

		npcHandler:say("For the " .. messageLower .. " you're gonna need it " .. text .. ". Do you have the necessary items?", npc, player)
		messageCache[playerGuid] = messageLower
		npcHandler:setTopic(playerGuid, 2)
		return true

	elseif npcHandler:getTopic(playerGuid) == 2 and messageLower == "yes" then

		local requiredAddonCache = addonInfo[messageCache[playerGuid]]
		if not requiredAddonCache then
			return false
		end

		local maxValueTableItemsCache = table.maxn(requiredAddonCache.items)
		local items_number = 0
		if maxValueTableItemsCache > 0 then
			local item
			for i = 1, maxValueTableItemsCache do
				item = requiredAddonCache.items[i]
				if player:getItemCount(item[1]) >= item[2] then
					items_number = items_number + 1
				end
			end

			if items_number ~= maxValueTableItemsCache then
				npcHandler:say("You do not have the necessary value to purchase the desired addon.", npc, player)
				npcHandler:resetNpc(player)
				return true
			end
		end

		if requiredAddonCache.cost > 0 then
			if getTotalMoney() < requiredAddonCache.cost then
				npcHandler:say("You do not have the necessary value to purchase the desired addon.", npc, player)
				npcHandler:resetNpc(player)
				return true
			end

			if not player:removeMoneyBank(requiredAddonCache.cost) then
				logger.warn("[NPCaddoner.creatureSayCallback] Function removeMoneyBank did not work for player " .. player:getName() .. ".")
				return false
			end
		end
		
		if maxValueTableItemsCache > 0 then
			local item
			for i = 1, maxValueTableItemsCache do
				item = requiredAddonCache.items[i]
				if not player:removeItem(item[1],item[2]) then
					logger.warn("[NPCaddoner.creatureSayCallback] Function removeItem did not work for player " .. player:getName() .. ".")
					return false
				end
			end
		end

		if requiredAddonCache.achievement and requiredAddonCache.achievement ~= "" then
			local otherAddon = requiredAddonCache.addon == 1 and 2 or 1
			if player:hasOutfit(requiredAddonCache.outfit_female, otherAddon) or player:hasOutfit(requiredAddonCache.outfit_male, otherAddon) then
				player:addAchievement(requiredAddonCache.achievement)
				if requiredAddonCache.bonusExtraHealth and requiredAddonCache.bonusExtraHealth > 0 then
					player:setMaxHealth(player:getMaxHealth() + 15)
					player:say("+" .. requiredAddonCache.bonusExtraHealth .. " HP Extra Bonus", TALKTYPE_MONSTER_SAY)
				end
			end
		end

		player:addOutfitAddon(requiredAddonCache.outfit_male, requiredAddonCache.addon)
		player:addOutfitAddon(requiredAddonCache.outfit_female, requiredAddonCache.addon)

		npcHandler:say("Congratulations, you have received your " .. messageCache[playerGuid] .. "!", npc, player)
		player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
		player:save()

		messageCache[playerGuid] = nil
		npcHandler:setTopic(playerGuid, 0)
		return true

	elseif table.contains({"golden", "golden outfit"}, messageLower) then
		
		npcHandler:say("In exchange for a truly generous donation, I will offer a special outfit. Do you want to make a donation?", npc, player)
		npcHandler:setTopic(playerGuid, 3)
		return true

	elseif table.contains({"addon", "outfits"}, messageLower) then
		npcHandler:say("I can give {first} or {second} addon for {" .. table.concat(outfits, "}, {") .. "} outfits.", npc, player)
		messageCache[playerGuid] = nil
		npcHandler:setTopic(playerGuid, 0)
		return true

	elseif table.contains({"help", "first", "second"}, messageLower) then
		npcHandler:say("You should say 'first OUTFIT addon' for the first addon and 'second OUTFIT addon' for the second addon.", npc, player)
		messageCache[playerGuid] = nil
		npcHandler:setTopic(playerGuid, 0)
		return true

	elseif messageLower == "yes" and npcHandler:getTopic(playerGuid) == 3 then
		npcHandler:say({
			"Excellent! Now, let me explain. If you donate 1.000.000.000 gold pieces, you will be entitled to wear a unique outfit. ...",
			"You will be entitled to wear the {armor} for 500.000.000 gold pieces, {helmet} for an additional 250.000.000, and the {boots} for another 250.000.000 gold pieces. ...",
			"What will it be?"
		}, npc, player)
		npcHandler:setTopic(playerGuid, 4)

		messageCache[playerGuid] = nil
		return true

	elseif messageLower == "yes" and npcHandler:getTopic(playerGuid) == 4 then
		npcHandler:say("In that case, return to me once you've made up your mind.", npc, player)
		npcHandler:setTopic(playerGuid, 4)
		messageCache[playerGuid] = nil
		return true

	elseif messageLower == "yes" and npcHandler:getTopic(playerGuid) == 5 then
		if player:getStorageValue(Storage.goldenOutfit) < 1 then
			if player:getTotalMoney() >= 500000000 then
				local inbox = player:getStoreInbox()
				local inboxItems = inbox:getItems()
				if inbox and #inboxItems <= inbox:getMaxCapacity() then
					local decorationKit = inbox:addItem(ITEM_DECORATION_KIT, 1)
					local outfitDisplay = 31510
					local decorationItemName = ItemType(outfitDisplay):getName()
					decorationKit:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, "Unwrap it in your own house to create a " .. decorationItemName .. ".")
					decorationKit:setCustomAttribute("unWrapId", outfitDisplay)

					-- Removing money from player and adding outfit
					player:removeMoneyBank(500000000)
					player:addOutfit(1211)
					player:addOutfit(1210)
					player:getPosition():sendMagicEffect(CONST_ME_EARLY_THUNDER)
					player:setStorageValue(Storage.goldenOutfit, 1)

					-- NPC's message to player
					npcHandler:say("Take this armor as a token of great gratitude. Let us forever remember this day, my friend!", npc, player)
				else
					npcHandler:say("Please make sure you have free slots in your store inbox.", npc, player)
				end
			else
				npcHandler:say("You do not have enough money to donate that amount.", npc, player)
			end
		else
			npcHandler:say("You already have that addon.", npc, player)
		end

		npcHandler:setTopic(playerGuid, 2)
		return true

	elseif messageLower == "yes" and npcHandler:getTopic(playerGuid) == 6 then
		if player:getStorageValue(Storage.goldenOutfit) == 1 then
			if player:getStorageValue(Storage.goldenOutfit) < 2 then
				if player:getTotalMoney() >= 250000000 then
					npcHandler:say("Take this helmet as a token of great gratitude. Let us forever remember this day, my friend. ", npc, player)
					player:removeMoneyBank(250000000)
					player:addOutfitAddon(1210, 2)
					player:addOutfitAddon(1211, 2)
					player:getPosition():sendMagicEffect(CONST_ME_EARLY_THUNDER)
					player:setStorageValue(Storage.goldenOutfit, 2)

					npcHandler:setTopic(playerGuid, 0)
					return true
				else
					npcHandler:say("You do not have enough money to donate that amount.", npc, player)
				end
			else
				npcHandler:say("You already have that outfit.", npc, player)
			end
		else
			npcHandler:say("You need to donate {armor} outfit first.", npc, player)
		end

		npcHandler:setTopic(playerGuid, 4)
		return true

	elseif messageLower == "yes" and npcHandler:getTopic(playerGuid) == 7 then
		if player:getStorageValue(Storage.goldenOutfit) == 2 then
			if player:getStorageValue(Storage.goldenOutfit) < 3 then
				if player:getTotalMoney() >= 250000000 then
					npcHandler:say("Take this boots as a token of great gratitude. Let us forever remember this day, my friend. ", npc, player)
					player:removeMoneyBank(250000000)
					player:addOutfitAddon(1210, 1)
					player:addOutfitAddon(1211, 1)
					player:getPosition():sendMagicEffect(CONST_ME_EARLY_THUNDER)
					player:setStorageValue(Storage.goldenOutfit, 3)
				else
					npcHandler:say("You do not have enough money to donate that amount.", npc, player)
				end
			else
				npcHandler:say("You already have that outfit.", npc, player)
			end
		else
			npcHandler:say("You need to donate {helmet} addon first.", npc, player)
		end

		npcHandler:setTopic(playerGuid, 4)
		return true

	elseif messageLower == "armor" and npcHandler:getTopic(playerGuid) == 4 then
		npcHandler:say("So you would like to donate 500.000.000 gold pieces which in return will entitle you to wear a unique armor?", npc, player)
		npcHandler:setTopic(playerGuid, 5)
		return true

	elseif messageLower == "helmet" and npcHandler:getTopic(playerGuid) == 4 then
		npcHandler:say("So you would like to donate 250.000.000 gold pieces which in return will entitle you to wear unique helmet?", npc, player)
		npcHandler:setTopic(playerGuid, 6)
		return true

	elseif messageLower == "boots" and npcHandler:getTopic(playerGuid) == 4 then
		npcHandler:say("So you would like to donate 250.000.000 gold pieces which in return will entitle you to wear a unique boots?", npc, player)
		npcHandler:setTopic(playerGuid, 7)
		return true

	elseif table.contains(outfits, messageLower) then
		npcHandler:say("To purchase outfit " .. messageLower .. " addons you must specify which one you want: {first " .. messageLower .. " addon} or {second " .. messageLower .. " addon}.", npc, player)
		messageCache[playerGuid] = nil
		npcHandler:setTopic(playerGuid, 0)
		return true

	else
		local topic = npcHandler:getTopic(playerGuid)
		if topic and topic > 0 then
			npcHandler:say("Come back when you have all the items needed for the addon you want.", npc, player)
			messageCache[playerGuid] = nil
			npcHandler:setTopic(playerGuid, 0)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! Which addon do you want to purchase? I have addons of several {outfits}. If the outfit is already decided, just ask me about the first or second addon, for example: {first citizen addon} or {second citizen addon}.")
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
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
