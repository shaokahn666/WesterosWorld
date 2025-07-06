local mType = Game.createMonsterType("Evancing")
local monster = {}

monster.description = "Evancing"
monster.experience = 650000
monster.outfit = {
	lookType = 12,
	lookHead = 1,
	lookBody = 94,
	lookLegs = 79,
	lookFeet = 78,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"bossesAlive",
}

monster.health = 250000
monster.maxHealth = 250000
monster.race = "undead"
monster.corpse = 5526
monster.speed = 450
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.bosstiary = {
	bossRaceId = 229,
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
	chance = 10,
	{ text = "I AM EVANCING, LORD OF THE TRIANGLE... AND YOU ARE LOST!", yell = true },
	{ text = "MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!", yell = true },
	{ text = "THE TRIANGLE OF TERROR WILL RISE!", yell = true },
	{ text = "DEATH TO ALL!", yell = true },
}

monster.loot = {
	{ name = "blade of corruption", chance = 3000 }, -- blade of corruption
	{ name = "shield of corruption", chance = 700 }, -- shield of corruption
	{ name = "draken boots", chance = 10000 }, -- draken boots	
	{ id = 3006, chance = 5000}, -- rinf of the sky	
	{ name = "elite draken mail", chance = 2500 }, -- elite draken mail	
	{ id = 27267, chance = 100000, unique = true }, -- 43002 key 27267,
	{ name = "talon", chance = 24500, maxCount = 3 }, -- talon
	{ name = "small ruby", chance = 18500, maxCount = 40 }, -- ruby
	{ name = "small emerald", chance = 18500, maxCount = 40 }, -- emerald
	{ name = "small amethyst", chance = 18500, maxCount = 40 }, -- amethyst
	{ name = "small diamond", chance = 18500, maxCount = 40 }, -- diamond
}

monster.attacks = {
	{ name = "melee", interval = 1350, chance = 100, minDamage = -1250, maxDamage = -1600 },
	{ name = "combat", interval = 2153, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -1450, maxDamage = -1950, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },	
	{ name = "combat", interval = 2000, chance = 45, type = COMBAT_PHYSICALDAMAGE, minDamage = -950, maxDamage = -1650, lenght = 8, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2355, chance = 75, type = COMBAT_ENERGYDAMAGE, minDamage = -1400, maxDamage = -2020, range = 7, radius = 2, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_PURPLEENERGY, target = true },
	{ name = "combat", interval = 2658, chance = 55, type = COMBAT_PHYSICALDAMAGE, minDamage = -1350, maxDamage = -2050, radius = 7, effect = CONST_ME_MORTAREA, target = false },
}

monster.defenses = {
	defense = 110,
	armor = 120,
	mitigation = 8.0,
	{ name = "combat", interval = 2000, chance = 20, type = COMBAT_HEALING, minDamage = 250, maxDamage = 750, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 80, speedChange = 808, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 5 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 60 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 30 },
	{ type = COMBAT_HOLYDAMAGE, percent = 30 },
	{ type = COMBAT_DEATHDAMAGE, percent = 80 },
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
