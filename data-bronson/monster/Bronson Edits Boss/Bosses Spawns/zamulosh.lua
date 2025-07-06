local mType = Game.createMonsterType("Zamulosh")
local monster = {}

monster.description = "Zamulosh"
monster.experience = 650000
monster.outfit = {
	lookType = 862,
	lookHead = 16,
	lookBody = 12,
	lookLegs = 73,
	lookFeet = 55,
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
monster.speed = 380
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 20,
}

monster.bosstiary = {
	bossRaceId = 1181,
	bossRace = RARITY_ARCHFOE,
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
	{ text = "I AM ZAMULOSH!", yell = true },
	{ text = "DESTRUCTION!", yell = true },
	{ text = "BOW TO THE POWER OF THE RUTHLESS SEVEN!", yell = true },
	{ text = "DEATH TO ALL!", yell = true },
}

monster.loot = {
	{ id = 29304, chance = 100000, unique = true }, -- key 29304 - action 43003
	{ id = 3043, chance = 5300, maxCount = 12 }, -- crystal coin	
	{ name = "golden legs", chance = 300 }, -- golden legs
	{ name = "demon helmet", chance = 700 }, -- DH
	{ name = "elite draken mail", chance = 250 }, -- elite draken mail
	{ name = "golden boots", chance = 100 }, -- golden boots
	{ name = "great shield", chance = 200 }, -- great shield	
	{ id = 3029, chance = 12000, maxCount = 80 }, -- small sapphire
	{ id = 3026, chance = 12000, maxCount = 70 }, -- white pearl

}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, skill = 230, attack = 210 },
	{ name = "combat", interval = 1000, chance = 8, type = COMBAT_DEATHDAMAGE, minDamage = -800, maxDamage = -1900, radius = 9, effect = CONST_ME_MORTAREA, target = false },
	{ name = "speed", interval = 1200, chance = 12, speedChange = -850, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000 },
	{ name = "combat", interval = 1200, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1450, radius = 5, effect = CONST_ME_PRISMATIC_SPARK, target = false },
	{ name = "combat", interval = 3000, chance = 13, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1200, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 3000, chance = 8, type = COMBAT_MANADRAIN, minDamage = -600, maxDamage = -700, radius = 10, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 2000, chance = 9, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -1200, lenght = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "condition", type = CONDITION_POISON, interval = 5000, chance = 18, minDamage = -1500, maxDamage = -2000, effect =  CONST_ME_GREEN_SPARK, condition = { type = CONDITION_POISON, totalDamage = 1000, interval = 1000 } },
	{ name = "combat", interval = 2000, chance = 6, type = COMBAT_LIFEDRAIN, minDamage = -800, maxDamage = -1600, radius = 14, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 110,
	armor = 120,
	mitigation = 8.0,
	{ name = "combat", interval = 1000, chance = 5, type = COMBAT_HEALING, minDamage = 300, maxDamage = 500, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 1000, chance = 8, speedChange = 480, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 50 },
	{ type = COMBAT_EARTHDAMAGE, percent = 50 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 50 },
	{ type = COMBAT_MANADRAIN, percent = 50 },
	{ type = COMBAT_DROWNDAMAGE, percent = 50 },
	{ type = COMBAT_ICEDAMAGE, percent = 50 },
	{ type = COMBAT_HOLYDAMAGE, percent = 50 },
	{ type = COMBAT_DEATHDAMAGE, percent = 50 },
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
