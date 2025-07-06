local mType = Game.createMonsterType("Terminator")
local monster = {}

monster.description = "a terminator"
monster.experience = 10000
monster.outfit = {
	lookType = 326,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 533
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Factory Quarter.",
}

monster.health = 13000
monster.maxHealth = 13000
monster.race = "undead"
monster.corpse = 9092
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 50,
	health = 10,
	damage = 20,
	random = 20,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
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
	level = 3,
	color = 180,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Terminator initialized!", yell = false },
	{ text = "Hasta la vista... baby!", yell = false },
}

monster.loot = {
	{ id = 3035, chance = 10000, maxCount = 4 }, -- gold coin
	{ id = 5880, chance = 1920 }, -- iron ore
	{ id = 9654, chance = 250 }, -- War crystal
	{ id = 3366, chance = 40 }, -- MPA
	{ id = 3369, chance = 600 }, -- warrior helmet
	{ id = 3364, chance = 40 }, -- Golden Legs
	{ id = 12801, chance = 40 }, -- golden can of oil
	{ id = 3554, chance = 420 }, -- steel boots
	{ id = 3296, chance = 200 }, -- warlord sword
	{ id = 3030, chance = 1000, maxCount = 5 }, -- small ruby
	
}

monster.attacks = {
	{ name = "melee", interval = 1750, chance = 60, minDamage = -350, maxDamage = -550 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_ENERGYDAMAGE, minDamage = -200, maxDamage = -400, range = 7, shootEffect = CONST_ANI_ENERGY, effect =  CONST_ME_YELLOW_ENERGY_SPARK, target = true  },
	{ name = "combat", interval = 2320, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -400, range = 7, shootEffect =  CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_HITBYFIRE, target = true  },
	{ name = "combat", interval = 1810, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -200, maxDamage = -400, range = 7, shootEffect =  CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 0,
	armor = 0,
	mitigation = 1.18,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 100, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "combat", interval = 2000, chance = 95, type = COMBAT_HEALING, minDamage = 100, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 80 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 70 },
	{ type = COMBAT_MANADRAIN, percent = 70 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = 80 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
