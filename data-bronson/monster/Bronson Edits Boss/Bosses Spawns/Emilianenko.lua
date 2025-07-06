local mType = Game.createMonsterType("Emelianenko")
local monster = {}

monster.description = "Emelianenko"
monster.experience = 550000
monster.outfit = {
	lookType = 323,
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

monster.raceId = 521
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Alchemist Quarter and Factory Quarter (Yalahar), Robson's Isle, Tiquanda Laboratory.",
}

monster.health = 40000
monster.maxHealth = 40000
monster.race = "blood"
monster.corpse = 5798
monster.speed = 323
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 30,
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
	staticAttackChance = 40,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 1,
	color = 2,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Take that creature off my back!! I can feel it!", yell = false },
	{ text = "You will regret interrupting my studies!", yell = false },
	{ text = "You will be the next infected one... CRAAAHHH!", yell = false },
	{ text = "Science... is a curse.", yell = false },
	{ text = "Run as fast as you can.", yell = false },
	{ text = "Oh by the gods! What is this... aaaaaargh!", yell = false },
}

monster.loot = {
	{ name = "demonrage sword", chance = 15000 },
	{ name = "axe of maim", chance = 15000 },
	{ name = "golden legs", chance = 8000 },
	{ name = "golden armor", chance = 1000 },
	{ name = "golden helmet", chance = 1000 },
	{ name = "golden boots", chance = 700 },
	{ name = "great shield", chance = 700 },	
}

monster.attacks = {
	{ name = "melee", interval = 800, chance = 100, minDamage = -800, maxDamage = -1900},	
	{ name = "combat", interval = 2170, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -1800, maxDamage = -2800, range = 1, effect = CONST_ME_STUN, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = -600, range = 7, effect = CONST_ME_STUN, target = true, duration = 30000 },
	{ name = "condition", type = CONDITION_POISON, interval = 2640, chance = 15, minDamage = -250, maxDamage = -250, effect = CONST_ME_SLEEP, condition = { type = CONDITION_POISON, totalDamage = 5000, interval = 2000 } },
}

monster.defenses = {
	defense = 150,
	armor = 140,
	mitigation = 11.59,
	{ name = "speed", interval = 2000, chance = 15, speedChange = 220, effect = CONST_ME_GREEN_RINGS, target = false, duration = 5000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 90 },
	{ type = COMBAT_MANADRAIN, percent = 90 },
	{ type = COMBAT_DROWNDAMAGE, percent = 90 },
	{ type = COMBAT_ICEDAMAGE, percent = 90 },
	{ type = COMBAT_HOLYDAMAGE, percent = 90 },
	{ type = COMBAT_DEATHDAMAGE, percent = 90 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = true },
}

mType:register(monster)
