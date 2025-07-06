local mType = Game.createMonsterType("Soul Burner")
local monster = {}

monster.description = "a soul burner"
monster.experience = 15000
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

monster.health = 17000
monster.maxHealth = 17000
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
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
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
	{ name = "platinum coin", chance = 2500, maxCount = 6 },
	{ id = 9019, chance = 5 }, -- Firewalker boots
	{ id = 2993, chance = 300 }, -- Teddy bear
	{ name = "phoenix plate", chance = 65 },	
	{ name = "magma legs", chance = 170 },
	{ name = "fire sword", chance = 320 },
	{ name = "thunder hammer", chance = 15 },	
	{ name = "phoenix shield", chance = 120 },
	{ name = "fire axe", chance = 250 },
	{ name = "wand of inferno", chance = 360 },
	{ name = "fiery heart", chance = 9570 },
	{ name = "crystal coin", chance = 240, maxCount = 1 },
	{ id = 3039, chance = 550 },
	{ name = "talon", chance = 450, maxCount = 3 },
	{ name = "small ruby", chance = 850, maxCount = 3 },
	{ id = 6528, chance = 25600, maxCount = 12 },

}

monster.attacks = {
	{ name = "melee", interval = 1750, chance = 100, minDamage = -520, maxDamage = -840 },
	{ name = "firefield", interval = 3500, chance = 65, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2200, chance = 50, type = COMBAT_FIREDAMAGE, range = 7, radius = 2, minDamage = -552, maxDamage = -800, shootEffect = CONST_ANI_FIRE,  effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 2450, chance = 65, type = COMBAT_FIREDAMAGE, range = 7, minDamage = -750, maxDamage = -1000, shootEffect = CONST_ANI_FIRE,  effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 2650, chance = 70, type = COMBAT_FIREDAMAGE, minDamage = -450, maxDamage = -950, range = 7, radius = 3, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 3500, chance = 55, type = COMBAT_FIREDAMAGE, minDamage = -1100, maxDamage = -1590, radius = 5, effect = CONST_ME_FIREWORK_RED, target = false },	
	{ name = "combat", interval = 2250, chance = 45, type = COMBAT_MANADRAIN, minDamage = -250, maxDamage = -560, range = 7, target = false, effect = CONST_ME_MAGIC_BLUE },
}

monster.defenses = {
	defense = 75,
	armor = 122,
	mitigation = 1.60,
	{ name = "combat", interval = 4220, chance = 35, type = COMBAT_HEALING, minDamage = 250, maxDamage = 650,  target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 25 },
	{ type = COMBAT_EARTHDAMAGE, percent = 35 },
	{ type = COMBAT_FIREDAMAGE, percent = 95 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
