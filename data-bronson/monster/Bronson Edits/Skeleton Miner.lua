local mType = Game.createMonsterType("Skeleton Miner")
local monster = {}

monster.description = "a skeleton miner"
monster.experience = 185
monster.outfit = {
	lookType = 232,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 283
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Pits of Inferno, Formorgar Mines, Helheim, Roshamuul Prison and in The Arcanum Part of the Inquisition quest, Oramond Fury Dungeon",
}

monster.health = 230
monster.maxHealth = 230
monster.race = "undead"
monster.corpse = 6309
monster.speed = 190
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 15,
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 30,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
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
	{ text = "Mouuuurn meeee!", yell = false },
	{ text = "Forgive Meee!", yell = false },
	{ text = "Help meee!", yell = false },
}

monster.loot = {
	{ name = "ruby necklace", chance = 1500 },
	{ name = "white pearl", chance = 3000, maxCount = 3 },
	{ name = "black pearl", chance = 3500, maxCount = 3 },
	{ name = "gold coin", chance = 100000, maxCount = 198 },
	{ name = "stone skin amulet", chance = 2780 },
	{ name = "blank rune", chance = 35250, maxCount = 3 },
	{ name = "skull staff", chance = 850 },
	{ name = "amulet of loss", chance = 200 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 45, maxDamage = -90 },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -10, maxDamage = -50, length = 3, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -800, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 4000 },
}

monster.defenses = {
	defense = 30,
	armor = 28,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 1 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
