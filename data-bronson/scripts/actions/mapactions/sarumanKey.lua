local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1653, y = 378, z = 6 }},
	},
	idGoldenKey = 2971,
	requiredLevel = 200
}

local crystal = Action()

function crystal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 43001 then

		if item.itemid ~= nil and item.itemid == setting.idGoldenKey then
			if player and player:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Saruman rejected your key, you must be level " .. setting.requiredLevel .. " or higher.")
				return true
			end			

			toPosition:sendMagicEffect(CONST_ME_HOLYDAMAGE)
			player:say("You embrace the power of Saruman...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			item:remove(1)
			player:say("Now is the time to Saruman choose a reward for you... ", TALKTYPE_MONSTER_SAY, false, player, setting.posTeleport[1].fromPos)
			player:say("The key crumble to dust... ", TALKTYPE_MONSTER_SAY, false, player, setting.posTeleport[1].fromPos)
		
		end
	end
	
	return false
end

crystal:id(2971)
crystal:register()
