local internalNpcName = "Broflovski"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 328,
	lookHead = 95,
	lookBody = 114,
	lookLegs = 98,
	lookFeet = 97,
	lookAddons = 0,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Mantenha seu dinheiro seguro, deposite-o aqui!", yell = false },
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
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	-- Parse bank
	npc:parseBank(message, npc, player, npcHandler)

	-- Parse guild bank
	npc:parseGuildBank(message, npc, player, player:getId(), npcHandler)

	-- Normal messages
	npc:parseBankMessages(message, npc, player, npcHandler)

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|, o que voce deseja hoje? {depositar}, {sacar}, ver o {saldo} ou {transferir} seu dinheiro ?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Tenha um otimo dia")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Tenha um... Bom dia.")
npcHandler:setCallback(CALLBACK_GREET, NpcBankGreetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
