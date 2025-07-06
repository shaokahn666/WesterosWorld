local mType = Game.createMonsterType("Deathstrike")
local monster = {}

monster.description = "Deathstrike"
monster.experience = 565000
monster.outfit = {
	lookType = 500,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.bosstiary = {
	bossRaceId = 892,
	bossRace = RARITY_ARCHFOE,
}

monster.events = {
	"bossesAlive",
}

monster.health = 90000
monster.maxHealth = 90000
monster.race = "blood"
monster.corpse = 16088
monster.speed = 380
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 50,
	health = 20,
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
	staticAttackChance = 50,
	targetDistance = 1,
	runHealth = 2000,
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
	{ text = "Deeestructiooon!", yell = false },
	{ text = "Maaahhhrrr!", yell = false },
	{ text = "I am carnage incarnate!", yell = false },
	{ text = "I've seen the light! And it was all engulfing fire!", yell = false },
	{ text = "Taaake... this!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 53000, maxCount = 3 },
	{ name = "green crystal shard", chance = 53000, maxCount = 10 },	
	{ id = 3032, chance = 65000, maxCount = 50 }, -- small emerald
	{ id = 3366, chance = 400, unique = true}, -- magic plate armor	
	{ id = 11689, chance = 1200 }, -- elite draken helmet
	{ name = "prismatic boots", chance = 1800},
	{ name = "prismatic shield", chance = 1500, unique = true},
	{ name = "ornate mace", chance = 250, unique = true},
	{ name = "crystalline axe", chance = 250, unique = true},
	{ name = "shiny blade", chance = 250, unique = true},
	{ name = "crystal crossbow", chance = 250, unique = true},
	{ id = 16164, chance = 250, unique = true}, -- mycological bow
}

monster.attacks = {
	{ name = "melee", interval = 1300, chance = 100, skill = 110, attack = 120 },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -400, range = 7, shootEffect = CONST_ANI_EXPLOSION, target = false, duration = 2500 },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -820, maxDamage = -950, range = 7, effect = CONST_ME_FIREAREA, target = false },
	{ name = "combat", interval = 2000, chance = 100, type = COMBAT_FIREDAMAGE, minDamage = -1000, maxDamage = -1300, range = 4, radius = 4, effect = CONST_ME_FIREAREA, target = true },	
	{ name = "combat", interval = 750, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -450, maxDamage = -800, range = 4, radius = 4, effect = CONST_ME_PURPLEENERGY, target = true },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_ENERGYDAMAGE, minDamage = -550, maxDamage = -1000, range = 4, radius = 4, effect = CONST_ME_ENERGYAREA, target = true },	
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_PHYSICALDAMAGE, minDamage = -800, maxDamage = -1460, range = 7, spread = 2, effect = CONST_ME_STUN, target = false },	
	{ name = "melee", interval = 3000, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -500, maxDamage = -850, range = 7, radius = 3,  effect = CONST_ME_EXPLOSIONAREA, target = true },
}

monster.defenses = {
	defense = 120,
	armor = 90,
	mitigation = 5.0,
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 3000, maxDamage = 5500, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 30 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 40 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 50 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 40 },
	{ type = COMBAT_HOLYDAMAGE, percent = 40 },
	{ type = COMBAT_DEATHDAMAGE, percent = 30 },
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
