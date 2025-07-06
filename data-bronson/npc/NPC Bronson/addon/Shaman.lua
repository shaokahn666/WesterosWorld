local internalNpcName = "Shaman" 
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 154, -- Male
	lookHead = 38,
	lookBody = 4,
	lookLegs = 15,
	lookFeet = 85,
	lookAddons = 3
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
	['first shaman addon'] = {  
		cost = 0,
		items = {{12803, 1},
			{5948, 100}},	
		outfit_female = 158, -- Female
		outfit_male = 154, -- Male
		addon = 1
	},
	['second shaman addon'] = { 
		cost = 0,
		items = {{6098, 50},
			{3445, 1}},
		outfit_female = 158, -- Female
		outfit_male = 154, -- Male
		addon = 2
	},
}

local outfits = {'shaman'}

local messageCache = {}

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local messageLower = message:lower()
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
			if player:getMoney() + player:getBankBalance() < requiredAddonCache.cost then
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

npcHandler:setMessage(MESSAGE_GREET, "Hello |PLAYERNAME|! Say {shaman} to find out what I have for sale. Or say whether you want {first shaman addon} or {second shaman addon}.")
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
