local mType = Game.createMonsterType("abyssal cursed stone")
local monster = {}

monster.description = "an abyssal cursed stone"
monster.experience = 2150
monster.outfit = {
	lookType = 67,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 67
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 1000,
	FirstUnlock = 25,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 2,
	Occurrence = 0,
	Locations = "Maze of Lost Souls, in and around Ashta daramai, Formorgar Mines, \z
		Mad Technomancer room, Dark Cathedral, Demona, Goroma, Tarpit Tomb, Peninsula Tomb, \z
		Deeper Banuta, Forbidden Lands, Beregar Mines, Farmine Mines, Drillworm Caves, 2 caves on Hrodmir, \z
		Orc Fortress (single spawn) and Medusa Tower.",
}

monster.health = 3500
monster.maxHealth = 3500
monster.race = "undead"
monster.corpse = 6005
monster.speed = 90
monster.manaCost = 590

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
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "small stone", chance = 13890, maxCount = 4 },
	{ name = "gold coin", chance = 90000, maxCount = 40 },
	{ id = 3050, chance = 5070 }, -- power ring
	{ name = "iron ore", chance = 1980 },
	{ name = "ancient stone", chance = 1020 },
	{ name = "shiny stone", chance = 760 },
	{ name = "headchopper", chance = 200 },
	{ name = "aegis armor", chance = 100 },
	{ name = "warrior helmet", chance = 500 },
	{ name = "plate legs", chance = 800 },
	{ name = "sulphurous stone", chance = 10370 },
	{ name = "piece of marble rock", chance = 380 },
}

monster.attacks = {
	{ name = "melee", interval = 1900, chance = 100, minDamage = -72, maxDamage = -160 },

{ name = "combat", interval = 2000, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = 100, maxDamage = -200, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
}
monster.defenses = {
	defense = 40,
	armor = 50,
	mitigation = 0.64,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 95 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 95 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 95 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 95 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
