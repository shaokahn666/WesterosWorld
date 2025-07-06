local mType = Game.createMonsterType("Ancalagon")
local monster = {}

monster.description = "Ancalagon"
monster.experience = 180000
monster.outfit = {
	lookType = 928,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "undead"
monster.corpse = 6305
monster.speed = 310
monster.manaCost = 0

monster.changeTarget = {
	interval = 8000,
	chance = 30,
}

monster.events = {
	"bossesAlive",
}

monster.strategiesTarget = {
	nearest = 50,
	health = 10,
	damage = 30,
	random = 10,
}

monster.bosstiary = {
	bossRaceId = 1375,
	bossRace = RARITY_ARCHFOE,
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
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 4000,
	chance = 25,
	{ text = "Face the Dragon Who Kills Everyone!", yell = false },
	{ text = "You are not digne for die by me!", yell = false },
	{ text = "Do you think you are strong? Maybe the adversary for you is my son!", yell = true },
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "dragon lord", chance = 15, interval = 8000, count = 2 },
		{ name = "dragon", chance = 15, interval = 8000, count = 1 },
	},
}

monster.loot = {
	{ name = "aghanim robe", chance = 2000}, 
	{ name = "golden boots", chance = 300, unique = true},		
	{ name = "skull helmet", chance = 6000},	
	{ name = "magma legs", chance = 4000}, 
	{ name = "demon shield", chance = 2500}, 
	{ name = "warlord sword", chance = 800}, 
	{ name = "demonic essence", chance = 10000, maxCount = 3 }, -- demonic essence	
	{ id = 3043, chance = 15000, maxCount = 2 }, -- crystal coin
	{ name = "platinum coin", chance = 100000, maxCount = 70 }, -- platinum coin
	{ name = "platinum coin", chance = 100000, maxCount = 25 }, -- platinum coin	
	{ name = "platinum coin", chance = 100000, maxCount = 13 }, -- platinum coin
	{ name = "power bolt", chance = 40000, maxCount = 45 },
	{ name = "small ruby", chance = 18500, maxCount = 20 }, -- ruby	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -400, maxDamage = -640 },
	{ name = "combat", interval = 1850, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -750, lenght = 8, spread = 3, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2600, chance = 99, type = COMBAT_FIREDAMAGE, minDamage = -400, maxDamage = -700, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2700, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -600, range = 7, radius = 8, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },
	{ name = "speed", interval = 5000, chance = 30, speedChange = -700, range = 7, effect = CONST_ME_BLACK_BLOOD, target = false, duration = 4000 },	
}

monster.defenses = {
	defense = 65,
	armor = 70,
	mitigation = 3.7,
	{ name = "combat", interval = 500, chance = 100, type = COMBAT_HEALING, minDamage = 70, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 95 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
