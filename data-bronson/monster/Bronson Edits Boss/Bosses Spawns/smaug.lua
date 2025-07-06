local mType = Game.createMonsterType("Smaug")
local monster = {}

monster.description = "Smaug"
monster.experience = 100000
monster.outfit = {
	lookType = 204,
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

monster.health = 85000
monster.maxHealth = 85000
monster.race = "blood"
monster.corpse = 5984
monster.speed = 280
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 40,
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
	rewardBoss = true,
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
	color = 206,
}

monster.voices = {
	interval = 5000,
	chance = 40,
	{ text = "I WILL BURN THESE MISARABLE DWARVES", yell = true },
	{ text = "THE TREASURE IS MINE!! YOU DON'T WANT TO TOUCH THIS, RIGHT!!?", yell = true },
	{ text = "A BURNT CHICKEN! That's you to me!", yell = false },
	{ text = "ROOOOARRRRSHHHHHH-KRAAAKKKHHHHHHHHHHHHHH!", yell = true },
}

monster.loot = {
	{ name = "great shield", chance = 600, unique = true },
	{ name = "leather whip", chance = 600, unique = true },
	{ name = "dragon scale helmet", chance = 5000},	
	{ id = 3386, chance = 5000 }, -- dragon scale mail
	{ name = "dragon scale legs", chance = 5000},	
	{ name = "steel boots", chance = 10000},	
	{ name = "aegis armor", chance = 20000},	
	{ id = 5919, chance = 100000 }, -- dragon claw vermelha
	{ id = 3280, chance = 95000 }, -- fire sword
	{ id = 3035, chance = 95050, maxCount = 25 }, -- platinum coin
	{ id = 3035, chance = 50150, maxCount = 40 }, -- platinum coin
	{ id = 3035, chance = 35150, maxCount = 55 }, -- platinum coin
	{ id = 3035, chance = 5150, maxCount = 75 }, -- platinum coin	
}

monster.attacks = {
	{ name = "melee", interval = 1700, chance = 100, minDamage = -640, maxDamage = -800 },
	{ name = "melee", interval = 1250, chance = 20, minDamage = -560, maxDamage = -1040 },	
	{ name = "combat", interval = 1550, chance = 60, type = COMBAT_FIREDAMAGE, minDamage = -700, maxDamage = -1200, range = 7, radius = 3, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },	
	{ name = "firefield", interval = 3250, chance = 99, range = 9, radius = 4, minDamage = -700, maxDamage = -1240, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 3350, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -750, maxDamage = -1600, radius = 8, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 3700, chance = 1, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1300, radius = 8, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 6000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -3000, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
}

monster.defenses = {
	defense = 105,
	armor = 95,
	mitigation = 5.99,
	{ name = "combat", interval = 1000, chance = 30, type = COMBAT_HEALING, minDamage = 200, maxDamage = 320, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 35 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
