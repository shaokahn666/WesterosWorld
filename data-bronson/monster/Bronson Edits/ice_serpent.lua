local mType = Game.createMonsterType("Ice Serpente")
local monster = {}

monster.description = "a ice serpent"
monster.experience = 11500
monster.outfit = {
	lookType = 275,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 438
monster.Bestiary = {
	class = "Reptile",
	race = BESTY_RACE_REPTILE,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Harlond",
}

monster.health = 14500
monster.maxHealth = 14500
monster.race = "blood"
monster.corpse = 949
monster.speed = 510
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,

}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 20,
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
	{ text = "You will feel the taste of your blood!", yell = true },
	{ text = "Bow to Queen Ice Serpent!!!", yell = true },
}

monster.loot = {
	{ name = "small diamond", chance = 500, maxCount = 3 },
	{ name = "gold coin", chance = 38000, maxCount = 100 },
	{ name = "gold coin", chance = 30000, maxCount = 100 },
	{ name = "platinum coin", chance = 10000, maxCount = 2},
	{ id = 21801, chance = 500 }, -- seacrest hair
	{ id = 828, chance = 290 }, -- aghanim mask
	{ id = 8059, chance = 220 }, -- frozen plate
	{ name = "crystalline armor", chance = 35 },
	{ id = 645, chance = 150 }, -- blue legs
	{ id = 819, chance = 265 }, -- glacier shoes
	{ id = 10200, chance = 180 }, -- crystal boots
	{ id = 820, chance = 150 }, -- crystal boots
	{ id = 3284, chance = 400 }, -- ice rapier
	{ id = 3333, chance = 220 }, -- crystal mace
	{ id = 3442, chance = 95 }, -- tempest shield
	{ name = "small sapphire", chance = 500, maxCount = 3 },
	{ id = 3049, chance = 400 }, -- stealth ring
	{ name = "dragon ham", chance = 6000, maxCount = 2 },
	{ name = "strong mana potion", chance = 3850 },
	{ name = "glacier amulet", chance = 200 },
	{ name = "sea serpent scale", chance = 10200 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -450, maxDamage = -750 },
	{ name = "speed", interval = 5400, chance = 35, speedChange = -450, effect = CONST_ME_GIANTICE, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 4000 },
	{ name = "combat", interval = 2750, chance = 60, type = COMBAT_MANADRAIN, minDamage = -100, maxDamage = -200, range = 7, target = false },
	{ name = "combat", interval = 2100, chance = 40, type = COMBAT_ICEDAMAGE, minDamage = -550, maxDamage = -850, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true},
	{ name = "combat", interval = 2450, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -520, maxDamage = -750, range = 7, radius = 2, shootEffect = CONST_ANI_ICE, effect = CONST_ME_GIANTICE, target = true},
	{ name = "combat", interval = 2800, chance = 65, type = COMBAT_ICEDAMAGE, minDamage = -200, maxDamage = -400, length = 8, effect = CONST_ME_POFF, target = false},
}

monster.defenses = {
	defense = 45,
	armor = 25,
	mitigation = 1.04,
	{ name = "combat", interval = 4220, chance = 35, type = COMBAT_HEALING, minDamage = 190, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 15, speedChange = 100, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 45 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 95 },
	{ type = COMBAT_HOLYDAMAGE, percent = 35 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
