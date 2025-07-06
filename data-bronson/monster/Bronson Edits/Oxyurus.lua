local mType = Game.createMonsterType("Oxyurus")
local monster = {}

monster.description = "a gigante oxyurus"
monster.experience = 5350
monster.outfit = {
	lookType = 295,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 289
monster.Bestiary = {
	class = "Slime",
	race = BESTY_RACE_SLIME,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Harlond, and others",
}

monster.health = 8500
monster.maxHealth = 8500
monster.race = "blood"
monster.corpse = 8119
monster.speed = 240
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
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
	rewardBoss = false,
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

monster.loot = {
	{ id = 3031, chance = 100000, maxCount = 95 }, -- gold coin
	{ id = 3492, chance = 20000, maxCount = 45 }, -- worm
	{ id = 3427, chance = 700}, -- rose shield
	{ id = 3369, chance = 500}, -- warrior helmet
	{ id = 10438, chance = 300}, -- spell'sweaver robe
	{ name = "brass legs", chance = 7000 },
	{ name = "spiked squelcher", chance = 500 }, -- spiked squelcher
	{ name = "small amethyst", chance = 6000, maxCount = 4  },
	{ name = "black pearl", chance = 7000, maxCount = 3  },
	{ name = "white pearl", chance = 6000, maxCount = 4  },
	{ name = "small diamond", chance = 10000, maxCount = 3 },
	{ name = "platinum coin", chance = 10000, maxCount = 4 },
	
	
}

monster.attacks = {
	{ name = "melee", interval = 2800, chance = 45, minDamage = -335, maxDamage = -552, condition = { type = CONDITION_POISON, totalDamage = 50, interval = 4000 } },
	{ name = "combat", interval = 2200, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -140, maxDamage = -200, range = 8, shootEffect = CONST_ANI_POISON, target = false },
	-- poison
	{ name = "combat", interval = 2500, chance = 45, type = COMBAT_EARTHDAMAGE, minDamage = -200, maxDamage = -240, range = 8, effect =  CONST_ME_BIGPLANTS, target = false },
	-- poison
	{ name = "speed", interval = 2000, chance = 15, speedChange = -900, range = 8, effect = CONST_ME_SMALLPLANTS, target = true, duration = 15000 },
}

monster.defenses = {
	defense = 20,
	armor = 60,
	mitigation = 1.32,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 280, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 80 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
}

mType:register(monster)
