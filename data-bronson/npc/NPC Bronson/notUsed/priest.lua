local internalNpcName = "Priest"
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

local topicList = {
	NONE = 0,
	SOLTEIRO = 2,
	CELEBRACAO = 3,
	REMOVER = 4,
	DIVORCIO = 5
}

PEDIDO_CASAMENTO_STATUS = 1
CASADO_STATUS = 2
NOIVO_STATUS = 3

LOOK_MARRIAGE_DESCR = true
ITEM_WEDDING_RING = 3004
ITEM_ENGRAVED_WEDDING_RING = 9585

local eventDelayMarriage = {}

function Player.getMarriageDescription(thing)
	local descr = ""
	if getPlayerMarriageStatus(thing:getGuid()) == CASADO_STATUS then
		playerSpouse = getPlayerSpouse(thing:getGuid())
		if self == thing then
			descr = descr .. " You are "
		else
			descr = descr .. " " .. thing:getSubjectPronoun():titleCase() .. " " .. thing:getSubjectVerb() .. " "
		end
		descr = descr .. "married to " .. getPlayerNameByGuid(playerSpouse) .. "."
	end
	return descr
end

local function getPlayerSpouse(playerGuid)
	local resultId = db.storeQuery("SELECT `marriage_spouse` FROM `players` WHERE `id` = " .. db.escapeString(playerGuid))
	if not resultId then
		return false
	end

	local spouseGuid = Result.getNumber(resultQuery, "marriage_spouse")
	Result.free(resultId)
	return spouseGuid
end

local function getPlayerMarriageStatus(playerGuid)
	local resultId = db.storeQuery("SELECT `marriage_status` FROM `players` WHERE `id` = " .. db.escapeString(playerGuid))
	if not resultId then
		return false
	end

	local marriageStatus = Result.getNumber(resultQuery, "marriage_status")
	Result.free(resultId)
	return marriageStatus
end

function setPlayerSpouse(playerGuid, pouseGuid)
	db.query("UPDATE `players` SET `marriage_spouse` = " .. pouseGuid .. " WHERE `id` = " .. playerGuid)
end

function setPlayerMarriageStatus(playerGuid, status)
	db.query("UPDATE `players` SET `marriage_status` = " .. status .. " WHERE `id` = " .. playerGuid)
end

local function getPlayerGuidByName(playerName)
	local player = Player(playerName)
	if player then
		return player:getGuid()
	end

	local resultId = db.storeQuery("SELECT `id` FROM `players` WHERE `name` = " .. db.escapeString(playerName))
	if not resultId then
		return false
	end

	local playerGuid = Result.getNumber(resultQuery, "id")
	Result.free(resultId)
	return playerGuid
end

local function getPlayerNameByGuid(playerGuid)
	local resultId = db.storeQuery("SELECT `name` FROM `players` WHERE `id` = " .. db.escapeString(playerGuid))
	if not resultId then
		return true
	end

	local playerName = Result.getString(resultId, "name")
	Result.free(resultId)
	return playerName
end

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local messageLower = message:lower()
	local playerGuid = player:getGuid()

	if messageLower == "marriage" or messageLower == "casamento" then
		local playerStatus = getPlayerMarriageStatus(playerGuid)
		if playerStatus == CASADO_STATUS then
			npcHandler:say("Vejo que você tem um casamento feliz. O que te traz aqui? Você gostaria de se {divorciar}?", npc, player)
			npcHandler:setTopic(playerGuid, topicList.DIVORCIO)

		elseif playerStatus == PEDIDO_CASAMENTO_STATUS then
			local spouseGuid = getPlayerSpouse(playerGuid)
			if not spouseGuid then
				logger.error("[NPC Priest] error in 'not spouseGuid' and PEDIDO_CASAMENTO_STATUS (player: {})", player:getName())
				npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			local spouseName = getPlayerNameByGuid(spouseGuid)
			if not spouseName then
				setPlayerSpouse(playerGuid, -1)
				npcHandler:say("Você recebeu um pedido de casamento, mas sinto muito, seu pretendente não está mais entre nós. O que você está procurando?", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			npcHandler:say("Você já fez um pedido de casamento para {" .. spouseName .. "}. Você sempre pode remover o pedido dizendo {remover}.", npc, player)
			npcHandler:setTopic(playerGuid, topicList.REMOVER)

		elseif playerStatus == NOIVO_STATUS then
			local spouseGuid = getPlayerSpouse(playerGuid)
			if not spouseGuid then
				logger.error("[NPC Priest] error in 'not spouseGuid' and NOIVO_STATUS (player: {})", player:getName())
				npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			local spouseName = getPlayerNameByGuid(spouseGuid)
			if not spouseName then
				setPlayerSpouse(playerGuid, -1)
				npcHandler:say("Você estava noivo, mas sinto muito, sua noiva não está mais entre nós. O que você está procurando?", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			npcHandler:say("Você está noivo de {" .. spouseName .. "}. Você gostaria de realizar uma {celebração} de casamento?", npc, player)
			npcHandler:setTopic(playerGuid, topicList.CELEBRACAO)

		else
			npcHandler:say("Que boa notícia! Voce gostaria de se {casar}?", npc, player)
			npcHandler:setTopic(playerGuid, topicList.SOLTEIRO)
		end

		return true

	elseif npcHandler:getTopic(playerGuid) == topicList.SOLTEIRO then
		if messageLower == "married" or messageLower == "casar" then
			npcHandler:say("Preciso que você tenha uma aliança de casamento para que eu possa abençoá-la. Se você tiver a aliança, diga {sim}.", npc, player)
			npcHandler:setTopic(playerGuid, topicList.CASAR)
		elseif messageLower == "yes" or messageLower == "sim" then
			npcHandler:say("Qual é o {nome da pessoa} com quem você gostaria de se casar?", npc, player)
			npcHandler:setTopic(playerGuid, topicList.CASAR)

		elseif messageLower == "no" or messageLower == "não" or messageLower == "nao" then
			npcHandler:say("Que pena!", npc, player)
			npcHandler:setTopic(playerGuid, 0)
		end

		return true

	elseif npcHandler:getTopic(playerGuid) == topicList.CASAR then
		if messageLower == "yes" or messageLower == "sim" then
			npcHandler:say("Qual é o {nome da pessoa} com quem você gostaria de se casar?", npc, player)
			npcHandler:setTopic(playerGuid, topicList.CASAR)
		elseif messageLower == "no" or messageLower == "não" or messageLower == "nao" then
			npcHandler:say("Que pena!", npc, player)
			npcHandler:setTopic(playerGuid, 0)
		else
			local candidateGuid = getPlayerGuidByName(messageLower)
			if not candidateGuid then
				npcHandler:say("O nome do seu pretendente está errado, dê-me o {nome completo} por favor.", npc, player)
				npcHandler:setTopic(playerGuid, 0)
			elseif candidateGuid == playerGuid then
				npcHandler:say("Você não pode se casar consigo mesmo. Diga-me, qual é o {nome do seu amor}?", npc, player)
				npcHandler:setTopic(playerGuid, 0)
			else
				if player:getItemCount(ITEM_WEDDING_RING) == 0 or player:getItemCount(9586) == 0 then -- verifique se há itens (anel de casamento e caixa de roupa)
					npcHandler:say("Como eu disse, você precisa de uma aliança e da caixa de roupas de casamento para se casar.", npc, player)
					npcHandler:setTopic(playerGuid, 0)
				else
					local candidateName = getPlayerNameByGuid(candidateGuid)
					if not candidateName then
						logger.error("[NPC Priest] error in 'not candidateName' (name: {})", messageLower)
						npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
						npcHandler:setTopic(playerGuid, 0)
						return true
					end

					local candidateStatus = getPlayerMarriageStatus(candidateGuid)
					if not candidateStatus then
						logger.error("[NPC Priest] error in 'not candidateStatus' (name: {})", candidateName)
						npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
						npcHandler:setTopic(playerGuid, 0)
						return true
					end

					if candidateStatus == CASADO_STATUS then
						local candidateSpouseName = getPlayerSpouse(candidateGuid)
						if not candidateSpouseName then
							logger.error("[NPC Priest] error in 'not candidateSpouseName' (name: {})", candidateName)
							npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
							npcHandler:setTopic(playerGuid, 0)
							return true
						end

						npcHandler:say("{" .. candidateName .. "} é casado com {" .. candidateSpouseName .. "}. Você não pode casar-se com alguém que já é casada.", npc, player)
						npcHandler:setTopic(playerGuid, 0)

					elseif candidateStatus == NOIVO_STATUS then
						local candidateSpouseName = getPlayerSpouse(candidateGuid)
						if not candidateSpouseName then
							logger.error("[NPC Priest] error in 'not candidateSpouseName' (name: {})", candidateName)
							npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
							npcHandler:setTopic(playerGuid, 0)
							return true
						end

						npcHandler:say("{" .. candidateName .. "} tem um pedido de casamento de {" .. candidateSpouseName .. "}. Eles vão se casar em breve.", npc, player)
						npcHandler:setTopic(playerGuid, 0)

					elseif candidateStatus == PEDIDO_CASAMENTO_STATUS then
						local candidateSpouseName = getPlayerSpouse(candidateGuid)
						if candidateSpouseName == player:getName() then -- se esse alguém é você.
							local spouse = Player(candidateGuid)
							if not spouse then
								npcHandler:say("Seu pretendente deve estar aqui com você!", npc, player)
								npcHandler:setTopic(playerGuid, 0)
								return true
							end

							npcHandler:say("Como vocês dois estão dispostos a se casar, concordo em comemorar seu casamento, vista-se e me avise quando estiver pronto para a {celebração}.", npc, player)
							player:removeItem(ITEM_WEDDING_RING, 1)
							player:removeItem(9586, 1) -- wedding outfit box
							player:addOutfit(329) -- Wife
							player:addOutfit(328) -- Husb
							setPlayerMarriageStatus(playerGuid, NOIVO_STATUS)
							setPlayerMarriageStatus(candidateGuid, NOIVO_STATUS)
							setPlayerSpouse(playerGuid, candidateGuid)
							spouse:addOutfit(329)
							spouse:addOutfit(328)
							npcHandler:setTopic(playerGuid, 0)
						else -- se esse alguém não for você
							npcHandler:say("{" .. candidateName .. "} já fez um pedido de casamento a {" .. candidateSpouseName .. "}.", npc, player)
							npcHandler:setTopic(playerGuid, 0)
						end
					else -- se o jogador que quero propor não tiver outra proposta
						npcHandler:say("Ok, agora vamos esperar que {" .. candidateName .. "} venha falar comigo aceitando o seu pedido de casamento. \z
							Se você se arrepender de alguma forma deste pedido de casamento, podemos {cancelar}.", npc, player)
						player:removeItem(ITEM_WEDDING_RING, 1)
						player:removeItem(9586, 1)
						setMarriageStatus(playerGuid, PEDIDO_CASAMENTO_STATUS)
						setPlayerSpouse(playerGuid, candidateGuid)
					end
				end
			end
		end

		return true

	elseif msgcontains(messageLower, "celebration") or msgcontains(messageLower, "celebracao") or msgcontains(messageLower, "celebração") then
		npcHandler:say("Sua alma gêmea e amigos estão aqui com você para comemorar? Diga {sim} ou {não}.", npc, player)
		npcHandler:setTopic(playerGuid, topicList.CELEBRACAO)
		return true

	elseif npcHandler:getTopic(playerGuid) == topicList.CELEBRACAO then

		if msgcontains(messageLower, "no") or msgcontains(messageLower, "nao") or msgcontains(messageLower, "não") then
			npcHandler:say("Está tudo bem. Como posso ajudá-lo?", npc, player)
			npcHandler:setTopic(playerGuid, 0)

		elseif msgcontains(messageLower, "yes") or msgcontains(messageLower, "sim") then
			if playerStatus == NOIVO_STATUS then
				local itemType = ItemType(ITEM_ENGRAVED_WEDDING_RING)
				local ringsWeight = itemType:getWeight() * 2

				local playerCap = player:getFreeCapacity()
				if playerCap < ringsWeight then
					npcHandler:say("Você precisa de " .. (ringsWeight / 100) .. "oz para receber os anéis. Depois que tiver a capacidade necessária, diga {celebração} novamente.", npc, player)
					npcHandler:setTopic(playerGuid, 0)
					return true
				end

				local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
				if not backpack or backpack:getEmptySlots(false) < 2 then
					npcHandler:say("Sua backpack está cheia. Você precisa liberar 2 slots para receber as alianças. Depois que liberar os slots, diga {celebração} novamente.", npc, player)
					return true
				end

				local candidateName = getPlayerSpouse(playerGuid)
				if not candidateName then
					logger.error("[NPC Priest] error in 'not candidateName' (player: {})", player:getName())
					npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
					npcHandler:setTopic(playerGuid, 0)
					return true
				end

				local candidateGuid = getPlayerGuidByName(candidateName)
				if not candidateGuid then
					npcHandler:say("Seu amor não esta aqui, aguarde ela chegar!", npc, player)
					npcHandler:setTopic(playerGuid, 0)
					return true
				end

				local spouse = Player(candidateGuid)
				if not spouse then
					npcHandler:say("Seu amor não esta aqui, aguarde ela chegar!", npc, player)
					npcHandler:setTopic(playerGuid, 0)
					return true
				end

				setPlayerMarriageStatus(playerGuid, STATUS_CASADO)
				setPlayerMarriageStatus(candidateGuid, STATUS_CASADO)
				setPlayerSpouse(playerGuid, candidateGuid)
				setPlayerSpouse(candidateGuid, playerGuid)

			--npc:sayWithDelay(npc:getId(), "...", TALKTYPE_MONSTER_YELL, 3000, eventDelayMarriage, player)
			--npc:sayWithDelay(npc:getId(), "How can I help you? I can make your wedding, or if you are looking to confess this is not the right time.", TALKTYPE_PRIVATE_NP, 6000, eventDelayMarriage, player)
				--doCreatureSayWithDelay(getNpcCid(), "Dear friends and family, we are gathered here today to witness and celebrate the union of " .. candidateName .. " and " .. player:getName() .. " in marriage.", TALKTYPE_SAY, 1000, tableNpc, npc, player)
				--doCreatureSayWithDelay(getNpcCid(), "Through their time together, they realized that their personal dreams, hopes and goals are more attainable and more meaningful through the combined effort and mutual support provided in love, commitment and family.", TALKTYPE_SAY, 5000, tableNpc, npc, player)
				--doCreatureSayWithDelay(getNpcCid(), "And so they decided to live together as husband and wife. And now, by the power vested in me by the Gods of Tibia, I now pronounce you man and wife.", TALKTYPE_SAY, 11000, tableNpc, npc, player)
				--doCreatureSayWithDelay(getNpcCid(), "*After a whispered blessing, open your hand to " .. player:getName() .. "* Take these two engraved wedding rings and give one of them to your spouse.", TALKTYPE_SAY, 17000, tableNpc, npc, player)
				--doCreatureSayWithDelay(getNpcCid(), "Now you can kiss your bride.", TALKTYPE_SAY, 23000, tableNpc, npc, player)

				local ring1 = Game.createItem(ITEM_ENGRAVED_WEDDING_RING)
				local ring2 = Game.createItem(ITEM_ENGRAVED_WEDDING_RING)

				ring1:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, player:getName() .. " & " .. candidateName .. " para sempre - casados em " .. os.date("%B %d, %Y."))
				ring2:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, candidateName .. " & " .. player:getName() .. " para sempre - casados em " .. os.date("%B %d, %Y."))

				player:addItemEx(ring1)
				player:addItemEx(ring2)
				npcHandler:setTopic(playerGuid, 0)
			else
				npcHandler:say("Seu parceiro ainda não aceitou seu pedido de casamento. Peça a ele que venha me ver e aceite seu pedido de casamento.", npc, player)
				npcHandler:setTopic(playerGuid, 0)
			end
		end

		return true

	elseif npcHandler:getTopic(playerGuid) == topicList.REMOVER then
		if playerStatus == PEDIDO_CASAMENTO_STATUS then
			local spouseGuid = getPlayerSpouse(playerGuid)
			if not spouseGuid then
				logger.error("[NPC Priest] error in 'not spouseGuid' and PEDIDO_CASAMENTO_STATUS (player: {})", player:getName())
				npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			local spouseName = getPlayerNameByGuid(spouseGuid)
			if not spouseName then
				setPlayerSpouse(playerGuid, -1)
				npcHandler:say("Você estava noivo, mas sinto muito, sua noiva não está mais entre nós. O que você está procurando?", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			if msgcontains(messageLower, "cancel") or msgcontains(messageLower, "cancelar") then
				npcHandler:say("Tem certeza de que deseja cancelar seu pedido de casamento com {" .. spouseName .. "}? {Sim}?", npc, player)
				npcHandler:setTopic(playerGuid, topicList.REMOVER)

			elseif msgcontains(messageLower, "no") or msgcontains(messageLower, "nao") or msgcontains(messageLower, "não") then
				npcHandler:say("OK. Seu destino pertence a Deus. Vocês serão felizes juntos.", npc, player)
				npcHandler:setTopic(playerGuid, 0)

			elseif msgcontains(messageLower, "yes") or msgcontains(messageLower, "sim") then
				local ringItemType = ItemType(ITEM_WEDDING_RING)
				local itemWeight = ringItemType:getWeight()
				local playerCap = player:getFreeCapacity()
				if playerCap < itemWeight then
					npcHandler:say("Você precisa " .. (itemWeight / 100) .. "oz para recuperar sua aliança de casamento. Se você já tiver capacidade, diga {cancelar} novamente.", npc, player)
					npcHandler:setTopic(playerGuid, 0)
					return true
				end

				local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
				if not backpack or backpack:getEmptySlots(false) < 1 then
					npcHandler:say("Sua mochila está cheia. Você precisa liberar 1 espaço para recuperar sua aliança de casamento. Se você já tiver capacidade, diga {cancelar} novamente.", npc, player)
					npcHandler:setTopic(playerGuid, 0)
					return true
				end

				npcHandler:say("Ok, seu pedido de casamento para {" .. spouseName .. "} foi cancelado. Pegue sua aliança de casamento de volta.", npc, player)
				player:addItem(ITEM_WEDDING_RING, 1)
				setMarriageStatus(playerGuid, 0)
				setPlayerSpouse(playerGuid, -1)
				npcHandler:setTopic(playerGuid, 0)
			end
		else
			npcHandler:say("Você não tem nenhum pedido de casamento pendente para ser removido.", npc, player)
			npcHandler:setTopic(playerGuid, 0)
		end

		return true

	elseif npcHandler:getTopic(playerGuid) == topicList.DIVORCIO then
		if playerStatus == STATUS_CASADO then
			local spouseGuid = getPlayerSpouse(playerGuid)
			if not spouseGuid then
				logger.error("[NPC Priest] error in 'not spouseGuid' and PEDIDO_CASAMENTO_STATUS (player: {})", player:getName())
				npcHandler:say("Ocorreu um erro, entre em contato com seu administrador.", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			local spouseName = getPlayerNameByGuid(spouseGuid)
			if not spouseName then
				setPlayerSpouse(playerGuid, -1)
				npcHandler:say("Você estava casado, mas sinto muito, sua esposa não está mais entre nós. O que você está procurando?", npc, player)
				npcHandler:setTopic(playerGuid, 0)
				return true
			end

			if msgcontains(messageLower, "divorced") or msgcontains(messageLower, "divorcio") or msgcontains(messageLower, "divorciar") then
				npcHandler:say("Você e {" .. spouseName .. "} pareciam um casal perfeito.", npc, player)
				npcHandler:say("Tem certeza de que deseja se divorciar? Diga {sim} e os poderes que me são atribuídos desfaço esse vínculo que deveria durar para sempre.", npc, player)
				npcHandler:setTopic(playerGuid, topicList.DIVORCIO)

			elseif msgcontains(messageLower, "no") or msgcontains(messageLower, "nao") or msgcontains(messageLower, "não") then
				npcHandler:say("Ótimo! O casamento deve ser um compromisso eterno.", npc, player)
				npcHandler:setTopic(playerGuid, 0)

			elseif msgcontains(messageLower, "yes") or msgcontains(messageLower, "sim") then
				npcHandler:say("De hoje em diante, declaro você e {" .. spouseName .. "} separados. Deus tem um propósito na vida de todos os seus filhos, incluindo os seus. Amém!?", npc, player)
				setMarriageStatus(playerGuid, 0)
				setPlayerSpouse(playerGuid, -1)
				setMarriageStatus(spouseGuid, 0)
				setPlayerSpouse(spouseGuid, -1)
				npcHandler:setTopic(playerGuid, 0)
			end
		else
			npcHandler:say("Você não é casado para se divorciar.", npc, player)
			npcHandler:setTopic(playerGuid, 0)
		end

		return true

	elseif msgcontains(messageLower, "blessing") or msgcontains(messageLower, "benção") or msgcontains(messageLower, "benções") then
		npcHandler:say("Deus o abençoe!", npc, player)
		return true

	else
		local topic = npcHandler:getTopic(playerGuid)
		if topic and topic > 0 then
			npcHandler:say("Deus o abençoe!", npc, player)
			npcHandler:setTopic(playerGuid, 0)
			npcHandler:resetNpc(player)
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Bem-vindo em nome dos deuses, peregrino |PLAYERNAME|!")
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
