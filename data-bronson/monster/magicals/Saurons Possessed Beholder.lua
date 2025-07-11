local mType = Game.createMonsterType("Saurons Possessed Beholder")
local monster = {}

monster.description = "a saurons possessed beholder"
monster.experience = 10500
monster.outfit = {
	lookType = 256,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 321
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Helheim, Demon Forge (The Arcanum), beneath Fenrock, Vandura Bonelord Cave, \z
		Alchemist Quarter and Cemetery Quarter.",
}

monster.health = 11000
monster.maxHealth = 11000
monster.race = "undead"
monster.corpse = 7256
monster.speed = 109
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
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
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 3,
	color = 180,
}



monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "You have disturbed my thoughts!", yell = false },
	{ text = "I will turn you into something more useful!", yell = false },
	{ text = "Let me taste your brain!", yell = false },
	{ text = "You will be punished!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 99470, maxCount = 89 },
	{ name = "bone sword", chance = 15130 },
	{ name = "sniper arrow", chance = 9560, maxCount = 4 },
	{ name = "steel shield", chance = 5940 },
	{ name = "piece of dead brain", chance = 5030 },
	{ name = "bonelord eye", chance = 2960 },
	{ name = "clerical mace", chance = 1970 },
	{ name = "haunted blade", chance = 1440 },
	{ id = 3059, chance = 930 }, -- spellbook
	{ name = "spiked squelcher", chance = 180 },
	{ name = "bonelord shield", chance = 100 },
	{ name = "bonelord helmet", chance = 100 },
}

monster.attacks = {
	{ name = "melee", interval = 1720, chance = 100, minDamage = -288, maxDamage = -504 },
	{ name = "combat", interval = 2500, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -150, maxDamage = -250, range = 7, shootEffect = CONST_ANI_ENERGY, target = false },
	{ name = "combat", interval = 2650, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -180, maxDamage = -280, range = 7, shootEffect = CONST_ANI_FIRE, target = false },
	{ name = "combat", interval = 2100, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -170, maxDamage = -390, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 3000, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -230, maxDamage = -270, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 3110, chance = 25, type = COMBAT_LIFEDRAIN, minDamage = -75, maxDamage = -35, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 3110, chance = 25, type = COMBAT_MANADRAIN, minDamage = -50, maxDamage = -240, range = 7, target = false },
}

monster.defenses = {
	defense = 12,
	armor = 12,
	mitigation = 0.67,
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_HEALING, minDamage = 150, maxDamage = 200, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 400, effect = CONST_ME_MAGIC_RED, target = false, duration = 8000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_EARTHDAMAGE, percent = 35 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 35 },
	{ type = COMBAT_HOLYDAMAGE, percent = -20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 70 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
