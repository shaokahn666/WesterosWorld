local mType = Game.createMonsterType("Valaraukar")
local monster = {}

monster.description = "Valaraukar"
monster.experience = 45000
monster.outfit = {
	lookType = 300,
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

monster.health = 40000
monster.maxHealth = 40000
monster.race = "undead"
monster.corpse = 8127
monster.speed = 400
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
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
	chance = 20,
	{ text = "Your time is ending... Come here to antecipate your pain!", yell = false },
	{ text = "Afraid of DEATH? Muahaha! I'M THE DEATH!", yell = false },
	{ text = "I'm proud to be a Minion of The Evil Master Sauron!", yell = false },
}

monster.loot = {
	{ id = 6299, chance = 12000 }, -- ring of tarrasque
	{ name = "demonrage sword", chance = 2500 },
	{ name = "dark lord's cape", chance = 2500 },	
	{ name = "skull helmet", chance = 15000 },	
	{ name = "aghanim legs", chance = 5500 },		
	{ name = "orichalcum pearl", chance = 40000, maxCount = 4 },
	{ id = 3043, chance = 20000, maxCount = 5 }, -- crystal coin	
	{ name = "small emerald", chance = 18500, maxCount = 12 }, -- emerald	
	{ name = "flask of demonic blood", chance = 7500, maxCount = 2 },
	{ id = 131, chance = 30500 },	-- ectoplasm container
	{ name = "demonic essence", chance = 75000, maxCount = 2 }, -- demonic essence	
	{ name = "scythe", chance = 100000 },
	{ name = "black hood", chance = 100000 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -680, maxDamage = -1200 },
	{ name = "combat", interval = 2500, chance = 33, type = COMBAT_DEATHDAMAGE, minDamage = -450, maxDamage = -750, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 2700, chance = 33, type = COMBAT_LIFEDRAIN, minDamage = -300, maxDamage = -600, length = 7, spread = 0, effect = CONST_ME_EXPLOSIONAREA, target = false },
	{ name = "combat", interval = 3500, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -750, maxDamage = -1200, range = 7, radius = 4, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONAREA, target = false },	
}

monster.defenses = {
	defense = 75,
	armor = 60,
	mitigation = 4.64,
	{ name = "combat", interval = 1000, chance = 50, type = COMBAT_HEALING, minDamage = 100, maxDamage = 195, effect = CONST_ME_MORTAREA, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 10 },
	{ type = COMBAT_EARTHDAMAGE, percent = -20 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 95 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
