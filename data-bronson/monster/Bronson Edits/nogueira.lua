local mType = Game.createMonsterType("Nogueira")
local monster = {}

monster.description = "a nogueira"
monster.experience = 5000
monster.outfit = {
	lookType = 25,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 6000
monster.maxHealth = 6000
monster.race = "blood"
monster.corpse = 5969
monster.speed = 218
monster.manaCost = 999999

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 20,
	{ text = "I will defeat david nelson soon as possible", yell = false },
	{ text = "Do you wanna join to my gym?", yell = false },
}

monster.loot = {
	{ name = "chain armor", chance = 3000 }, -- chain armor
	{ name = "studded legs", chance = 2000 },
	{ name = "carlin sword", chance = 1000 },
	{ name = "nose ring", chance = 3700 },
	{ name = "plate shield", chance = 4000 },
	{ id = 3031, chance = 85000, maxCount = 45 }, -- gold coin
	{ id = 11472, chance = 100000 }, -- minotaur horn
	{ id = 3035, chance = 50000, maxCount = 2 }, -- platinum coin
	{ id = 3577, chance = 50000, maxCount = 4 }, -- meat
	{ id = 3396, chance = 200 }, -- Dwarven Helmet
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -25, maxDamage = -45 },
}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 1.09,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
