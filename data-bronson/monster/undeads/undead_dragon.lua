local mType = Game.createMonsterType("Undead Dragon")
local monster = {}

monster.description = "an undead dragon"
monster.experience = 7500
monster.outfit = {
	lookType = 231,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 282
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 2500,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 4,
	Occurrence = 0,
	Locations = "Helheim (single, isolated spawn), Pits of Inferno (Ashfalor's throneroom), \z
		Demon Forge (The Shadow Nexus and The Arcanum), under Razachai (including the Inner Sanctum), \z
		Chyllfroest, Oramond Fury Dungeon.",
}

monster.health = 8350
monster.maxHealth = 8350
monster.race = "undead"
monster.corpse = 6305
monster.speed = 165
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
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
	{ text = "FEEEED MY ETERNAL HUNGER!", yell = true },
	{ text = "I SENSE LIFE", yell = true },
}

monster.loot = {
	{ name = "golden mug", chance = 6002 },
	{ name = "black pearl", chance = 22780, maxCount = 2 },
	{ name = "small sapphire", chance = 28370, maxCount = 2 },
	{ name = "gold coin", chance = 35500, maxCount = 100 },
	{ name = "gold coin", chance = 55500, maxCount = 98 },
	{ name = "platinum coin", chance = 52000, maxCount = 5 },
	{ name = "life crystal", chance = 2500 },
	{ name = "war axe", chance = 1290 },
	{ name = "golden armor", chance = 860 },
	{ name = "knight armor", chance = 5500 },
	{ name = "royal helmet", chance = 1720 },
	{ name = "power bolt", chance = 15190, maxCount = 15 },
	{ name = "hardened bone", chance = 14180 },
	{ id = 6299, chance = 1150 }, -- death ring
	{ name = "demonic essence", chance = 12460 },
	{ name = "assassin star", chance = 26650, maxCount = 5 },
	{ name = "dragon slayer", chance = 860 },
	{ name = "dragonbone staff", chance = 4000 },
	{ name = "great mana potion", chance = 21490 },
	{ name = "great health potion", chance = 21200 },
	{ name = "divine plate", chance = 430 },
	{ name = "gold ingot", chance = 570 },
	{ name = "unholy bone", chance = 33380 },
	{ name = "spellweaver's robe", chance = 860 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -480 },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -300, maxDamage = -400, range = 7, radius = 4, effect = CONST_ME_HITAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -125, maxDamage = -600, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 5, type = COMBAT_EARTHDAMAGE, minDamage = -100, maxDamage = -390, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 0, maxDamage = -180, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -690, length = 8, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -700, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -100, maxDamage = -200, radius = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "undead dragon curse", interval = 2000, chance = 10, target = false },
}

monster.defenses = {
	defense = 40,
	armor = 40,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 200, maxDamage = 250, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 90 },
	{ type = COMBAT_HOLYDAMAGE, percent = -25 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
