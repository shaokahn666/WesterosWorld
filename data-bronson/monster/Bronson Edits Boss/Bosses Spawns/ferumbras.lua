local mType = Game.createMonsterType("Ferumbras")
local monster = {}

monster.description = "Ferumbras"
monster.experience = 12000
monster.outfit = {
	lookType = 229,
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

monster.bosstiary = {
	bossRaceId = 231,
	bossRace = RARITY_NEMESIS,
}

monster.health = 35000
monster.maxHealth = 35000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 320
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.strategiesTarget = {
	nearest = 60,
	health = 10,
	damage = 20,
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
	runHealth = 2500,
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Demon", chance = 20, interval = 15000, count = 1 },
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "NO ONE WILL STOP ME THIS TIME!", yell = true },
	{ text = "THE POWER IS MINE!", yell = true },
	{ text = "I returned from death and you dream about defeating me?", yell = false },
	{ text = "Witness the first seconds of my eternal world domination!", yell = false },
	{ text = "Even in my weakened state I will crush you all!", yell = false },
}

monster.loot = {
	{ name = "wand of inferno", chance = 100000 },
	{ id = 3414, chance = 5000 }, -- mastermind shield
	{ id = 3366, chance = 300, unique = true}, -- magic plate armor	
	{ name = "platinum amulet", chance = 50000 },
	{ name = "great axe", chance = 2000, unique = true}, 
	{ name = "thunder hammer", chance = 2000, unique = true}, 
	{ id = 5903, chance = 100000, unique = true }, -- ferumbras' hat
	{ name = "boots of haste", chance = 2500}, 
	{ id = 3035, chance = 95000, maxCount = 10 }, -- platinum coin
	{ id = 3035, chance = 75000, maxCount = 13 }, -- platinum coin	
	{ id = 3035, chance = 5000, maxCount = 37 }, -- platinum coin		
	{ id = 3034, chance = 80000, maxCount = 4 }, -- Talon
	{ id = 3032, chance = 65000, maxCount = 25 }, -- small emerald
	{ id = 7407, chance = 10000 }, -- haunted blade
	{ id = 9058, chance = 7500, maxCount = 2 }, -- gold ingot	
	{ id = 821, chance = 5000 }, -- magma legs
	{ id = 3010, chance = 8000 }, -- emerald bangle
	{ id = 823, chance = 10000 }, -- glacier kilt

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -720, maxDamage = -880 },
	{ name = "combat", interval = 2380, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -350, maxDamage = -600, radius = 1, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_EXPLOSIONAREA, target = true },	
	{ name = "combat", interval = 2700, chance = 20, type = COMBAT_MANADRAIN, minDamage = -500, maxDamage = -750, range = 7, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "combat", type = COMBAT_EARTHDAMAGE, interval = 2150, chance = 24, minDamage = -450, maxDamage = -750, radius = 6, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", type = COMBAT_ENERGYDAMAGE, interval = 1950, chance = 25, minDamage = -400, maxDamage = -850, radius = 6, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "combat", interval = 2650, chance = 22, type = COMBAT_LIFEDRAIN, minDamage = -500, maxDamage = -850, range = 6, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "condition", type = CONDITION_FIRE, interval = 3150, chance = 40, minDamage = -500, maxDamage = -600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "firefield", interval = 2000, chance = 10, range = 7, radius = 6, shootEffect = CONST_ANI_FIRE, target = true },	
}

monster.defenses = {
	defense = 120,
	armor = 100,
	mitigation = 3.00,
	{ name = "combat", interval = 2350, chance = 22, type = COMBAT_HEALING, minDamage = 450, maxDamage = 750, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "invisible", interval = 4000, chance = 20, effect = CONST_ME_MAGIC_BLUE, duration = 10000  },
	{ name = "speed", interval = 2000, chance = 30, speedChange = 360, effect = CONST_ME_MAGIC_RED, target = false, duration = 2000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 35 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 40 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 40 },
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
