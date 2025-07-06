local mType = Game.createMonsterType("Gothmog")
local monster = {}

monster.description = "Gothmog"
monster.experience = 500000
monster.outfit = {
	lookType = 12,
	lookHead = 38,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 85000
monster.maxHealth = 85000
monster.race = "undead"
monster.corpse = 5526
monster.speed = 320
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
	{ text = "HOW DARE INTERUPT MY SILENCE?", yell = true },
	{ text = "I FEEL YOUR FEAR!", yell = true },
	{ text = "YOU NEVER WILL FINISH THE PENTAGRAMA!", yell = true },
	{ text = "Feel the fury of the Lord of Balrogs!", yell = false },
}

monster.summon = {
	maxSummons = 3,
	summons = {
		{ name = "Demon", chance = 15, interval = 12000, count = 3 },
	},
}

monster.loot = {
	{ id = 2970, chance = 100000, unique = true }, -- key 2970 - action 2970 - Pentagrama
	{ id = 3043, chance = 5300, maxCount = 3 }, -- crystal coin	
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -800, maxDamage = -1200 },
	{ name = "combat", interval = 2200, chance = 18, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -1100, radius = 7, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 1600, chance = 99, type = COMBAT_FIREDAMAGE, minDamage = -450, maxDamage = -700, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 3200, chance = 13, type = COMBAT_MANADRAIN, minDamage = -200, maxDamage = -300, lenght = 2, spread = 3, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 1350, chance = 16, type = COMBAT_ENERGYDAMAGE, minDamage = -1000, maxDamage = -1500, lenght = 8, spread = 0, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "condition", type = CONDITION_POISON, interval = 3600, chance = 15, minDamage = -150, maxDamage = -150, condition = { type = CONDITION_POISON, totalDamage = 3000, interval = 3000 },  target = true},
	{ name = "combat", interval = 2750, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -1000, maxDamage = -1500, lenght = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 85,
	armor = 90,
	mitigation = 4.7,
	{ name = "combat", interval = 700, chance = 100, type = COMBAT_HEALING, minDamage = 70, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 20, speedChange = 80, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 60 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 80 },
	{ type = COMBAT_MANADRAIN, percent = 80 },
	{ type = COMBAT_DROWNDAMAGE, percent = 80 },
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
