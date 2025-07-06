local mType = Game.createMonsterType("Adramelech")
local monster = {}

monster.description = "Adramelech"
monster.experience = 50000
monster.outfit = {
	lookType = 12,
	lookHead = 0,
	lookBody = 123,
	lookLegs = 97,
	lookFeet = 94,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 60000
monster.maxHealth = 60000
monster.race = "undead"
monster.corpse = 5526
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.events = {
	"bossesAlive",
}

monster.bosstiary = {
	bossRaceId = 312,
	bossRace = RARITY_NEMESIS,
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
	chance = 30,
	{ text = "COME HERE AND DIE!", yell = true },
	{ text = "FLAWLESS VICTORY!!", yell = true },
	{ text = "YOU ARE A COWARD! FIGHT LIKE A GROWN MAN!", yell = true },
}

monster.loot = {
	{ name = "boots of haste", chance = 15000 },
	{ name = "decorative ribbon", chance = 5000, unique = true },
	{ name = "magic plate armor", chance = 400, unique = true },	
	{ name = "mastermind shield", chance = 2000 },
	{ name = "warlord sword", chance = 600 },
	{ name = "demon helmet", chance = 1500 },
	{ name = "great shield", chance = 350, unique = true },
	{ name = "giant sword", chance = 20000 },
	{ id = 3043, chance = 50000, maxCount = 2 }, -- crystal coin	
	{ id = 3043, chance = 10000, maxCount = 2 }, -- crystal coin	
	{ id = 6299, chance = 10000}, -- ring of tarrasque
	{ id = 5943, chance = 5000}, -- morgaroth heart
}

monster.attacks = {
	{ name = "melee", interval = 1700, chance = 100, minDamage = -400, maxDamage = -800 },
	{ name = "combat", interval = 2324, chance = 99, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -1100, range = 7, radius = 1, shootEffect = CONST_ANI_WHIRLWINDSWORD, effect = CONST_ME_DRAWBLOOD, target = true },	
	{ name = "combat", interval = 2211, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -1000, range = 7, radius = 5, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 4122, chance = 28, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -800, range = 7, radius = 5, effect = CONST_ME_YELLOW_ENERGY_SPARK, target = false },
	{ name = "combat", interval = 3850, chance = 29, type = COMBAT_ENERGYDAMAGE, minDamage = -450, maxDamage = -750, range = 7, radius = 4, effect = CONST_ME_ENERGYAREA, target = false },
}

monster.defenses = {
	defense = 88,
	armor = 93,
	mitigation = 5.6,
	{ name = "combat", interval = 1000, chance = 100, type = COMBAT_HEALING, minDamage = 150, maxDamage = 260, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 7000, chance = 50, speedChange = 200, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 50 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = 25 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 35 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
