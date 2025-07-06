local mType = Game.createMonsterType("Wormageddon")
local monster = {}

monster.description = "Wormageddon"
monster.experience = 30000
monster.outfit = {
	lookType = 295,
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
	bossRaceId = 459,
	bossRace = RARITY_NEMESIS,
}

monster.health = 36000
monster.maxHealth = 36000
monster.race = "blood"
monster.corpse = 8119
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 35,
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
	staticAttackChance = 80,
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
	{ text = "you feel a itch in a sensible area?", yell = false },
	{ text = "i will slip through your ... nose", yell = false },
}

monster.summon = {
	maxSummons = 6,
	summons = {
		{ name = "Carrion Worm", chance = 25, interval = 5000, count = 6 },
	},
}

monster.loot = {
	{ name = "terra boots", chance = 3600 },
	{ name = "scale armor", chance = 55000 },
	{ name = "warrior helmet", chance = 3600 },	
	{ name = "demonrage sword", chance = 350 },	
	{ name = "terra rod", chance = 9350 },
	{ id = 7379, chance = 500}, -- motaba wand - bruttatamer staff
	{ id = 3492, chance = 20000, maxCount = 99 }, -- worm
	{ name = "platinum coin", chance = 25000, maxCount = 50  },
	{ id = 5953, chance = 12000}, -- marijuana
	{ name = "small amethyst", chance = 2800, maxCount = 15  },
	{ name = "black pearl", chance = 2600, maxCount = 10  },
	{ name = "white pearl", chance = 2600, maxCount = 13  },
	{ name = "small diamond", chance = 2600, maxCount = 10 },
	{ name = "great mana potion", chance = 48000, maxCount = 8  },
	{ name = "stone skin amulet", chance = 10000, maxCount = 1 },	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -110, maxDamage = -680},
	{ name = "combat", interval = 2600, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -260, maxDamage = -430, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2100, chance = 35, type = COMBAT_EARTHDAMAGE, minDamage = -160, maxDamage = -240, lenght = 5, spread = 0, effect =  CONST_ME_BIGPLANTS, target = false },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -850, range = 7, effect = CONST_ME_SMALLPLANTS, target = true, duration = 7000 },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	mitigation = 2.32,
	{ name = "combat", interval = 2500, chance = 35, type = COMBAT_HEALING, minDamage = 120, maxDamage = 220, effect = CONST_ME_HOLYAREA, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
}

mType:register(monster)
