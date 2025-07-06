local mType = Game.createMonsterType("Jormungand")
local monster = {}

monster.description = "the Jormungand"
monster.experience = 21000
monster.outfit = {
	lookType = 563,
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

monster.raceId = 121

monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Northern Hydra Mountain in east Tiquanda, southern Hydra Mountain, Hydra Egg Quest in Tiquanda \z
	north-east of the Elephant Tusk Quest, Forbidden Lands hydra cave, Deeper Banuta, Talahu surface, \z
	Ferumbras Citadel, Yalahar Arena and Zoo Quarter, Yalahar Foreigner Quarter (Crystal Lake), Oramond Hydra/Bog Raider Cave.",
}

monster.health = 35500
monster.maxHealth = 35500
monster.race = "blood"
monster.corpse = 18974
monster.speed = 180
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
	{ text = "FCHHHHH", yell = true },
	{ text = "HISSSS", yell = true },
}

monster.loot = {
	{ name = "gold coin", chance = 87970, maxCount = 212 },
	{ name = "dragon ham", chance = 59510, maxCount = 80 },
	{ name = "platinum coin", chance = 49910, maxCount = 3 },
	{ name = "hydra head", chance = 10820 },
	{ name = "cucumber", chance = 6900 },
	{ name = "green gem", chance = 10000 },
	{ name = "small sapphire", chance = 3920 },
	{ name = "warrior helmet", chance = 1310 },
	{ name = "knight armor", chance = 1120 },
	{ name = "life crystal", chance = 930 },
	{ id = 3098, chance = 840 }, -- ring of healing
	{ name = "hydra egg", chance = 840 },
	{ name = "strong mana potion", chance = 840 },
	{ name = "stone skin amulet", chance = 750 },
	{ name = "boots of haste", chance = 190 },
	{ name = "medusa shield", chance = 190 },
	{ name = "royal helmet", chance = 90 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -300, maxDamage = -500 },
	{ name = "speed", interval = 7000, chance = 35, speedChange = -700, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true, duration = 15000 },
	{ name = "condition", type = CONDITION_POISON, interval = 4600, chance = 35, range = 7, radius = 3, minDamage = -30, maxDamage = -30, condition = { type = CONDITION_POISON, totalDamage = 2000, interval = 4000 }, effect = CONST_ME_MAGIC_GREEN},
	{ name = "combat", interval = 2100, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -150, maxDamage = -350, length = 8, spread = 4, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 2200, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -160, maxDamage = -380, shootEffect = CONST_ANI_SMALLICE, target = false },
	{ name = "combat", interval = 2500, chance = 30, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -320, length = 8, spread = 3, effect = CONST_ME_CARNIPHILA, target = false },
	{ name = "poisonfield", interval = 1000, chance = 10, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, target = true },
}

monster.defenses = {
	defense = 35,
	armor = 27,
	mitigation = 1.18,
	{ name = "combat", interval = 700, chance = 100, type = COMBAT_HEALING, minDamage = 90, maxDamage = 130, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = 60 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 90 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 70 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
