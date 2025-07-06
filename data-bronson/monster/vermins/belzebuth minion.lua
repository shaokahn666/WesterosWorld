local mType = Game.createMonsterType("Belzebuth Minion")
local monster = {}

monster.description = "a belzebuth minion"
monster.experience = 9500
monster.outfit = {
	lookType = 79,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 79
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Ankrahmun Library Tomb, Stone Tomb, Peninsula Tomb, Mother of Scarabs Lair, Kha'zeel Scarab Lair, \z
	deep in Larva Caves (found beneath steps underground), Lion's Rock, Arena and Zoo Quarter and beneath Fenrock.",
}

monster.health = 12000
monster.maxHealth = 12000
monster.race = "venom"
monster.corpse = 6021
monster.speed = 109
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 20,
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

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "ancient scarab", chance = 15, interval = 6000, count = 3 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{ name = "scarab amulet", chance = 3410 },
	{ id = 3025, chance = 2500 }, -- ancient amulet
	{ name = "gold coin", chance = 100000, maxCount = 187 },
	{ name = "small emerald", chance = 6000, maxCount = 3 },
	{ name = "small amethyst", chance = 6000, maxCount = 4 },
	{ name = "scarab coin", chance = 8000, maxCount = 2 },
	{ id = 3046, chance = 11480 }, -- magic light wand
	{ name = "daramian waraxe", chance = 300 },
	{ name = "terra boots", chance = 800 },
	{ name = "scarab shield", chance = 1000 },
	{ name = "winged helmet", chance = 500 },
	{ name = "springsprout rod", chance = 1000 },
	{ name = "pestilence omega", chance = 100 },
	{ name = "scarab pincers", chance = 7000 },
}

monster.attacks = {
	{ name = "melee", interval = 1750, chance = 100, minDamage = -392, maxDamage = -632, condition = { type = CONDITION_POISON, totalDamage = 90, interval = 4100 } },
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -15, maxDamage = -145, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 7000, chance = 30, speedChange = -500, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = false, duration = 25000 },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2460, chance = 30, minDamage = -400, maxDamage = -780, radius = 5, effect = CONST_ME_POISONAREA, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 36,
	mitigation = 0.86,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 380, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 99 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 60 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
