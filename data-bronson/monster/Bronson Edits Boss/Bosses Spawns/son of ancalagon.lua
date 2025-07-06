local mType = Game.createMonsterType("Son of Ancalagon")
local monster = {}

monster.description = "Son of Ancalagon"
monster.experience = 25000
monster.outfit = {
	lookType = 239,
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
	bossRaceId = 671,
	bossRace = RARITY_BANE,
}

monster.health = 25000
monster.maxHealth = 25000
monster.race = "blood"
monster.corpse = 6301
monster.speed = 300
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
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
	runHealth = 300,
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
	chance = 25,
	{ text = "Shriiiek", yell = false },
	{ text = "Poison is my Art!", yell = false },
	{ text = "You gonna die... in a few minutes!", yell = false },
}

monster.loot = {
	{ name = "dragon ham", chance = 20000, maxCount = 10 },
	{ name = "red robe", chance = 3000 },		
	{ name = "winged helmet", chance = 2000 },
	{ name = "dragon shield", chance = 6000 },
	{ name = "wand of inferno", chance = 6000 },
	{ name = "plate legs", chance = 5000 },
	{ name = "wyvern fang", chance = 5000 },
	{ name = "emerald bangle", chance = 5000 },
	{ name = "crystal arrow", chance = 25000},	
	{ name = "crystal arrow", chance = 25000},	
	{ name = "amulet of loss", chance = 8000},
	{ name = "small sapphire", chance = 100000, maxCount = 15 },	
	{ name = "platinum coin", chance = 100000, maxCount = 29 },
	{ name = "power bolt", chance = 15000, maxCount = 45 },
}

monster.attacks = {
	{ name = "melee", interval = 1900, chance = 100, minDamage = -280, maxDamage = -460, condition = { type = CONDITION_POISON, totalDamage = 500, interval = 2000 } },
	{ name = "condition", type = CONDITION_POISON, interval = 3100, chance = 18, minDamage = -300, maxDamage = -520, length = 6, spread = 3, effect = CONST_ME_POISONAREA, target = false },
	{ name = "speed", interval = 11000, chance = 35, speedChange = -500, range = 7, radius = 4, shootEffect = CONST_ANI_POISON, effect = CONST_ME_GREEN_RINGS, target = true, duration = 10000 },	
	{ name = "drunk", interval = 4000, chance = 10, range = 8, shootEffect = CONST_ANI_POISON, effect = CONST_ME_SOUND_RED, target = true, duration = 7000 },
}

monster.defenses = {
	defense = 48,
	armor = 45,
	mitigation = 1.25,
	{ name = "combat", interval = 1000, chance = 30, type = COMBAT_HEALING, minDamage = 30, maxDamage = 80, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 10, speedChange = 115, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 30 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 25 },
	{ type = COMBAT_MANADRAIN, percent = 25 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 10 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
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
