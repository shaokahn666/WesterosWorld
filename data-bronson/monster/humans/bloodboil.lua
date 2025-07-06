local mType = Game.createMonsterType("Bloodboil")
local monster = {}

monster.description = "a bloodboil"
monster.experience = 13500
monster.outfit = {
	lookType = 130,
	lookHead = 115,
	lookBody = 97,
	lookLegs = 128,
	lookFeet = 79,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 10
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Demona, Ghostland (Banshee Quest area), Temple of Xayepocax, Oasis Tomb, Kharos, Magician Quarter, \z
		beneath Fenrock, The Arcanum.",
}

monster.health = 15000
monster.maxHealth = 15000
monster.race = "blood"
monster.corpse = 4240
monster.speed = 260
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 20,
	damage = 20,
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
	targetDistance = 3,
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
		{ name = "hellfire fighter", chance = 40, interval = 1000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "I never will fall for a little rat like you!", yell = false },
	{ text = "Do you mind, if i ... turn you into a dead body?!", yell = false },
	{ text = "Ezequiel 23:20!", yell = false },
}

monster.loot = {
	{ name = "divine plate", chance = 60 },
	{ name = "magma legs", chance = 150 },	
	{ name = "blue robe", chance = 250 },	
	{ id = 3006, chance = 80 },	
	{ id = 3057, chance = 300 },		
	{ name = "platinum coin", chance = 30000, maxCount = 3 },	
	{ name = "gold coin", chance = 80000, maxCount = 100 },	
	{ id = 3051, chance = 1000 },
	{ name = "great mana potion", chance = 4760 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -120, maxDamage = -200 },
	{ name = "speed", interval = 5400, chance = 25, speedChange = -600, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 4000 },
	{ name = "combat", interval = 1800, chance = 80, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -750, range = 7, radius = 1, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2400, chance = 50, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -780, range = 7, radius = 6, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true },	
}

monster.defenses = {
	defense = 20,
	armor = 33,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 95 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
