local mType = Game.createMonsterType("Robin Kid")
local monster = {}

monster.description = "a robin kid"
monster.experience = 5000
monster.outfit = {
	lookType = 116,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 116
monster.Bestiary = {
	class = "Mammal",
	race = BESTY_RACE_MAMMAL,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "In Banuta, northeast of Port Hope, Arena and Zoo Quarter.",
}

monster.health = 2440
monster.maxHealth = 2440
monster.race = "blood"
monster.corpse = 6043
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 200,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Ungh! Ungh!", yell = false },
	{ text = "Hugah!", yell = false },
	{ text = "Huaauaauaauaa!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 40 },
	{ name = "coconut", chance = 3000, maxCount = 2 },	
	{ name = "banana", chance = 10000, maxCount = 10 },
	{ name = "ape fur", chance = 7000, maxCount = 5 },
	{ name = "plate armor", chance = 520 },
	{ name = "protection amulet", chance = 990 },
	{ name = "dwarven armor", chance = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -35, maxDamage = -70 },
}

monster.defenses = {
	defense = 20,
	armor = 18,
	mitigation = 0.36,
	{ name = "speed", interval = 7000, chance = 40, speedChange = 300, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 40 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
