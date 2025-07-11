local mType = Game.createMonsterType("Hellfire Fighter")
local monster = {}

monster.description = "a hellfire fighter"
monster.experience = 3800
monster.outfit = {
	lookType = 243,
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

monster.health = 3800
monster.maxHealth = 3800
monster.race = "fire"
monster.corpse = 6323
monster.speed = 165
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	random = 20,
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
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 5,
	color = 212,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "emerald bangle", chance = 2200 },
	{ id = 3019, chance = 190 }, -- demonbone amulet
	{ name = "small diamond", chance = 1400 },
	{ name = "gold coin", chance = 50000, maxCount = 100 },
	{ name = "gold coin", chance = 10000, maxCount = 46 },
	{ name = "wand of inferno", chance = 9450 },
	{ name = "burnt scroll", chance = 50000 },
	{ name = "blank rune", chance = 30000, maxCount = 2 },
	{ name = "fire sword", chance = 3140 },
	{ name = "fire axe", chance = 440 },
	{ name = "soul orb", chance = 12150 },
	{ name = "demonic essence", chance = 14500 },
	{ name = "magma legs", chance = 682 },
	{ name = "magma coat", chance = 380 },
	{ name = "fiery heart", chance = 9570 },
	{ name = "piece of hellfire armor", chance = 5060 },
	{ id = 12600, chance = 670 }, -- coal
	{ name = "eternal flames", chance = 380 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -30, maxDamage = -250 },
	{ name = "firefield", interval = 2000, chance = 20, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -180, maxDamage = -400, length = 8, spread = 0, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -210, maxDamage = -450, range = 7, radius = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "hellfire fighter soulfire", interval = 2000, chance = 15, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 62,
	mitigation = 1.60,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
