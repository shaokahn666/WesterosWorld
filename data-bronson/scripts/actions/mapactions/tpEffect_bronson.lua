local setting = { -- actionsid 43014
    tpSettings = {
        { --buried
            effect_bf = CONST_ME_LIGHTBLUETELEPORT,
            effect_af = CONST_ME_GREEN_ENERGY_SPARK,
            phrase_bf = nil,
            phrase_after = "A strange magic force teleported you into deeper of buried cathedral.",
            level = 50,
            quest = {0,0},
            posItem = Position(649, 827, 8),
            fromPos = nil,
            toPos = nil,
			posItemVolta = Position(715, 904, 8),
			effect_bf_volta = CONST_ME_GREEN_ENERGY_SPARK,
            effect_af_volta = CONST_ME_LIGHTBLUETELEPORT,
			phrase_bf_volta = nil,
			phrase_after_volta = "You saw things that should never be seen...",
			
        },
        { -- nightmare island
            effect_bf = CONST_ME_PURPLETELEPORT,
            effect_af = CONST_ME_PURPLEENERGY,
            phrase_bf = "A magic force suck you to your nightmares...",
            phrase_after = "You felt a painful headache...  you feel to be in your own nightmares.",
            level = 100,
            quest = {0,0},
            posItem = Position(1473, 268, 7),
            fromPos = nil,
            toPos = nil,
			posItemVolta = Position(1746, 86, 8),
			effect_bf_volta = CONST_ME_PURPLEENERGY,
            effect_af_volta = CONST_ME_PURPLETELEPORT,
			phrase_bf_volta = nil,
			phrase_after_volta = "Your headache is gone... These monsters are real? Or that was a nightmare?",
        },
        { -- gargoyle sanctuare
            effect_bf = nil,
            effect_af = CONST_ME_STONES,
            phrase_bf = nil,
            phrase_after = "your knees are burning... the stair was to longgg...",
            level = 2,
            quest = {0,0},
            posItem = Position(1226, 1427, 7),
            fromPos = {x = 1227, y = 1427, z = 7},
            toPos = {x = 1082, y = 1414, z = 8},
			posItemVolta = Position(1081, 1414, 8),
			effect_bf_volta = nil,
            effect_af_volta = CONST_ME_BATS,
			phrase_bf_volta = nil,
			phrase_after_volta = "finally! I was anxious to see sunlight",
        },
        { -- void entrada
            effect_bf = CONST_ME_PURPLEENERGY,
            effect_af = CONST_ME_BLUE_ENERGY_SPARK,
            phrase_bf = "A strong purple shock burnet your soul.",
            phrase_after = "The massive force of vortex transformed your body in plasma and moved you to void...",
            level = 100,
            quest = {0,0},
            posItem = Position(1722, 453, 15),
            fromPos = {x = 1723, y = 453, z = 15},
            toPos = {x = 1951, y = 439, z = 13},
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
        { -- entrada para inquisition
            effect_bf = CONST_ME_HITBYFIRE,
            effect_af = CONST_ME_FIREAREA,
            phrase_bf = "Your soul is digne to enter in inquisiton.",
            phrase_after = "You feel your soul burning from inside. A clarity path become visible inside these flames...",
            level = 300,
            quest = {Storage.Quest.U01_24.Inquisition.SecondInquisition, 4},
            posItem = Position(1291, 1288, 13),
            fromPos = {x = 1291, y = 1286, z = 13},
            toPos = {x = 1222, y = 1056, z = 15},
			posItemVolta = Position(1222, 1055, 15),
			effect_bf_volta = nil,
            effect_af_volta = CONST_ME_HITBYFIRE,
			phrase_bf_volta = nil,
			phrase_after_volta = "You are guided by a flame spirit to back to reality.",
        },
        { -- inquisiton Crystal Caves
            effect_bf = CONST_ME_ICEAREA,
            effect_af = CONST_ME_ICETORNADO,
            phrase_bf = "A quick visit to the crystal caves.",
            phrase_after = "I feel cold in this place, maybe i can light a fire here to warm this ambient.",
            level = 300,
            quest = {Storage.Quest.U01_24.Inquisition.TheDarkPath, 2},
            posItem = Position(1223, 1078, 14),
            fromPos = {x = 1217, y = 1081, z = 14},
            toPos = {x = 1123, y = 1155, z = 13},
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
        { -- inquisiton The Blood Halls
            effect_bf = CONST_ME_MORTAREA,
            effect_af = CONST_ME_MORTAREA,
            phrase_bf = "A quick visit to the blood halls.",
            phrase_after = "A death path is waiting for me.",
            level = 300,
            quest = {Storage.Quest.U01_24.Inquisition.TheCrystalCaves, 2},
            posItem = Position(1229, 1082, 14),
            fromPos = {x = 1217, y = 1081, z = 14},
            toPos = {x = 1426, y = 986, z = 14},
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
        { -- inquisiton The Vats
            effect_bf = CONST_ME_HITBYPOISON,
            effect_af = CONST_ME_POISONAREA,
            phrase_bf = "A quick visit to the Vats",
            phrase_after = "A long path through these poisons creatures...",
            level = 300,
            quest = {Storage.Quest.U01_24.Inquisition.TheBloodHalls, 2},
            posItem = Position(1229, 1086, 14),
            fromPos = {x = 1217, y = 1081, z = 14},
            toPos = {x = 1207, y = 1155, z = 12},
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
        { -- inquisiton The Arcanum
            effect_bf =  CONST_ME_PURPLESMOKE,
            effect_af = CONST_ME_BLUE_ENERGY_SPARK,
            phrase_bf = "A quick visit to the Arcanum",
            phrase_after = "A magical path with demoniacal creatures. These are horrible monsters.",
            level = 300,
            quest = {Storage.Quest.U01_24.Inquisition.TheVats, 2},
            posItem = Position(1224, 1092, 14),
            fromPos = {x = 1217, y = 1081, z = 14},
            toPos = {x = 1092, y = 1126, z = 15},
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
        { -- inquisiton The Hive
            effect_bf = CONST_ME_HOLYDAMAGE,
            effect_af = CONST_ME_HOLYAREA,
            phrase_bf = "A quick visit to the Hive",
            phrase_after = "A crater with disgusting creatures. I hate those...",
            level = 300,
            quest = {Storage.Quest.U01_24.Inquisition.TheArcanum, 2},
            posItem = Position(1219, 1092, 14),
            fromPos = {x = 1217, y = 1081, z = 14},
            toPos = {x = 1253, y = 1059, z = 12},
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
        { -- roomLordOfDunedain
            effect_bf = nil,
            effect_af = CONST_ME_BATS,
            phrase_bf = nil,
            phrase_after = "Thats was the creepyst local i visited!",
            level = 200,
            quest = {Storage.Quest.U01_24.Inquisition.TheInquisition, 4},
            posItem = Position(1864, 610, 9),
            fromPos = {x = 1217, y = 1081, z = 14},
            toPos = nil,
			posItemVolta = nil,
			effect_bf_volta = nil,
            effect_af_volta = nil,
			phrase_bf_volta = nil,
			phrase_after_volta = nil,
        },
    }
}

local tpEffect = MoveEvent()

function tpEffect.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    for i = 1, #setting.tpSettings do
        local tp = setting.tpSettings[i]

		if item:getPosition() == tp.posItem then

			if player:getLevel() < tp.level then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to be level " .. tp.level .. " or higher.")
					player:teleportTo(fromPosition)
					fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
				return true
			end
			
			if  tp.quest[1] ~= 0 and player:getStorageValue(tp.quest[1]) ~= tp.quest[2] then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have the questline necessary to access this location.")
				player:teleportTo(fromPosition)
				fromPosition:sendMagicEffect(CONST_ME_TELEPORT)
				return true
	
			end


			if tp.effect_bf ~= nil then
				tp.posItem:sendMagicEffect(tp.effect_bf)
				if tp.phrase_bf ~= nil then
					player:say(tp.phrase_bf, TALKTYPE_MONSTER_SAY, false, player, tp.posItem)
				end
			
			end
			
			if player ~= nil and tp.toPos ~= nil then
				player:teleportTo(tp.toPos)
			end		
			
			if tp.effect_af ~= nil then
				player:getPosition():sendMagicEffect(tp.effect_af)
				if tp.phrase_after ~= nil then
					player:say(tp.phrase_after, TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
				end
			
			end
			
			break
			
		elseif item:getPosition() == tp.posItemVolta then
			local tp = setting.tpSettings[i]
			
			if tp.effect_bf_volta ~= nil then
				tp.posItemVolta:sendMagicEffect(tp.effect_bf_volta)
				if tp.phrase_bf_volta ~= nil then
					player:say(tp.phrase_bf_volta, TALKTYPE_MONSTER_SAY, false, player, tp.posItemVolta)
				end
			
			end
			
			if player ~= nil and tp.fromPos ~= nil then
				player:teleportTo(tp.fromPos)
			end	
			
			if tp.effect_af_volta ~= nil then
				player:getPosition():sendMagicEffect(tp.effect_af_volta)
				if tp.phrase_after_volta ~= nil then
					player:say(tp.phrase_after_volta, TALKTYPE_MONSTER_SAY, false, player, player:getPosition())
				end
			
			end		

			break
			
		end   
	
	end

    return true
end

tpEffect:type("stepin")
tpEffect:aid(43014)
tpEffect:register()