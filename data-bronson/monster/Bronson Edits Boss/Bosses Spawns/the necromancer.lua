local mType = Game.createMonsterType("The Necromancer")
local monster = {}

monster.description = "The Necromancer"
monster.experience = 150000
monster.outfit = {
	lookType = 209,
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

monster.health = 60000
monster.maxHealth = 60000
monster.race = "blood"
monster.corpse = 18293
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 10,
	damage = 30,
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
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 5,
	color = 30,
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{ name = "Banshee", chance = 25, interval = 3000, count = 2 },
		{ name = "blightwalker", chance = 15, interval = 2500, count = 1 },
		{ name = "warlock", chance = 13, interval = 3800, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 25,
	{ text = "Our Enconter Will Be in... HELL!", yell = false },
	{ text = "Bow to the POWER OF SAURON!", yell = false },
	{ text = "Do you wanna see a magic trick? I will blow all in a blink of an eye!", yell = false },
}

monster.loot = {
	{ id = 3574, chance = 47000 }, -- mystic turban
	{ name = "demon legs", chance = 2000 }, 
	{ name = "demon helmet", chance = 2000 }, 
	{ name = "demon armor", chance = 2000 },
	{ name = "dark lord's cape", chance = 3000 },	
	{ id = 6529, chance = 1200 }, -- soft boots
	{ name = "necromancer shield", chance = 80, unique = true },
	{ name = "haunted blade", chance = 7500 },
	{ id = 7451, chance = 6500 }, -- shadow sceptre ~ deveria ser saruman sceptre
	{ name = "platinum coin", chance = 42000, maxCount = 25 }, 
	{ name = "platinum coin", chance = 22000, maxCount = 25 }, 
	{ name = "platinum coin", chance = 35000, maxCount = 15 }, 
	{ name = "behemoth claw", chance = 20500, maxCount = 10 },
	{ id = 131, chance = 30500 },	-- ectoplasm container
	{ id = 5944, chance = 45000 }, -- show orb
	{ id = 3081, chance = 22000 }, -- stone skin amulet
	{ id = 3081, chance = 20000 }, -- stone skin amulet
	{ id = 5809, chance = 15400 }, -- soul stone
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -640, maxDamage = -960},
	{ name = "combat", interval = 2550, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -600, maxDamage = -900, range = 1, effect = CONST_ME_EXPLOSIONAREA, target = true },	
	{ name = "combat", interval = 2230, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -800, range = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_YELLOW_RINGS, target = true },
	{ name = "condition", type = CONDITION_POISON, interval = 6200, chance = 20, minDamage = -65, maxDamage = -65, range = 8, shootEffect = CONST_ANI_POISON, condition = { type = CONDITION_POISON, totalDamage = 1300, interval = 2000 } },
	{ name = "combat", interval = 2850, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -1500, length = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2530, chance = 40, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -800, range = 8, radius = 7, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true },
}

monster.defenses = {
	defense = 85,
	armor = 95,
	mitigation = 7.18,
	{ name = "combat", interval = 800, chance = 100, type = COMBAT_HEALING, minDamage = 120, maxDamage = 150, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 6000, chance = 20, effect = CONST_ME_POFF, duration = 5000  },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 50 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
