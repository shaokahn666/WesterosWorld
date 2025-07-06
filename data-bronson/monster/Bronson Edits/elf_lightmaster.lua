local mType = Game.createMonsterType("Elf Lightmaster")
local monster = {}

monster.description = "an elf lightmaster"
monster.experience = 10500
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

monster.health = 10000
monster.maxHealth = 10000
monster.race = "blood"
monster.corpse = 6011
monster.speed = 370
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 20,
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
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 1000,
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
	{ text = "I'm the trully Wisdom!", yell = false },
	{ text = "Elen sila lumenn' omentielvo!", yell = false },
	{ text = "Bow to my powerful magic!", yell = false },


}

monster.loot = {
	{ id = 21975, chance = 2000 }, -- peacock feather fan
	{ name = "blue robe", chance = 600 },
	{ name = "voltage armor", chance = 30 },
	{ name = "elvish bow", chance = 450 },
	{ id = 3006, chance = 15 }, -- ring of the sky
	{ id = 3035, chance = 35000, maxCount = 4  }, -- platinum coin
	{ name = "great mana potion", chance = 4500 },
	{ name = "small amethyst", chance = 950, maxCount = 3 },

}

monster.attacks = {
	{ name = "speed", interval = 5400, chance = 25, speedChange = -300, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 4000 },
	{ name = "combat", interval = 1500, chance = 100, type = COMBAT_PHYSICALDAMAGE, minDamage = -350, maxDamage = -400, range = 7, radius = 2, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 2320, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -350, maxDamage = -400, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = true },
	{ name = "combat", interval = 1800, chance = 40, type = COMBAT_HOLYDAMAGE, minDamage = -300, maxDamage = -400, range = 7, radius = 2, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2550, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -800, length = 8, spread = 0, effect = CONST_ME_ENERGYHIT, target = false },	

}

monster.defenses = {
	defense = 45,
	armor = 25,
	mitigation = 0.51,
	{ name = "combat", interval = 4220, chance = 35, type = COMBAT_HEALING, minDamage = 190, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 25 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 80 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 80 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
