local internalNpcName = "War Private"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 146,
	lookHead = 19,
	lookBody = 19,
	lookLegs = 9,
	lookFeet = 58,
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

local function getWarCityNamesString()
	local namesConcat = ""
	local citys = _G.WAR_PRIVATE.citysById
	for i = 1, #citys do
		if i == 1 then
			namesConcat = citys[1].name
		elseif i > 1 and i ~= #citys then
			namesConcat = namesConcat .. ", ".. citys[i].name
		elseif i > 1 and i == #citys then
			namesConcat = namesConcat .. " or ".. citys[i].name
		end
	end
	return namesConcat ~= "" and namesConcat or ""
end

local function checkCityName(message)
	local messageLower = message:lower()
	for id, city in pairs(_G.WAR_PRIVATE.citysById) do
		if city.name:lower() == messageLower then
			return id
		end
	end
	return false
end

local function warPrivate_finishInviteTime()
	db.asyncQuery("DELETE FROM `guild_wars` WHERE `status` = 0 AND `invite_time` != 0 AND `invite_time` < " .. os.time())
end

local function getEnemyGuildId(enemyGuildName)
	local resultId = db.storeQuery("SELECT `id` FROM `guilds` WHERE `name` = " .. db.escapeString(enemyGuildName))
	if not resultId then
		return false
	end

	local enemyGuildId = Result.getNumber(resultId, "id")
	Result.free(resultId)
	return enemyGuildId
end

local function getEnemyGuildName(enemyGuildId)
	local resultId = db.storeQuery("SELECT `name` FROM `guilds` WHERE `id` = " .. enemyGuildId)
	if not resultId then
		logger.warn("[WAR PRIVATE] function getEnemyGuildName error: resultId not found (enemy id: {}).", enemyGuildId)
		return false
	end

	local enemyGuildName = Result.getString(resultId, "name")
	Result.free(resultId)
	return enemyGuildName
end

local function validIpsGuild(guild_id)
	local guild = Guild(guild_id)
	if not guild then
		return false
	end

	local validIpsTable = {}
	local membersTotal = 0
	for _, member in ipairs(guild:getMembersOnline()) do
		if member and member:getLevel() > _G.WAR_PRIVATE.levelMinimoCitywar then
			local ip = member:getIp()
			if ip > 0 and not validIpsTable[ip] then
				validIpsTable[ip] = true
				membersTotal = membersTotal + 1
			end
		end
	end

	return membersTotal
end

local function mensagemParaGuild(guild_id, message)
	local guild = Guild(guild_id)
	if not guild then
		logger.warn("[WAR PRIVATE] function mensagemParaGuild error: guild not found (guild id: {}).", guild_id)
		return false
	end

	for _, member in ipairs(guild:getMembersOnline()) do
		member:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
	end
end

local function capitalizeFirstLetter(str)
	return str:gsub("(%a)([%w_']*)", function(first, rest)
		return first:upper()..rest:lower()
	end)
end

local function creatureSayCallback(npc, player, type, message)
	if not player or not npcHandler:checkInteraction(npc, player) then
		return false
	end

	local guild = player:getGuild()
	if not guild then
		npcHandler:say("You need to be in a guild to invite or accept a war in a war private.", npc, player)
		-- Voce precisa estar em uma guild para invitar ou aceitar um convite de guerra em um local privado.
		npcHandler:resetNpc(player)
		return false
	end

	local guildId = guild:getId()
	if not guildId then
		npcHandler:say("You need to be in a guild to invite or accept a war in a war private.", npc, player)
		-- Voce precisa estar em uma guild para invitar ou aceitar um convite de guerra em um local privado.
		npcHandler:resetNpc(player)
		return false
	end

	if guildId == 0 then
		npcHandler:say("You need to be in a guild to invite or accept a war in a war private.", npc, player)
		-- Voce precisa estar em uma guild para invitar ou aceitar um convite de guerra em um local privado.
		npcHandler:resetNpc(player)
		return false
	end

	if player:getLevel() < _G.WAR_PRIVATE.levelMinimoCitywar then
		npcHandler:say("You need to have the minimum level of " .. _G.WAR_PRIVATE.levelMinimoCitywar .. " to invite or accept a war invitation in a war private.", npc, player)
		-- Voce precisa ter o level minimo de " .. _G.WAR_PRIVATE.levelMinimoCitywar .. " para invitar ou aceitar um convite de guerra em um local privado.
		npcHandler:resetNpc(player)
		return false
	end

	if player:getGuildLevel() < 3 then
		npcHandler:say("You need to be a guild leader to invite or accept a war invitation in a war private.", npc, player)
		-- Voce precisa ser lider de uma guild para invitar ou aceitar um convite de guerra em um local privado.
		npcHandler:resetNpc(player)
		return false
	end

	local messageLower = message:lower()
	local playerGuid = player:getGuid()

	-- CONVITE -----------------------------------------------------------------------------------------------------------------------------------------
	if messageLower == "invite" then

		npcHandler:say("What is the name of the guild you want to invite to a war in a private location?", npc, player)
		-- Qual o nome da guild que você quer convidar para uma guerra em um local privado?"
		npcHandler:setTopic(playerGuid, 1)

		messageCache[playerGuid] = nil

	-- GUILD CONTRA -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 1 and messageLower ~= "accept" then

		local exhaustion = player:getExhaustion("npc-private-war-enemy-1")
		if exhaustion > 0 then
			npcHandler:say("You are exhausted at this stage, please wait " .. exhaustion .. " " .. (exhaustion > 1 and "seconds" or "second") .. " to try again.", npc, player)
			-- Voce esta com exaustao nesta etapa, aguarde " .. exhaustion .. " " .. (exhaustion > 1 and "segundos" or "segundo") .. " para tentar novamente.
			npcHandler:resetNpc(player)
			return false
		end

		player:setExhaustion("npc-private-war-enemy-1", 20)

		local enemyGuildId = getEnemyGuildId(messageLower)
		if not enemyGuildId then
			npcHandler:say("The guild you informed does not exist. Try again.", npc, player)
			-- A guild que voce informou nao existe. Tente novamente.
			npcHandler:resetNpc(player)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = enemyGuildId,
			enemyGuildName = messageLower,
		}

		npcHandler:say("In which city do you want to fight a private war? You can choose between cities: " .. getWarCityNamesString() .. ".", npc, player)
		-- Em qual cidade voce deseja disputar uma guerra privada? Voce pode escolher entre as cidades: " .. getWarCityNamesString() .. ".
		npcHandler:setTopic(playerGuid, 2)

	-- CIDADE -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 2 and messageLower ~= "accept" then

		local cityWarId = checkCityName(messageLower)
		if not cityWarId then
			npcHandler:say("The city you chose does not exist in our system. You can choose between cities: " .. getWarCityNamesString() .. ". Try again.", npc, player)
			-- A cidade que voce escolheu nao existe em nosso sistema. Voce pode escolher entre as cidades: " .. getWarCityNamesString() .. ". Tente novamente.
			npcHandler:setTopic(playerGuid, 2)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = cityWarId,
		}

		npcHandler:say("How many frags do you want to fight in the war? You can choose an amount between " .. _G.WAR_PRIVATE.minimoFragsParaGuerra .. " and " .. _G.WAR_PRIVATE.maximoFragsParaGuerra .. ", \z
			or if you prefer, you can type 0 for an unlimited frag war.", npc, player)
		-- Quantos frags voce quer disputar na guerra? Voce pode escolher uma quantidade entre " .. _G.WAR_PRIVATE.minimoFragsParaGuerra .. " e " .. _G.WAR_PRIVATE.maximoFragsParaGuerra .. ",
		-- ou se preferir pode digitar 0 para uma guerra sem limites de frags.
		npcHandler:setTopic(playerGuid, 3)

	-- FRAGS -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 3 and messageLower ~= "accept" then

		local fragsLimit = tonumber(messageLower)
		if not fragsLimit then
			npcHandler:say("You did not define the correct number of frags for the system. Try again.", npc, player)
			-- Voce nao definiu uma quantidade de frags correta para o sistema. Tente novamente.
			npcHandler:setTopic(playerGuid, 3)
			return false
		end

		if fragsLimit < _G.WAR_PRIVATE.minimoFragsParaGuerra and fragsLimit ~= 0 then
			npcHandler:say("The minimum number of frags to fight a private war is " .. _G.WAR_PRIVATE.minimoFragsParaGuerra .. " frags.", npc, player)
			-- O minimo de frags para disputar uma guerra privada e " .. _G.WAR_PRIVATE.minimoFragsParaGuerra .. " frags.
			npcHandler:setTopic(playerGuid, 3)
			return false
		end

		if fragsLimit > _G.WAR_PRIVATE.maximoFragsParaGuerra then
			npcHandler:say("The maximum number of frags to fight a private war is " .. _G.WAR_PRIVATE.maximoFragsParaGuerra .. " frags.", npc, player)
			-- O maximo de frags para disputar uma guerra privada e " .. _G.WAR_PRIVATE.maximoFragsParaGuerra .. " frags.
			npcHandler:setTopic(playerGuid, 3)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = fragsLimit == 0 and 999 or fragsLimit,
		}

		npcHandler:say("How long in minutes will the private war last? You can choose between the options: " .. table.concat(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, ', ') .. ".", npc, player)
		-- Quanto tempo em minutos sera a duracao da guerra privada? Voce pode escolher entre as opcoes: " .. table.concat(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, ', ') .. ".
		npcHandler:setTopic(playerGuid, 4)

	-- DURACAO EM MINUTOS -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 4 and messageLower ~= "accept" then

		local durationTime = tonumber(messageLower)
		if not durationTime then
			npcHandler:say("You entered an invalid duration time for the private war. The duration of the private war can be chosen from among \z
				options in minutes: " .. table.concat(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, ', ') .. ". Try again.", npc, player)
			-- Voce informou um tempo de duracao invalido para a guerra privada. O tempo de duracao da guerra privada pode ser escolhido dentre \z
			-- as opcoes em minutos: " .. table.concat(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, ', ') .. ". Tente novamente.
			npcHandler:setTopic(playerGuid, 4)
			return false
		end

		if not table.contains(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, durationTime) then
			npcHandler:say("You entered an invalid duration time for the private war. The duration of the private war can be chosen from among \z
				options in minutes: " .. table.concat(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, ', ') .. ". Try again.", npc, player)
			-- Voce informou um tempo de duracao invalido para a guerra privada. O tempo de duracao da guerra privada pode ser escolhido dentre \z
			-- as opcoes em minutos: " .. table.concat(_G.WAR_PRIVATE.tabelaDeOpcoesDeTempoDeDuracaoDaGuerraEmMinutos, ', ') .. ". Tente novamente.
			npcHandler:setTopic(playerGuid, 4)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = messageCache[playerGuid].fragsLimit,
			durationMinutes = durationTime,
		}

		npcHandler:say("What will be the maximum number of players per guild allowed within private war? The minimum amount is " .. _G.WAR_PRIVATE.minimoDeJogadoresPorCityWar .. " and \z
			maximum and " .. _G.WAR_PRIVATE.maximoDeJogadoresPorCityWar .. ". Enter {0} to be unlimited.", npc, player)
		-- Qual sera a quantidade maximo de jogadores por guild permitidos dentro da guerra privada? A quantidade minima e " .. _G.WAR_PRIVATE.minimoDeJogadoresPorCityWar .. " e \z
		-- maxima e " .. _G.WAR_PRIVATE.maximoDeJogadoresPorCityWar .. ". Digite {0} para ser ilimitado.
		npcHandler:setTopic(playerGuid, 5)

	-- MAX PLAYERS POR GUILD -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 5 and messageLower ~= "accept" then

		local maxPlayers = tonumber(messageLower)
		if not maxPlayers then
			npcHandler:say("You entered an invalid value for the number of players allowed per guild for private war. Try again.", npc, player)
			-- Voce informou um valor invalido para a quantidade de jogadores permidos por guild para a guerra privada. Tente novamente.
			npcHandler:setTopic(playerGuid, 5)
			return false
		end

		if maxPlayers ~= 0 and maxPlayers < _G.WAR_PRIVATE.minimoDeJogadoresPorCityWar then
			npcHandler:say("You entered a value lower than the minimum number (" .. _G.WAR_PRIVATE.minimoDeJogadoresPorCityWar .. ") of players allowed by guild for private war. \z
				For a private war with unlimited players, enter the value {0}. Try again.", npc, player)
			-- Voce informou um valor menor que a quantidade minima (" .. _G.WAR_PRIVATE.minimoDeJogadoresPorCityWar .. ") de jogadores permidos por guild para a guerra privada. \z
			-- Para uma guerra privada com os jogadores ilimitados informe o valor {0}. Tente novamente.
			npcHandler:setTopic(playerGuid, 5)
			return false
		end

		if maxPlayers > _G.WAR_PRIVATE.maximoDeJogadoresPorCityWar then
			npcHandler:say("You entered a value greater than the maximum number (" .. _G.WAR_PRIVATE.maximoDeJogadoresPorCityWar .. ") of players allowed by guild for private war. \z
				For a private war with unlimited players, enter the value {0}. Try again.", npc, player)
			-- Voce informou um valor maior que a quantidade maxima (" .. _G.WAR_PRIVATE.maximoDeJogadoresPorCityWar .. ") de jogadores permidos por guild para a guerra privada. \z
			-- Para uma guerra privada com os jogadores ilimitados informe o valor {0}. Tente novamente.
			npcHandler:setTopic(playerGuid, 5)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = messageCache[playerGuid].fragsLimit,
			durationMinutes = messageCache[playerGuid].durationMinutes,
			maxPlayerPerGuild = maxPlayers,
		}

		npcHandler:say("Do you want to {release} or {forbid} area spells within private warfare?", npc, player)
		-- Voce quer {liberar} ou {proibir} as magias de area dentro da guerra privado?
		npcHandler:setTopic(playerGuid, 6)

	-- OPTION SPELL AREA -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 6 and messageLower ~= "accept" then

		if messageLower ~= "release" and messageLower ~= "forbid" then
			npcHandler:say("You did not correctly inform {release} or {forbid} for area spells within private war. Try again.", npc, player)
			-- Voce nao informou corretamente com {liberar} ou {proibir} para as magias de area dentro da guerra privada. Tente novamente.
			npcHandler:setTopic(playerGuid, 6)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = messageCache[playerGuid].fragsLimit,
			durationMinutes = messageCache[playerGuid].durationMinutes,
			maxPlayerPerGuild = messageCache[playerGuid].maxPlayerPerGuild,
			optionSpellArea = messageLower == "forbid" and 1 or 0,
		}

		npcHandler:say("Do you want to {release} or {forbid} area runes within private warfare?", npc, player)
		-- Voce quer {liberar} ou {proibir} as runas de area dentro da guerra privado?
		npcHandler:setTopic(playerGuid, 7)

	-- OPTION RUNES AREA -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 7 and messageLower ~= "accept" then

		if messageLower ~= "release" and messageLower ~= "forbid" then
			npcHandler:say("You did not correctly input {release} or {forbid} for area runes within private war. Try again.", npc, player)
			-- Voce nao informou corretamente com {liberar} ou {proibir} para as runas de area dentro da guerra privada. Tente novamente.
			npcHandler:setTopic(playerGuid, 7)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = messageCache[playerGuid].fragsLimit,
			durationMinutes = messageCache[playerGuid].durationMinutes,
			maxPlayerPerGuild = messageCache[playerGuid].maxPlayerPerGuild,
			optionSpellArea = messageCache[playerGuid].optionSpellArea,
			optionRunesArea = messageLower == "forbid" and 1 or 0,
		}

		npcHandler:say("Do you want to {release} or {forbid} amulets with physical protection above 50% within private war?", npc, player)
		-- Voce quer {liberar} ou {proibir} os amuletos com protecao de physical acima de 50% dentro da guerra privado?
		npcHandler:setTopic(playerGuid, 8)

	-- OPTION AMULETS -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 8 and messageLower ~= "accept" then

		if messageLower ~= "release" and messageLower ~= "forbid" then
			npcHandler:say("You did not correctly inform {release} or {forbid} for amulets with physical protection above 50% within private war. Try again.", npc, player)
			-- Voce nao informou corretamente com {liberar} ou {proibir} para os amuletos com protecao de physical acima de 50% dentro da guerra privada. Tente novamente.
			npcHandler:setTopic(playerGuid, 8)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = messageCache[playerGuid].fragsLimit,
			durationMinutes = messageCache[playerGuid].durationMinutes,
			maxPlayerPerGuild = messageCache[playerGuid].maxPlayerPerGuild,
			optionSpellArea = messageCache[playerGuid].optionSpellArea,
			optionRunesArea = messageCache[playerGuid].optionRunesArea,
			optionAmuletsPhysical = messageLower == "forbid" and 1 or 0,
		}

		npcHandler:say("Do you want to {release} or {forbid} the might ring within the private war?", npc, player)
		-- Voce quer {liberar} ou {proibir} o might ring dentro da guerra privado?
		npcHandler:setTopic(playerGuid, 9)

--[[
		npcHandler:say("Qual a quantidade maxima de frond-lines de cada guild podem entrar na guerra privada?", npc, player)
		npcHandler:setTopic(playerGuid, 10)

	-- MAX FROND-LINES -----------------------------------------------------------------------------------------------------------------------------------------

	elseif npcHandler:getTopic(playerGuid) == 10 then

		if messageLower == "" or (messageLower ~= "liberar" and messageLower ~= "proibir") then
			npcHandler:say("Voce nao informou corretamente com 'liberar' ou 'proibir' para o might ring dentro da guerra privada. Tente novamente.", npc, player)
			npcHandler:setTopic(playerGuid, 11)
			return false
		end

		messageCache[playerGuid] = {optionMightRing = messageLower}

		npcHandler:say("Voce quer liberar ou proibir o might ring dentro da guerra privado? Responda com {liberar} ou {proibir}.", npc, player)
		npcHandler:setTopic(playerGuid, 11)
]]--

	-- OPTION MIGHT RING -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 9 and messageLower ~= "accept" then

		if messageLower ~= "release" and messageLower ~= "forbid" then
			npcHandler:say("You did not correctly inform {release} or {forbid} for the might ring within the private war. Try again.", npc, player)
			-- Voce nao informou corretamente com {liberar} ou {proibir} para o might ring dentro da guerra privada. Tente novamente.
			npcHandler:setTopic(playerGuid, 9)
			return false
		end

		messageCache[playerGuid] = {
			enemyId = messageCache[playerGuid].enemyId,
			enemyGuildName = messageCache[playerGuid].enemyGuildName,
			cityId = messageCache[playerGuid].cityId,
			fragsLimit = messageCache[playerGuid].fragsLimit,
			durationMinutes = messageCache[playerGuid].durationMinutes,
			maxPlayerPerGuild = messageCache[playerGuid].maxPlayerPerGuild,
			optionSpellArea = messageCache[playerGuid].optionSpellArea,
			optionRunesArea = messageCache[playerGuid].optionRunesArea,
			optionAmuletsPhysical = messageCache[playerGuid].optionAmuletsPhysical,
			optionMightRing = messageLower == "forbid" and 1 or 0,
		}

		local warInfo = messageCache[playerGuid]
		if not warInfo then
			npcHandler:say("The information provided for the invitation is incorrect, please try again.", npc, player)
			-- As informacoes fornecidas para o convite estao incorretas, tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			logger.warn("[WAR PRIVATE] function creatureSayCallback error in 'not warInfo' (topic 9).")
			return false
		end

		if not warInfo.enemyGuildName or not warInfo.cityId or not warInfo.fragsLimit or not warInfo.durationMinutes or not warInfo.maxPlayerPerGuild or not warInfo.optionSpellArea or not warInfo.optionRunesArea or not warInfo.optionAmuletsPhysical or not warInfo.optionMightRing then
			npcHandler:say("The information provided for the invitation is incorrect, please try again.", npc, player)
			-- As informacoes fornecidas para o convite estao incorretas, tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			logger.warn("[WAR PRIVATE] function creatureSayCallback error in 'not ALL INFO' (topic 9).")
			return false
		end

		local cityName = _G.WAR_PRIVATE.citysById[warInfo.cityId].name
		if not cityName then
			npcHandler:say("The name of the city provided for the invitation is incorrect.", npc, player)
			-- O nome da cidade informado para o convite esta incorreto.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local fragsMessage = warInfo.fragsLimit == 999 and "unlimited frags" or "limit of " .. warInfo.fragsLimit .. ""
		local maxPlayersMessage = warInfo.maxPlayerPerGuild == 0 and "unlimited" or "maximum amount of " .. warInfo.maxPlayerPerGuild .. ""

		npcHandler:say("Are you sure you want to send a private war invite to the guild " .. warInfo.enemyGuildName .. " in the city " .. cityName .. " with \z
			" .. fragsMessage .. " frags, duration of " .. warInfo.durationMinutes .. " minutes, " .. maxPlayersMessage .. " players \z
			participants of each guild, spells in area " .. (warInfo.optionSpellArea == 1 and "forbidden" or "released") .. ", \z
			runes in area " .. (warInfo.optionRunesArea == 1 and "forbidden" or "released") .. ", \z
			" .. (warInfo.optionAmuletsPhysical == 1 and "forbidden" or "released") .. " the Protection Amulet and Stone Skin Amulet, \z
			" .. (warInfo.optionMightRing == 1 and "forbidden" or "released") .. " the might ring, and \z
			Say {yes} to send the invitation!", npc, player)
		npcHandler:setTopic(playerGuid, 10)

	-- ULTIMA VERIFICAÇÃO -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 10 and messageLower == "yes" and messageLower ~= "accept" then

		local exhaustion = player:getExhaustion("npc-private-war-enemy-2")
		if exhaustion > 0 then
			npcHandler:say("You are exhausted at this stage, wait for " .. exhaustion .. " " .. (exhaustion > 1 and "seconds" or "second") .. " to try again.", npc, player)
			-- Voce esta com exaustao nesta etapa, aguarde " .. exhaustion .. " " .. (exhaustion > 1 and "segundos" or "segundo") .. " para tentar novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local warInfo = messageCache[playerGuid]
		if not warInfo then
			npcHandler:say("The information provided for the invitation is incorrect, please try again.", npc, player)
			-- As informacoes fornecidas para o convite estao incorretas, tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			logger.warn("[WAR PRIVATE] function creatureSayCallback error in 'not warInfo' (topic 10).")
			return false
		end

		if not warInfo.enemyId or not warInfo.enemyGuildName or not warInfo.cityId or not warInfo.fragsLimit or not warInfo.durationMinutes or not warInfo.maxPlayerPerGuild or not warInfo.optionSpellArea or not warInfo.optionRunesArea or not warInfo.optionAmuletsPhysical or not warInfo.optionMightRing then
			npcHandler:say("The information provided for the invitation is incorrect, please try again.", npc, player)
			-- As informacoes fornecidas para o convite estao incorretas, tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			logger.warn("[WAR PRIVATE] function creatureSayCallback error in 'not ALL INFO' (topic 10).")
			return false
		end

		player:setExhaustion("npc-private-war-enemy-2", 60)

		local enemyGuildName = getEnemyGuildName(warInfo.enemyId)
		if not enemyGuildName then
			npcHandler:say("The guild you want to invite to a war in a war private does not exist. Try again.", npc, player)
			-- A guild que voce quer convidar para uma guerra em um local privado nao existe. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		enemyGuildName = capitalizeFirstLetter(enemyGuildName)

		if warInfo.enemyId == guildId or enemyGuildName == guild:getName() then
			npcHandler:say("You cannot invite your own guild to private war. Try again.", npc, player)
			-- Voce nao pode convidar sua propria guild para a guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		--[[
				local invitationDenied = ""
		resultId = db.storeQuery("SELECT `guild1`, `guild2`, `status`, `private_city`, `invite_time`  FROM `guild_wars` WHERE \z
			(`guild1` = " .. guildId .. " OR `guild2` = " .. guildId .. " OR `guild1` = " .. enemyId .. " OR `guild2` = " .. enemyId .. ") AND `status` IN (0, 1)")

		if resultId then
			local privateCity = Result.getNumber(resultId, "private_city")
			local guild_1 = Result.getNumber(resultId, "guild1")
			local guild_2 = Result.getNumber(resultId, "guild2")
			local statusWar = Result.getNumber(resultId, "status")
			local invitedTime = Result.getNumber(resultId, "invite_time")

			if statusWar == 0 then
				if privateCity > 0 then
					if invitedTime > os.time() then
						if guild_1 == guildId then
							if guild_2 == enemyId then
								invitationDenied = "Sua guild ja convidou a guild " .. enemyGuildName .. " para uma guerra em um local privado."
							else
								invitationDenied = "Sua guild ja convidou outra guild para uma guerra em um local privado. Aguarde o convite expirar."
							end
						elseif guild_1 == enemyId then
							if guild_2 == guildId then
								invitationDenied = "A guild " .. enemyGuildName .. " ja convidou voce para uma guerra em um local privado."
							else
								invitationDenied = "A guild " .. enemyGuildName .. " ja convidou outra guild para uma guerra em um local privado. Aguarde o convite expirar."
							end
						else
							if guild_2 == guildId then
								invitationDenied = "Sua guild ja tem um convite ativo para uma guerra em um local privado. Aguarde o convite expirar."
							elseif Result.getNumber(resultId, "guild2") == enemyId then
								invitationDenied = "A guild " .. enemyGuildName .. " ja tem um convite ativo para uma guerra em um local privado. Aguarde o convite expirar."
							end
						end
					end
				else
					if guild_1 == guildId then
						if guild_2 == enemyId then
							invitationDenied = "Sua guild ja convidou a guild " .. enemyGuildName .. " para uma guerra."
						else
							invitationDenied = "Sua guild ja convidou outra guild para uma guerra."
						end
					elseif guild_1 == enemyId then
						if guild_2 == guildId then
							invitationDenied = "A guild " .. enemyGuildName .. " ja convidou voce para uma guerra."
						else
							invitationDenied = "A guild " .. enemyGuildName .. " ja convidou outra guild para uma guerra."
						end
					else
						if guild_2 == guildId then
							invitationDenied = "Sua guild ja tem um convite ativo para uma guerra."
						elseif guild_2 == enemyId then
							invitationDenied = "A guild " .. enemyGuildName .. " ja tem um convite ativo para uma guerra."
						end
					end
				end
			else
				if privateCity > 0 then
					if guild_1 == guildId then
						if guild_2 == enemyId then
							invitationDenied = "Sua guild ja esta em guerra em um local privado com a guild " .. enemyGuildName .. "."
						else
							invitationDenied = "Sua guild ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar."
						end
					elseif guild_1 == enemyId then
						if guild_2 == guildId then
							invitationDenied = "A guild " .. enemyGuildName .. " ja esta em guerra em um local privado com a sua guild."
						else
							invitationDenied = "A guild " .. enemyGuildName .. " ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar."
						end
					else
						if guild_2 == guildId then
							invitationDenied = "Sua guild ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar."
						elseif guild_2 == enemyId then
							invitationDenied = "A guild " .. enemyGuildName .. " ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar."
						end
					end
				else
					if guild_1 == guildId then
						if guild_2 == enemyId then
							invitationDenied = "Sua guild ja esta em guerra com a guild " .. enemyGuildName .. "."
						else
							invitationDenied = "Sua guild ja esta em guerra com outra guild. Aguarde a guerra terminar."
						end
					elseif guild_1 == enemyId then
						if guild_2 == guildId then
							invitationDenied = "A guild " .. enemyGuildName .. " ja esta em guerra com a sua guild."
						else
							invitationDenied = "A guild " .. enemyGuildName .. " ja esta em guerra com outra guild. Aguarde a guerra terminar."
						end
					else
						if guild_2 == guildId then
							invitationDenied = "Sua guild ja esta em guerra com outra guild. Aguarde a guerra terminar."
						elseif guild_2 == enemyId then
							invitationDenied = "A guild " .. enemyGuildName .. " ja esta em guerra com outra guild. Aguarde a guerra terminar."
						end
					end
				end
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end
		]]--

		local invitationDenied = ""
		local resultId = db.storeQuery("SELECT `guild1`, `status`, `invite_time` FROM `guild_wars` WHERE `guild1` IN (" .. guildId .. "," .. warInfo.enemyId .. ") AND `guild2` IN (" .. warInfo.enemyId .. "," .. guildId .. ") AND `status` IN (0, 1)")
		if resultId then
			if Result.getNumber(resultId, "status") == 0 then
				if Result.getNumber(resultId, "invite_time") > os.time() then
					if Result.getNumber(resultId, "guild1") == guildId then
						invitationDenied = "Your guild has already invited the guild " .. enemyGuildName .. " to a war."
						-- Sua guild ja convidou a guild " .. enemyGuildName .. " para uma guerra.
					else
						invitationDenied = "The guild " .. enemyGuildName .. " has already invited you to a war."
						-- A guild " .. enemyGuildName .. " ja convidou voce para uma guerra.
					end
				end
			else
				invitationDenied = "You are already at war with the guild " .. enemyGuildName .. "."
				-- Voce ja esta em guerra com a guild " .. enemyGuildName .. ".
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		invitationDenied = ""
		resultId = db.storeQuery("SELECT `guild1`, `status`, `invite_time` FROM `guild_wars` WHERE (`guild1` = " .. guildId .. " OR `guild2` = " .. guildId .. ") AND `private_city` > 0 AND `status` IN (0, 1)")
		if resultId then
			if Result.getNumber(resultId, "status") == 0 then
				if Result.getNumber(resultId, "invite_time") > os.time() then
					if Result.getNumber(resultId, "guild1") == guildId then
						invitationDenied = "Your guild has already invited another guild to a private war. Wait for the invitation to expire."
						-- Sua guild ja convidou outra guild para uma guerra privada. Aguarde o convite expirar.
					else
						invitationDenied = "Your guild already has a pending invitation from another guild for a private war. Wait for the invitation to expire."
						-- Sua guild ja tem um convite pendente de outra guild para uma guerra privada. Aguarde o convite expirar.
					end
				end
			else
				invitationDenied = "Your guild is already in a private war with another guild. Wait for the war to end or cancel the active war."
				-- Sua guild ja esta em guerra privada com outra guild. Aguarde a guerra terminar ou cancele a guerra ativa.
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		invitationDenied = ""
		resultId = db.storeQuery("SELECT `guild1`, `status`, `invite_time` FROM `guild_wars` WHERE (`guild1` = " .. warInfo.enemyId .. " OR `guild2` = " .. warInfo.enemyId .. ") AND `private_city` > 0 AND `status` IN (0, 1)")
		if resultId then
			if Result.getNumber(resultId, "status") == 0 then
				if Result.getNumber(resultId, "invite_time") > os.time() then
					if Result.getNumber(resultId, "guild1") == guildId then
						invitationDenied = "The guild against has already invited another guild to a private war. Wait for the invitation to expire."
						-- A guild contra ja convidou outra guild para uma guerra privada. Aguarde o convite expirar.
					else
						invitationDenied = "The contra guild already has a pending invitation from another guild for a private war. Wait for the invitation to expire."
						-- A guild contra ja tem um convite pendente de outra guild para uma guerra privada. Aguarde o convite expirar.
					end
				end
			else
				invitationDenied = "The contra guild is already in a private war with another guild. Wait for the war to end or she has to cancel the active war."
				-- A guild contra ja esta em guerra privada com outra guild. Aguarde a guerra terminar ou ela tem que cancelar a guerra ativa.
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local validIps = validIpsGuild(guildId)
		if not validIps then
			npcHandler:say("Your guild must have a minimum of " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " online members \z
				of different IPs for you to invite a guild to a private war. Try again.", npc, player)
			-- Sua guild deve ter o minimo de " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online \z
			-- de IPs diferentes para voce convidar uma guild para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		if validIps < _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar then
			npcHandler:say("Your guild has " .. validIps .." online members from different IPs. She must have at least \z
				" .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " online members from different IPs for you to invite \z
				a guild for a private war. Try again.", npc, player)
			-- Sua guild tem " .. validIps .. " membros online de IPs diferentes. Ela deve ter o minimo de \z
			-- uma guild para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		validIps = validIpsGuild(warInfo.enemyId)
		if not validIps then
			npcHandler:say("The enemy guild must have a minimum of " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " members online \z
				of different IPs for you to invite her to a private war. Try again.", npc, player)
			-- A guild inimiga deve ter o minimo de " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online \z
			-- de IPs diferentes para voce convida-la para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		if validIps < _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar then
			npcHandler:say("The enemy guild has " .. validIps .. " members online from different IPs. She must have at least \z
				" .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " online members from different IPs for you to invite \z
				for a private war. Try again.", npc, player)
			-- A guild inimiga tem " .. validIps .. " membros online de IPs diferentes. Ela deve ter o minimo de \z
			-- " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online de IPs diferentes para voce convida-la \z
			-- para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local cityName = _G.WAR_PRIVATE.citysById[warInfo.cityId].name
		if not cityName then
			npcHandler:say("The name of the city provided for the invitation is incorrect.", npc, player)
			-- O nome da cidade informado para o convite esta incorreto.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		invitationDenied = ""
		resultId = db.storeQuery("SELECT `id`, `status`, `invite_time` FROM `guild_wars` WHERE `private_city` = " .. warInfo.cityId .. " AND `status` IN (0, 1)")
		if resultId then
			if Result.getNumber(resultId, "status") == 0 then
				if Result.getNumber(resultId, "invite_time") > os.time() then
					invitationDenied = "There is already an active invitation to private war in the city " .. cityName .. ". Wait for the invitation to expire or choose another city."
					-- Ja existe um convite ativo para a guerra privada na cidade " .. cityName .. ". Aguarde o convite expirar ou escolha outra cidade.
				end
			else
				invitationDenied = "There is already an active private war in the city " .. cityName .. ". Wait for the war to end or choose another city."
				-- Ja existe uma guerra privada ativa na cidade " .. cityName .. ". Aguarde a guerra acabar ou escolha outra cidade.
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local inviteTime = (_G.WAR_PRIVATE.tempoDoConviteEmMinutos * 60) + os.time()

		db.query("INSERT INTO `guild_wars` (`guild1`, `guild2`, `name1`, `name2`, `frags_limit`, `private_city`, `invite_time`, `duration_time`, `max_players_guild`, `blocked_spell_area`, `blocked_rune_area`, `blocked_amulet`, `blocked_might_ring`) VALUES (\z
			" .. guildId .. ", " .. warInfo.enemyId .. ", " .. db.escapeString(guild:getName()) .. ", " .. db.escapeString(enemyGuildName) .. ", \z
			" .. warInfo.fragsLimit .. ", " .. warInfo.cityId .. ", " .. inviteTime .. ", " .. warInfo.durationMinutes .. ", " .. warInfo.maxPlayerPerGuild .. ", \z
			" .. warInfo.optionSpellArea .. ", " .. warInfo.optionRunesArea .. ", " .. warInfo.optionAmuletsPhysical .. " , " .. warInfo.optionMightRing .. ");")


		mensagemParaGuild(guildId, "[WAR PRIVATE] The guild leader invited the guild " .. enemyGuildName .. " to a private war in the city " .. cityName .. "!")
		-- [WAR PRIVATE] O lider da guild convidou a guild " .. enemyGuildName .. " para uma guerra privada na cidade " .. cityName .. "!

		mensagemParaGuild(warInfo.enemyId, "[WAR PRIVATE] The guild " .. guild:getName() .. " has sent a private war invitation to your guild in the city " .. cityName .. "! \z
			To accept, the guild leader must accept the invitation at NPC Private War.")
		-- [WAR PRIVATE] A guild " .. guild:getName() .. " enviou um convite de guerra privada para a sua guild na cidade " .. cityName .. "! \z
		-- Para aceitar o lider da guild deve aceitar o convite no NPC Private War.

		local fragsMessage = warInfo.fragsLimit == 999 and "Unlimited" or warInfo.fragsLimit
		local maxPlayersMessage = warInfo.maxPlayerPerGuild == 0 and "Unlimited" or warInfo.maxPlayerPerGuild

		local stringAllowed = ""
		local stringRestricted = ""

		if warInfo.optionSpellArea == 0 or warInfo.optionRunesArea == 0 or warInfo.optionAmuletsPhysical == 0 or warInfo.optionMightRing == 0 then
			stringAllowed = "[Allowed] "
		end

		if warInfo.optionSpellArea == 1 or warInfo.optionRunesArea == 1 or warInfo.optionAmuletsPhysical == 1 or warInfo.optionMightRing == 1 then
			stringRestricted = "[Restricted] "
		end

		if warInfo.optionSpellArea == 0 then
			stringAllowed = stringAllowed .. "Area Spells, "
		else
			stringRestricted = stringRestricted .. "Area Spells, "
		end

		if warInfo.optionRunesArea == 0 then
			stringAllowed = stringAllowed .. "Area Runes, "
		else
			stringRestricted = stringRestricted .. "Area Runes, "
		end

		if warInfo.optionAmuletsPhysical == 0 then
			stringAllowed = stringAllowed .. "Amulets with Physical Protection above 50%, "
		else
			stringRestricted = stringRestricted .. "Amulets with Physical Protection above 50%, "
		end

		if warInfo.optionMightRing == 0 then
			stringAllowed = stringAllowed .. "Might Rings, "
		else
			stringRestricted = stringRestricted .. "Might Rings, "
		end

		mensagemParaGuild(guildId, "[WAR PRIVATE] Invitation Information: \z
			[Guilds] " .. guild:getName() .. " vs " .. enemyGuildName .. " \z
			[Map] " .. cityName .. " \z
			[Frags] " .. fragsMessage .. " \z
			[Duration] " .. warInfo.durationMinutes .. " minutes \z
			" .. stringAllowed .. "\z
			" .. stringRestricted .. "\z
			[Maximum Players per Guild] " .. maxPlayersMessage .. ".")

		mensagemParaGuild(warInfo.enemyId, "[WAR PRIVATE] War Private Invitation Information: \z
			[Guilds] " .. enemyGuildName .. " vs " .. guild:getName() .. " \z
			[Map] " .. cityName .. " \z
			[Frags] " .. fragsMessage .. " \z
			[Duration] " .. warInfo.durationMinutes .. " minutes \z
			" .. stringAllowed .. "\z
			" .. stringRestricted .. "\z
			[Maximum Players per Guild] " .. maxPlayersMessage .. ".")

		fragsMessage = warInfo.fragsLimit == 999 and "unlimited frags" or "limit of " .. warInfo.fragsLimit .. ""
		maxPlayersMessage = warInfo.maxPlayerPerGuild == 0 and "unlimited" or "maximum amount of " .. warInfo.maxPlayerPerGuild .. ""

		local mensagem = "The guild " .. guild:getName() .. " invited the guild " .. enemyGuildName .. " to a private war with " .. fragsMessage .. " frags and \z
			" .. maxPlayersMessage .. " participating players for each guild in the city of " .. cityName .. " with a duration of " .. warInfo.durationMinutes .. " minutes."
		-- A guild " .. guild:getName() .. " convidou para uma guerra privada a guild " .. warInfo.enemyGuildName .. " " .. fragsMessage .. " e \z
		-- " .. maxPlayersMessage .. " jogadores participantes para cada guild na cidade de " .. cityName .. " com duracao de " .. warInfo.durationMinutes .. " minutos."

		Game.broadcastMessage(mensagem)
		logger.info("[WAR PRIVATE] {}", mensagem)

		npcHandler:say("Your invitation to war in a private location has been sent!", npc, player)
		-- Seu convite de guerra em um local privado foi enviado!
		messageCache[playerGuid] = nil
		npcHandler:resetNpc(player)

		_G.WAR_PRIVATE.citysById[warInfo.cityId].CACHE_ADDEVENT.INVITE = addEvent(warPrivate_finishInviteTime, _G.WAR_PRIVATE.tempoDoConviteEmMinutos * 61000)

		return true

		------------------- VERIFICAR A QUESTÃO DE EXCLUIR O CONVITE APÓS O TEMPO.

	-- ACEITAR CONVITE -----------------------------------------------------------------------------------------------------------------------------------------
	elseif messageLower == "accept" then

		npcHandler:say("What is the name of the guild you want to accept the invitation to a private war?", npc, player)
		-- Qual o nome da guild que voce quer aceitar o convite para uma guerra privada?
		npcHandler:setTopic(playerGuid, 21)
		messageCache[playerGuid] = nil

	-- ACEITAR CONVITE GUILD  -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 21 then

		local exhaustion = player:getExhaustion("npc-private-war-enemy-1")
		if exhaustion > 0 then
			npcHandler:say("You are exhausted at this stage, wait for " .. exhaustion .. " " .. (exhaustion > 1 and "seconds" or "second") .. " to try again.", npc, player)
			-- Voce esta com exaustao nesta etapa, aguarde " .. exhaustion .. " " .. (exhaustion > 1 and "segundos" or "segundo") .. " para tentar novamente.
			npcHandler:resetNpc(player)
			return false
		end

		player:setExhaustion("npc-private-war-enemy-1", 60)

		local enemyGuildId = getEnemyGuildId(messageLower)
		if not enemyGuildId then
			npcHandler:say("The guild you informed does not exist. Try again.", npc, player)
			-- A guild que voce informou nao existe. Tente novamente.
			npcHandler:resetNpc(player)
			return false
		end

		local resultId = db.storeQuery("SELECT `id`, `private_city`, `frags_limit`, `duration_time`, `max_players_guild`, `blocked_spell_area`, `blocked_rune_area`, `blocked_amulet`, `blocked_might_ring` \z
			FROM `guild_wars` \z
			WHERE `guild1` IN (" .. guildId .. "," .. enemyGuildId .. ") \z
			AND `guild2` IN (" .. enemyGuildId .. "," .. guildId .. ") \z
			AND `status` = 0 AND `invite_time` > " ..  os.time())

		if not resultId then
			npcHandler:say("You do not have an active invitation to the private war against the guild " .. messageLower .. ".", npc, player)
			-- Voce nao tem um convite ativo para a guerra privada contra a guild " .. messageLower .. ".
			npcHandler:resetNpc(player)
			return false
		end

		local warId =  Result.getNumber(resultId, "id")
		local cityId = Result.getNumber(resultId, "private_city")
		local fragsLimit = Result.getNumber(resultId, "frags_limit")
		local durationInMinutes = Result.getNumber(resultId, "duration_time")
		local maxPlayersByGuild = Result.getNumber(resultId, "max_players_guild")
		local optionSpellArea = Result.getNumber(resultId, "blocked_spell_area")
		local optionRunesArea = Result.getNumber(resultId, "blocked_rune_area")
		local optionAmuletsPhysical = Result.getNumber(resultId, "blocked_amulet")
		local optionMightRing = Result.getNumber(resultId, "blocked_might_ring")

		Result.free(resultId)

		local cityName = _G.WAR_PRIVATE.citysById[cityId].name
		if not cityName then
			npcHandler:say("The city mentioned in the invitation does not exist.", npc, player)
			-- A cidade informada no convite nao existe.
			npcHandler:resetNpc(player)
			return false
		end

		local fragsMessage = fragsLimit == 999 and "unlimited" or "limit of " .. fragsLimit .. ""
		local maxPlayersMessage = maxPlayersByGuild == 0 and "unlimited" or "maximum amount of " .. maxPlayersByGuild .. ""

		npcHandler:say("Do you want to accept the invitation to a private war against the guild " .. messageLower .. " in the city of " .. cityName .. " \z
			with a duration of " .. durationInMinutes .. " minutes, \z
			" .. fragsMessage .. " frags, \z
			" .. maxPlayersMessage .. " participating players for each guild, \z
			" .. (optionSpellArea == 1 and "forbidden" or "released") .. " spells in area, \z
			" .. (optionRunesArea == 1 and "forbidden" or "released") .. " runes in area, \z
			" .. (optionAmuletsPhysical == 1 and "forbidden" or "released") .. " amulets with physical protection above 50% and \z
			" .. (optionMightRing == 1 and "forbidden" or "released") .. " the might ring. \z
			If you agree with the terms, say {yes}.", npc, player)

		npcHandler:setTopic(playerGuid, 22)
		messageCache[playerGuid] = {
			warId = warId,
		}

	-- FINALIZAR ACEITAR CONVITE GUILD  -----------------------------------------------------------------------------------------------------------------------------------------
	elseif npcHandler:getTopic(playerGuid) == 22 and messageLower == "yes" then

		local warId = messageCache[playerGuid].warId
		if not warId then
			npcHandler:say("You entered an invalid command, try again.", npc, player)
			-- Voce digitou um comando invalido, tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local resultId = db.storeQuery("SELECT `guild1`, `private_city`, `frags_limit`, `duration_time`, `max_players_guild`, `blocked_spell_area`, `blocked_rune_area`, `blocked_amulet`, `blocked_might_ring` \z
			FROM `guild_wars` \z
			WHERE `id` = " .. warId .. " AND `guild2` = " .. guildId .. " AND `status` = 0 AND `invite_time` > " ..  os.time())

		if not resultId then
			npcHandler:say("You do not have an active invitation to private war against.", npc, player)
			-- Voce nao tem um convite ativo para a guerra privada contra.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local cityId = Result.getNumber(resultId, "private_city")
		local enemyId = Result.getNumber(resultId, "guild1")
		local fragsLimit = Result.getNumber(resultId, "frags_limit")
		local durationInMinutes = Result.getNumber(resultId, "duration_time")
		local maxPlayersByGuild = Result.getNumber(resultId, "max_players_guild")
		local optionSpellArea = Result.getNumber(resultId, "blocked_spell_area")
		local optionRunesArea = Result.getNumber(resultId, "blocked_rune_area")
		local optionAmuletsPhysical = Result.getNumber(resultId, "blocked_amulet")
		local optionMightRing = Result.getNumber(resultId, "blocked_might_ring")

		Result.free(resultId)

		local enemyGuildName = getEnemyGuildName(enemyId)
		if not enemyGuildName then
			npcHandler:say("The guild against which appears in this private war invitation does not exist.", npc, player)
			-- A guild contra que consta nesse convite de guerra privada nao existe.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		enemyGuildName = capitalizeFirstLetter(enemyGuildName)

		local cityName = _G.WAR_PRIVATE.citysById[cityId].name
		if not cityName then
			npcHandler:say("The city that appears in this private war invitation does not exist.", npc, player)
			-- A cidade que consta nesse convite de guerra privada nao existe.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local invitationDenied = ""
		resultId = db.storeQuery("SELECT `guild1`, `guild2`, `status`, `private_city`, `invite_time` FROM `guild_wars` WHERE \z
			(`guild1` = " .. guildId .. " OR `guild2` = " .. guildId .. " OR `guild1` = " .. enemyId .. " OR `guild2` = " .. enemyId .. ") AND `status` IN (0, 1)")

		if resultId then
			local privateCity = Result.getNumber(resultId, "private_city")
			local guild_1 = Result.getNumber(resultId, "guild1")
			local guild_2 = Result.getNumber(resultId, "guild2")
			local statusWar = Result.getNumber(resultId, "status")
			local invitedTime = Result.getNumber(resultId, "invite_time")

			if statusWar == 0 then
				if privateCity > 0 then
					if invitedTime > os.time() then
						if guild_1 == guildId then
							if guild_2 == enemyId then
								invitationDenied = "Your guild has already invited the guild " .. enemyGuildName .. " to a war in a private location."
								-- Sua guild ja convidou a guild " .. enemyGuildName .. " para uma guerra em um local privado.
							else
								invitationDenied = "Your guild has already invited another guild to a war in a private location. Wait for the invitation to expire."
								-- Sua guild ja convidou outra guild para uma guerra em um local privado. Aguarde o convite expirar.
							end
						elseif guild_1 == enemyId then
							if guild_2 ~= guildId then
								invitationDenied = "The guild " .. enemyGuildName .. " has already invited another guild to a war in a private location. Wait for the invitation to expire."
								-- A guild " .. enemyGuildName .. " ja convidou outra guild para uma guerra em um local privado. Aguarde o convite expirar.
							end
						else
							if guild_2 == guildId then
								invitationDenied = "Your guild already has an active invitation to a war in a private location. Wait for the invitation to expire."
								-- Sua guild ja tem um convite ativo para uma guerra em um local privado. Aguarde o convite expirar.
							elseif Result.getNumber(resultId, "guild2") == enemyId then
								invitationDenied = "The guild " .. enemyGuildName .. " already has an active invitation to a war in a private location. Wait for the invitation to expire."
								-- A guild " .. enemyGuildName .. " ja tem um convite ativo para uma guerra em um local privado. Aguarde o convite expirar
							end
						end
					end
				else
					if guild_1 == guildId then
						if guild_2 == enemyId then
							invitationDenied = "Your guild has already invited the guild " .. enemyGuildName .. " to a war."
							-- Sua guild ja convidou a guild " .. enemyGuildName .. " para uma guerra.
						else
							invitationDenied = "Your guild has already invited another guild to a war."
							-- Sua guild ja convidou outra guild para uma guerra.
						end
					elseif guild_1 == enemyId then
						if guild_2 == guildId then
							invitationDenied = "The guild " .. enemyGuildName .. " has already invited you to a war."
							--A guild " .. enemyGuildName .. " ja convidou voce para uma guerra.
						else
							invitationDenied = "The guild " .. enemyGuildName .. " has already invited another guild to a war."
							-- A guild " .. enemyGuildName .. " ja convidou outra guild para uma guerra.
						end
					else
						if guild_2 == guildId then
							invitationDenied = "Your guild already has an active invitation to a war."
							-- Sua guild ja tem um convite ativo para uma guerra.
						elseif guild_2 == enemyId then
							invitationDenied = "The guild " .. enemyGuildName .. " already has an active invitation to a war."
							-- A guild " .. enemyGuildName .. " ja tem um convite ativo para uma guerra.
						end
					end
				end
			else
				if privateCity > 0 then
					if guild_1 == guildId then
						if guild_2 == enemyId then
							invitationDenied = "Your guild is already at war in a private location with the guild " .. enemyGuildName .. "."
							-- Sua guild ja esta em guerra em um local privado com a guild " .. enemyGuildName .. ".
						else
							invitationDenied = "Your guild is already at war in a private location with another guild. Wait for the war to end."
							-- Sua guild ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar.
						end
					elseif guild_1 == enemyId then
						if guild_2 == guildId then
							invitationDenied = "The guild " .. enemyGuildName .. " is already at war in a private location with your guild."
							-- A guild " .. enemyGuildName .. " ja esta em guerra em um local privado com a sua guild.
						else
							invitationDenied = "The guild " .. enemyGuildName .. " is already at war in a private location with another guild. Wait for the war to end."
							-- A guild " .. enemyGuildName .. " ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar.
						end
					else
						if guild_2 == guildId then
							invitationDenied = "Your guild is already at war in a private location with another guild. Wait for the war to end."
							-- Sua guild ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar.
						elseif guild_2 == enemyId then
							invitationDenied = "The guild " .. enemyGuildName .. " is already at war in a private location with another guild. Wait for the war to end."
							-- A guild " .. enemyGuildName .. " ja esta em guerra em um local privado com outra guild. Aguarde a guerra terminar.
						end
					end
				else
					if guild_1 == guildId then
						if guild_2 == enemyId then
							invitationDenied = "Your guild is already at war with the guild " .. enemyGuildName .. "."
							-- Sua guild ja esta em guerra com a guild " .. enemyGuildName .. ".
						else
							invitationDenied = "Your guild is already at war with another guild. Wait for the war to end."
							-- Sua guild ja esta em guerra com outra guild. Aguarde a guerra terminar.
						end
					elseif guild_1 == enemyId then
						if guild_2 == guildId then
							invitationDenied = "The guild " .. enemyGuildName .. " is already at war with your guild."
							-- A guild " .. enemyGuildName .. " ja esta em guerra com a sua guild.
						else
							invitationDenied = "The guild " .. enemyGuildName .. " is already at war with another guild. Wait for the war to end."
							-- A guild " .. enemyGuildName .. " ja esta em guerra com outra guild. Aguarde a guerra terminar.
						end
					else
						if guild_2 == guildId then
							invitationDenied = "Your guild is already at war with another guild. Wait for the war to end."
							-- Sua guild ja esta em guerra com outra guild. Aguarde a guerra terminar.
						elseif guild_2 == enemyId then
							invitationDenied = "The guild " .. enemyGuildName .. " is already at war with another guild. Wait for the war to end."
							-- A guild " .. enemyGuildName .. " ja esta em guerra com outra guild. Aguarde a guerra terminar.
						end
					end
				end
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local validIps = validIpsGuild(guildId)
		if not validIps then
			npcHandler:say("Your guild must have a minimum of " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " online members \z
				of different IPs for you to accept a guild's invitation to a private war. Try again.", npc, player)
			-- Sua guild deve ter o minimo de " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online \z
			-- de IPs diferentes para voce aceitar o convite de uma guild para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		if validIps < _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar then
			npcHandler:say("Your guild has " .. validIps .." online members from different IPs. She must have at least \z
				" .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online de IPs diferentes para voce aceitar o convite de \z
				a guild for a private war. Try again.", npc, player)
				-- Sua guild tem " .. validIps .. " membros online de IPs diferentes. Ela deve ter o minimo de \z
				-- " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online de IPs diferentes para voce aceitar o convite de \z
				-- uma guild para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		validIps = validIpsGuild(enemyId)
		if not validIps then
			npcHandler:say("The enemy guild must have a minimum of " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " members online \z
				of different IPs for you to accept the invitation to a private war. Try again.", npc, player)
			-- A guild inimiga deve ter o minimo de " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online \z
			-- de IPs diferentes para voce aceitar o convite para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		if validIps < _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar then
			npcHandler:say("The enemy guild has " .. validIps .. " members online from different IPs. She must have at least \z
				" .. _G.WAR_PRIVATE.minimoDeIpsDifferentesPorGuildParaAddWar .. " online members from different IPs for you to accept the invitation \z
				for a private war. Try again.", npc, player)
			-- A guild inimiga tem " .. validIps .. " membros online de IPs diferentes. Ela deve ter o minimo de \z
			-- " .. _G.WAR_PRIVATE.minimoDeIpsDiferentesPorGuildParaAddWar .. " membros online de IPs diferentes para voce aceitar o convite \z
			-- para uma guerra privada. Tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		invitationDenied = ""
		resultId = db.storeQuery("SELECT `id`, `status`, `invite_time` FROM `guild_wars` WHERE `private_city` = " .. cityId .. " AND `status` IN (0, 1)")
		if resultId then
			if Result.getNumber(resultId, "status") == 0 then
				if Result.getNumber(resultId, "id") ~= warId and Result.getNumber(resultId, "invite_time") > os.time() then
					invitationDenied = "There is already an active invitation to private war in the city " .. cityName .. ". Wait for the invitation to expire or choose another city."
					-- Ja existe um convite ativo para a guerra privada na cidade " .. cityName .. ". Aguarde o convite expirar ou escolha outra cidade.
				end
			else
				invitationDenied = "There is already an active private war in the city " .. cityName .. ". Wait for the war to end or choose another city."
				-- Ja existe uma guerra privada ativa na cidade " .. cityName .. ". Aguarde a guerra acabar ou escolha outra cidade.
			end
			Result.free(resultId)
		end

		if invitationDenied ~= "" then
			npcHandler:say(invitationDenied, npc, player)
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
			return false
		end

		local enemyGuildId = getEnemyGuildId(enemyGuildName)
		if not enemyGuildId then
			npcHandler:say("The enemy guild does not exist. Try again.", npc, player)
			npcHandler:setTopic(playerGuid, 0)
			return false
		end

		mensagemParaGuild(guildId, "[WAR PRIVATE] The private war against the guild " .. enemyGuildName .. " has started in the city " .. cityName .. ", \z
			use the command '!private go' in a protected area to enter the city! Relog your character to update emblems and shields.")
		-- A guerra privada contra a guild  " .. enemyGuildName .. " comecou na cidade " .. cityName .. ", \z
		-- use o comando '!private go' em uma area de protecao para entrar na cidade! Relogue o seu personagem para atualizar os emblemas e escudos.

		mensagemParaGuild(enemyGuildId, "[WAR PRIVATE] The private war against the guild " .. guild:getName() .. " has started in the city " .. cityName .. ", \z
			use the command '!private go' in a protected area to enter the city! Relog your character to update emblems and shields.")
		-- A guerra privada contra a guild " .. guild:getName() .. " comecou na cidade " .. cityName .. ", \z
		-- use o comando '!private go' em uma area de protecao para entrar na cidade! Relogue o seu personagem para atualizar os emblemas e escudos.

		local fragsMessage = fragsLimit == 999 and "unlimited" or fragsLimit
		local maxPlayersMessage = maxPlayersByGuild == 0 and "unlimited" or maxPlayersByGuild

		local stringAllowed = ""
		local stringRestricted = ""

		if optionSpellArea == 0 or optionRunesArea == 0 or optionAmuletsPhysical == 0 or optionMightRing == 0 then
			stringAllowed = "[Allowed] "
		end

		if optionSpellArea == 1 or optionRunesArea == 1 or optionAmuletsPhysical == 1 or optionMightRing == 1 then
			stringRestricted = "[Restricted] "
		end

		if optionSpellArea == 0 then
			stringAllowed = stringAllowed .. "Area Spells, "
		else
			stringRestricted = stringRestricted .. "Area Spells, "
		end

		if optionRunesArea == 0 then
			stringAllowed = stringAllowed .. "Area Runes, "
		else
			stringRestricted = stringRestricted .. "Area Runes, "
		end

		if optionAmuletsPhysical == 0 then
			stringAllowed = stringAllowed .. "Amulets with Physical Protection above 50%, "
		else
			stringRestricted = stringRestricted .. "Amulets with Physical Protection above 50%, "
		end

		if optionMightRing == 0 then
			stringAllowed = stringAllowed .. "Might Rings, "
		else
			stringRestricted = stringRestricted .. "Might Rings, "
		end

		mensagemParaGuild(guildId, "[WAR PRIVATE] Private War Information: \z
			[Guilds] " .. guild:getName() .. " vs " .. enemyGuildName .. " \z
			[Map] " .. cityName .. " \z
			[Frags] " .. fragsMessage .. " \z
			[Duration] " .. durationInMinutes .. " minutes \z
			" .. stringAllowed .. "\z
			" .. stringRestricted .. "\z
			[Maximum Players per Guild] " .. maxPlayersMessage .. ".")

		mensagemParaGuild(enemyGuildId, "[WAR PRIVATE] Private War Information: \z
			[Guilds] " .. enemyGuildName .. " vs " .. guild:getName() .. " \z
			[Map] " .. cityName .. " \z
			[Frags] " .. fragsMessage .. " \z
			[Duration] " .. durationInMinutes .. " minutes \z
			" .. stringAllowed .. "\z
			" .. stringRestricted .. "\z
			[Maximum Players per Guild] " .. maxPlayersMessage .. ".")

		local mensagem = "The guild " .. guild:getName() .. " has accepted the private war invitation from the guild " .. enemyGuildName .. " in the city of " .. cityName .. "."
		-- A guild " .. guild:getName() .. " aceitou o convite de guerra privada da guild " .. enemyGuildName .. " na cidade de " .. cityName .. ".

		Game.broadcastMessage(mensagem)
		logger.info("[WAR PRIVATE] {}", mensagem)

		local endedWar = os.time() + (durationInMinutes * 60)

		db.query("UPDATE `guild_wars` SET \z
			`started` = " .. os.time() .. ", \z
			`ended` = " .. endedWar .. ", \z
			`status` = 1, \z
			`invite_time` = 0 \z
			WHERE `id` = " .. warId)

		npcHandler:say("Good luck in your private war!", npc, player)
		-- Boa sorte em sua guerra privada!
		npcHandler:resetNpc(player)
		messageCache[playerGuid] = nil

		_G.WAR_PRIVATE.citysById[cityId].CACHE_ADDEVENT.WAR = addEvent(warPrivate_finishWarTime, durationInMinutes * 60000, warId)

	else
		local topic = npcHandler:getTopic(playerGuid)
		if topic and topic > 0 then
			npcHandler:say("You entered an invalid command, try again.", npc, player)
			-- Voce digitou um comando invalido, tente novamente.
			npcHandler:resetNpc(player)
			messageCache[playerGuid] = nil
		end
	end

	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Hello, |PLAYERNAME|! You want to {invite} or {accept} an invitation from a guild to a private war?")
-- Ola, voce quer {convidar} ou {aceitar} um convite de uma guild para uma guerra em um local privado.
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
