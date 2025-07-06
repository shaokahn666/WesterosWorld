local internalNpcName = "Duvidas"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 266,
	lookHead = 0,
	lookBody = 78,
	lookLegs = 0,
	lookFeet = 114,
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

local messageCache = {}

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local messageLower = message:lower()
	local playerGuid = player:getGuid()

	if messageLower == "lugares de caca" then
		npcHandler:say("Voc� pode utilzar o comando /ir, para explorar os lugares de ca�a do seu level ou se prefir as cidades iniciais est�o repletas de respawns para levels baixos, basta explorar em volta da cidade que voc� achar� os respawns sem maiores problemas.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "comandos" then
		npcHandler:say("Voc� pode utilizar o comando !buyhouse para compra de casas, o comando !sellhouse para vender sua casa, o comando !leavehouse para abandonar sua casa, o comando !uptime para ver o tempo do servidor online, o comando !mortes para ver suas mortes e de outro jogadores, o comando /ir para se teletraportar at� hunts e cidades, o comando !stats para obter algumas informa��es sobre seu personagem, o comando !tradevip para vender vip para outros jogadores, o comando !coins para vender coins para outros jogadores e o comando !redskull para remover seu redskul.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "npcs" then
		npcHandler:say("Npc de venda e compra de itens pode ser encontrado em dunedain, edoras, bellfallas e minas, npc de food proximo a saida de edoras ao oeste, npc de blank rune em forod enfrente ao depot e npcs de addons est�o espalhados pelo mapa.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "sistemas" then
		npcHandler:say("Nosso servidor conta com diversos sistemas exclusivos, para mais informa��es acesse: www.oldrevolution.com/?view=sistemas.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "frags" then
		npcHandler:say("Voc� tem direito a matar injustamente 5 jogadores por dia, voc� pode ver na skull bar (ao lado do quest log) seus frags, basta passar o mouse encima de cada barrinha, a 1� � os frags diarios, a 2� frags semanais e a 3� frags mensais.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "bless" then
		npcHandler:say("Voc� pode comprar sua bless em cormaya, para ir at� l� fale /ir cormaya e v� at� o npc Blessing.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "aol" then
		npcHandler:say("Voc� pode comprar seu aol em edoras no depot inferior, ou em minas na parte superior ao oeste da cidade.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "montaria" then
		npcHandler:say("Para adiquirir uma montaria voc� pode utilizar a store ou dropar o item necessario de cada monstro e usar no mesmo, voc� pode conferir tudo em www.oldrevolution.com/?view=montarias.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "magias" then
		npcHandler:say("Para saber suas magias acesse: www.oldrevolution.com/?view=vocmagias", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "promotions" then
		npcHandler:say("Para saber sobre as promotions acesse: www.oldrevolution.com/?view=promotions", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "itens" then
		npcHandler:say("Para saber sobre os itens acesse: www.oldrevolution.com/?view=itens", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "criaturas" then
		npcHandler:say("Para saber sobe as criaturas acesse: www.oldrevolution.com/?view=criaturas", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "stamina" then
		npcHandler:say("Quando o personagem esta online sobe 1 minuto, a cada 3 minutos para qualquer ocasiao. Quando o personagem esta offline sobe 1 minuto a cada 3 minutos a stamina normal j� a bonus (verde) sobe 1 minuto a cada 10 minutos.", npc, player)
		npcHandler:resetNpc(player)

	elseif messageLower == "trainer" then
		npcHandler:say("Os treinadores ficam localizados na ciade de dunedain e minas, voc� s� pode entrar na sala caso seja level 50+, tamb�m temos os trainer offline na cama das casas, mas aten��o apenas vips podem usar o recurso de trainer offline.", npc, player)
		npcHandler:resetNpc(player)

	else
		local topic = npcHandler:getTopic(playerGuid)
		if topic and topic > 0 then
			npcHandler:say("Posso tirar algumas duvidas, sobre {lugares de caca}, {comandos}, {magias}, {promotions}, {itens}, {stamina},{criaturas}, {npcs}, {sistemas}, {frags}, {bless}, {aol}, {montarias}, {trainer}.", npc, player)
			messageCache[playerGuid] = nil
			npcHandler:setTopic(playerGuid, 0)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Ola {|PLAYERNAME|}, posso tirar algumas duvidas, sobre {lugares de caca}, {comandos}, {magias}, {promotions}, {itens}, {stamina},{criaturas}, {npcs}, {sistemas}, {frags}, {bless}, {aol}, {montarias}, {trainer}.")
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
