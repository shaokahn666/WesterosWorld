local mType = Game.createMonsterType("Saruman")
local monster = {}

monster.description = "Saruman"
monster.experience = 350000
monster.outfit = {
	lookType = 844,
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

monster.health = 120000
monster.maxHealth = 120000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 320
monster.manaCost = 0

monster.changeTarget = {
	interval = 6000,
	chance = 80,
}

monster.strategiesTarget = {
	nearest = 30,
	health = 20,
	damage = 40,
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
	targetDistance = 2,
	runHealth = 5000,
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
	chance = 0,
	{ text = "Feel the power of the white wizard!!!", yell = false },
	{ text = "I defeated the Gandalf! Do you think you can beat me?", yell = false },
	{ text = "I NEVER DID BLACK MAGIC! JUST WHITE MAGIC MUAHAHA!", yell = true },
	{ text = "BOW TO THE SUPERIOR WIZARD!!", yell = true },
}

monster.loot = {
	{ id = 6527, chance = 200, unique = true }, -- narsil
	{ id = 8096, chance = 200, unique = true }, -- durins axe
	{ id = 7414, chance = 200, unique = true }, -- glamdring
	{ id = 8027, chance = 200, unique = true }, -- eaglehorn
	{ id = 8024, chance = 200, unique = true }, -- the Buriza	
	{ name = "aiglos", chance = 200, unique = true }, -- aiglos	
	{ name = "aghanim scepter", chance = 200, unique = true }, -- aghanim scepter
	{ name = "mekansm", chance = 200, unique = true }, -- mekansm
	{ id = 21467, chance = 900 }, -- Translation scoll
	{ name = "library ticket", chance = 100000}, -- Avaliar	
	{ id = 2971, chance = 100000, unique = true }, -- the golden key 430001 action
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin	
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
	{ id = 3035, chance = 35000, maxCount = 85 }, -- platinum coin
}

monster.attacks = {
	{ name = "melee", interval = 1300, chance = 100, minDamage = -1200, maxDamage = -1520 },
	{ name = "combat", interval = 2750, chance = 25, type = COMBAT_MANADRAIN, minDamage = -900, maxDamage = -1500, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_EARTHDAMAGE, minDamage = -1700, maxDamage = -2900, radius = 6, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "combat", interval = 2000, chance = 33, type = COMBAT_ENERGYDAMAGE, minDamage = -1900, maxDamage = -2800, radius = 6, effect = CONST_ME_YELLOWENERGY, target = false },
	{ name = "combat", interval = 2300, chance = 30, type = COMBAT_LIFEDRAIN, minDamage = -1200, maxDamage = -1800, range = 4, radius = 1, effect = CONST_ME_MAGIC_RED, target = true },
	{ name = "combat", type = COMBAT_HOLYDAMAGE, interval = 1200, chance = 35, minDamage = -1800, maxDamage = -2500, range = 7, radius = 1, shootEffect = CONST_ANI_SMALLHOLY, effect = CONST_ME_HOLYAREA, target = true },
	{ name = "combat", interval = 2850, chance = 100, type = COMBAT_HOLYDAMAGE, minDamage = -2200, maxDamage = -3000, length = 7, spread = 0, effect = CONST_ME_HOLYAREA, target = false },
}

monster.defenses = {
	defense = 140,
	armor = 120,
	mitigation = 9.00,
	{ name = "combat", interval = 1200, chance = 30, type = COMBAT_HEALING, minDamage = 300, maxDamage = 500, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "invisible", interval = 6000, chance = 20, effect = CONST_ME_POFF, duration = 5000  },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 45 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 80 },
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
