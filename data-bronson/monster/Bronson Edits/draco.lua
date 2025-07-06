local mType = Game.createMonsterType("Draco")
local monster = {}

monster.description = "a draco"
monster.experience = 2400
monster.outfit = {
	lookType = 34,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 34
monster.Bestiary = {
	class = "Dragon",
	race = BESTY_RACE_DRAGON,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Dragon Vip, Dragon II, Dragon I and various others places...",
}

monster.health = 2000
monster.maxHealth = 2000
monster.race = "blood"
monster.corpse = 5973
monster.speed = 170
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 5,
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
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 1,
	runHealth = 200,
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
	{ text = "Feel the breath of Draco", yell = true },
	{ text = "GROOAAARRR", yell = true },
}

monster.loot = {

	{ name = "dragon ham", chance = 11270, maxCount = 2 },
	{ name = "green dragon scale", chance = 4000 },
	{ id = 9611, chance = 1500, maxCount = 1 }, -- Dragon Claw (Green)
	{ name = "green dragon leather", chance = 5500, maxCount = 2 },
	{ id = 7419, chance = 40}, -- dreaded cleaver
	{ name = "plate legs", chance = 350 },
	{ name = "double axe", chance = 500 },
	{ id = 3449, chance = 10000, maxCount = 13 }, -- burst arrow
	{ name = "dragon shield", chance = 290 },
	{ name = "serpent sword", chance = 800 },	
	{ name = "gold coin", chance = 90920, maxCount = 50 },
	{ name = "small diamond", chance = 2000 },	
	{ name = "life crystal", chance = 100 },	
	{ id = 3386, chance = 2}, -- dragon scale mail
	{ id = 3363, chance = 3}, -- dragon scale legs
	{ name = "dragon's tail", chance = 10000 },	
	{ name = "strong health potion", chance = 1130 },

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 90, minDamage = -160, maxDamage = -320 },
	{ name = "combat", interval = 2100, chance = 25, type = COMBAT_FIREDAMAGE, minDamage = -120, maxDamage = -220, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1750, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -130, maxDamage = -230, length = 6, spread = 4, effect = CONST_ME_POFF, target = false },
}

monster.defenses = {
	defense = 30,
	armor = 25,
	mitigation = 0.99,
	{ name = "combat", interval = 1500, chance = 20, type = COMBAT_HEALING, minDamage = 50, maxDamage = 100, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 95 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
