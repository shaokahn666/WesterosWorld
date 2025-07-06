local mType = Game.createMonsterType("Pirate Captain")
local monster = {}

monster.description = "a pirate captain"
monster.experience = 4000
monster.outfit = {
	lookType = 98,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 250
monster.Bestiary = {
	class = "Human",
	race = BESTY_RACE_HUMAN,
	toKill = 1000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 25,
	Stars = 3,
	Occurrence = 0,
	Locations = "Nargor, Trade Quarter, Foreigner Quarter Dock, Krailos Steppe During a World Change.",
}

monster.health = 12500
monster.maxHealth = 12500
monster.race = "blood"
monster.corpse = 18194
monster.speed = 260
monster.manaCost = 0

monster.changeTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
}

monster.strategiesTarget = {
	nearest = 100,
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 40,
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
	{ text = "Hiyaa!", yell = false },
	{ text = "Give up!", yell = false },
	{ text = "Plundeeeeer!", yell = false },
}

monster.loot = {
	{ name = "dark armor", chance = 6000 },
	{ name = "dark shield", chance = 8000 },
	{ id = 6101, chance = 9000 }, -- ron the ripper's sabre
	{ name = "pirate boots", chance = 3000 },	
	{ name = "skull helmet", chance = 400 },	
	{ name = "naginata", chance = 400 },	
	{ name = "axe of maim", chance = 350 },	
	{ name = "hook", chance = 70000 },
	{ name = "eye patch", chance = 50000 },
	{ name = "peg leg", chance = 50000 },
	{ name = "pirate backpack", chance = 100000 },
		{ name = "platinum coin", chance = 95000, maxCount = 20 },

}

monster.attacks = {
	{ name = "melee", interval = 1500, chance = 100, minDamage = -128, maxDamage = -224 },
	{ name = "combat", interval = 1650, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -130, maxDamage = -230, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
	{ name = "combat", interval = 2890, chance = 5, type = COMBAT_PHYSICALDAMAGE, minDamage = -110, maxDamage = -500, range = 7, shootEffect = CONST_ANI_THROWINGKNIFE, target = false },
}

monster.defenses = {
	defense = 35,
	armor = 20,
	mitigation = 1.46,
	{ name = "combat", interval = 500, chance = 100, type = COMBAT_HEALING, minDamage = 30, maxDamage = 60, effect = CONST_ME_MAGIC_BLUE,  target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
