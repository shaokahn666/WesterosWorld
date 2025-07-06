local mType = Game.createMonsterType("Jaul")
local monster = {}

monster.description = "Jaul"
monster.experience = 700000
monster.outfit = {
	lookType = 444,
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
	bossRaceId = 773,
	bossRace = RARITY_BANE,
}

monster.health = 150000
monster.maxHealth = 150000
monster.race = "blood"
monster.corpse = 13787
monster.speed = 400
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
	targetDistance = 1,
	runHealth = 15000,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 5,
	color = 30,
}

monster.voices = {
	interval = 5000,
	chance = 20,
	{ text = "DIE!! KENH!!", yell = true },
	{ text = "QJELL AFAR GOU JEY!!", yell = true },
}

monster.loot = {
	{ id = 3043, chance = 53000, maxCount = 10 }, -- crystal coin	
	{ name = "prismatic helmet", chance = 1500},
	{ name = "depth lorica", chance = 350, unique = true },
	{ name = "ornate crossbow", chance = 1200, unique = true },
	{ name = "ring of the sky", chance = 3000 },
	{ name = "cerberus shield", chance = 700 },
	{ id = 9018, chance = 700 }, -- firewalker boots
	{ name = "valar kilt", chance = 500, unique = true },	
	{ name = "depth calcei", chance = 700 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1250, maxDamage = -2000, condition = { type = CONDITION_POISON, totalDamage = 870, interval = 4000 } },
	{ name = "combat", interval = 3000, chance = 50, type = COMBAT_FIREDAMAGE, minDamage = -700, maxDamage = -900, radius = 8, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = false },	
	{ name = "combat", interval = 1300, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -1000, maxDamage = -2200, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_EXPLOSIONAREA, target = false },	
	{ name = "speed", interval = 1000, chance = 20, speedChange = -300, radius = 20, effect = CONST_ME_POFF, target = true, duration = 10000 },	
	{ name = "combat", interval = 1500, chance = 100, type = COMBAT_EARTHDAMAGE, minDamage = -1900, maxDamage = -2200, range = 7, shootEffect = CONST_ANI_EARTH, effect = CONST_ME_BIGPLANTS, target = false },
	{ name = "combat", interval = 1000, chance = 25, type = COMBAT_MANADRAIN, minDamage = -200, maxDamage = -400, range = 7, effect = CONST_ME_MORTAREA, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_ENERGYDAMAGE, minDamage = -1000, maxDamage = -1600, length = 7, spread = 0, effect = CONST_ME_PURPLEENERGY, target = false },
	{ name = "speed", interval = 2000, chance = 37, speedChange = -600, range = 7, effect = CONST_ME_GROUNDSHAKER, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 140,
	armor = 130,
	mitigation = 6.9,
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 2500, maxDamage = 3500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 100 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 100 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
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
