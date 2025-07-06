local fragsRemove = TalkAction("!fragremove")

function queryRemovefrag(playerId)
	print(playerId)
	if playerId then
		local queryTest = string.format("SELECT * FROM player_kills WHERE player_id = %d", playerId)
		local queryStore = db.storeQuery(queryTest)
		local bossId = Result.getNumber(queryStore,"player_id")
		print(bossId)
		local updateQuery = string.format("UPDATE player_kills SET time = 1 WHERE player_id = %d", playerId)
		
        if not db.query(updateQuery) then
            print("[ERROR] Failed to update player_kills for player ID: " .. playerId)
        end
		
	end
end
	
function fragsRemove.onSay(player, words, param)

	local exhaustion = player:getExhaustion("talkactions")
	if exhaustion > 0 then
		player:sendCancelMessage("You're exhausted and must wait " .. exhaustion .. " " .. (exhaustion > 1 and "seconds" or "second") .. " to use the command again.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return true
	end

	player:setExhaustion("talkactions", 5)

	if player then
		local playerId = player:getGuid()
    	-- Avisa no broadcast que o player tirou skull, se não quiser só remover a linha
        Game.broadcastMessage('Player: '.. player:getName() ..' just removed your skull', MESSAGE_GAME_HIGHLIGHT)
        player:setSkull(SKULL_NONE)
        player:setSkullTime(0)
        player:getPosition():sendMagicEffect(50)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You frags and skull have been cleaned, automatic relogin in 3 seconds!")
		addEvent(function()
			local player = Player(playerId)
			if not player then
				return false
			end

			player:remove()
		end, 3000)
		
		addEvent(queryRemovefrag, 3500, playerId)
		
		
		
	end

	return true
end

fragsRemove:groupType("normal")
--fragsRemove:register()
