local mType = Game.createMonsterType("Khel Thuzad")
local monster = {}

monster.description = "Khel Thuzad"
monster.experience = 250000
monster.outfit = {
	lookType = 287,
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

monster.health = 85000
monster.maxHealth = 85000
monster.race = "undead"
monster.corpse = 8109
monster.speed = 370
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
	chance = 20,
}

monster.loot = {
	{ id = 6529, chance = 850}, -- soft boots
	{ id = 8061, chance = 550, unique = true}, -- khel thuzads skin	
	{ name = "mastermind shield", chance = 4500}, 	
	{ name = "pharaoh sword", chance = 3100}, 	
	{ name = "skull helmet", chance = 12000}, 
	{ name = "valar kilt", chance = 650, unique = true}, -- khel thuzads skin	
	{ name = "crystal coin", chance = 35000, maxCount = 7}, 
	{ id = 6299, chance = 32000 }, -- ring of tarrasque
}

monster.voices = {
	interval = 5000,
	chance = 30,
	{ text = "Feel the power of the Lich King!!", yell = false },
}

monster.attacks = {
	{ name = "melee", interval = 1550, chance = 100, minDamage = -480, maxDamage = -880 },
	{ name = "speed", interval = 11000, chance = 50, speedChange = -700, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true, duration = 10000 },	
	{ name = "combat", interval = 3000, chance = 34, type = COMBAT_PHYSICALDAMAGE, minDamage = -480, maxDamage = -620, radius = 1, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_PINK_ENERGY_SPARK, target = true },	
	{ name = "combat", interval = 2200, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -460, maxDamage = -730, radius = 5, range = 14, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 1800, chance = 45, type = COMBAT_DEATHDAMAGE, minDamage = -320, maxDamage = -400, radius = 2, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true },
	{ name = "combat", interval = 4100, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -650, maxDamage = -850, radius = 4, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_GROUNDSHAKER, target = false },
	{ name = "combat", interval = 2850, chance = 22, type = COMBAT_LIFEDRAIN, minDamage = -1650, maxDamage = -2250, radius = 0, range = 7, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 120,
	armor = 95,
	mitigation = 6.0,
	{ name = "combat", interval = 2400, chance = 35, type = COMBAT_HEALING, minDamage = 500, maxDamage = 900, effect = CONST_ME_BLUE_FIREWORKS, target = false },
	{ name = "invisible", interval = 15000, chance = 45, effect = CONST_ME_POFF, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 70 },
	{ type = COMBAT_EARTHDAMAGE, percent = 70 },
	{ type = COMBAT_FIREDAMAGE, percent = 70 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 70 },
	{ type = COMBAT_HOLYDAMAGE, percent = 70 },
	{ type = COMBAT_DEATHDAMAGE, percent = 70 },
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
