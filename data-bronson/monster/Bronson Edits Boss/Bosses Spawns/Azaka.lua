local mType = Game.createMonsterType("Azaka")
local monster = {}

monster.description = "a azaka"
monster.experience = 20000
monster.outfit = {
	lookType = 214,
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

monster.health =13000
monster.maxHealth = 13000
monster.race = "blood"
monster.corpse = 6055
monster.speed = 140
monster.manaCost = 0

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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 100,
	targetDistance = 2,
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
	{ text = "Moufasa!", yell = false },
	{ text = "Shaka Zoula!", yell = false },
	{ text = "uga-buga, ugaa!", yell = false },
}

monster.loot = {
	{ id = 3116, chance = 3000 }, -- big bone
	{ id = 3115, chance = 5800 }, -- bone
	{ name = "platinum coin", chance = 75000, maxCount = 17 },
	{ name = "boots of haste", chance = 3000 },	
	{ name = "hat of the mad", chance = 6000 },		
	{ name = "native armor", chance = 5000 },	
	{ name = "terra legs", chance = 4000 },	
	{ name = "hat of the mad", chance = 6000 },	
	{ id = 8016, chance = 10000, maxCount = 3  }, -- torch
	{ name = "terra rod", chance = 6000 },		
	{ name = "emerald bangle", chance = 8000 },	
	{ id = 3002, chance = 130 }, -- voodoo doll
	{ name = "tribal mask", chance = 500 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -120, maxDamage = -170 },
	{ name = "combat", interval = 1433, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -110, maxDamage = -180, range = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "speed", interval = 1343, chance = 22, speedChange = -800, range = 7, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
	{ name = "drunk", interval = 1666, chance = 18, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "outfit", interval = 1420, chance = 9, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000, outfitMonster = "chicken" },
	{ name = "combat", interval = 2250, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = -156, maxDamage = -258, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "poisonfield", interval = 2250, chance = 76, range = 9, radius = 1, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 90,
	armor = 40,
	mitigation = 0.20,
	{ name = "combat", interval = 3000, chance = 40, type = COMBAT_HEALING, minDamage = 100, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 200, effect = CONST_ME_MAGIC_RED, target = false, duration = 4000 },
	{ name = "invisible", interval = 3000, chance = 5, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 85 },
	{ type = COMBAT_FIREDAMAGE, percent = 39 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 35 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
