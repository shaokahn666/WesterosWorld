local mType = Game.createMonsterType("Baalrog")
local monster = {}

monster.description = "Baalrog"
monster.experience = 180000
monster.outfit = {
	lookType = 243,
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

monster.health = 65000
monster.maxHealth = 65000
monster.race = "undead"
monster.corpse = 6324
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 50,
	health = 10,
	damage = 30,
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
	interval = 4000,
	chance = 25,
	{ text = "My wrath will burn your soul!", yell = false },
	{ text = "You shall not pass? The last one who spoke this is dead!", yell = false },
	{ text = "YOU NEVER WILL BECOME KING OF SPIRIT OF FIRES!", yell = true },
	{ text = "Revenge is a dish best served... BURNED!", yell = true },
}

monster.summon = {
	maxSummons = 5,
	summons = {
		{ name = "spirit of fire", chance = 17, interval = 2000, count = 1 },
		{ name = "Hellfire Fighter", chance = 15, interval = 2500, count = 1 },
		{ name = "Fire elemental", chance = 35, interval = 2500, count = 3 },
	},
}

monster.loot = {
	{ name = "molten plate", chance = 300}, -- molten plate
	{ id = 9018, chance = 250}, --firewalker boots
	{ id = 16154, chance = 600}, --glow wine
	{ id = 8039, chance = 550}, --baalrog robe
	{ name = "demon legs", chance = 800},	
	{ name = "fire sword", chance = 40500},
	{ name = "thunder hammer", chance = 600},
	{ name = "phoenix shield", chance = 650},
	{ name = "fire axe", chance = 30000},
	{ name = "wand of inferno", chance = 60500},
	{ id = 3043, chance = 15000, maxCount = 6 }, -- crystal coin	
	{ id = 3039, chance = 60000}, -- red gem
	{ id = 3021, chance = 12000}, -- starlight amulet
	{ name = "burning heart", chance = 35000},
	{ name = "talon", chance = 24500, maxCount = 10 }, -- talon
	{ name = "small ruby", chance = 18500, maxCount = 40 }, -- ruby	
	{ name = "red powder", chance = 45000},	
}

monster.attacks = {
	{ name = "melee", interval = 1800, chance = 100, minDamage = -800, maxDamage = -1440 },
	{ name = "firefield", interval = 3300, chance = 55, range = 7, radius = 5, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2200, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -500, maxDamage = -750, range = 7, radius = 3, shootEffect = CONST_ANI_FLAMMINGARROW, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2500, chance = 99, type = COMBAT_FIREDAMAGE, minDamage = -150, maxDamage = -200, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_EXPLOSIONAREA, target = true },
	{ name = "combat", interval = 4100, chance = 23, type = COMBAT_FIREDAMAGE, minDamage = -1200, maxDamage = -2000, range = 7, radius = 11, effect = CONST_ME_FIREATTACK, target = false },
	{ name = "combat", interval = 1800, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -1500, maxDamage = -2500, lenght = 8, spread = 0, effect = CONST_ME_POFF, target = false },
}

monster.defenses = {
	defense = 85,
	armor = 100,
	mitigation = 5.7,
	{ name = "combat", interval = 3200, chance = 38, type = COMBAT_HEALING, minDamage = 500, maxDamage = 900, effect = CONST_ME_FIREWORK_RED, target = false },
	{ name = "combat", interval = 900, chance = 100, type = COMBAT_HEALING, minDamage = 100, maxDamage = 200, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 95 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
