local mType = Game.createMonsterType("Hellforger Cyclops")
local monster = {}

monster.description = "a hellforger cyclops"
monster.experience = 2600
monster.outfit = {
	lookType = 277,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 389
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

monster.health = 4100
monster.maxHealth = 4100
monster.race = "blood"
monster.corpse = 656
monster.speed = 280
monster.manaCost = 695

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
	{ text = "Creatura desprezivel, voce se arrependera de ter me encontrado", yell = false },
	{ text = "Forjarei seus ossos!!!", yell = false },
}

monster.loot = {
	{ name = "plate armor", chance = 900 },
	{ name = "leather boots", chance = 15000 },
	{ name = "meat", maxCount = 3, chance = 5050 },
	{ name = "ham", maxCount = 3, chance = 2050 },
	{ name = "iron helmet", chance = 1400 },
	{ name = "war hammer", chance = 800 },
	{ name = "iron hammer", chance = 3200 },
	{ name = "chaos mace", chance = 300 },
	{ name = "gold coin", chance = 4000, maxCount = 100 },
	{ name = "gold coin", chance = 14000, maxCount = 50 },
	{ name = "gold coin", chance = 14020, maxCount = 50 },
	{ name = "gold coin", chance = 14020, maxCount = 39 },
	{ id = 6528, chance = 9000, maxCount = 6 },
	{ id = 3032, chance = 1200, maxCount = 1 },
	{ id = 3029, chance = 1200, maxCount = 1 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -96, maxDamage = -256 },
	{ name = "combat", interval = 3300, chance = 99, type = COMBAT_FIREDAMAGE, minDamage = -100, maxDamage = -160, range = 7, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_FIREAREA, target = false },
	{ name = "drunk", interval = 2000, chance = 10, shootEffect = CONST_ANI_WHIRLWINDCLUB, effect = CONST_ME_STUN, target = false, duration = 1000 },
}

monster.defenses = {
	defense = 35,
	armor = 48,
	mitigation = 0.96,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = -5 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -5 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
