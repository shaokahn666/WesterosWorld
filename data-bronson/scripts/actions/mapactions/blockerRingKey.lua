local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 1305, y = 1359, z = 1 }},
	},
	idGoldenKey = 28476,
	requiredLevel = 200,
	posElementals = {CONST_ME_HITBYFIRE, CONST_ME_HITBYPOISON, CONST_ME_ENERGYHIT, CONST_ME_ICEATTACK},
	posMagic = {
		{fromPos = { x = 1307, y = 1357, z = 1 }},
		{fromPos = { x = 1306, y = 1357, z = 1 }},
		{fromPos = { x = 1304, y = 1357, z = 1 }},
		{fromPos = { x = 1303, y = 1357, z = 1 }},
	},	
}

local crystal = Action()

function crystal.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if target.uid == 43008 then

		if item.itemid ~= nil and item.itemid == setting.idGoldenKey then
			if player and player:getLevel() < setting.requiredLevel then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The tree rejected your key, you must be level " .. setting.requiredLevel .. " or higher.")
				return true
			end			

			toPosition:sendMagicEffect(CONST_ME_HOLYDAMAGE)
			player:say("You was recognized as a True Hero for Minas...", TALKTYPE_MONSTER_SAY, false, player, toPosition)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:teleportTo(setting.posTeleport[1].fromPos)
			item:remove(1)
			player:say("The key crumble to dust... ", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			for i = 1, #setting.posElementals do
				Position(setting.posMagic[i].fromPos):sendMagicEffect(setting.posElementals[i])
			end			
		
		end
	end
	
	return false
end

crystal:id(28476)
crystal:register()
