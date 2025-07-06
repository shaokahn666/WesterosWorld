local mType = Game.createMonsterType("Lord Baalsec")
local monster = {}

monster.description = "Lord Baalsec"
monster.experience = 90000
monster.outfit = {
	lookType = 287,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 476,
	bossRace = RARITY_NEMESIS,
}

monster.health = 400
monster.maxHealth = 40000
monster.race = "undead"
monster.corpse = 8109
monster.speed = 380
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
	interval = 5000,
	chance = 10,
	{ text = "Feel the power of Lord Baalsec!", yell = false },
	{ text = "Muahaha! you are a intimate? a weak guy like you will be a girl in prision.", yell = false },
}

monster.loot = {
	{ id = 8192, chance = 75000, maxCount = 1, unique = true }, -- vampire lord token
	{ id = 18927, chance = 100000 }, -- vampire's cape chain
	{ id = 18936, chance = 5000 }, -- vampire count's medal
	{ id = 18935, chance = 5000 }, -- vampire's signet ring
	{ id = 11449, chance = 50000 }, -- blood preservation
	{ id = 9685, chance = 50000 }, -- vampire teeth
	{ id = 19083, chance = 5000 }, -- silver raid token
	{ id = 3031, chance = 1000000, maxCount = 100 }, -- gold coin
	{ id = 3035, chance = 100000, maxCount = 5 }, -- platinum coin
	{ id = 237, chance = 50000, maxCount = 3 }, -- strong mana potion
	{ id = 236, chance = 50000, maxCount = 3 }, -- strong health potion
	{ id = 3049, chance = 10000 }, -- stealth ring
	{ id = 3098, chance = 10000 }, -- ring of healing
	{ id = 5909, chance = 10000 }, -- white piece of cloth
	{ id = 5911, chance = 10000 }, -- red piece of cloth
	{ id = 5912, chance = 10000 }, -- blue piece of cloth
	{ id = 7427, chance = 5000 }, -- chaos mace
	{ id = 3326, chance = 10000 }, -- epee
	{ id = 7419, chance = 5000 }, -- dreaded cleaver
	{ id = 8075, chance = 5000 }, -- spellbook of lost souls
	{ id = 19373, chance = 5000 }, -- haunted mirror piece
	{ id = 3434, chance = 5000 }, -- vampire shield
	{ id = 19374, chance = 5000 }, -- vampire silk slippers
	{ id = 3028, chance = 50000, maxCount = 5 }, -- small diamond
	{ id = 3027, chance = 50000, maxCount = 5 }, -- black pearl
	{ id = 3029, chance = 50000, maxCount = 5 }, -- small sapphire
	{ id = 3032, chance = 50000, maxCount = 5 }, -- small emerald
	{ id = 3036, chance = 10000 }, -- violet gem
}


monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 70, attack = 95 },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_DEATHDAMAGE, minDamage = 0, maxDamage = -190, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
}

monster.defenses = {
	defense = 155,
	armor = 158,
	mitigation = 7.04,
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 1235, effect = CONST_ME_MAGIC_BLUE, target = false },

}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 55 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -5 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 100 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
