local mType = Game.createMonsterType("Elf Ranger")
local monster = {}

monster.description = "an elf ranger"
monster.experience = 550
monster.outfit = {
	lookType = 64,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 64
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 500,
	FirstUnlock = 25,
	SecondUnlock = 250,
	CharmsPoints = 15,
	Stars = 2,
	Occurrence = 0,
	Locations = "Yalahar Foreigner Quarter, Shadowthorn, northwest of Ab'Dendriel, north and west of Mount Sternum, \z
		Hellgate, Maze of Lost Souls, near Knightwatch Tower in the Plains of Havoc. \z
		Two may also spawn when a Desperate White Deer or an Enraged White Deer is killed.",
}

monster.health = 600
monster.maxHealth = 600
monster.race = "blood"
monster.corpse = 6012
monster.speed = 110
monster.manaCost = 360

monster.changeTarget = {
	interval = 4000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
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
	{ text = "Tha'shi Ab'Dendriel!", yell = false },
	{ text = "Evicor guide my arrow!", yell = false },
	{ text = "Your existence will end here!", yell = false },
	{ text = "Feel the sting of my arrows!", yell = false },
	{ text = "Thy blood will quench the soil's thirst!", yell = false },
}

monster.loot = {
	{ name = "gold coin", chance = 75000, maxCount = 25 },
	{ name = "bow", chance = 4000 },
	{ name = "arrow", chance = 30710, maxCount = 12 },
	{ name = "poison arrow", chance = 15400, maxCount = 4 },
	{ name = "grapes", chance = 17750 },
	{ id = 5921, chance = 1130 }, -- heaven blossom
	{ name = "elvish bow", chance = 140 },
	{ name = "bright sword", chance = 220 },
	{ name = "griffin shield", chance = 440 },
	{ name = "elvish bow", chance = 380 },
	{ name = "horseman helmet", chance = 800 },
	{ name = "amulet of loss", chance = 200 },
	{ name = "belted cape", chance = 580 },
	{ name = "elvish talisman", chance = 5200 },
	{ name = "elven scouting glass", chance = 9750 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -15 },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -70, maxDamage = -150, range = 7, shootEffect = CONST_ANI_ARROW, target = false },
	--{ name = "combat", interval = 2000, chance = 100, type = COMBAT_ENERGYDAMAGE minDamage = -70, maxDamage = -150, range = 7, shootEffect = CONST_ANI_SHIVERARROW, target = false },
}

monster.defenses = {
	defense = 10,
	armor = 7,
	mitigation = 0.46,
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
