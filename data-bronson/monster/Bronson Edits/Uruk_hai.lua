local mType = Game.createMonsterType("Uruk-hai")
local monster = {}

monster.description = "an uruk-hai"
monster.experience = 150
monster.outfit = {
	lookType = 7,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 7
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "West of edoras, close to saruman tower!",
}

monster.health = 200
monster.maxHealth = 200
monster.race = "blood"
monster.corpse = 5979
monster.speed = 180
monster.manaCost = 360

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 11,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Alk!", yell = false },
	{ text = "Trak grrrr brik.", yell = false },
	{ text = "Grow truk grrrr.", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 70000, maxCount = 50 },
	{ name = "battle shield", chance = 10000 },
	{ id = 3307, chance = 1900 },
	{ name = "sabre", chance = 2100 },
	{ name = "double axe", chance = 1000 },
	{ name = "dark armor", chance = 1000 },
	{ name = "dark helmet", chance = 1000 },
	{ id = 2875, chance = 6000 },
	{ id = 2877, chance = 1000 }, -- green flask
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -20, maxDamage = -60 },
	{ name = "combat", interval = 3150, chance = 75, type = COMBAT_PHYSICALDAMAGE, range = 6, minDamage = -20, maxDamage = -40, shootEffect = CONST_ANI_BOLT, target = true },
}

monster.defenses = {
	defense = 15,
	armor = 8,
	mitigation = 0.36,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
