local mType = Game.createMonsterType("Scatha")
local monster = {}

monster.description = "Scatha"
monster.experience = 40000
monster.outfit = {
	lookType = 947,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"bossesAlive",
}

monster.health = 28000
monster.maxHealth = 28000
monster.race = "undead"
monster.corpse = 25185
monster.speed = 280
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
	rewardBoss = true,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Frost Dragon", chance = 8, interval = 5000, count = 2 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 20,
	{ text = "I will blow a freezing breath into you!", yell = false },
	{ text = "I'm so cold! Like the heart of a fallen soldier!", yell = false },
	{ text = "I will freeze your soul!", yell = false },
}

monster.loot = {
	{ name = "golden fir cone", chance = 100, unique = true},
	{ name = "ice rapier", chance = 8000 },	
	{ id = 6529, chance = 100 }, -- soft boots
	{ id = 8050, chance = 100 }, -- crystalline armor
	{ name = "crystal mace", chance = 200 },
	{ name = "frost razor", chance = 3000 },
	{ name = "haunted blade", chance = 3000 },
	{ name = "aghanim robe", chance = 400 },
	{ name = "aghanim legs", chance = 400 },
	{ name = "medusa shield", chance = 400 },
	{ id = 3041, chance = 5500 }, -- blue gem
	{ id = 3082, chance = 3000 }, -- elven amulet
	{ name = "power bolt", chance = 15000, maxCount = 45 },
	{ name = "small sapphire", chance = 15000, maxCount = 25 },
	{ name = "platinum coin", chance = 50000, maxCount = 75 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -640, maxDamage = -1040 },
	{ name = "combat", interval = 2300, chance = 99, type = COMBAT_ICEDAMAGE, minDamage = -420, maxDamage = -590, radius = 6, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true },	
	{ name = "combat", interval = 2150, chance = 25, type = COMBAT_ICEDAMAGE, minDamage = -500, maxDamage = -800, spread = 3, lenght = 8, effect = CONST_ME_ICEAREA},
	{ name = "speed", interval = 5200, chance = 50, speedChange = -800, range = 7, radius = 5, shootEffect = CONST_ANI_ICE, effect = CONST_ME_GIANTICE, target = true, duration = 5000 },
}

monster.defenses = {
	defense = 75,
	armor = 68,
	mitigation = 2.57,
	{ name = "combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 50, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },

}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 35 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = 95 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 95 },
	{ type = COMBAT_HOLYDAMAGE, percent = 60 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
