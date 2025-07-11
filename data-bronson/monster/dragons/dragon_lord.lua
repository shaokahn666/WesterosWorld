local mType = Game.createMonsterType("Dragon Lord")
local monster = {}

monster.description = "a dragon lord"
monster.experience = 2100
monster.outfit = {
	lookType = 39,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}



monster.raceId = 39
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Ankrahmun Dragon Lairs, Banshee Quest final room (level 60+ to open the door), \z
	Deeper Cyclopolis past the Dragon Spawn (level 30+ to open the door), Draconia, Edron Dragon Lair, \z
	Fibula Dungeon (level 50+ to open the door), Maze of Lost Souls (level 30+ to open the door), \z
	Pits of Inferno Dragon Lair, Dragon Lord hole in Plains of Havoc, Carlin Dragon Lair, \z
	Thais Dragon Lair, Goroma Dragon Lairs, Hot Spot, Venore Dragon Lair, Arena and Zoo Quarter(Yalahar), \z
	beneath Fenrock, Darashia Dragon Lair, Razachai, Dragonblaze Peaks, Ferumbras Citadel, Fury Dungeon, \z
	Lower Spike, Krailos Steppe.",
}

monster.health = 1900
monster.maxHealth = 1900
monster.race = "blood"
monster.corpse = 5984
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 300,
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
	{ text = "YOU WILL BURN!", yell = true },
	{ text = "ZCHHHHHHH", yell = true },
}

monster.loot = {
	{ name = "gold coin", chance = 95300, maxCount = 237 },
	{ name = "dragon ham", chance = 79790, maxCount = 2 },
	{ name = "green mushroom", chance = 12030 },
	{ id = 2842, chance = 9590 }, -- gemmed book
	{ name = "royal spear", chance = 9380, maxCount = 3 },
	{ name = "power bolt", chance = 5920, maxCount = 7 },
	{ name = "small sapphire", chance = 5590 },
	{ id = 3051, chance = 4550 }, -- energy ring
	{ name = "golden mug", chance = 3310 },
	{ name = "red dragon scale", chance = 1940 },
	{ name = "red dragon leather", chance = 1150 },
	{ name = "strong health potion", chance = 800 },
	{ name = "life crystal", chance = 650 },
	{ name = "strange helmet", chance = 520 },
	{ name = "tower shield", chance = 410 },
	{ name = "fire sword", chance = 350 },
	{ name = "royal helmet", chance = 260 },
	{ name = "dragon slayer", chance = 220 },
	{ name = "dragon lord trophy", chance = 130 },
	{ name = "dragon scale mail", chance = 90 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -230 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -220, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 22, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -270, length = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 34,
	armor = 34,
	mitigation = 1.29,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 57, maxDamage = 93, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
