local config = {
	[VOCATION.ID.NONE] = {
		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 9596, 1 }, -- canivete
		},
	},

	[VOCATION.ID.SORCERER] = {
		items = {
			{ 20089, 1 }, -- umbral spellbook
			{ 36669, 1 }, -- eldritch rod
			{ 39165, 1 }, -- midnight tunic
			{ 21892, 1 }, -- crest 
			{ 14087, 1 }, -- grasshoper legs
			{ 44649, 1 }, -- leather boots
			{ 3572, 1 }, -- scarf
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 23373, 10 }, -- mana potion
			{ 9596, 1 }, -- canivete
		},
	},

	[VOCATION.ID.DRUID] = {
		items = {
			{ 20089, 1 }, -- spellbook
			{ 36675, 1 }, -- snakebite rod
			{ 31583, 1 }, -- magician's robe
			{ 21892, 1 }, -- mage hat
			{ 14087, 1 }, -- studded legs
			{ 40593, 1 }, -- leather boots
			{ 3572, 1 }, -- scarf
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 23373, 10 }, -- mana potion
			{ 9596, 1 }, -- canivete
		},
	},

	[VOCATION.ID.PALADIN] = {
		items = {
			{ 39160, 1 }, -- dwarven shield
			{ 39159, 1 }, -- spear
			{ 13999, 1 }, -- ranger's cloak
			{ 16111, 1 }, -- ranger legs
			{ 31617, 1 }, -- leather boots
			{ 3572, 1 }, -- scarf
			{ 29427, 1 }, -- legion helmet
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 23374, 10 }, -- health potion
			{ 237, 1 }, -- bow
			{ 25758, 50 }, -- 50 arrows
			{ 9596, 1 }, -- canivete
		},
	},

	[VOCATION.ID.KNIGHT] = {
		items = {
			{ 14000, 1 }, -- dwarven shield
			{ 30398, 1 }, -- sword
			{ 13992, 1 }, -- brass armor
			{ 31577, 1 }, -- brass helmet
			{ 13999, 1 }, -- brass legs
			{ 30394, 1 }, -- leather boots
			{ 3572, 1 }, -- scarf
		},

		container = {
			{ 39157, 1 }, -- club
			{ 20072, 1 }, --  axe
			{ 3003, 1 }, -- rope
			{ 5710, 1 }, -- light shovel
			{ 23375, 10 }, -- health potion
			{ 237, 10 }, 
			{ 9596, 1 }, -- canivete
		},
	},
}

local sendFirstItems = CreatureEvent("SendFirstItems")

function sendFirstItems.onLogin(player)
	local targetVocation = config[player:getVocation():getId()]
	if not targetVocation or player:getLastLoginSaved() ~= 0 then
		return true
	end

	if targetVocation.items then
		for i = 1, #targetVocation.items do
			player:addItem(targetVocation.items[i][1], targetVocation.items[i][2])
		end
	end

	local backpack = player:addItem(2854)
	if not backpack then
		return true
	end

	if targetVocation.container then
		for i = 1, #targetVocation.container do
			backpack:addItem(targetVocation.container[i][1], targetVocation.container[i][2])
		end
	end
	return true
end

--sendFirstItems:register()
