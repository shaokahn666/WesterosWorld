local mType = Game.createMonsterType("Olog-Hai")
local monster = {}

monster.description = "Olog-Hai"
monster.experience = 2500
monster.outfit = {
	lookType = 55,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"bossesAlive",
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
	Locations = "Cyclopolis, deepest part of Tarpit Tomb after the flame, Forbidden Lands, Vandura Mountain, \z
		Deeper Banuta, Serpentine Tower (unreachable), deep into the Formorgar Mines, Arena and Zoo Quarter, \z
		The Dark Path, Lower Spike, Chyllfroest, Medusa Tower and Underground Glooth Factory (west side).",
}

monster.health = 35000
monster.maxHealth = 35000
monster.race = "blood"
monster.corpse = 5999
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 8000,
	chance = 8,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
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
	{ text = "Vou esmaga-lo!", yell = false },
	{ text = "Tente correr inseto!", yell = false },
	{ text = "Hahaha, isso eh tudo?!", yell = false },
}

monster.loot = {
	{ id = 2893, chance = 100 }, -- amphora
	{ name = "horned helmet", chance = 800 },
	{ name = "gold coin", chance = 100000, maxCount = 200 },
	{ name = "small emerald", chance = 5000, maxCount = 5 },
	{ name = "platinum coin", chance = 59800, maxCount = 5 },
	{ name = "strange symbol", chance = 750 },
	{ id = 3116, chance = 670 }, -- big bone
	{ name = "tower shield", chance = 4000 },
	{ name = "aegis armor", chance = 900 },
	{ name = "giant sword", chance = 2500 },
	{ name = "war hammer", chance = 7800 },
	--{ name = "starlight amulet", chance = 1500 },
	{ name = "steel boots", chance = 2000 },
	{ name = "meat", chance = 30000, maxCount = 6 },
	{ name = "perfect behemoth fang", chance = 1090 },
	{ name = "behemoth claw", chance = 860 },
	{ name = "assassin star", chance = 9750, maxCount = 5 },
	{ id = 7396, chance = 170 }, -- behemoth trophy
	{ name = "great health potion", chance = 5120 },
	{ name = "battle stone", chance = 14000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = -100, minDamage = -200, maxDamage = -480 },
	{ name = "combat", interval = 2900, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -250, maxDamage = -390, range = 6, shootEffect = CONST_ANI_LARGEROCK, target = false },
	{ name = "combat", interval = 3700, chance = 33, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -450, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = true },
}

monster.defenses = {
	defense = 45,
	armor = 50,
	mitigation = 1.74,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 300, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 40, maxDamage = 70, effect = CONST_ME_YELLOW_RINGS, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
