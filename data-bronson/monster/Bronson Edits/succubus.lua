local mType = Game.createMonsterType("Succubus")
local monster = {}

monster.description = "a succubus"
monster.experience = 260
monster.outfit = {
	lookType = 237,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 288
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Bree, close to Dragon1",
}

monster.health = 430
monster.maxHealth = 430
monster.race = "fire"
monster.corpse = 6363
monster.speed = 210
monster.manaCost = 0

monster.changeTarget = {
	interval = 3000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 50,
	health = 20,
	damage = 20,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
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
	{ text = "You will feel the power of succubus!", yell = false },
	{ text = "He he he, you see to be a old bronson player...", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 100000, maxCount = 40 },
	{ name = "gold coin", chance = 20000, maxCount = 21 },
	{ name = "gold coin", chance = 3390, maxCount = 4 },
	{ id = 3049, chance = 200 }, -- stealth ring
	{ id = 3307, chance = 900 }, -- scimitar
	{ name = "corncob", chance = 15000, maxCount = 3 },
	{ name = "Devil Helmet", chance = 200 },
	{ name = "Guardian shield", chance = 100 },
	{ name = "leather boots", chance = 2000 },
	{ name = "dragon necklace", chance = 1030 },
	{ name = "pitchfork", chance = 10000 },
	{ name = "small ruby", chance = 1000, maxCount = 2 },
	{ name = "small ruby", chance = 500, maxCount = 1 },
	
	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -60, maxDamage = -100},
	{ name = "combat", interval = 3200, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -30, maxDamage = -50, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 2100, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -50, maxDamage = -100, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREATTACK, target = true },
	{ name = "firefield", interval = 10000, chance = 5, range = 7, radius = 1, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "outfit", interval = 1000, chance = 2, effect = CONST_ME_MAGIC_RED, target = true, duration = 5000, outfitMonster = "succubus" },
}

monster.defenses = {
	defense = 10,
	armor = 10,
	mitigation = 1.46,
	{ name = "combat", interval = 10000, chance = 10, type = COMBAT_HEALING, minDamage = 10, maxDamage = 25, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = 300, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
	{ name = "invisible", interval = 4000, chance = 5, effect = CONST_ME_TELEPORT },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -10 },
	{ type = COMBAT_HOLYDAMAGE, percent = -5 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
