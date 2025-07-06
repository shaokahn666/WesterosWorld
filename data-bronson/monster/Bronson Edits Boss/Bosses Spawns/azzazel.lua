local mType = Game.createMonsterType("Azazel")
local monster = {}

monster.description = "Azzazel"
monster.experience = 300000
monster.outfit = {
	lookType = 334,
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
	bossRaceId = 628,
	bossRace = RARITY_NEMESIS,
}

monster.health = 130000
monster.maxHealth = 130000
monster.race = "blood"
monster.corpse = 10190
monster.speed = 350
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
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
	{ text = "The lizard culture is much superior!", yell = false },
	{ text = "I will empale you in my big lance!", yell = false },
	{ text = "Face the Wrath of the LIZARD EMPEROR!", yell = true},
}

monster.loot = {
	{ name = "harness", chance = 900, unique = true },
	{ name = "drachaku", chance = 950 },
	{ name = "drakinata", chance = 950 },
	{ name = "chaos blade", chance = 950, unique = true },
	{ name = "dragon scale boots", chance = 1950 },
	{ name = "zenit helmet", chance = 1250 },
	{ name = "zenit cuirass", chance = 1250 },
	{ name = "zenit legs", chance = 1250 },
	{ id = 8028, chance = 950, unique = true },
	{ id = 8025, chance = 950, unique = true },
	{ name = "dragon ham", chance = 35000, maxCount = 35 },
	{ name = "dragon ham", chance = 35000, maxCount = 35 },
	{ name = "small emerald", chance = 15000, maxCount = 7 },
	{ name = "small emerald", chance = 15000, maxCount = 7 },
	{ name = "small emerald", chance = 15000, maxCount = 7 },
	{ name = "amulet of loss", chance = 5500 },
}

monster.attacks = {
	{ name = "melee", interval = 1550, chance = 100, minDamage = -960, maxDamage = -1360 },
	{ name = "speed", interval = 11000, chance = 50, speedChange = -700, range = 7, radius = 1, shootEffect = CONST_ANI_GREENSTAR, effect = CONST_ME_STUN, target = true, duration = 10000 },
	{ name = "combat", interval = 2100, chance = 25, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -720, range = 7, radius = 3, shootEffect = CONST_ANI_POISON, effect = CONST_ME_HITBYPOISON, target = true },
	{ name = "combat", interval = 2320, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -450, maxDamage = -700, range = 7, radius = 4, shootEffect = CONST_ANI_REDSTAR, effect = CONST_ME_FIREAREA, target = true },	
	{ name = "combat", interval = 2633, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -750, maxDamage = -1050, lenght = 8, spread = 3,effect = CONST_ME_HITBYFIRE, target = false },	
	{ name = "combat", interval = 2922, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -550, maxDamage = -750, range = 7, radius = 4, shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_EXPLOSIONHIT, target = true },
	{ name = "combat", interval = 3311, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -900, radius = 8, effect = CONST_ME_YELLOWENERGY, target = false },	
	{ name = "combat", interval = 3912, chance = 35, type = COMBAT_PHYSICALDAMAGE, minDamage = -650, maxDamage = -850, range = 7, radius = 4,shootEffect = CONST_ANI_WHIRLWINDAXE, effect = CONST_ME_GROUNDSHAKER, target = true },	
	{ name = "outfit", interval = 15000, chance = 75, range = 7, effect = CONST_ME_SMOKE, target = false, duration = 15000, outfitMonster = "deer" },
}

monster.defenses = {
	defense = 119,
	armor = 96,
	mitigation = 7.2,
	{ name = "combat", interval = 2400, chance = 35, type = COMBAT_HEALING, minDamage = 500, maxDamage = 900, effect = CONST_ME_YELLOW_RINGS, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 70 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 30 },
	{ type = COMBAT_EARTHDAMAGE, percent = 90 },
	{ type = COMBAT_FIREDAMAGE, percent = 90 },
	{ type = COMBAT_LIFEDRAIN, percent = 100 },
	{ type = COMBAT_MANADRAIN, percent = 100 },
	{ type = COMBAT_DROWNDAMAGE, percent = 100 },
	{ type = COMBAT_ICEDAMAGE, percent = 35 },
	{ type = COMBAT_HOLYDAMAGE, percent = 45 },
	{ type = COMBAT_DEATHDAMAGE, percent = 65 },
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
