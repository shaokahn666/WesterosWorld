local mType = Game.createMonsterType("Deepling Master Summon")
local monster = {}

monster.name = "Deepling Master"
monster.description = "a deepling master"
monster.experience = 0
monster.outfit = {
	lookType = 443,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "blood"
monster.corpse = 13771
monster.speed = 670
monster.manaCost = 0

monster.faction = FACTION_DEEPLING
monster.enemyFactions = { FACTION_PLAYER, FACTION_DEATHLING }

monster.changeTarget = {
	interval = 4000,
	chance = 25,
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
	canPushCreatures = true,
	staticAttackChance = 60,
	targetDistance = 3,
	runHealth = 1000,
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
	{ text = "Jey Obu giotja!!", yell = false },
	{ text = "Mmmmmoooaaaaaahaaa!!", yell = false },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -452, effect = CONST_ME_DRAWBLOOD },
	{ name = "combat", interval = 2000, chance = 100, range = 7, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -500, shootEffect = CONST_ANI_ENERGY,  effect = CONST_ME_BIGCLOUDS, target = true },
	{ name = "speed", interval = 1000, chance = 20, speedChange = -200, radius = 100, effect = CONST_ME_POFF, target = true, duration = 3000 },
	{ name = "combat", interval = 2000, chance = 100, range = 7, type = COMBAT_ICEDAMAGE, minDamage = -400, maxDamage = -500, shootEffect = CONST_ANI_ICE,  effect = CONST_ME_GIANTICE, target = true },
	{ name = "combat", interval = 2000, chance = 30, length = 8, spread = 0, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -900, effect = CONST_ME_MORTAREA, target = false },
	{ name = "speed", interval = 2000, chance = 37, range = 7, speedChange = -400, effect = CONST_ME_GROUNDSHAKER, duration = 20000 },
}

monster.defenses = {
	defense = 25,
	armor = 42,
	mitigation = 1.29,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 90 },
	{ type = COMBAT_HOLYDAMAGE, percent = 25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
