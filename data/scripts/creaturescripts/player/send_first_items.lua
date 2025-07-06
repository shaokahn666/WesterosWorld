local config = {
	[VOCATION.ID.NONE] = {
		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
		},
	},

	[VOCATION.ID.SORCERER] = {
		items = {
			{ 3059, 1 }, -- spellbook
			{ 3074, 1 }, -- wand of vortex
			{ 7991, 1 }, -- magician's robe
			{ 7992, 1 }, -- mage hat
			{ 3362, 1 }, -- studded legs
			{ 3552, 1 }, -- leather boots
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 268, 1 }, -- mana potion
			{ 3723, 5}, -- white mushroom
		},
	},

	[VOCATION.ID.DRUID] = {
		items = {
			{ 3059, 1 }, -- spellbook
			{ 3066, 1 }, -- snakebite rod
			{ 7991, 1 }, -- magician's robe
			{ 7992, 1 }, -- mage hat
			{ 3362, 1 }, -- studded legs
			{ 3552, 1 }, -- leather boots
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 268, 1 }, -- mana potion
			{ 3723, 5}, -- white mushroom
		},
	},

	[VOCATION.ID.PALADIN] = {
		items = {
			{ 3430, 1 }, -- copper shield
			{ 3277, 1 }, -- spear
			{ 3354, 1 }, -- brass helmet
			{ 3571, 1 }, -- ranger's cloak
			{ 8095, 1 }, -- ranger legs
			{ 3552, 1 }, -- leather boots
		},

		container = {
			{ 35562, 1 }, -- quiver
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 266, 1 }, -- health potion
			{ 3350, 1 }, -- bow
			{ 3447, 50 }, -- 50 arrows
			{ 3723, 5}, -- white mushroom
		},
	},

	[VOCATION.ID.KNIGHT] = {
		items = {
			{ 3430, 1 }, -- copper shield
			{ 7774, 1 }, -- jagged sword
			{ 3359, 1 }, -- brass armor
			{ 3354, 1 }, -- brass helmet
			{ 3372, 1 }, -- brass legs
			{ 3552, 1 }, -- leather boots
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 266, 1 }, -- health potion
			{ 3723, 5}, -- white mushroom
		},
	},
	
	[VOCATION.ID.BARBARIAN] = {
		items = {
			{ 3430, 1 }, -- copper shield
			{ 7773, 1 }, -- steel axe
			{ 3359, 1 }, -- brass armor
			{ 3354, 1 }, -- brass helmet
			{ 3372, 1 }, -- brass legs
			{ 3552, 1 }, -- leather boots
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 266, 1 }, -- health potion
			{ 3723, 5}, -- white mushroom
		},
	},
	
		[VOCATION.ID.MINER] = {
		items = {
			{ 3430, 1 }, -- copper shield
			{ 3327, 1 }, -- daramanian mace
			{ 3359, 1 }, -- brass armor
			{ 3354, 1 }, -- brass helmet
			{ 3372, 1 }, -- brass legs
			{ 3552, 1 }, -- leather boots
		},

		container = {
			{ 3003, 1 }, -- rope
			{ 3457, 1 }, -- shovel
			{ 266, 1 }, -- health potion
			{ 3723, 5}, -- white mushroom
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

sendFirstItems:register()
