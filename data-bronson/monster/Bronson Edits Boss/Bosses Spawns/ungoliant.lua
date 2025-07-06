local mType = Game.createMonsterType("Ungoliant")
local monster = {}

monster.description = "Ungoliant"
monster.experience = 100000
monster.outfit = {
	lookType = 1344,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"bossesAlive",
}

monster.health = 80000
monster.maxHealth = 80000
monster.race = "blood"
monster.corpse = 35358
monster.speed = 450
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Laracna", chance = 13, interval = 4000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 20,
	{ text = "Prepare to face the powerful Ungoliant!", yell = false },
	{ text = "The Melkor aliance is better for everyone!!", yell = false },
	{ text = "SSSSSHHHHH!", yell = true },
}

monster.loot = {
	{ id = 3035, chance = 20000, maxCount = 90 }, -- platinum coin
	{ name = "small emerald", chance = 100000, maxCount = 15 },
	{ id = 7379, chance = 25350}, -- motaba wand - bruttatamer staff
	{ id = 12320, chance = 5000}, -- sweet smelling bait
	{ name = "medusa shield", chance = 19320},
	{ id = 814, chance = 12000}, -- terra amulet
	{ id = 8054, chance = 2600}, -- earthborn titan armor
	{ name = "boots of haste", chance = 12000},
	{ id = 5953, chance = 50000}, -- marijuana
	{ id = 8052, chance = 950}, -- pestilence omega
	{ id = 5879, chance = 100000, maxCount = 15 }, -- spider silk
	{ id = 3370, chance = 1000 }, -- knight armor
	{ id = 3049, chance = 15333 }, -- stealth ring
	{ id = 3053, chance = 15333 }, -- time ring
	{ id = 8029, chance = 250 }, -- silkweaver bow
}

monster.attacks = {
	{ name = "melee", interval = 1750, chance = 100, minDamage = -360, maxDamage = -680 },
	{ name = "combat", interval = 1750, chance = 65, type = COMBAT_EARTHDAMAGE, minDamage = -350, maxDamage = -650, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "condition", type = CONDITION_POISON, interval = 1000, chance = 15, minDamage = -75, maxDamage = -75, condition = { type = CONDITION_POISON, totalDamage = 1500, interval = 1000 } },
	{ name = "speed", interval = 11000, chance = 50, speedChange = -700, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREENSMOKE, target = true, duration = 10000 },
	{ name = "poisonfield", interval = 1800, chance = 25, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 81,
	armor = 115,
	mitigation = 4.54,
	{ name = "combat", interval = 3200, chance = 20, type = COMBAT_HEALING, minDamage = 225, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, speedChange = 200, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
