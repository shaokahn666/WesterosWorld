local mType = Game.createMonsterType("Spirit of nature")
local monster = {}

monster.description = "a spirit of nature"
monster.experience = 45000
monster.outfit = {
	lookType = 567,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 20000
monster.maxHealth = 20000
monster.race = "undead"
monster.corpse = 19041
monster.speed = 68
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 3,
}

monster.strategiesTarget = {
	nearest = 20,
	health = 40,
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

monster.events = {
	"sptofnature",
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {

	{ id = 3035, chance = 100000, maxCount = 300 }, -- platinum coin
	{ id = 3098, chance = 100000 }, -- ring of healing
}

monster.attacks = {
	{ name = "melee", interval = 2200, chance = 75, minDamage = -55, maxDamage = -200 },
	{ name = "combat", interval = 6000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -100, maxDamage = -300, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 3500, chance = 45, type = COMBAT_EARTHDAMAGE, minDamage = -50, maxDamage = -275, radius = 5, effect = CONST_ME_PLANTATTACK, target = false },
	{ name = "combat", interval = 1800, chance = 60, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -200, range = 7, radius = 4, shootEffect = CONST_ANI_ENVENOMEDARROW, effect = CONST_ME_BIGPLANTS, target = true },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -600, radius = 3, effect = CONST_ME_SMALLPLANTS, target = false, duration = 9000 },
}

monster.defenses = {
	defense = 20,
	armor = 20,
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_HEALING, minDamage = 200, maxDamage = 350, effect = CONST_ME_SMALLPLANTS, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 45 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -20 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 45 },
	{ type = COMBAT_HOLYDAMAGE, percent = 95 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
}

mType:register(monster)
