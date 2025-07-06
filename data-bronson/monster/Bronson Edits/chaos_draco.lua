local mType = Game.createMonsterType("Chaos Draco")
local monster = {}

monster.description = "an chaos draco"
monster.experience = 5500
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 282
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Helheim (single, isolated spawn), Pits of Inferno (Ashfalor's throneroom), \z
		Demon Forge (The Shadow Nexus and The Arcanum), under Razachai (including the Inner Sanctum), \z
		Chyllfroest, Oramond Fury Dungeon.",
}

monster.health = 8100
monster.maxHealth = 8100
monster.race = "undead"
monster.corpse = 6305
monster.speed = 180
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
	{ text = "you will feel the true power of chaos draco!", yell = true },
	{ text = "I will protect my son", yell = true },
}

monster.loot = {
	{ name = "golden armor", chance = 10 },
	{ name = "skull helmet", chance = 50 },	
	{ name = "demon legs", chance = 35 },	
	{ name = "dragon shield", chance = 1200 },
	{ id = 2328, chance = 2000 }, -- death ring
	{ name = "guardian halberd", chance = 300 },
	{ name = "bright sword", chance = 100 },
	{ id = 7367, chance = 800, maxCount = 2}, -- enchanted spear
	{ name = "gold coin", chance = 80000, maxCount = 80 },
	{ name = "gold coin", chance = 50000, maxCount = 80 },
	{ name = "gold coin", chance = 50000, maxCount = 80 },
	{ name = "power bolt", chance = 20000, maxCount = 8 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -200, maxDamage = -360 },
	{ name = "combat", interval = 1650, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -200, maxDamage = -300, range = 8, spread = 3, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 1850, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -200, maxDamage = -300, range = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },		
	{ name = "speed", interval = 7000, chance = 30, speedChange = -400, range = 7, radius = 4, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_BLACKSMOKE, target = true, duration = 6000 },	
	{ name = "combat", interval = 1350, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -170, maxDamage = -260, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{ name = "combat", interval = 2600, chance = 16, type = COMBAT_HEALING, minDamage = 120, maxDamage = 320, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 40 },
	{ type = COMBAT_MANADRAIN, percent = 30 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
