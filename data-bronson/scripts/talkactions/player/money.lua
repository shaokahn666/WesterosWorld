local totalMoney = TalkAction("!money")

function totalMoney.onSay(player, words, param)
	local money = player:getMoney()
	local moneyText = ""
	if money >= 1000000 then
		moneyText = "[MONEY] You have " .. money .. " gold coins in your player."
	else
		moneyText = "[MONEY] You have " .. money .. " gold " .. (money > 1 and "coins" or "coin") .. " in your player."
	end

	if moneyText ~= "" then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, moneyText)
	end

	return true
end

totalMoney:groupType("normal")
--totalMoney:register()
