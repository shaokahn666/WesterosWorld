local mType = Game.createMonsterType("Allukard")
local monster = {}

monster.description = "an Allukard"
monster.experience = 14000
monster.outfit = {
	lookType = 312,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 483
monster.Bestiary = {
	class = "Undead",
	race = BESTY_RACE_UNDEAD,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Drefia and Vampire Castle on Vengoth, Edron Vampire Crypt.",
}

monster.health = 17000
monster.maxHealth = 17000
monster.race = "blood"
monster.corpse = 8744
monster.speed = 100
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Kneel before your Mistress!", yell = false },
	{ text = "Dead is the new alive.", yell = false },
	{ text = "Come, let me kiss you, darling. Oh wait, I meant kill.", yell = false },
	{ text = "Enjoy the pain - I know you love it.", yell = false },
	{ text = "Are you suffering nicely enough?", yell = false },
	{ text = "You won't regret you came to me, sweetheart.", yell = false },
}

monster.loot = {
	{ name = "small diamond", chance = 1020, maxCount = 2 },
	{ name = "gold coin", chance = 90000, maxCount = 149 },
	{ name = "platinum coin", chance = 9910 },
	{ name = "skull helmet", chance = 550 },
	{ name = "vampire shield", chance = 500 },
	{ name = "pharaoh sword", chance = 330 },
	{ name = "valar kilt", chance = 55 },
	{ name = "strong health potion", chance = 5000 },
	{ name = "strong mana potion", chance = 10210 },
	{ id = 649, chance = 200 }, -- flower bouquet
	{ name = "aghanim mask", chance = 800 },
	{ name = "iron loadstone", chance = 600 },
	{ name = "blood goblet", chance = 55 },
	{ id = 8895, chance = 1010 }, -- rusted armor
	{ id = 8923, chance = 970 }, -- velvet tapestry
	{ name = "vampire teeth", chance = 10000 },
	{ name = "blood preservation", chance = 4950 },
}

monster.attacks = {
	{ name = "melee", interval = 1900, chance = 100, minDamage = -560, maxDamage = -968 },
	{ name = "combat", interval = 2920, chance = 33, type = COMBAT_LIFEDRAIN, minDamage = -750, maxDamage = -120, range = 1, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2480, chance = 16, type = COMBAT_DEATHDAMAGE, minDamage = -450, maxDamage = -560, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 4105, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -850, radius = 2, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_GROUNDSHAKER, target = false },
}

monster.defenses = {
	defense = 20,
	armor = 55,
	mitigation = 1.18,
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 40, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 5000, chance = 35, speedChange = 500, effect = CONST_ME_MAGIC_RED, target = false, duration = 8000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 19 },
	{ type = COMBAT_EARTHDAMAGE, percent = 52 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 10 },
	{ type = COMBAT_ICEDAMAGE, percent = 22 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 82 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
