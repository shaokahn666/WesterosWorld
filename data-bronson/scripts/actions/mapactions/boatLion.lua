local setting = {
	-- At what level can do the quest?
	posTeleport = {
		{fromPos = { x = 166, y = 760, z = 7 }}, {toPos = { x = 101, y = 1445, z = 7 }},
	},
	
}

local boatLion = Action()

function boatLion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
	if player:getLevel() < 250 then
		player:say("First, you need a invitation for travel to Lions. Second, some more levels...", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		return false
	end
	
	if item.itemid ~= nil then

		if item.itemid == 4981 then
			player:say("The journey to Lions Basement are exausting! I don't want to fight anymore!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:teleportTo(setting.posTeleport[2].toPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
		
		end
		
		if  item.itemid == 1764 then
			toPosition:sendMagicEffect(CONST_ME_MAGIC_POWDER)
			player:teleportTo(setting.posTeleport[1].fromPos)
			player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
			player:say("A long trip for a tiny boat! I had luck to don't get any bad weather...!", TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
		
		end
		
	end
	
	return false
end

boatLion:aid(43013)
boatLion:register()
