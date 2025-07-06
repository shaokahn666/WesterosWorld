local internalNpcName = "The First Knight"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 0

npcConfig.outfit = {
	lookType = 1593,
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

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()
	local level = player:getLevel()
	local playervoc = player:getVocation():getId()
	vocationSet = {4, 8, 9, 10}
	vocationName = {"Knight", "Elite Knight", "Templar Knight", "Chaos Knight"}
	vocationCost = {0, 10000, 30000, 200000}
	
	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if npcHandler:getTopic(playerId) == 0 then
		if MsgContains(message, "promover") or MsgContains(message, "promotion") then
			if playervoc == vocationSet[1] or playervoc == vocationSet[2] or playervoc == vocationSet[3] or playervoc == vocationSet[4] then
				if level >= 34 then
					if level >= 35 and playervoc == vocationSet[1] then
						npcHandler:say("Voce deseja receber a proxima promocao disponivel, |PLAYERNAME|? Custara 10.000 gps", npc, creature)
						vocdst = 2
						npcHandler:setTopic(playerId, 1)

					elseif level >= 101 and playervoc == vocationSet[2]  then
						npcHandler:say("Voce deseja receber a proxima promocao disponivel, |PLAYERNAME|?  Custara 30.000 gps", npc, creature)
						vocdst = 3	
						npcHandler:setTopic(playerId, 1)				

					elseif level >= 200 and playervoc == vocationSet[3]  then
						npcHandler:say("Voce deseja receber a proxima promocao disponivel, |PLAYERNAME|? Custara 200.000 gps", npc, creature)
						vocdst = 4
						npcHandler:setTopic(playerId, 1)

					else
						if playervoc == vocationSet[4] then
							npcHandler:say("Voce ja e um mestre em sua vocacao, |PLAYERNAME|! Nao ha promocoes para voce!", npc, creature)
							return false
						else
							npcHandler:say("Voce ainda nao esta pronto para a proxima promocao, |PLAYERNAME|!", npc, creature)
							npcHandler:resetNpc(creature)
							return false
						end
												
					end
				else
					npcHandler:say("Voce e fraco |PLAYERNAME|! Volte quando adquirir mais experiencia como um guerreiro!", npc, creature)
					npcHandler:resetNpc(creature)
					return false
				end	
			else
				npcHandler:say("Voce nao pertence a classe digna para que eu lhe promova, |PLAYERNAME|!", npc, creature)
				npcHandler:resetNpc(creature)
				return false
			end
		end
	end
	
	if npcHandler:getTopic(playerId) == 1 then
		if MsgContains(message, "yes") or MsgContains(message, "sim") then
			if player:getMoney() + player:getBankBalance() >= vocationCost[vocdst] then
			player:removeMoneyBank(vocationCost[vocdst])		
			player:setVocation(Vocation(vocationSet[vocdst]))
			npcHandler:say("Parabens! Voce foi promovido a " .. vocationName[vocdst] .."! desfrute de sua nova promocao!", npc, creature)
			npcHandler:resetNpc(creature)
			npcHandler:setTopic(playerId, 2)
			else
				npcHandler:say("Voce nao possui a quantia necessaria, volte quando nao estiver pobre.", npc, creature)
			end

		end
		if MsgContains(message, "no") or MsgContains(message, "nao") then
			player:setVocation(Vocation(vocdst))
			npcHandler:say("Volte quando estiver buscando uma promocao, |PLAYERNAME|", npc, creature)
			npcHandler:setTopic(playerId, 2)
			npcHandler:resetNpc(creature)
		end		
	end	
	
	
end

local function onAddFocus(npc, player)
	local playerId = player:getId()
end

local function onReleaseFocus(npc, player)
	local playerId = player:getId()
end

npcHandler:setCallback(CALLBACK_SET_INTERACTION, onAddFocus)
npcHandler:setCallback(CALLBACK_REMOVE_INTERACTION, onReleaseFocus)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)

npcHandler:setMessage(MESSAGE_GREET, "Ola grande aventureiro!, |PLAYERNAME|. Estou aqui para lhe oferecer sua proxima promocao.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Adeus, aventureiro. Estarei aqui para a sua proxima promocao!")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Volte e se despeca como um bom knight faria")
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)