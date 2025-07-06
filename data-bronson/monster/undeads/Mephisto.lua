local mType = Game.createMonsterType("Mephisto")
local monster = {}

monster.description = "a Mephisto"
monster.experience = 20000
monster.outfit = {
	lookType = 287,
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
	CharmsPoints = 50,
	Stars = 3,
	Occurrence = 0,
	Locations = "Drefia and Vampire Castle on Vengoth, Edron Vampire Crypt.",
}

monster.health = 23000
monster.maxHealth = 23000
monster.race = "undead"
monster.corpse = 8109
monster.speed = 140
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
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
	staticAttackChance = 90,
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
	{ text = "Not in my face you barbarian!", yell = false },
	{ text = "I envy you to be slain by someone as beautiful as me.", yell = false },
	{ text = "So it shall be written. So it shall be done.", yell = false },
	{ text = "My brides will feast on your souls!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000 },
	{ name = "blood preservation", chance = 94000 },
	{ id = 6529, chance = 350 }, --soft boots
	{ name = "dreaded cleaver", chance = 660 },
	{ name = "royal spear", chance = 450 },
	{ name = "khel thuzads skin", chance = 65 },
	{ name = "mastermind shield", chance = 175 },
	{ name = "demon legs", chance = 220 },
	{ name = "haunted blade", chance = 800 },
	{ name = "skull helmet", chance = 175 },
	{ name = "platinum coin", chance = 12000, maxCount = 5 },
	{ name = "crystal coin", chance = 1000, maxCount = 1 },
	{ id = 6299, chance = 800 }, --deathring
	{ name = "royal fanfare", chance = 700 },
	{ id = 3098, chance = 12000 }, -- ring of healing
	{ id = 3114, chance = 12000 }, -- skull
	{ name = "spellbook of lost souls", chance = 800 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -804, maxDamage = -1160 },
	{ name = "combat", interval = 2000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = 700, maxDamage = -1000, length = 8, spread = 0, effect = CONST_ME_WHITE_ENERGY_SPARK },
	{ name = "combat", interval = 6030, chance = 35, type = COMBAT_LIFEDRAIN, minDamage = -1200, maxDamage = -1600, range = 1, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 2900, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -480, maxDamage = -620, range = 7, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", interval = 1820, chance = 45, type = COMBAT_DEATHDAMAGE, minDamage = -220, maxDamage = -460,  radius = 2, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2230, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -560, maxDamage = -660, radius = 5,  range = 14, effect = CONST_ME_POFF, target = true },
	{ name = "combat", interval = 4110, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -450, maxDamage = -650, radius = 2, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_GROUNDSHAKER, target = false },

}

monster.defenses = {
	defense = 30,
	armor = 30,
	--	mitigation = ???,
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 100, maxDamage = 235, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 14000, chance = 45, effect = CONST_ME_MAGIC_BLUE },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 29 },
	{ type = COMBAT_EARTHDAMAGE, percent = 62 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 32 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 92 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
