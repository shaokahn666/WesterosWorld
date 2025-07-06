local mType = Game.createMonsterType("Istari Follower")
local monster = {}

monster.description = "a istari follower"
monster.experience = 12500
monster.outfit = {
	lookType = 309,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
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

monster.health = 14000
monster.maxHealth = 14000
monster.race = "blood"
monster.corpse = 18269
monster.speed = 370
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 900,
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
		{ name = "stone golem", chance = 10, interval = 2000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Muahahaha!!!", yell = false },
	{ text = "To the GLORY of ISTARI!!!", yell = false },
	{ text = "We believe in a better world... without you!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 35000, maxCount = 89 },
	{ name = "gold coin", chance = 35000, maxCount = 89 },
	{ id = 3334, chance = 150 }, -- pharaoh sword
	{ name = "blue robe", chance = 500 },
	{ id = 8051, chance = 25 }, -- voltage armor
	{ name = "skull staff", chance = 800 },
	{ id = 3046, chance = 3000 }, -- magic light wand
	{ name = "small sapphire", chance = 950, maxCount = 8 },
	{ id = 3509, chance = 10000 }, -- inkwell
	{ id = 3006, chance = 15 }, -- ring of the sky
	{ id = 3051, chance = 750 }, -- energy ring
	{ name = "stone skin amulet", chance = 330 },
	{ name = "golden armor", chance = 40 },
	{ name = "great mana potion", chance = 1000 },
	{ name = "great health potion", chance = 1000 },
}

monster.attacks = {
	{ name = "melee", interval = 1650, chance = 100, minDamage = -550, maxDamage = -850 },
	{ name = "speed", interval = 5400, chance = 25, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 4000 },
	{ name = "combat", interval = 2750, chance = 50, type = COMBAT_MANADRAIN, minDamage = -180, maxDamage = -300, range = 7, target = false, effect = CONST_ME_MAGIC_BLUE },
	{ name = "firefield", interval = 2230, chance = 33, range = 3, radius = 2, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 1720, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -180, maxDamage = -300, range = 7,  radius = 2, target = false, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_MAGIC_RED},
	{ name = "combat", interval = 2320, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, range = 7, shootEffect = CONST_ANI_ENERGY, target = true },
	{ name = "combat", interval = 1800, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -270, maxDamage = -600, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 2550, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -540, maxDamage = -900, length = 8, spread = 0, effect = CONST_ME_ENERGYAREA, target = false },
	
}

monster.defenses = {
	defense = 20,
	armor = 33,
	mitigation = 1.32,
	{ name = "combat", interval = 4200, chance = 20, type = COMBAT_HEALING, minDamage = 190, maxDamage = 455,  target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 70 },
	{ type = COMBAT_LIFEDRAIN, percent = 70 },
	{ type = COMBAT_MANADRAIN, percent = 70 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 60 },
	{ type = COMBAT_HOLYDAMAGE, percent = 35},
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
