local mType = Game.createMonsterType("Cyclopslave")
local monster = {}

monster.description = "a cyclopslave"
monster.experience = 1750
monster.outfit = {
	lookType = 280,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 391
monster.Bestiary = {
	class = "Giant",
	race = BESTY_RACE_GIANT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Cyclops II",
}

monster.health = 1900
monster.maxHealth = 1900
monster.race = "blood"
monster.corpse = 771
monster.speed = 250
monster.manaCost = 525

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	damage = 30,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
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
	{ text = "I will crush all intruders!", yell = false },
	{ text = "Why a misarable creature like you are here?", yell = false },

}

monster.loot = {
	{ id = 7419, chance = 20 }, -- dreaded cleaver
	{ id = 3418, chance = 750 }, -- bonelord shield
	{ name = "battle hammer", chance = 950 },
	{ name = "gold coin", chance = 40000, maxCount = 50 },
	{ name = "gold coin", chance = 40000, maxCount = 50 },
	{ name = "gold coin", chance = 40000, maxCount = 50 },
	{ name = "gold coin", chance = 40000, maxCount = 50 },
	{ name = "platinum coin", chance = 5000, maxCount = 3},
	{ name = "meat", chance = 50430, maxCount = 2 },
	{ id = 7398, chance = 120 }, -- cyclops trophy
	{ name = "strong health potion", chance = 520 },
	{ name = "cyclops toe", chance = 6750 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -96, maxDamage = -208 },
	{ name = "combat", interval = 2000, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -150, maxDamage = -230, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = false },
	{ name = "speed", interval = 6000, chance = 25, speedChange = -600, range = 6, shootEffect = CONST_ANI_POISON, effect = CONST_ME_MAGIC_RED, target = true, duration = 5000 },
}

monster.defenses = {
	defense = 40,
	armor = 45,
	mitigation = 0.72,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
