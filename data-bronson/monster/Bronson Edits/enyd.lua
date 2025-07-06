local mType = Game.createMonsterType("Enyd")
local monster = {}

monster.description = "a enyd"
monster.experience = 3400
monster.outfit = {
	lookType = 320,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 520
monster.Bestiary = {
	class = "Magical",
	race = BESTY_RACE_MAGICAL,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Harlond",
}

monster.health = 7100
monster.maxHealth = 7100
monster.race = "undead"
monster.corpse = 9001
monster.speed = 290
monster.manaCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 20,
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
	chance = 10,
	{ text = "The sunlight is so depressing.", yell = false },
	{ text = "I've been in the shadow under your bed last night.", yell = false },
	{ text = "You never know what hides in the night.", yell = false },
	{ text = "I remember your face - and I know where you sleep.", yell = false },
	{ text = "You will face a cruel fate!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 25600, maxCount = 25 },
	{ name = "gold coin", chance = 26900, maxCount = 35 },
	{ id = 6528, chance = 10500, countMax = 10 }, -- infernal bolt
	{ name = "shadow herb", chance = 10000 },	
	{ id = 3393, chance = 380 }, -- amazon helmet
	{ name = "blue legs", chance = 350 },
	{ id = 8041, chance = 450 }, -- greenwood coat
	{ id = 820, chance = 290 }, -- aghanim legs
	{ id = 3437, chance = 280 }, -- amazon shield
	{ name = "haunted blade", chance = 120 },	
	{ name = "strong mana potion", chance = 1000 },
	{ name = "platinum coin", chance = 1000, maxCount = 4 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -160, maxDamage = -256},
	{ name = "speed", interval = 3200, chance = 15, speedChange = -900, range = 7, shootEffect = CONST_ANI_SMALLSTONE, effect = CONST_ME_STUN, target = true, duration = 3000 },	
	{ name = "combat", interval = 3500, chance = 45, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -160, effect = CONST_ME_SMALLPLANTS},
	{ name = "combat", interval = 2200, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -80, maxDamage = -150, effect = CONST_ME_BIGPLANTS},
	{ name = "combat", interval = 2500, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -180, effect = CONST_ME_STONES, target = true },	
}

monster.defenses = {
	defense = 35,
	armor = 60,
	mitigation = 1.18,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 120, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 5000 },
	{ name = "invisible", interval = 2000, chance = 10, effect = CONST_ME_YELLOW_RINGS },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
