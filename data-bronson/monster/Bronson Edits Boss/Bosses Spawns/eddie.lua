local mType = Game.createMonsterType("Eddie")
local monster = {}

monster.description = "Eddie"
monster.experience = 80000
monster.outfit = {
	lookType = 85,
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

monster.health = 55000
monster.maxHealth = 55000
monster.race = "undead"
monster.corpse = 6025
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 5500,
	chance = 40,
}

monster.bosstiary = {
	bossRaceId = 85,
	bossRace = RARITY_BANE,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	level = 5,
	color = 206,
}

monster.summon = {
	maxSummons = 10,
	summons = {
		{ name = "crypt shambler", chance = 100, interval = 2200, count = 4 },
		{ name = "mummy", chance = 100, interval = 2510, count = 4 },
		{ name = "demon skeleton", chance = 100, interval = 1750, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "The evil that men do lives on!", yell = false },
	{ text = "Eddie is gonna get you no matter how far!", yell = false },
	{ text = "Show them no fear! Show them no pain!", yell = false },
	{ text = "Enter the risen Osiris", yell = false },
}

monster.loot = {
	{ name = "ravager's axe", chance = 2500 },
	{ name = "orb", chance = 40000 },	
	{ name = "phoenix shield", chance = 1300 },
	{ name = "dark lord's cape", chance = 2500 },
	{ name = "necrotic rod", chance = 38000 },	
	{ id = 3574, chance = 47000 }, -- mystic turban
	{ name = "terra legs", chance = 15000 },	
	{ name = "aghanim boots", chance = 12000 },	
	{ name = "small ruby", chance = 24500, maxCount = 12 }, -- emerald
	{ name = "small emerald", chance = 24500, maxCount = 12 }, -- emerald
	{ name = "small amethyst", chance = 24500, maxCount = 12 }, -- amethyst
	{ id = 3231, chance = 38000 },	
	{ name = "holy scarab", chance = 3000 },	
	{ name = "gold coin", chance = 100000, maxCount = 90 },
	{ name = "gold coin", chance = 100000, maxCount = 80 },
	{ name = "gold coin", chance = 100000, maxCount = 65 },	
	{ name = "Green Bandage", chance = 100000, maxCount = 1 },
	{ name = "Green Bandage", chance = 100000, maxCount = 1 },	
	{ name = "Gauze Bandage", chance = 100000, maxCount = 1 },	
	{ name = "Green Bandage", chance = 100000, maxCount = 1 },	
	{ name = "Gauze Bandage", chance = 100000, maxCount = 3 },	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -800 },
	{ name = "combat", interval = 2750, chance = 35, type = COMBAT_LIFEDRAIN, minDamage = -400, maxDamage = -700, radius = 4, effect = CONST_ME_MAGIC_RED, target = false },		
	{ name = "combat", interval = 2320, chance = 65, type = COMBAT_DEATHDAMAGE, minDamage = -600, maxDamage = -800, radius = 8, effect = CONST_ME_MORTAREA, target = false },
	{ name = "condition", type = CONDITION_POISON, interval = 2100, chance = 20, minDamage = -85, maxDamage = -85, range = 8, shootEffect = CONST_ANI_POISONARROW, condition = { type = CONDITION_POISON, totalDamage = 1700, interval = 500 } },
	{ name = "combat", interval = 1900, chance = 99, type = COMBAT_FIREDAMAGE, minDamage = -450, maxDamage = -750, range = 7, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_EXPLOSIONHIT, target = false },	
	{ name = "speed", interval = 2350, chance = 20, speedChange = -600, range = 7, effect = CONST_ME_GREEN_RINGS, target = false, duration = 5000 },
}

monster.defenses = {
	defense = 75,
	armor = 60,
	mitigation = 7.18,	
	{ name = "combat", interval = 500, chance = 100, type = COMBAT_HEALING, minDamage = 250, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 60 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 95 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
