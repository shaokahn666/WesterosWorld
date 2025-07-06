local mType = Game.createMonsterType("Mancubus")
local monster = {}

monster.description = "a mancubus"
monster.experience = 4200
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 55
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Deepness of Cyclops 2, Anfallas Giants Hell,",
}

monster.health = 7000
monster.maxHealth = 7000
monster.race = "blood"
monster.corpse = 5999
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 60,
	damage = 40,
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
	staticAttackChance = 70,
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

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Tiny! Like a little girl!", yell = false },
	{ text = "Do you feel nostalgia?", yell = false },
}

monster.loot = {
	{ id = 2893, chance = 100 }, -- amphora
	{ name = "platinum coin", chance = 30000, maxCount = 3 },
	{ name = "war axe", chance = 50 },
	{ name = "dark armor", chance = 2070 },
	{ name = "great health potion", chance = 400 },
	{ name = "battle stone", chance = 1000 },
	{ name = "crowbar", chance = 15000 },
	{ id = 3116, chance = 7000 }, -- big bone
	{ name = "demon armor", chance = 20, unique = true },
	{ name = "horned helmet", chance = 80, unique = true },
	{ name = "giant sword", chance = 300 },
	{ name = "meat", chance = 30000, maxCount = 6 },
	{ name = "gold coin", chance = 50000, maxCount = 80 },
	{ name = "gold coin", chance = 50000, maxCount = 80 },
	{ name = "gold coin", chance = 50000, maxCount = 80 },
	{ name = "small amethyst", chance = 2580, maxCount = 5 },
	{ name = "double axe", chance = 1000 },
	{ name = "behemoth claw", chance = 860, maxCount = 2},
	{ name = "perfect behemoth fang", chance = 1090, maxCount = 1 },

	
	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -80, maxDamage = -200 },
	{ name = "combat", interval = 1500, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
	{ name = "combat", interval = 3700, chance = 33, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -250, range = 1, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 50,
	mitigation = 1.74,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 500, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
