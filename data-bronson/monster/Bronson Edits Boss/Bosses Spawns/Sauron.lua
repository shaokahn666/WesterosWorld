local mType = Game.createMonsterType("Sauron")
local monster = {}

monster.description = "Sauron The Trully Evil"
monster.experience = 600000
monster.outfit = {
	lookType = 243,
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

monster.health = 300000
monster.maxHealth = 300000
monster.race = "fire"
monster.corpse = 6323
monster.speed = 355
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 20,
	health = 20,
	damage = 40,
	random = 20,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 5000,
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
	{ text = "Gu kibum kelkum-ishi", yell = false },
	{ text = "burzum-ishi. Akha-gum-ishi ashi gurum", yell = false },
}


monster.loot = {
	{ name = "werewolf helmet", chance = 6000, unique = true },
	{ name = "ornate chestplate", chance = 600, unique = true },	
	{ name = "ornate legs", chance = 1000, unique = true },		
	{ id = 9018, chance = 6000, unique = true }, -- firewalker boots	
	{ name = "cerberus shield", chance = 1000, unique = true },		
	{ id = 3019, chance = 6000 }, -- demonbone amulet
	{ name = "small diamond", chance = 50000, maxCount = 100  },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },	
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
	{ name = "platinum coin", chance = 50000, maxCount = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 1300, chance = 100, minDamage = -1800, maxDamage = -2320 },
	{ name = "combat", interval = 2753, chance = 25, type = COMBAT_MANADRAIN, minDamage = -900, maxDamage = -1500, range = 7, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -1990, maxDamage = -2800, radius = 6,  effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGEDAMAGE, minDamage = -1500, maxDamage = -2800, radius = 6,  effect = CONST_ME_FIREAREA, target = false },	
	{ name = "combat", interval = 2303, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -1700, maxDamage = -2100, radius = 1, effect = CONST_ME_HITBYFIRE, target = true },	
	{ name = "combat", interval = 1200, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -1800, maxDamage = -2700, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE,  effect = CONST_ME_FIREAREA, target = true },	
	{ name = "combat", interval = 2850, chance = 22, type = COMBAT_DEATHDAMAGE, minDamage = -2500, maxDamage = -3200, length = 7, spread = 0, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 95,
	armor = 110,
	mitigation = 1.60,	
	{ name = "combat", interval = 1200, chance = 30, type = COMBAT_HEALING, minDamage = 400, maxDamage = 600, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 3000, chance = 25, effect = CONST_ME_POFF },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 60 },
	{ type = COMBAT_FIREDAMAGE, percent = 99 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 60 },
	{ type = COMBAT_HOLYDAMAGE, percent = 60 },
	{ type = COMBAT_DEATHDAMAGE, percent = 99 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
