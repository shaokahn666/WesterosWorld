local mType = Game.createMonsterType("Frost Torog")
local monster = {}

monster.description = "a frost torog"
monster.experience = 1500
monster.outfit = {
	lookType = 261,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 326
monster.Bestiary = {
	class = "Construct",
	race = BESTY_RACE_CONSTRUCT,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Formorgar Glacier, Formorgar Mines, Nibelor Ice Cave, Ice Witch Temple, \z
		Deeper Banuta, Crystal Caves, Chyllfroest.",
}

monster.health = 1600
monster.maxHealth = 1600
monster.race = "undead"
monster.corpse = 7282
monster.speed = 230
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Chrrr.", yell = false },
	{ text = "Crrrrk.", yell = false },
	{ text = "Gnarr.", yell = false },
}

monster.loot = {
	{ name = "black pearl", chance = 1500 },
	{ name = "small diamond", chance = 750 },
	{ name = "small sapphire", chance = 578 },
	{ name = "gold coin", chance = 100000, maxCount = 111 },
	{ name = "strange helmet", chance = 350 },
	{ name = "shard", chance = 200 },
	{ id = 7441, chance = 5000 }, -- ice cube
	{ name = "crystal sword", chance = 600 },
	{ name = "strong health potion", chance = 2500 },
	{ name = "strong mana potion", chance = 3000 },
	{ name = "aghanim mask", chance = 200 },
	{ name = "haunted blade", chance = 200 },
	{ name = "crystal mace", chance = 200 },
	{ name = "frost razor", chance = 200 },
	{ name = "frosty heart", chance = 14500 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -96, maxDamage = -224 },
	{ name = "speed", interval = 1000, chance = 13, speedChange = -800, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT, target = false, duration = 20000 },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_ICEDAMAGE, minDamage = -120, maxDamage = -200, range = 7, shootEffect = CONST_ANI_SMALLICE, effect = CONST_ME_ICEATTACK, target = false },
}

monster.defenses = {
	defense = 26,
	armor = 47,
	mitigation = 0.70,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 100 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
