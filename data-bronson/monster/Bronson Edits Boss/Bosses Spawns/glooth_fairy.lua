local mType = Game.createMonsterType("Glooth Fairy")
local monster = {}


monster.description = "Glooth Fairy"
monster.experience = 600000
monster.outfit = {
	lookType = 600,
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

monster.bosstiary = {
	bossRaceId = 1058,
	bossRace = RARITY_BANE,
}

monster.health = 85000
monster.maxHealth = 85000
monster.race = "blood"
monster.corpse = 20972
monster.speed = 400
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
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
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 50,
	{ text = "CLANK! WHIRRR! HISS!", yell = true },
	{ text = "FIREEE! INI-TI-ATE FLAME PRO-TO-COL. SET-TING FIRE TO TAR-GET AN-I-MALS!", yell = false },
	{ text = "CLACK-CLACK-CLACK! SQUEAK! CLUCK-CLUCK-CLUCK!", yell = false },
	{ text = "I WILL GRAB THIS WOODPECKER... CLACK-CLACK-CLACK! SQUEAK!", yell = false },
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "walker", chance = 50, interval = 3000, count = 2 },
	},
}

monster.loot = {
	{ id = 21158, chance = 200, unique = true }, -- glooth spear
	{ id = 21180, chance = 1000, unique = true }, -- glooth axe
	{ id = 21179, chance = 1000, unique = true }, -- glooth blade
	{ id = 21178, chance = 1000, unique = true }, -- glooth club
	{ name = "glooth backpack", chance = 100000}, -- 
	{ name = "control unit", chance = 7000}, -- 
	{ name = "crystal coin", chance = 15600, maxCount = 4}, -- 
	{ name = "talon", chance = 24500, maxCount = 3 }, -- talon
	{ name = "small ruby", chance = 18500, maxCount = 23 }, -- emerald
	{ name = "small emerald", chance = 18500, maxCount = 12 }, -- emerald
	{ name = "small amethyst", chance = 18500, maxCount = 8 }, -- amethyst
	{ name = "small diamond", chance = 18500, maxCount = 35 }, -- diamond
	{ id = 21167, chance = 1200 }, -- heat core
	{ id = 21183, chance = 2400 }, -- glooth amulet
	{ id = 21165, chance = 480 }, -- rubber cap
}

monster.attacks = {
	{ name = "melee", interval = 1200, chance = 95, minDamage = -1400, maxDamage = -2000 },
	{ name = "condition", type = CONDITION_POISON, interval = 1200, chance = 85, minDamage = -250, maxDamage = -250, condition = { type = CONDITION_POISON, totalDamage = 5000, interval = 4000 } },
	{ name = "combat", interval = 1500, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -1750, maxDamage = -2000, range = 7, shootEffect = CONST_ANI_GREENDSTAR, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2500, chance = 45, type = COMBAT_EARTHDAMAGE, minDamage = -1800, maxDamage = -1900, range = 7, radius = 5, shootEffect = CONST_ANI_GREENDSTAR, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -2000, maxDamage = -3500, length = 8, spread = 3, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "combat", interval = 3700, chance = 60, type = COMBAT_EARTHDAMAGE, minDamage = -1850, maxDamage = -2400, radius = 4, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 150,
	armor = 165,
	mitigation = 8.37,
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1000, chance = 1, type = COMBAT_HEALING, minDamage = 750, maxDamage = 800, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 80 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = 80 },
	{ type = COMBAT_LIFEDRAIN, percent = 80 },
	{ type = COMBAT_MANADRAIN, percent = 80 },
	{ type = COMBAT_DROWNDAMAGE, percent = 80 },
	{ type = COMBAT_ICEDAMAGE, percent = 80 },
	{ type = COMBAT_HOLYDAMAGE, percent = 80 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
