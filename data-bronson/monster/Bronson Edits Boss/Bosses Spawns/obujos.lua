local mType = Game.createMonsterType("Obujos")
local monster = {}

monster.description = "Obujos"
monster.experience = 670000
monster.outfit = {
	lookType = 445,
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
	bossRaceId = 774,
	bossRace = RARITY_BANE,
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "blood"
monster.corpse = 13800
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 50,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 2,
	runHealth = 15000,
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
	{ text = "QJELL KEJH!!", yell = true },
	{ text = "JN OBU!!", yell = true },
}

monster.summon = {
	maxSummons = 2,
	summons = {
		{ name = "Deepling Master Summon", chance = 100, interval = 1000, count = 2 },
	},
}

monster.loot = {
	{ id = 3043, chance = 53000, maxCount = 10 }, -- crystal coin	
	{ name = "blessed shield", chance = 300, unique = true}, -- 
	{ name = "ornate legs", chance = 250, unique = true}, -- 	
	{ name = "magic plate armor", chance = 600, unique = true}, -- 	
	{ name = "yalahari mask", chance = 800, unique = true}, -- 
	{ id = 6529, chance = 5000}, -- crystal coin	
	{ name = "tin key", chance = 2000, unique = true}, -- 
	{ name = "depth scutum", chance = 5805 },

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -900, maxDamage = -1200, condition = { type = CONDITION_POISON, totalDamage = 360, interval = 2000 } },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -2000, maxDamage = -2180, radius = 8, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_BIGCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_ENERGYDAMAGE, minDamage = -1000, maxDamage = -1500, range = 7, effect = CONST_ME_BIGCLOUDS, target = false },
	{ name = "speed", interval = 1000, chance = 20, speedChange = -300, radius = 20, effect = CONST_ME_POFF, target = false, duration = 10000 },	
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_ICEDAMAGE, minDamage = -1000, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICETORNADO, target = false },	
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -200, maxDamage = -600, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_BIGCLOUDS, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1000, length = 7, spread = 0, effect = CONST_ME_MORTAREA, target = false },
	{ name = "speed", interval = 2000, chance = 37, speedChange = -600, range = 7, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 140,
	armor = 160,
	mitigation = 6.0,
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 800, maxDamage = 1200, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 10 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 100 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
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
