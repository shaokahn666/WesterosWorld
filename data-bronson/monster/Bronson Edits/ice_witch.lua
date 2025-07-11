local mType = Game.createMonsterType("Ice Witch")
local monster = {}

monster.description = "an ice witch"
monster.experience = 580
monster.outfit = {
	lookType = 149,
	lookHead = 0,
	lookBody = 9,
	lookLegs = 86,
	lookFeet = 86,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 331
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Ice Witch Temple, tower in Krimhorn, caves around Hrodmir ('camps' area), \z
		Formorgar Glacier deepest mines, Magician Quarter in Yalahar (Level 60 Requirement Door).",
}

monster.health = 650
monster.maxHealth = 650
monster.race = "blood"
monster.corpse = 18142
monster.speed = 114
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = false,
	staticAttackChance = 70,
	targetDistance = 4,
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
	{ text = "So you think you are cool?", yell = false },
	{ text = "I hope it is not too cold for you! HeHeHe.", yell = false },
	{ text = "Freeze!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 29630, maxCount = 90 },
	{ name = "clerical mace", chance = 1920 },
	{ name = "mystic turban", chance = 1430 },
	{ name = "green mushroom", chance = 1310 },
	{ name = "shard", chance = 530 },
	{ name = "diamond sceptre", chance = 800 },
	{ name = "skull staff", chance = 630 },
	{ name = "crystal mace", chance = 530 },
	{ name = "boots of haste", chance = 350 },
	{ id = 7441, chance = 1000 }, -- ice cube
	{ name = "crystal sword", chance = 600 },
	{ name = "pair of earmuffs", chance = 190 },
	{ name = "strong mana potion", chance = 1820 },
	{ name = "glacier shoes", chance = 1280 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -90 },
	{ name = "outfit", interval = 2000, chance = 1, range = 7, shootEffect = CONST_ANI_SNOWBALL, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 4000, outfitItem = 7172 },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -60, maxDamage = -150, length = 5, spread = 2, effect = CONST_ME_ICETORNADO, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -55, maxDamage = -130, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = true },
	{ name = "speed", interval = 2000, chance = 15, speedChange = -600, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICETORNADO, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 20,
	armor = 70,
	mitigation = 0.91,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 90, maxDamage = 120, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 40 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
