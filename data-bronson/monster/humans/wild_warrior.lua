local mType = Game.createMonsterType("Wild Warrior")
local monster = {}

monster.description = "a wild warrior"
monster.experience = 60
monster.outfit = {
	lookType = 131,
	lookHead = 38,
	lookBody = 38,
	lookLegs = 38,
	lookFeet = 38,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 47
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Dark Cathedral, Outlaw Camp, North of Thais, Cyclopolis, in Edron Hero Cave and around it, \z
		the small camp near Femor Hills, in Ghostlands disguised as a statue.",
}

monster.health = 100
monster.maxHealth = 100
monster.race = "blood"
monster.corpse = 18250
monster.speed = 95
monster.manaCost = 420

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 10,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Gimme your money!", yell = false },
	{ text = "An enemy!", yell = false },
}

monster.loot = {
	{ id = 2991, chance = 520 }, -- doll
	{ name = "gold coin", chance = 49070, maxCount = 30 },
	{ name = "axe", chance = 30710 },
	{ name = "mace", chance = 9800 },
	{ name = "chain helmet", chance = 5250 },
	{ name = "iron helmet", chance = 580 },
	{ name = "brass armor", chance = 2540 },
	{ name = "steel shield", chance = 910 },
	{ name = "brass shield", chance = 17000 },
	{ id = 3606, chance = 9730, maxCount = 2 }, -- egg
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -70 },
}

monster.defenses = {
	defense = 20,
	armor = 8,
	mitigation = 0.46,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 200, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
