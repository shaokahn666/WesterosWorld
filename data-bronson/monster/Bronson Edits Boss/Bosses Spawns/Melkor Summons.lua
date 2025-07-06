local mType = Game.createMonsterType("Melkors Summon")
local monster = {}

monster.description = "a Melkors Summon"
monster.experience = 600000
monster.outfit = {
	lookType = 244,
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
	bossRaceId = 305,
	bossRace = RARITY_NEMESIS,
}

monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 6335
monster.speed = 215
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10,
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
	{ text = "FOORR MELKOR!!!", yell = true },
	{ text = "GRRAAARRRHH!", yell = true },
	{ text = "GRRRRRRR!", yell = true },
}

monster.loot = {
	{ id = 10385, chance = 500 }, -- zenit helmet
	{ name = "molten plate", chance = 400, unique = true },
	{ name = "valar kilt", chance = 300, unique = true },	
	{ name = "zenit shoes", chance = 500},
	{ name = "giant sword", chance = 25000},
	{ id = 6553, chance = 600 }, -- ruthless axe
	{ name = "hammer of wrath", chance = 700},
	{ id = 3035, chance = 25600, maxCount = 25 }, -- platinum coin
	{ id = 3035, chance = 25600, maxCount = 25 }, -- platinum coin	
	{ id = 3035, chance = 25600, maxCount = 25 }, -- platinum coin	
	{ id = 3340, chance = 1000 }, -- heavy mace	
	{ id = 7403, chance = 900 }, -- berserker
	{ id = 6104, chance = 1200 }, -- jewel case
	{ id = 3043, chance = 10500, maxCount = 3 }, -- crystal coin	
}

monster.attacks = {
	{ name = "melee", interval = 1900, chance = 100, minDamage = -1040, maxDamage = -1440 },
	{ name = "combat", interval = 2170, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -1440, maxDamage = -1840, range = 7, effect = CONST_ME_STUN, target = false },
	{ name = "combat", interval = 2550, chance = 25, type = COMBAT_PHYSICALDAMAGE, minDamage = -750, maxDamage = -1000, range = 7, shootEffect = CONST_ANI_LARGEROCK, target = true },
	{ name = "combat", interval = 3150, chance = 33, type = COMBAT_PHYSICALDAMAGE, minDamage = -500, maxDamage = -700, radius = 5, effect = CONST_ME_GROUNDSHAKER, target = false },
}

monster.defenses = {
	defense = 120,
	armor = 95,
	mitigation = 7.5,
	{ name = "combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 100, maxDamage = 300, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 30 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 12 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
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
