local internalNpcName = "A Merchant Cyclops"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 22,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Hum hum, huhum" },
	{ text = "Silly lil' human" },
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

local TOPICS = {
	KOSHEI_ANCIENT_AMULET = 1,
	PIECE_OF_ROYAL_STEEL = 2,
	PIECE_OF_DRACONIAN_STEEL = 3,
	PIECE_OF_HELL_STEEL = 4,
	HUGE_CHUNK_OF_CRUDE_IRON = 5,
	INFERNAL_BOLT = 6,
	CUP_OF_MOLTEN_GOLD = 7,
	ENCHANTED_CHICKEN_WING = 8,
	WARRIOR_SWEAT = 9,
	FIGHTING_SPIRIT = 10,
	MAGIC_SULPHUR = 11,
	SPOOL_OF_YARN = 12,
	BLESSED_WOODEN_STAKE = 13,
	OBSIDIAN_KNIFE = 14,
}

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local playerId = player:getId()
	local messageLower = message:lower()

	if MsgContains(messageLower, "yes") then
		if npcHandler:getTopic(playerId) == TOPICS.KOSHEI_ANCIENT_AMULET then
			if player:getItemCount(7528) > 0 and player:getItemCount(7529) > 0 and player:getItemCount(7530) > 0 and player:getItemCount(7531) > 0 and (player:getMoney() + player:getBankBalance()) >= 5000 then
				player:removeItem(7528, 1)
				player:removeItem(7529, 1)
				player:removeItem(7530, 1)
				player:removeItem(7531, 1)
				player:removeMoneyBank(5000)
				--player:setStorageValue(Storage.SweetyCyclops.AmuletTimer, os.time())
				player:kv():set("sweety-cyclops-amulet", 1)
				npcHandler:say("Well, well, I do that! Big Ben makes lil' amulet unbroken with big hammer in big hands! No worry! Come back after sun hits the horizon 24 times and ask me for amulet.", npc, creature)
			end
	
		elseif npcHandler:getTopic(playerId) == TOPICS.PIECE_OF_ROYAL_STEEL then -- Crown Armor
			if player:removeItem(3381, 1) then
				npcHandler:say("Cling clang!", npc, player)
				player:addItem(5887, 1)
			else
				npcHandler:say("You don't have a crown armor!", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.PIECE_OF_DRACONIAN_STEEL then -- Dragon Shield
			if player:removeItem(3416, 1) then
				npcHandler:say("Cling clang!", npc, player)
				player:addItem(5889, 1)
			else
				npcHandler:say("You don't have a dragon shield!", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.PIECE_OF_HELL_STEEL then -- Devil Helmet
			if player:removeItem(3356, 1) then
				npcHandler:say("Cling clang!", npc, player)
				player:addItem(5888, 1)
			else
				npcHandler:say("You don't have a devil helmet!", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.HUGE_CHUNK_OF_CRUDE_IRON then -- Giant Sword
			if player:removeItem(3281, 1) then
				npcHandler:say("Cling clang!", npc, player)
				player:addItem(5892, 1)
			else
				npcHandler:say("You don't have a giant sword!", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.INFERNAL_BOLT then -- Soul Orb
			if player:getItemCount(5944) > 0 then
				local count = player:getItemCount(5944)
				for i = 1, count do
					if math.random(100) <= 1 then
						player:addItem(6528, 6)
						player:removeItem(5944, 1)
					else
						player:addItem(6528, 3)
						player:removeItem(5944, 1)
					end
				end
				npcHandler:say("Cling clang!", npc, player)
			else
				npcHandler:say("You don't have soul orbs!", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.CUP_OF_MOLTEN_GOLD then -- Gold Ingot
			if player:removeItem(9058, 1) then
				npcHandler:say("whoooosh There!", npc, player)
				player:addItem(12804, 1)
			else
				npcHandler:say("You don't have gold ingot with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.ENCHANTED_CHICKEN_WING then -- Boots of Haste
			if player:removeItem(3079, 1) then
				npcHandler:say("Cling clang!", npc, player)
				player:addItem(5891, 1)
			else
				npcHandler:say("You don't have boots of haste with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.WARRIOR_SWEAT then -- Warrior Helmet
			if player:getItemCount(3369) >= 4 then
				if player:removeItem(3369, 4) then
					npcHandler:say("Cling clang!", npc, player)
					player:addItem(5885, 1)
				else
					npcHandler:say("You don't have 4 warrior helmets with you.", npc, player)
				end
			else
				npcHandler:say("You don't have 4 warrior helmets with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.FIGHTING_SPIRIT then -- Royal Helmet
			if player:getItemCount(3392) >= 2 then
				if player:removeItem(3392, 2) then
					npcHandler:say("Cling clang!", npc, player)
					player:addItem(5884, 1)
				else
					npcHandler:say("You don't have 2 royal helmets with you.", npc, player)
				end
			else
				npcHandler:say("You don't have 2 royal helmets with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.MAGIC_SULPHUR then -- Fire Sword
			if player:getItemCount(3280) >= 3 then
				if player:removeItem(3280, 3) then
					npcHandler:say("Cling clang!", npc, player)
					player:addItem(5904, 1)
				else
					npcHandler:say("You don't have 3 fire swords with you.", npc, player)
				end
			else
				npcHandler:say("You don't have 3 fire swords with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.SPOOL_OF_YARN then -- Spider Silk
			if player:getItemCount(5879) >= 10 then
				if player:removeItem(5879, 10) then
					npcHandler:say("Cling clang!", npc, player)
					player:addItem(5886, 1)
				else
					npcHandler:say("You don't have 10 spider silks with you.", npc, player)
				end
			else
				npcHandler:say("You don't have 10 spider silks with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.BLESSED_WOODEN_STAKE then -- Wooden Stake
			if player:getItemCount(5941) >= 1 and player:getTotalMoney() >= 5000 then
				if player:removeItem(5941, 1) and player:removeMoneyBank(5000) then
					npcHandler:say("Cling clang!", npc, player)
					player:addItem(5942, 1)
					player:addAchievement("Blessed!")
				else
					npcHandler:say("You don't have the wooden stake and 5000 gold coins with you.", npc, player)
				end
			else
				npcHandler:say("You don't have the wooden stake and 5000 gold coins with you.", npc, player)
			end

		elseif npcHandler:getTopic(playerId) == TOPICS.OBSIDIAN_KNIFE then -- Obsidian Lance
			if player:getItemCount(5889) >= 1 and player:getItemCount(3313) >= 1 then
				if player:removeItem(5889, 1) and player:removeItem(3313, 1) then
					npcHandler:say("Cling clang!", npc, player)
					player:addItem(5908, 1)
				else
					npcHandler:say("You don't have an obsidian lance and a piece of draconian steel with you.", npc, player)
				end
			else
				npcHandler:say("You don't have an obsidian lance and a piece of draconian steel with you.", npc, player)
			end

		end

		npcHandler:setTopic(playerId, 0)
	----------------------------------------------------------------------------------------------------------------------------------------------

	elseif table.contains({ "amulet", "koshei ancient amulet", "ancient", "koshei" }, messageLower) then
		local AmuletStatus = player:kv():get("sweety-cyclops-amulet") or 0
		if AmuletStatus < 1 then
			npcHandler:say("Me can do unbroken but Big Ben want gold 5000 and Big Ben need a lil' time to make it unbroken. Yes or no??", npc, player)
			npcHandler:setTopic(playerId, TOPICS.KOSHEI_ANCIENT_AMULET)
		elseif AmuletStatus == 1 then
			npcHandler:say("Ahh, lil' one wants amulet. Here! Have it! Mighty, mighty amulet lil' one has. Don't know what but mighty, mighty it is!!!", npc, player)
			player:addItem(7532, 1)
			player:kv():remove("sweety-cyclops-amulet")
			npcHandler:setTopic(playerId, 0)
		end

	elseif table.contains({ "uth'kean", "crown armor", "royal", "piece of royal steel" }, messageLower) then
		npcHandler:say("Very noble. Shiny. Me like. But breaks so fast. Me can make from shiny armour. Lil' one want to trade?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.PIECE_OF_ROYAL_STEEL)

	elseif table.contains({ "uth'lokr", "dragon shield", "draconian", "piece of draconian steel" }, messageLower) then
		npcHandler:say("Firy steel it is. Need green ones' breath to melt. Or red even better. Me can make from shield. Lil' one want to trade?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.PIECE_OF_DRACONIAN_STEEL)

	elseif table.contains({ "za'ralator", "devil helmet", "hell", "piece of hell steel" }, messageLower) then
		npcHandler:say("Hellsteel is. Cursed and evil. Dangerous to work with. Me can make from evil helmet. Lil' one want to trade?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.PIECE_OF_HELL_STEEL)

	elseif table.contains({ "uth'prta", "giant sword", "crude", "iron", "huge chunk of crude iron" }, messageLower) then
		npcHandler:say("Good iron is. Me friends use it much for fight. Me can make from weapon. Lil' one want to trade?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.HUGE_CHUNK_OF_CRUDE_IRON)

	elseif table.contains({ "soul orb", "infernal bolt", "infernal", "soul" }, messageLower) then
		npcHandler:say("Uh. Me can make some nasty lil' bolt from soul orbs. Lil' one want to trade all?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.INFERNAL_BOLT)

	elseif table.contains({ "melt", "gold ingot", "ingot"}, messageLower) then
		npcHandler:say("Can melt gold ingot for lil' one. You want?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.CUP_OF_MOLTEN_GOLD)

	elseif table.contains({ "enchanted chicken wing", "chicken", "wing", "boots of haste" }, messageLower) then
		npcHandler:say("Do you want to trade Boots of Haste for Enchanted Chicken Wing?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.ENCHANTED_CHICKEN_WING)

	elseif table.contains({ "warrior sweat", "flask of warrior's sweat", "warrior", "warrior helmet" }, messageLower) then
		npcHandler:say("Do you want to trade 4 Warrior Helmet for Warrior Sweat?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.WARRIOR_SWEAT)

	elseif table.contains({ "fighting spirit", "spirit container", "spirit", "royal helmet" }, messageLower) then
		npcHandler:say("Do you want to trade 2 Royal Helmet for Fighting Spirit?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.FIGHTING_SPIRIT)

	elseif table.contains({ "magic sulphur", "magic", "sulphur", "fire sword" }, messageLower) then
		npcHandler:say("Do you want to trade 3 Fire Sword for Magic Sulphur?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.MAGIC_SULPHUR)

	elseif table.contains({ "silk", "yarn", "silk yarn", "spool of yarn", "giant spider silk", "spider silk" }, messageLower) then
		npcHandler:say("Do you want to trade 10 Spider Silk for Spool of Yarn?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.SPOOL_OF_YARN)

	elseif table.contains({ "blessed wooden stake", "wooden stake", "wooden", "stake" }, messageLower) then
		npcHandler:say("Do you want to trade Wooden Stake and 5000 gold coins for Blessed Wooden Stake?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.BLESSED_WOODEN_STAKE)

	elseif table.contains({ "obsidian lance", "obsidian knife", "knife" }, messageLower) then
		npcHandler:say("Do you want to trade Obsidian Lance and Piece of Draconian Steel for Obsidian Knife?", npc, player)
		npcHandler:setTopic(playerId, TOPICS.OBSIDIAN_KNIFE)

	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_GREET, "Hum Humm! Welcume lil' |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye lil' one.")

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
