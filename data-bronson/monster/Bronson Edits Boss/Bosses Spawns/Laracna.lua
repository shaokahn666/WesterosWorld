local mType = Game.createMonsterType("Laracna")
local monster = {}

monster.description = "Laracna"
monster.experience = 15000
monster.outfit = {
	lookType = 208,
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

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 5977
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 15,
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
		{ name = "giant spider", chance = 13, interval = 4000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 20,
	{ text = "I see a poor adventurer inside my cave!!!", yell = false },
	{ text = "I will suck your blood with a straw!!", yell = false },
	{ text = "SSSSSHHHHH!", yell = true },
}

monster.loot = {
	{ id = 3035, chance = 20000, maxCount = 25 }, -- platinum coin
	{ name = "small emerald", chance = 100000, maxCount = 10 },
	{ name = "snakebite rod", chance = 100000},	
	{ name = "medusa shield", chance = 2000},	
	{ id = 3021, chance = 2000}, -- starlight amulet
	{ id = 3041, chance = 2000}, -- blue gem
	{ name = "knight axe", chance = 7000},
	{ name = "boots of haste", chance = 2000},
	{ id = 5953, chance = 20000}, -- marijuana
	{ id = 3035, chance = 100000, maxCount = 10 }, -- platinum coin
	{ id = 5879, chance = 100000 }, -- spider silk
	{ id = 3370, chance = 2000 }, -- knight armor
	{ id = 3049, chance = 15333 }, -- stealth ring
	{ id = 3053, chance = 15333 }, -- time ring
}

monster.attacks = {
	{ name = "melee", interval = 1950, chance = 100, minDamage = -240, maxDamage = -480 },
	{ name = "combat", interval = 1750, chance = 32, type = COMBAT_EARTHDAMAGE, minDamage = -250, maxDamage = -350, range = 7, shootEffect = CONST_ANI_POISONARROW, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "condition", type = CONDITION_POISON, interval = 2150, chance = 20, minDamage = -30, maxDamage = -30, condition = { type = CONDITION_POISON, totalDamage = 600, interval = 4000 } },	
	{ name = "speed", interval = 6000, chance = 25, speedChange = -800, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false, duration = 5000 },
	{ name = "poisonfield", interval = 1000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 61,
	armor = 85,
	mitigation = 2.54,
	{ name = "combat", interval = 500, chance = 100, type = COMBAT_HEALING, minDamage = 50, maxDamage = 70, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, speedChange = 100, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
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
