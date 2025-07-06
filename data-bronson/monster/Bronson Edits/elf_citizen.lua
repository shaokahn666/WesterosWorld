local mType = Game.createMonsterType("Elf Citizen")
local monster = {}

monster.description = "an elf citizen"
monster.experience = 35
monster.outfit = {
	lookType = 159,
	lookHead = 22,
	lookBody = 25,
	lookLegs = 76,
	lookFeet = 39,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 62
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Edoras surrounds",
}

monster.health = 60
monster.maxHealth = 60
monster.race = "blood"
monster.corpse = 6003
monster.speed = 170
monster.manaCost = 320

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
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Death to the Defilers!", yell = false },
	{ text = "You are not welcome here.", yell = false },
	{ text = "Flee as long as you can.", yell = false },
	{ text = "Bahaha aka!", yell = false },
	{ text = "Ulathil beia Thratha!", yell = false },
}

monster.loot = {
	{ name = "studded helmet", chance = 5000 },
	{ name = "green piece of cloth", chance = 4000 },	
	{ name = "leather boots", chance = 2000 },
	{ name = "brass shield", chance = 2777 },
	{ name = "studded helmet", chance = 2000 },
	{ name = "sandals", chance = 250 },
	{ name = "longsword", chance = 1000 },
	{ name = "bow", chance = 3666 },
	{ name = "red apple", chance = 50000, maxCount = 5 },
	{ name = "gold coin", chance = 100000, maxCount = 12 },
}

monster.attacks = {
	{ name = "melee", interval = 2200, chance = 100, minDamage = -5, maxDamage = -15 },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.30,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
