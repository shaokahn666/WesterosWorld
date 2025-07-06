local mType = Game.createMonsterType("David Nelson")
local monster = {}

monster.description = "a david nelson"
monster.experience = 20000
monster.outfit = {
	lookType = 69,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 69
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Rivendell Cemetery",
}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "blood"
monster.corpse = 6007
monster.speed = 85
monster.manaCost = 99999

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
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
	{ text = "Words are like bullets!", yell = false },
	{ text = "Wanna fight with me? little girl!", yell = false },
}

monster.loot = {
	{ name = "dwarven helmet", chance = 1000},
	{ name = "dwarven armor", chance = 1000},	
	{ name = "dwarven legs", chance = 1000},		
	{ name = "double axe", chance = 30000},	
	{ name = "battle shield", chance = 32300 },	
	{ name = "small emerald", chance = 350, maxCount = 3 },	
	{ name = "small amethyst", chance = 350, maxCount = 3 },	
	{ name = "white mushroom", chance = 50000, maxCount = 15 },	
	{ name = "platinum coin", chance = 35000, maxCount = 4 },
	{ id = 3097, chance = 1000 }, -- dwarven ring
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -300 },
}

monster.defenses = {
	defense = 10,
	armor = 8,
	mitigation = 0.36,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = 25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
