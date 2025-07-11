local mType = Game.createMonsterType("Trintaecinco")
local monster = {}

monster.description = "a Trintaecinco"
monster.experience = 597600
monster.outfit = {
	lookType = 129,
	lookHead = 79,
	lookBody = 77,
	lookLegs = 76,
	lookFeet = 58,
	lookAddons = 2,
	lookMount = 0,
}

monster.raceId = 222
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Around Dark Cathedral, Tiquanda Bandit Caves, the Outlaw Camp, Tyrsung, Yalahar and Nargor.",
}

monster.health = 1
monster.maxHealth = 1
monster.race = "blood"
monster.corpse = 18226
monster.speed = 88
monster.manaCost = 390

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You saw something you shouldn't!", yell = false },
	{ text = "I will silence you forever!", yell = false },
}

monster.loot = {
	{ id = 2920, chance = 30200, maxCount = 2 }, -- torch
	{ name = "gold coin", chance = 80000, maxCount = 10 },
	{ id = 3264, chance = 5000 }, -- sword
	{ name = "knife", chance = 9920 },
	{ name = "combat knife", chance = 4400 },
	{ name = "short sword", chance = 10000 },
	{ name = "leather helmet", chance = 10050 },
	{ name = "leather legs", chance = 14840 },
	{ name = "ham", chance = 10200 },
	{ id = 7397, chance = 110 }, -- deer trophy
	{ name = "raspberry", chance = 5000, maxCount = 5 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -5, maxDamage = -40 },
}

monster.defenses = {
	defense = 10,
	armor = 8,
	mitigation = 0.28,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
