local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 366, y = 1088, z = 7 }},
	},
	idGoldenKey = 29304,
	requiredLevel = 300
}

local forgedKey = Action()

function forgedKey.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 43003 then

		if item.itemid ~= nil and item.itemid == setting.idGoldenKey then
			if player and player:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The statue won't react to your key, you must be level " .. setting.requiredLevel .. " or higher to use that.")
				return true
			end			

			toPosition:sendMagicEffect(CONST_ME_THUNDER)
			player:say("The key fits perfectly in the statue...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			item:remove(1)
			player:say("The journey through the nightmare was worth it, now you can choose a weapon...", TALKTYPE_MONSTER_SAY, false, player, setting.posTeleport[1].fromPos)
			player:say("The key crumble to dust... ", TALKTYPE_MONSTER_SAY, false, player, setting.posTeleport[1].fromPos)
		
		end
	end
	
	return false
end

forgedKey:id(29304)
forgedKey:register()
