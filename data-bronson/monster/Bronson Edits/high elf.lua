local mType = Game.createMonsterType("High Elf")
local monster = {}

monster.description = "an high elf"
monster.experience = 2000
monster.outfit = {
	lookType = 63,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 63
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Anfallas.",
}

monster.health = 1900
monster.maxHealth = 1900
monster.race = "blood"
monster.corpse = 6011
monster.speed = 260
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
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 3,
	runHealth = 200,
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
	{ text = "Salute to Gil-galad!!!", yell = false },
	{ text = "Elen sila lumenn' omentielvo.!", yell = false },
	{ text = "Wisdom guides our path", yell = false },
	{ text = "Go back to Rivendell poor creature!!!", yell = false },

}

monster.loot = {
	{ name = "elven hoof", chance = 1300 },
	{ name = "elven mail", chance = 400},
	{ name = "golden armor", chance = 10 },
	{ name = "elven legs", chance = 750 },
	{ name = "aghanim boots", chance = 100 },
	{ name = "elvenhair rope", chance = 30 },
	{ name = "elvish bow", chance = 450 },
	{ name = "small amethyst", chance = 950, maxCount = 3 },
	{ name = "gold coin", chance = 35000, maxCount = 80 },
	{ name = "gold coin", chance = 35000, maxCount = 80 },
	{ id = 3449, chance = 3000, maxCount = 12  }, -- burst arrow
	{ id = 3447, chance = 3000, maxCount = 12  }, -- Commum arrow
	{ id = 7364, chance = 2200, maxCount = 12  }, -- sniper arrow
	{ id = 7365, chance = 2200, maxCount = 12  }, -- onyx arrow
	{ id = 3035, chance = 1200, maxCount = 2  }, -- onyx arrow
	{ name = "strong mana potion", chance = 900 },
	{ name = "elvish talisman", chance = 900 }
}

monster.attacks = {
	{ name = "melee", interval = 1600, chance = 100, minDamage = -152, maxDamage = -200 },
	{ name = "combat", interval = 2320, chance = 35, type = COMBAT_HOLYDAMAGE, minDamage = -150, maxDamage = -190, range = 7, radius = 4, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 1600, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -90, maxDamage = -180, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
	{ name = "combat", interval = 2530, chance = 45, type = COMBAT_HOLYDAMAGE, minDamage = -250, maxDamage = -350, range = 7, radius = 1, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_HOLYAREA, target = true },

}

monster.defenses = {
	defense = 15,
	armor = 15,
	mitigation = 0.51,
	{ name = "combat", interval = 2300, chance = 25, type = COMBAT_HEALING, minDamage = 90, maxDamage = 153, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 60 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 85 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
