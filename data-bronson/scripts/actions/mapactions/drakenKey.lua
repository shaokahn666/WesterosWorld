local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 716, y = 1573, z = 8 }},
	},
	idGoldenKey = 27267,
	requiredLevel = 250
}

local forgedKey = Action()

function forgedKey.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 43002 then

		if item.itemid ~= nil and item.itemid == setting.idGoldenKey then
			if player and player:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Evancing rejected your key, you must be level " .. setting.requiredLevel .. " or higher.")
				return true
			end			

			toPosition:sendMagicEffect(CONST_ME_HITBYFIRE)
			player:say("The forged key fits perfectly in the statue...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:say("You feel a strange magic in your veins...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			item:remove(1)
			player:say("The Lord of Drakens are permitting you to choose a reward... ", TALKTYPE_MONSTER_SAY, false, player, setting.posTeleport[1].fromPos)
			player:say("The key crumble to dust... ", TALKTYPE_MONSTER_SAY, false, player, setting.posTeleport[1].fromPos)
		
		end
	end
	
	return false
end

forgedKey:id(27267)
forgedKey:register()
