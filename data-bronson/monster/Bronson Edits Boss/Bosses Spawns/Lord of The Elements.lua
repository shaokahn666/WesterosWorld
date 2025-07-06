local mType = Game.createMonsterType("Lord of The Elements")
local monster = {}

monster.description = "Lord of The Elements"
monster.experience = 650000
monster.outfit = {
	lookType = 242,
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

monster.health = 250000
monster.maxHealth = 250000
monster.race = "undead"
monster.corpse = 6323
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 50,
	health = 10,
	damage = 30,
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
	targetDistance = 3,
	runHealth = 20500,
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
	interval = 4000,
	chance = 40,
	{ text = "You will freeze soon as possible!", yell = false },
	{ text = "I'M THE KING OF ELEMENTS!", yell = true },
	{ text = "I'm a tiny piece of Sauron!", yell = false },
	{ text = "Domain the World? This WORLD IS MINE!!", yell = true },
}

monster.loot = {
	{ id = 28476, chance = 250, unique = true}, --43008 blockers ring -key 28476
	{ name = "zenit helmet", chance = 460}, -- Zenit Helmet
	{ name = "khel thuzads skin", chance = 320},
	{ name = "zenit legs", chance = 400}, -- 
	{ name = "golden boots", chance = 220}, -- 
	{ name = "blessed shield", chance = 200, unique = true}, -- 
	{ name = "ring of the sky", chance = 500}, -- 
	{ id = 3043, chance = 18000, maxCount = 6 }, -- crystal coin	
	{ name = "talon", chance = 24500, maxCount = 10 }, -- talon	
	{ name = "small ruby", chance = 18500, maxCount = 20 }, -- ruby	
	{ name = "small emerald", chance = 18500, maxCount = 15 }, -- ruby	
	{ name = "small amethyst", chance = 18500, maxCount = 25 }, -- ruby	
	{ name = "small diamond", chance = 18500, maxCount = 20 }, -- ruby		
}

monster.attacks = {
	{ name = "melee", interval = 1350, chance = 100, minDamage = -1160, maxDamage = -1760 },
	{ name = "combat", interval = 1650, chance = 35, type = COMBAT_MANADRAIN, minDamage = -800, maxDamage = -1300, range = 7, effect = CONST_ME_YALAHARIGHOST, target = false },
	{ name = "combat", interval = 1853, chance = 45, type = COMBAT_EARTHDAMAGE, minDamage = -1450, maxDamage = -1950, radius = 6, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2155, chance = 55, type = COMBAT_ENERGYDAMAGE, minDamage = -950, maxDamage = -1650, radius = 3, shootEffect = CONST_ANI_FLASHARROW, effect = CONST_ME_YELLOW_ENERGY_SPARK, target = true},
	{ name = "combat", interval = 2458, chance = 75, type = COMBAT_FIREDAMAGE, minDamage = -1350, maxDamage = -2050, lenght = 8, spread = 3, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "speed", interval = 5400, chance = 35, speedChange = -750, range = 7, effect = CONST_ME_GIANTICE, target = false, duration = 6000 },
	{ name = "combat", interval = 1310, chance = 85, type = COMBAT_ICEDAMAGE, minDamage = -1420, maxDamage = -2020, radius = 2, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICETORNADO, target = true },	
}

monster.defenses = {
	defense = 155,
	armor = 180,
	mitigation = 9.7,
	{ name = "combat", interval = 4220, chance = 35, type = COMBAT_HEALING, minDamage = 250, maxDamage = 650, effect = CONST_ME_HOLYAREA, target = false },
	{ name = "invisible", interval = 6000, chance = 20, effect = CONST_ME_POFF, duration = 5000  },
	{ name = "outfit", interval = 3000, chance = 85, effect = CONST_ME_GREENSMOKE, target = false, duration = 1100, outfitMonster = "defiler" },	
	{ name = "outfit", interval = 3000, chance = 70, effect = CONST_ME_WHITE_SMOKE, target = false, duration = 1100, outfitMonster = "Frost Torog" },
	{ name = "outfit", interval = 3000, chance = 60, effect = CONST_ME_PURPLESMOKE, target = false, duration = 1100, outfitMonster = "Energy Overlord" },
	{ name = "outfit", interval = 3000, chance = 55, effect = CONST_ME_REDSMOKE, target = false, duration = 1100, outfitMonster = "Spirit of Fire" },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 60 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 75 },
	{ type = COMBAT_EARTHDAMAGE, percent = 75 },
	{ type = COMBAT_FIREDAMAGE, percent = 75 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 75 },
	{ type = COMBAT_HOLYDAMAGE, percent = 55 },
	{ type = COMBAT_DEATHDAMAGE, percent = 60 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
