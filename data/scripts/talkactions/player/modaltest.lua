
local talk = TalkAction("!modal")

local status, err = pcall(function()
	potionsTable = dofile(DATA_DIRECTORY.."/scripts/systems/Alchemist System/systemAlchemist.lua")
end)

local AlchemistLevel = {
    [1] = {baseXp = -10, baseXpHigh = 100},
    [2] = {baseXp = 101, baseXpHigh = 250},
    [3] = {baseXp = 251, baseXpHigh = 450},
    [4] = {baseXp = 451, baseXpHigh = 700},
    [5] = {baseXp = 701, baseXpHigh = 1000},
    [6] = {baseXp = 1001, baseXpHigh = 1350},
    [7] = {baseXp = 1351, baseXpHigh = 1750},
    [8] = {baseXp = 1751, baseXpHigh = 2200},
    [9] = {baseXp = 2201, baseXpHigh = 2700},
    [10] = {baseXp = 2701, baseXpHigh = 3250},
    [11] = {baseXp = 3251, baseXpHigh = 3850},
    [12] = {baseXp = 3851, baseXpHigh = 4500},
    [13] = {baseXp = 4501, baseXpHigh = 5200},
    [14] = {baseXp = 5201, baseXpHigh = 5950},
    [15] = {baseXp = 5951, baseXpHigh = 6750},
    [16] = {baseXp = 6751, baseXpHigh = 7600},
    [17] = {baseXp = 7601, baseXpHigh = 8500},
    [18] = {baseXp = 8501, baseXpHigh = 9450},
    [19] = {baseXp = 9451, baseXpHigh = 10450},
    [20] = {baseXp = 10451, baseXpHigh = 99999999}
}

function getAlchemistLevel(xp)
    for level, data in pairs(AlchemistLevel) do
        if xp >= data.baseXp and xp <= data.baseXpHigh then
            return level
        end
		
    end

end

function modalExit(player)
	local message = "Voce deseja sair do ambiente de criacao de potions?"
	titleWiki = {"Alquimia de Potions"}
	local menu = ModalWindow{
        title = titleWiki[1],
        message = message
    }
	menu:addButton("Yes")
    menu:addButton("No", modalInit)
    menu:sendToPlayer(player)
end

function modalPotionsMake(player, id, pId)
	local levelAlchemist = getAlchemistLevel(player:getStorageValue(100405))
	local convertGp = (potionsTable[pId].costGp/1000)
	local convertGp2 = (player:getMoney() + player:getBankBalance())
	
	if convertGp2 then
		convertGp2 = math.floor(convertGp2/1000)
	end
	
	local message = {"Voce nao possui dinheiro suficiente para completar a alquimia!", 
	"Voce nao possui o level suficiente para fabricar esta pocao. Tente novamente mais tarde.", 
	"E neccesario possuir a missao designada para fabricar esta pocao.",
	"Voce deve possuir todos os itens para produzir a pocao. Tente mais tarde.",
	"Parabens! Seus conhecimentos de alquimia lhe permitiram criar a pocao "..potionsTable[pId].Name .. ". Aproveite seu novo drink.",
	"Voce nao possui o level de alquimia suficiente para fabricar esta pocao. Avance seu nivel antes de tentar novamente."}
	
	local idMsg = 0
	local itemSet = 0
	if (player:getMoney() + player:getBankBalance()) > potionsTable[pId].costGp then
		moneySet = 1
		if player:getLevel() > potionsTable[pId].levelNeed then
			if getAlchemistLevel(player:getStorageValue(100405))>= potionsTable[pId].alchemistLevel then

				if  potionsTable[pId].storageId == 0 or player:getStorageValue(potionsTable[pId].questStorage) == potionsTable[pId].storageId then
					for idChoose, options in ipairs(potionsTable[pId].itemNeed) do
						if player:getItemCount(options) >= potionsTable[pId].itemQuantity[idChoose] then
							itemSet = itemSet + 1
						end
					end
					
					if itemSet == #potionsTable[pId].itemNeed then
						for i = 1, #potionsTable[pId].itemNeed do
							player:removeItem(potionsTable[pId].itemNeed[i],potionsTable[pId].itemQuantity[i])
						end
						player:removeMoneyBank(potionsTable[pId].costGp)
						
						local levelSum = player:getStorageValue(100405)
						player:setStorageValue(100405,(levelSum + potionsTable[pId].alchemistExp))
						player:addItem(potionsTable[pId].potId, 1)
						player:getPosition():sendMagicEffect(CONST_ME_CONFETTI_VERTICAL)
						player:say("You made a ".. potionsTable[pId].Name .. " potion, enjoy your magic!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
						
						local menu = ModalWindow{title = potionsTable[pId].Name,message = message[5]}
						menu:addButton("Exit")
						menu:addButton("Menu", modalInit)
						menu:sendToPlayer(player)
					else
						local menu = ModalWindow{title = potionsTable[pId].Name,message = message[4]}
						menu:addButton("Back", function(player) modalUnitPotions(player, id, pId) end)
						menu:sendToPlayer(player)
					end
				else
					local menu = ModalWindow{title = potionsTable[pId].Name,message = message[3]}
					menu:addButton("Back", function(player) modalUnitPotions(player, id, pId) end)
					menu:sendToPlayer(player)			
				end
			else
				local menu = ModalWindow{title = potionsTable[pId].Name,message = message[6]}
				menu:addButton("Back", function(player) modalUnitPotions(player, id, pId) end)
				menu:sendToPlayer(player)			
			end
		else
			local menu = ModalWindow{title = potionsTable[pId].Name,message = message[2]}
			menu:addButton("Back", function(player) modalUnitPotions(player, id, pId) end)
			menu:sendToPlayer(player)
		end
	else
		local menu = ModalWindow{title = potionsTable[pId].Name,message = message[1]}
		menu:addButton("Back", function(player) modalUnitPotions(player, id, pId) end)
		menu:sendToPlayer(player)
	end
end

function modalUnitPotions(player, id, pId)
	local convertGp = (potionsTable[pId].costGp/1000)
	local convertGp2 = (player:getMoney() + player:getBankBalance())
	
	if convertGp2 then
		convertGp2 = math.floor(convertGp2/1000)
	end
	--.. potionsTable[pId].potionDesc .. 
    local imageHtml = "<img src='" .. potionsTable[pId].potImg .. "' width='42' height='32'>".. potionsTable[pId].potionDesc ..""
	local message = "Voce selecionou a potion: ".. potionsTable[pId].Name.."!<br><br>".. imageHtml .. "<br><br><br>Nivel requerido: ".. potionsTable[pId].levelNeed.."<br>Quest: " .. potionsTable[pId].questNeed .."<br>Level de alquimia: " .. potionsTable[pId].alchemistLevel ..  "<br><br>Sao necessarios os seguintes:"
	titleWiki = {"Potions Especiais", "Resistencia a Dano", "Amplificacao de Dano"}
	local menu = ModalWindow{
        title = titleWiki[id],
        message = message
    }
    menu:addButton("Select")
	menu:addButton("Back", function(player) modalEspeciais(player,id) end)

	menu:addChoice("--------------------------------",function(player) modalPotionsMake(player, id, pId) end)
	for idChoose, options in ipairs(potionsTable[pId].itemNeed) do
		menu:addChoice(getItemName(options) .. " [" .. player:getItemCount(options) .."]/[" .. potionsTable[pId].itemQuantity[idChoose] .. "]", function(player) modalPotionsMake(player, id, pId) end)
	end
	menu:addChoice("gps: [" .. convertGp2 .. "k]/[" .. convertGp .."k]", function(player) modalPotionsMake(player, id, pId) end)	
	menu:addChoice("--------------------------------", function(player) modalPotionsMake(player, id, pId) end)	
	
    menu:sendToPlayer(player)
end


function modalEspeciais(player, id)
    local imageUrl = {"https://i.imgur.com/rNgoawW.png","https://i.imgur.com/Tav3IwB.png","https://i.imgur.com/FHUINsJ.png"}--"https://www.tibiawiki.com.br/images/8/8c/Kooldown-Aid.gif"
    local imageHtml = "<img src='" .. imageUrl[id] .. "' width='200' height='29'>"
    local imageUrl2 = "https://i.imgur.com/67qnAkx.png"
    local imageHtml2 = "<img src='" .. imageUrl2 .. "' width='100' height='100'>"
	local message = "As pocoes para criacao estao ordenadas abaixo!<br><br>Escolha sua pocao e garanta que tenha todos os ingredientes e requisitos para criar-la.<br><br>" .. imageHtml .."<br><br><br>Selecione Abaixo:"
	titleWiki = {"Potions Especiais", "Resistencia a Dano", "Amplificacao de Dano"}
	titlePotions = {"Potions Especiais", "Resistencia a Dano", "Amplificacao de Dano"}
	local menu = ModalWindow{
        title = titleWiki[id],
        message = message
    }
    menu:addButton("Select")
	menu:addButton("Back", modalInit)	
	
	for pId, options in ipairs(potionsTable) do
		if options.potionsClass == id then
			menu:addChoice(options.Name,function(player) modalUnitPotions(player,id,pId) end)
		end
	end
    menu:sendToPlayer(player)
end

function modalInit(player)
	local levelAlchemist = getAlchemistLevel(player:getStorageValue(100405))
	
	local imageUrl = "https://www.tibiawiki.com.br/images/2/28/Alchemistic_Table.gif"
    local imageHtml = "<img src='" .. imageUrl .. "' width='100' height='100'>"
    local message = "Bem vindo ao sistema de Alquimia!<br><br>A criacao de potions necessita de itens magicos, dinheiro e em alguns casos missoes.<br>Atente-se aos requisitos da potions que criara!<br>" .. imageHtml .. "<br><br><br><br><br><br>Level de Alquimia: ".. levelAlchemist .."<br>"

    local menu = ModalWindow{
        title = "Alquimia de Potions",
        message = message
    }
	menu:addButton("Select")
	menu:addButton("Exit", modalExit)
	menu:addChoice("--------------------------------", modalInit)
	menu:addChoice("Potions Especiais", function(player) modalEspeciais(player,1) end)
	menu:addChoice("Resistencia a Dano", function(player) modalEspeciais(player,2) end)
	menu:addChoice("Amplificacao de Dano", function(player) modalEspeciais(player,3) end)
	menu:addChoice("--------------------------------", modalInit)
    menu:sendToPlayer(player)
end

function talk.onSay(player, words, param)
	modalInit(player)
    return false
end

talk:separator(" ")
talk:groupType("normal")
--talk:register()