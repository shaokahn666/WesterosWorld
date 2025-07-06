local internalNpcName = "Scarab Cow"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 79,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 3000,
	chance = 50,
	{ text = "Muuuuuh...", yell = false },
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

local function creatureSayCallback(npc, player, type, message)
	local playerId = player:getId()
	local creature = player
	
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	if MsgContains(message, "Moooh-muuuh")then
		if player:getLevel() >= 50 then
			if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 2 then
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.QuestLine) == -1 then
					npcHandler:say({"Moooh, muuh-mooow... muuh, mouhhhh... {muuouh}?",}, npc, creature)		
					npcHandler:setTopic(playerId, 2)
				end
			else
				npcHandler:say("Mooooh.", npc, creature)
				npcHandler:setTopic(playerId, 0)
			end	
		else
			npcHandler:say("Mooooh.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
		
	elseif MsgContains(message, "muuouh") then
		if npcHandler:getTopic(playerId) == 2 then
			if player:getLevel() >= 50 and player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic) == 2 then
				npcHandler:say("Moooh.. muuuh.. moooh.", npc, creature)
				if player:getStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ScarabCow) < os.time() then
					player:setStorageValue(Storage.Quest.U01_24.TheAlchemistQuest.ScarabCow, os.time() + 72000)
					player:addItem(169,1)
					npcHandler:setTopic(playerId, 0)
				else
					npcHandler:say("Muooh.. mouh.. mouh. (i don't have a cheese now, it will be avaliable in 24 hours.)", npc, creature)
				end
			else
				npcHandler:say("Mooooh.", npc, creature)
			end
		end

	elseif MsgContains(message, "no") then
		if npcHandler:getTopic(playerId) > 0 then
			npcHandler:say("Mooooh.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Mooohh... {Moooh-muuuh}")
npcHandler:setMessage(MESSAGE_FAREWELL, "Moouhhh!!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "MUUUUUUH!")
npcHandler:setCallback(CALLBACK_GREET, NpcBankGreetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

--npcType registering the npcConfig table
npcType:register(npcConfig)
