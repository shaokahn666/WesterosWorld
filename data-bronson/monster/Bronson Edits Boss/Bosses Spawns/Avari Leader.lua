local mType = Game.createMonsterType("Avari Leader")
local monster = {}

monster.description = "Avari Leader"
monster.experience = 120000
monster.outfit = {
	lookType = 63,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 203,
	bossRace = RARITY_NEMESIS,
}

monster.events = {
	"bossesAlive",
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 6011
monster.speed = 310
monster.manaCost = 0

monster.changeTarget = {
	interval = 2500,
	chance = 15,
}

monster.strategiesTarget = {
	nearest = 10,
	health = 20,
	damage = 30,
	random = 40,
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
	targetDistance = 3,
	runHealth = 2000,
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
	chance = 20,
	{ text = "Salute to Gil-galad!!!", yell = false },
	{ text = "Feel my wrath!", yell = false },
	{ text = "I'll bring balance upon you!", yell = false },
	{ text = "Prepare to face the Strenghest high elf!", yell = false },

}

monster.loot = {
	{ name = "elven mail", chance = 180},
	{ name = "golden armor", chance = 180 },
	{ name = "elven legs", chance = 35000 },
	{ name = "winged helmet", chance = 2000 },
	{ name = "golden legs", chance = 110, unique = true },
	{ name = "aghanim boots", chance = 10200 },
	{ name = "elvenhair rope", chance = 850 },
	{ name = "golden boots", chance = 90, unique = true },
	{ name = "small amethyst", chance = 9000, maxCount = 10 },
	{ name = "platinum coin", chance = 35000, maxCount = 35 },		
	{ name = "platinum coin", chance = 35000, maxCount = 15 },				
	{ name = "platinum coin", chance = 35000, maxCount = 10 },
	{ id = 3449, chance = 3000, maxCount = 12  }, -- burst arrow
	{ id = 7364, chance = 2200, maxCount = 12  }, -- sniper arrow	
	{ id = 3035, chance = 1200, maxCount = 12  }, -- onyx arrow	
	{ name = "strong mana potion", chance = 900, maxCount = 10 },
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -600, maxDamage = -1000 },
	{ name = "combat", interval = 2165, chance = 30, type = COMBAT_HOLYDAMAGE, minDamage = -1000, maxDamage = -2500, lenght = 8, spread = 3, effect = CONST_ME_HOLYAREA, target = false },
	{ name = "combat", interval = 1650, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -450, maxDamage = -1350, range = 7, shootEffect = CONST_ANI_ARROW, effect = CONST_ME_PINK_ENERGY_SPARK, target = true },	
	{ name = "combat", interval = 1930, chance = 45, type = COMBAT_HOLYDAMAGE, minDamage = -800, maxDamage = -1400, range = 7, radius = 1, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2280, chance = 75, type = COMBAT_FIREDAMAGE, minDamage = -550, maxDamage = -800, range = 7, radius = 3, shootEffect = CONST_ANI_BURSTARROW, effect = CONST_ME_FIREAREA, target = true },
	{ name = "speed", interval = 6510, chance = 80, speedChange = -500, range = 7, radius = 1, shootEffect = CONST_ANI_FLASHARROW, effect = CONST_ME_STUN, target = true, duration = 4000 },
}

monster.defenses = {
	defense = 125,
	armor = 85,
	mitigation = 4.51,
	{ name = "combat", interval = 2300, chance = 100, type = COMBAT_HEALING, minDamage = 200, maxDamage = 350, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 55 },
	{ type = COMBAT_EARTHDAMAGE, percent = 35 },
	{ type = COMBAT_FIREDAMAGE, percent = 35 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 65 },
	{ type = COMBAT_HOLYDAMAGE, percent = 85 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
