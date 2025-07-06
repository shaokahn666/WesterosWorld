local setting = {
	-- At what level can do the quest?
	requiredLevel = 0,
	-- Can it be done daily? true = yes, false = no
	weight = 200,
	-- Do not change from here down
	
	chestPos = {
	{ fromPos = { x = 1650, y = 376, z = 6 }}, -- narsil
	{ fromPos = { x = 1652, y = 376, z = 6 }}, -- staff magic
	{ fromPos = { x = 1654, y = 376, z = 6 }}, -- EagleHorn
	{ fromPos = { x = 1656, y = 376, z = 6 }}, -- Glamdring
	{ fromPos = { x = 1650, y = 380, z = 6 }}, -- Buriza
	{ fromPos = { x = 1652, y = 380, z = 6 }}, -- aiglos
	{ fromPos = { x = 1654, y = 380, z = 6 }}, -- Hellforger
	{ fromPos = { x = 1656, y = 380, z = 6 }}, -- Queen
	},
	
	itensSaruman = {
	6527, --narsil
	7424, -- Staff Magic
	8027, -- EagleHorn
	7414, -- Glamdring
	8024, -- Buriza
	3313, -- Aiglos
	8096, -- Hellforger
	7410, -- Queen's sceptre
	},
	
	itemChance = {
		[1] = { x = 0, y = 10, id = 6527},
		[2] = { x = 11, y = 20, id = 7424},
		[3] = { x = 21, y = 30, id = 8027},
		[4] = { x = 31, y = 40, id = 7414},
		[5] = { x = 41, y = 50, id = 8024},
		[6] = { x = 51, y = 60, id = 3313},
		[7] = { x = 61, y = 70, id = 8096},
		[8] = { x = 71, y = 80, id = 7410},
	},
}

local rSaruman = Action()

function rSaruman.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player and player:getLevel() < setting.requiredLevel then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must be level " .. setting.requiredLevel .. " or higher.")
		return true
		
	end

	if (player:getFreeCapacity() / 100) < setting.weight then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have enough capacity, you need atleast " .. setting.weight .. " oz.")
		return true
	end
	
	local backpack = player:getSlotItem(CONST_SLOT_BACKPACK)
	if not backpack or backpack:getEmptySlots(true) < 1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need atleast one free space in your backpack.")
		return true
	end
	
	if  player:getStorageValue(Storage.Quest.U01_24.TheSarumanTreasure.ALegendaryReward) ~= -1 then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You can't repeat this quest.")	
		return true
	end	
	
	player:say("The Saruman choose a digne reward for you...", TALKTYPE_MONSTER_SAY, true, player, item:getPosition())
	
	local valueRandom = math.random(0, 80)
	local rewardRandom = 0
	for i = 1, #setting.itemChance do
		if setting.itemChance[i].x <= valueRandom and valueRandom <= setting.itemChance[i].y then
			rewardRandom = i
			break
		end
	end
	
	if rewardRandom ~= 0 then
		for i = 1, #setting.chestPos do

			if i == rewardRandom then

				if player then
					player:addItem(setting.itemChance[rewardRandom].id, 1)
					player:getPosition():sendMagicEffect(CONST_ME_HOLYDAMAGE)
					player:setStorageValue(Storage.Quest.U01_24.TheSarumanTreasure.QuestLine, 1)
					player:setStorageValue(Storage.Quest.U01_24.TheSarumanTreasure.ALegendaryReward, 1)
				end
				
				if Tile(setting.chestPos[i].fromPos):getItemById(2478) then
					local chestItem = Tile(setting.chestPos[i].fromPos):getItemById(2478)
					chestItem:getPosition():sendMagicEffect(CONST_ME_MAGIC_POWDER)
					chestItem:transform(7466)
				end
				

				if item.itemid == 8007 then
					local itempos = item:getPosition()
					item:remove(1)
					itempos:getTile():addItem(8007)

				end
				
			else
				if Tile(setting.chestPos[i].fromPos):getItemById(2478) then
					local chestItem = Tile(setting.chestPos[i].fromPos):getItemById(2478)
					chestItem:getPosition():sendMagicEffect(CONST_ME_FIREAREA)
					chestItem:transform(2123)
				end
				
			end
		
		end
	
	end
	
	return true
end

rSaruman:uid(43007)
rSaruman:register()
