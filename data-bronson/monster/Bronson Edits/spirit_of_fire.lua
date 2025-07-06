local mType = Game.createMonsterType("Spirit of Fire")
local monster = {}

monster.description = "a spirit of fire"
monster.experience = 4100
monster.outfit = {
	lookType = 242,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 295
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Pits of Inferno, Demon Forge, Fury Dungeon.",
}

monster.health = 4000
monster.maxHealth = 4000
monster.race = "fire"
monster.corpse = 7349
monster.speed = 110
monster.manaCost = 0

monster.changeTarget = {
	interval = 0,
	chance = 0,
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
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 5,
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Feel the heat.", yell = false },
	{ text = "I will turn you into ashes.", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 50000, maxCount = 100 },
	{ name = "gold coin", chance = 40000, maxCount = 100 },
	{ name = "burnt scroll", chance = 50000 },
	{ name = "blank rune", chance = 30000, maxCount = 2 },
	{ name = "fire sword", chance = 1400 },
	{ name = "fire axe", chance = 440 },
	{ name = "soul orb", chance = 12150 },
	{ name = "demonic essence", chance = 14500 },
	{ name = "small ruby", chance = 1250, maxCount = 2 },
	{ name = "talon", chance = 1250, maxCount = 2 },
	{ name = "devil helmet", chance = 5400 },
	{ name = "chaos mace", chance = 1000 },
	{ name = "fireborn giant armor", chance = 300 },
	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -550 },
	{ name = "firefield", interval = 2000, chance = 15, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -300, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -700, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 62,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
