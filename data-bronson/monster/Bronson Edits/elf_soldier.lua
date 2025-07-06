local mType = Game.createMonsterType("Elf Soldier")
local monster = {}

monster.description = "an elf"
monster.experience = 440
monster.outfit = {
	lookType = 62,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 62
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter and Trade Quarter, Maze of Lost Souls, Orc Fort (unreachable), \z
		Hellgate, Shadowthorn, Ab'Dendriel elf caves, Elvenbane, north of Thais.",
}

monster.health = 500
monster.maxHealth = 500
monster.race = "blood"
monster.corpse = 6003
monster.speed = 95
monster.manaCost = 320

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
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	{ text = "Death to the Defilers!", yell = false },
	{ text = "You are not welcome here.", yell = false },
	{ text = "Flee as long as you can.", yell = false },
	{ text = "Bahaha aka!", yell = false },
	{ text = "Ulathil beia Thratha!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 44000, maxCount = 30 },
	{ id = 5921, chance = 940 }, -- heaven blossom
	{ name = "plum", chance = 20000, maxCount = 2 },
	{ name = "elvish talisman", chance = 2100 },
	{ name = "bright sword", chance = 220 },
	{ name = "griffin shield", chance = 440 },
	{ name = "horseman helmet", chance = 800 },
	{ name = "amulet of loss", chance = 200 },
	{ name = "elven legs", chance = 880 },
	{ name = "elven astral observer", chance = 7710 },
	

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -70, maxDamage = -180 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -50, maxDamage = -80, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.30,
{ name = "combat", interval = 5200, chance = 25, type = COMBAT_HEALING, minDamage = 40, maxDamage = 75, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 90 },
	{ type = COMBAT_EARTHDAMAGE, percent = 25 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 25 },
	{ type = COMBAT_HOLYDAMAGE, percent = 90 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
