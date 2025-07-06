--[[
	Reserved player action storage key ranges (const.hpp)
	It is possible to place the storage in a quest door, so the player who has that storage will go through the door

	Reserved player action storage key ranges (const.hpp at the source)
	[10000000 - 20000000]
	[1000 - 1500]
	[2001 - 2011]

	Others reserved player action/storages
	[100] = unmovable/untrade/unusable items
	[101] = use pick floor
	[102] = well down action
	[103-120] = others keys action
	[103] = key 0010
	[303] = key 0303
	[1000] = level door. Here 1 must be used followed by the level.
	Example: 1010 = level 10,
	1100 = level 100]

	Questline = Storage through the Quest
]]
--[[IDs de Actions unique 
43000 - golden key 2972, 
43001 saruman key 2971, 
43002 Draken Scale armor 27267,
43003 zamulosh, key 29304,
43004 gate de rosha
43005 dunedain saida
43006 Purgatorio
43007 sarumanReward
43008 blockers ring -key 28476
43009 Werelion Shortcut
43010 Werelion Entrace
43011 GrandMasterOberonLever
43012 BaneFaceless ~ boook entrada
43013 BaneFaceLessLever
43014 VoidBosses
43015 Mission 2 - The inquisiton Matar Lord Dunedain
43016 Mission 2 - The inquisition - Virgem
43017 StoneFloor_Entrace Lorf Hildegaar
43018 Inquisition_ShadowNexus
43019 - PutridEntrace
43020 - StepIn Alchemist
43021 - WallAlchemistClick
43022 - AlchemistStep
43023 - AlchemistLabBoss
43024 - MinusDailyBoss

]]

--[[IDs de Actions normais 
2970 - actions Door pentagrama
43000 Actions Torres
43001 actions lever LOTE
43002 NorthernLevers
43003 Orcfortress
43004 IssaviConcha
43009 - cobraBoat
43010 - Falconboat
43011 - FalconToOberon
43012 - Falcon Entrace
43013 - BoatLion
43014 - actions TP Bronson.
43015 - Teleports de Void
43016 - StepIn_Inquisition_Mission3
43017 - VampireViscount
43018 - Lord Baalsec
43019 - Lord Benchwood_entrace
43020 - Lord Asemuth entrance
43021 - DoorQuest Inquisition
43022 - Entrace_putrid_Mummy
43023 - Actions Daily Bosses
43024 - doorSpiritofNature
43025 - Actions Acampamento e Buraco Massive earth

]]

-- Reserved storage from 80000 - 89999
if not Storage then
	Storage = {
		DelayLargeSeaShell = 80000,
		Imbuement = 80002,
		-- = 80003,
		-- = 80004,
		UsedVialsCount = 80005,
		hirelingFoods = 80006,
		goldenOutfit = 80007,

		VipSystem = {
			-- = 80008,
			OnlineCoinsGain = 80009,
			OnlineTokensGain = 80010
		},

		killStreakBase = 80012, -- treated storage
		killStreakInterval = 80013, -- treated storage

		killsAndDeath = {
			kills = 80014,
			deaths = 80015
		},

		emptyVial = 80016,
		miningProgress = 80017,
		miningCooldown = 80018,
		timeLoginOnlineReward = 80019,
		totalTimeOnlineReward = 80020,
		-- 80021,
		-- 80022,
		-- 80023,
		-- 80024,
		battlefieldEventWinners = 80025,
		holyKills = 80026,
		castle24hrs = 80027,
		caveExclusiveCave = 80028,
		caveExclusiveInCave = 80029,
		caveExclusiveTime = 80030,
		caveExclusiveKeyUsed = 80031,
		-- 80032,
		-- 80033,
		-- 80034,
		-- 80035,
		royalCostumeOutfit = 80036,
		TheOrderOfTheLion = { Drume = {Commander = 80037, } },
		GraveDanger = {
			Questline = 80038,
			CobraBastion = {
				Questline = 80039,
			},
		},
		FeasterOfSouls = {
			UnazKilled = 80040,
			VokKilled = 80041,
			FearFeasterKilled = 80042,
			DreadMaidenKilled = 80043,
			UnwelcomeKilled = 80044,
			PaleWormEntrance = 80045,
			PaleWormKilled = 80046,
		},
		PoltergeistOutfits = {
			Received = 80047,
		},
		-- 80048,
		zombieEventWinners = 80049,
		ducaEventWinners = 80050,
		captureTheFlagEventWinners = 80051,
		safezoneEventWinners = 80052,
		fireStormEventWinners = 80053,
		snowballEventWinners = 80054,
		TheMutatedPumpkin = {
			Skinned = 80055,
		},

		-- last storage used: 80055

		-- ----------------------------------------

		-- Reserved storage from 84000 - 84099
		TibiaDrome = {
			-- General Upgrades
			BestiaryBetterment = {
				TimeLeft = 84000,
				LastActivatedAt = 84001,
			},
			CharmUpgrade = {
				TimeLeft = 84002,
				LastActivatedAt = 84003,
			},
			KooldownAid = {
				LastActivatedAt = 84005,
			},
			StaminaExtension = {
				LastActivatedAt = 84007,
			},
			StrikeEnhancement = {
				TimeLeft = 84008,
				LastActivatedAt = 84009,
			},
			WealthDuplex = {
				TimeLeft = 84010,
				LastActivatedAt = 84011,
			},

			-- Resilience
			FireResilience = {
				TimeLeft = 84012,
				LastActivatedAt = 84013,
			},
			IceResilience = {
				TimeLeft = 84014,
				LastActivatedAt = 84015,
			},
			EarthResilience = {
				TimeLeft = 84016,
				LastActivatedAt = 84017,
			},
			EnergyResilience = {
				TimeLeft = 84018,
				LastActivatedAt = 84019,
			},
			HolyResilience = {
				TimeLeft = 84020,
				LastActivatedAt = 84021,
			},
			DeathResilience = {
				TimeLeft = 84022,
				LastActivatedAt = 84023,
			},
			PhysicalResilience = {
				TimeLeft = 84024,
				LastActivatedAt = 84025,
			},

			-- Amplifications
			FireAmplification = {
				TimeLeft = 84026,
				LastActivatedAt = 84027,
			},
			IceAmplification = {
				TimeLeft = 84028,
				LastActivatedAt = 84029,
			},
			EarthAmplification = {
				TimeLeft = 84030,
				LastActivatedAt = 84031,
			},
			EnergyAmplification = {
				TimeLeft = 84032,
				LastActivatedAt = 84033,
			},
			HolyAmplification = {
				TimeLeft = 84034,
				LastActivatedAt = 84035,
			},
			DeathAmplification = {
				TimeLeft = 84036,
				LastActivatedAt = 84037,
			},
			PhysicalAmplification = {
				TimeLeft = 84038,
				LastActivatedAt = 84039,
			}
		},

		Quest = {
			Key = {
				ID1000 = 87000,
			},
			ExampleQuest = {
				Example = 87001,
				Door = 87002,
			},
			U12_90 = {  -- update 12.90 - Reserved Storages 87851 - 87900
				PrimalOrdeal = {
					QuestLine = 87851,
					Bosses = {
						MagmaBubbleTimer = 87852,
						MagmaBubbleKilled = 87853,
						ThePrimalMenaceTimer = 87854,
						ThePrimalMenaceKilled = 87855,
					},
				},
			},
			
			U01_24 = {  --- quests importantes bronson
				Annihilator = {
					QuestLine = 100001,
					TheTrueHero = 100002,
					RewardAnihi = 100007,
					Reward = {
						SOV = 100003,
						--TH = 100004,
						--Xbow = 100005,
						--SCA = 100006,
					},
				},
				Pentagrama = {
					QuestLine = 100008,
					InTheHellWithDevil = 100009,
					RewardPenta = 100010,
				},
				Northern = {
					QuestLine = 100374,
					FacingTheMelkorSummons = 100375,
					RewardNorthern = 100376,
				},
				Drakens = {
					QuestLine = 100377,
					ImprisionedInANightmare = 100378,
					RewardDrakens = 100379,
				},
				Zamulosh = {
					QuestLine = 100380,
					InaFightAgainstTheMadness = 100381,
					RewardZamulosh = 100382,
				},
				TheVoid = {
					QuestLine = 100383,
					InaFightWithTooMuchEnergy = 100384,
					RewardVoid = 100385,
				},
				Inquisition = {
					QuestLine = 100386,
					TheCrystalCaves = 100387,
					TheBloodHalls = 100388,
					TheVats = 100389,
					TheArcanum = 100390,
					TheHive = 100391,
					TheDarkPath = 100392,
					TheInquisition = 100393,
					SecondInquisition = 100394,
					ShadowNexus = 100395,
					Rewardinqui = 100396,
					bossVamp = 100397,
					bossDrag = 100398,
					finishDrago = 100399,
					rewardRoom = 43021,
				},	
				
				TheSarumanTreasure = {
					QuestLine = 100400,
					ALegendaryReward = 100401,
				},
				
				TheAlchemistQuest = {
					QuestLine = 100402,
					TheInitialMagic = 100403,
					ATripToAnStrangeWorld = 100404,
					StorageExp = 100405,
					ScarabCow = 100406,
					WallAlchemist = 100407,
					ToBecomeAlchemist = 100408,
					timeLab = 100409,
					timeWard = 100410,
					doorSpiritofNature = 43024,
				},				
			},
			
			U02_24 = {  -- quests Bau existentes no jogo.
				quest_ChestNumber1 = {
					QuestLine = 100011,
					Mission1 = 100012,
					Reward = 100013,
				},
				quest_ChestNumber2 = {
					QuestLine = 100014,
					Mission1 = 100015,
					Reward = 100016,
				},
				quest_ChestNumber3 = {
					QuestLine = 100017,
					Mission1 = 100018,
					Reward = 100019,
				},
				quest_ChestNumber4 = {
					QuestLine = 100020,
					Mission1 = 100021,
					Reward = 100022,
				},
				quest_ChestNumber5 = {
					QuestLine = 100023,
					Mission1 = 100024,
					Reward = 100025,
				},
				quest_ChestNumber6 = {
					QuestLine = 100026,
					Mission1 = 100027,
					Reward = 100028,
				},
				quest_ChestNumber7 = {
					QuestLine = 100029, ---100029
					Mission1 = 100030,
					Reward = 100031,
				},
				quest_ChestNumber8 = {
					QuestLine = 100032,
					Mission1 = 100033,
					Reward = 100034,
				},
				quest_ChestNumber9 = {
					QuestLine = 100035,
					Mission1 = 100036,
					Reward = 100037,
				},
				quest_ChestNumber10 = {
					QuestLine = 100038,
					Mission1 = 100039,
					Reward = 100040,
				},
				quest_ChestNumber11 = {
					QuestLine = 100041,
					Mission1 = 100042,
					Reward = 100043,
				},
				quest_ChestNumber12 = {
					QuestLine = 100044,
					Mission1 = 100045,
					Reward = 100046,
				},
				quest_ChestNumber13 = {
					QuestLine = 100047,
					Mission1 = 100048,
					Reward = 100049,
				},
				quest_ChestNumber14 = {
					QuestLine = 100050,
					Mission1 = 100051,
					Reward = 100052,
				},
				quest_ChestNumber15 = {
					QuestLine = 100053,
					Mission1 = 100054,
					Reward = 100055,
				},
				quest_ChestNumber16 = {
					QuestLine = 100056,
					Mission1 = 100057,
					Reward = 100058,
				},
				quest_ChestNumber17 = {
					QuestLine = 100059,
					Mission1 = 100060,
					Reward = 100061,
				},
				quest_ChestNumber18 = {
					QuestLine = 100062,
					Mission1 = 100063,
					Reward = 100064,
				},
				quest_ChestNumber19 = {
					QuestLine = 100065,
					Mission1 = 100066,
					Reward = 100067,
				},
				quest_ChestNumber20 = {
					QuestLine = 100068,
					Mission1 = 100069,
					Reward = 100070,
				},
				quest_ChestNumber21 = {
					QuestLine = 100071,
					Mission1 = 100072,
					Reward = 100073,
				},
				quest_ChestNumber22 = {
					QuestLine = 100074,
					Mission1 = 100075,
					Reward = 100076,
				},
				quest_ChestNumber23 = {
					QuestLine = 100077,
					Mission1 = 100078,
					Reward = 100079,
				},
				quest_ChestNumber24 = {
					QuestLine = 100080,
					Mission1 = 100081,
					Reward = 100082,
				},
				quest_ChestNumber25 = {
					QuestLine = 100083,
					Mission1 = 100084,
					Reward = 100085,
				},
				quest_ChestNumber26 = {
					QuestLine = 100086,
					Mission1 = 100087,
					Reward = 100088,
				},
				quest_ChestNumber27 = {
					QuestLine = 100089,
					Mission1 = 100090,
					Reward = 100091,
				},
				quest_ChestNumber28 = {
					QuestLine = 100092,
					Mission1 = 100093,
					Reward = 100094,
				},
				quest_ChestNumber29 = {
					QuestLine = 100095,
					Mission1 = 100096,
					Reward = 100097,
				},
				quest_ChestNumber30 = {
					QuestLine = 100098,
					Mission1 = 100099,
					Reward = 100100,
				},
				quest_ChestNumber31 = {
					QuestLine = 100101,
					Mission1 = 100102,
					Reward = 100103,
				},
				quest_ChestNumber32 = {
					QuestLine = 100104,
					Mission1 = 100105,
					Reward = 100106,
				},
				quest_ChestNumber33 = {
					QuestLine = 100107,
					Mission1 = 100108,
					Reward = 100109,
				},
				quest_ChestNumber34 = {
					QuestLine = 100110,
					Mission1 = 100111,
					Reward = 100112,
				},
				quest_ChestNumber35 = {
					QuestLine = 100113,
					Mission1 = 100114,
					Reward = 100115,
				},
				quest_ChestNumber36 = {
					QuestLine = 100116,
					Mission1 = 100117,
					Reward = 100118,
				},
				quest_ChestNumber37 = {
					QuestLine = 100119,
					Mission1 = 100120,
					Reward = 100121,
				},
				quest_ChestNumber38 = {
					QuestLine = 100122,
					Mission1 = 100123,
					Reward = 100124,
				},
				quest_ChestNumber39 = {
					QuestLine = 100125,
					Mission1 = 100126,
					Reward = 100127,
				},
				quest_ChestNumber40 = {
					QuestLine = 100128,
					Mission1 = 100129,
					Reward = 100130,
				},
				quest_ChestNumber41 = {
					QuestLine = 100131,
					Mission1 = 100132,
					Reward = 100133,
				},
				quest_ChestNumber42 = {
					QuestLine = 100134,
					Mission1 = 100135,
					Reward = 100136,
				},
				quest_ChestNumber43 = {
					QuestLine = 100137,
					Mission1 = 100138,
					Reward = 100139,
				},
				quest_ChestNumber44 = {
					QuestLine = 100140,
					Mission1 = 100141,
					Reward = 100142,
				},
				quest_ChestNumber45 = {
					QuestLine = 100143,
					Mission1 = 100144,
					Reward = 100145,
				},
				quest_ChestNumber46 = {
					QuestLine = 100146,
					Mission1 = 100147,
					Reward = 100148,
				},
				quest_ChestNumber47 = {
					QuestLine = 100149,
					Mission1 = 100150,
					Reward = 100151,
				},
				quest_ChestNumber48 = {
					QuestLine = 100152,
					Mission1 = 100153,
					Reward = 100154,
				},
				quest_ChestNumber49 = {
					QuestLine = 100155,
					Mission1 = 100156,
					Reward = 100157,
				},
				quest_ChestNumber50 = {
					QuestLine = 100158,
					Mission1 = 100159,
					Reward = 100160,
				},
				quest_ChestNumber51 = {
					QuestLine = 100161,
					Mission1 = 100162,
					Reward = 100163,
				},
				quest_ChestNumber52 = {
					QuestLine = 100164,
					Mission1 = 100165,
					Reward = 100166,
				},
				quest_ChestNumber53 = {
					QuestLine = 100167,
					Mission1 = 100168,
					Reward = 100169,
				},
				quest_ChestNumber54 = {
					QuestLine = 100170,
					Mission1 = 100171,
					Reward = 100172,
				},
				quest_ChestNumber55 = {
					QuestLine = 100173,
					Mission1 = 100174,
					Reward = 100175,
				},
				quest_ChestNumber56 = {
					QuestLine = 100176,
					Mission1 = 100177,
					Reward = 100178,
				},
				quest_ChestNumber57 = {
					QuestLine = 100179,
					Mission1 = 100180,
					Reward = 100181,
				},
				quest_ChestNumber58 = {
					QuestLine = 100182,
					Mission1 = 100183,
					Reward = 100184,
				},
				quest_ChestNumber59 = {
					QuestLine = 100185,
					Mission1 = 100186,
					Reward = 100187,
				},
				quest_ChestNumber60 = {
					QuestLine = 100188,
					Mission1 = 100189,
					Reward = 100190,
				},
				quest_ChestNumber61 = {
					QuestLine = 100191,
					Mission1 = 100192,
					Reward = 100193,
				},
				quest_ChestNumber62 = {
					QuestLine = 100194,
					Mission1 = 100195,
					Reward = 100196,
				},
				quest_ChestNumber63 = {
					QuestLine = 100197,
					Mission1 = 100198,
					Reward = 100199,
				},
				quest_ChestNumber64 = {
					QuestLine = 100200,
					Mission1 = 100201,
					Reward = 100202,
				},
				quest_ChestNumber65 = {
					QuestLine = 100203,
					Mission1 = 100204,
					Reward = 100205,
				},
				quest_ChestNumber66 = {
					QuestLine = 100206,
					Mission1 = 100207,
					Reward = 100208,
				},
				quest_ChestNumber67 = {
					QuestLine = 100209,
					Mission1 = 100210,
					Reward = 100211,
				},
				quest_ChestNumber68 = {
					QuestLine = 100212,
					Mission1 = 100213,
					Reward = 100214,
				},
				quest_ChestNumber69 = {
					QuestLine = 100215,
					Mission1 = 100216,
					Reward = 100217,
				},
				quest_ChestNumber70 = {
					QuestLine = 100218,
					Mission1 = 100219,
					Reward = 100220,
				},
				quest_ChestNumber71 = {
					QuestLine = 100221,
					Mission1 = 100222,
					Reward = 100223,
				},
				quest_ChestNumber72 = {
					QuestLine = 100224,
					Mission1 = 100225,
					Reward = 100226,
				},
				quest_ChestNumber73 = {
					QuestLine = 100227,
					Mission1 = 100228,
					Reward = 100229,
				},
				quest_ChestNumber74 = {
					QuestLine = 100230,
					Mission1 = 100231,
					Reward = 100232,
				},
				quest_ChestNumber75 = {
					QuestLine = 100233,
					Mission1 = 100234,
					Reward = 100235,
				},
				quest_ChestNumber76 = {
					QuestLine = 100236,
					Mission1 = 100237,
					Reward = 100238,
				},
				quest_ChestNumber77 = {
					QuestLine = 100239,
					Mission1 = 100240,
					Reward = 100241,
				},
				quest_ChestNumber78 = {
					QuestLine = 100242,
					Mission1 = 100243,
					Reward = 100244,
				},
				quest_ChestNumber79 = {
					QuestLine = 100245,
					Mission1 = 100246,
					Reward = 100247,
				},
				quest_ChestNumber80 = {
					QuestLine = 100248,
					Mission1 = 100249,
					Reward = 100250,
				},
				quest_ChestNumber81 = {
					QuestLine = 100251,
					Mission1 = 100252,
					Reward = 100253,
				},
				quest_ChestNumber82 = {
					QuestLine = 100254,
					Mission1 = 100255,
					Reward = 100256,
				},
				quest_ChestNumber83 = {
					QuestLine = 100257,
					Mission1 = 100258,
					Reward = 100259,
				},
				quest_ChestNumber84 = {
					QuestLine = 100260,
					Mission1 = 100261,
					Reward = 100262,
				},
				quest_ChestNumber85 = {
					QuestLine = 100263,
					Mission1 = 100264,
					Reward = 100265,
				},
				quest_ChestNumber86 = {
					QuestLine = 100266,
					Mission1 = 100267,
					Reward = 100268,
				},
				quest_ChestNumber87 = {
					QuestLine = 100269,
					Mission1 = 100270,
					Reward = 100271,
				},
				quest_ChestNumber88 = {
					QuestLine = 100272,
					Mission1 = 100273,
					Reward = 100274,
				},
				quest_ChestNumber89 = {
					QuestLine = 100275,
					Mission1 = 100276,
					Reward = 100277,
				},
				quest_ChestNumber90 = {
					QuestLine = 100278,
					Mission1 = 100279,
					Reward = 100280,
				},
				quest_ChestNumber91 = {
					QuestLine = 100281,
					Mission1 = 100282,
					Reward = 100283,
				},
				quest_ChestNumber92 = {
					QuestLine = 100284,
					Mission1 = 100285,
					Reward = 100286,
				},
				quest_ChestNumber93 = {
					QuestLine = 100287,
					Mission1 = 100288,
					Reward = 100289,
				},
				quest_ChestNumber94 = {
					QuestLine = 100290,
					Mission1 = 100291,
					Reward = 100292,
				},
				quest_ChestNumber95 = {
					QuestLine = 100293,
					Mission1 = 100294,
					Reward = 100295,
				},
				quest_ChestNumber96 = {
					QuestLine = 100296,
					Mission1 = 100297,
					Reward = 100298,
				},
				quest_ChestNumber97 = {
					QuestLine = 100299,
					Mission1 = 100300,
					Reward = 100301,
				},
				quest_ChestNumber98 = {
					QuestLine = 100302,
					Mission1 = 100303,
					Reward = 100304,
				},
				quest_ChestNumber99 = {
					QuestLine = 100305,
					Mission1 = 100306,
					Reward = 100307,
				},
				quest_ChestNumber100 = {
					QuestLine = 100308,
					Mission1 = 100309,
					Reward = 100310,
				},
				quest_ChestNumber101 = {
					QuestLine = 100311,
					Mission1 = 100312,
					Reward = 100313,
				},
				quest_ChestNumber102 = {
					QuestLine = 100314,
					Mission1 = 100315,
					Reward = 100316,
				},
				quest_ChestNumber103 = {
					QuestLine = 100317,
					Mission1 = 100318,
					Reward = 100319,
				},
				quest_ChestNumber104 = {
					QuestLine = 100320,
					Mission1 = 100321,
					Reward = 100322,
				},
				quest_ChestNumber105 = {
					QuestLine = 100323,
					Mission1 = 100324,
					Reward = 100325,
				},
				quest_ChestNumber106 = {
					QuestLine = 100326,
					Mission1 = 100327,
					Reward = 100328,
				},
				quest_ChestNumber107 = {
					QuestLine = 100329,
					Mission1 = 100330,
					Reward = 100331,
				},
				quest_ChestNumber108 = {
					QuestLine = 100332,
					Mission1 = 100333,
					Reward = 100334,
				},
				quest_ChestNumber109 = {
					QuestLine = 100335,
					Mission1 = 100336,
					Reward = 100337,
				},
				quest_ChestNumber110 = {
					QuestLine = 100338,
					Mission1 = 100339,
					Reward = 100340,
				},
				quest_ChestNumber111 = {
					QuestLine = 100341,
					Mission1 = 100342,
					Reward = 100343,
				},
				quest_ChestNumber112 = {
					QuestLine = 100344,
					Mission1 = 100345,
					Reward = 100346,
				},
				quest_ChestNumber113 = {
					QuestLine = 100347,
					Mission1 = 100348,
					Reward = 100349,
				},
				quest_ChestNumber114 = {
					QuestLine = 100350,
					Mission1 = 100351,
					Reward = 100352,
				},
				quest_ChestNumber115 = {
					QuestLine = 100353,
					Mission1 = 100354,
					Reward = 100355,
				},
				quest_ChestNumber116 = {
					QuestLine = 100356,
					Mission1 = 100357,
					Reward = 100358,
				},
				quest_ChestNumber117 = {
					QuestLine = 100359,
					Mission1 = 100360,
					Reward = 100361,
				},
				quest_ChestNumber118 = {
					QuestLine = 100362,
					Mission1 = 100363,
					Reward = 100364,
				},
				quest_ChestNumber119 = {
					QuestLine = 100365,
					Mission1 = 100366,
					Reward = 100367,
				},
				quest_ChestNumber120 = {
					QuestLine = 100368,
					Mission1 = 100369,
					Reward = 100370,
				},
				quest_ChestNumber121 = {
					QuestLine = 100371,
					Mission1 = 100372,
					Reward = 100373,
				},
				
			},
		},

		-- Reserved storage from 87996 - 90000 (task system)
		joinTaskSystem = 87996,
		taskRank = 87997,
		taskPoints = 87998,
		questLogEntry = 87999,
		taskIdBase = 88000, -- 500
		creaturesKillCounter = 88500, -- 500
		completedTaskIdBase = 89000, -- 500
		bossTaskIdBase = 89500,

		-- Reserved storage from 90001 - 90099 (reward room)
		rewardRoom = {
			level300 = 90001,
		}
	}
end

-- Reserved storage from 10000 - 99999
if not GlobalStorage then
	GlobalStorage = {
		-- Reserved global storages from 10000 - 34100 to caveStatistic
		ExampleQuest = {
			Example = 90000
		},
		autoBroadcastMessage = 90001,
		CobraBastionFlask = 90002,
		openBattlefieldEvent = 90003,
		openZombieEvent = 90004,
		guildIdOwnerCastle24hrs = 90005,
		TheOrderOfTheLion = {
			Drume = {
				TotalLionCommanders = 90006, -- Global
				TotalUsurperCommanders = 90007, -- Global
			},
		},
		openCaptureTheFlagEvent = 90008,
		ducaEvent = 90009,
		openDucaEvent = 90010,
		--  90011,
		openSafezoneEvent = 90012,
		openFireStormEvent = 90013,
		openSnowballEvent = 90014,
		openWarCastle = 90015,
		guildIdOwnerWarCastle = 90016,

		HeartOfDestruction = {
			ChargedAnomaly = 91001,
			ForeshockHealth = 91002,
			AftershockHealth = 91003,
			ForeshockStage = 91004,
			AftershockStage = 91005,
			RuptureResonanceStage = 91006,
			RuptureResonanceActive = 91007,
			EradicatorWeak = 91008,
			EradicatorReleaseT = 91009,
			OutburstStage = 91010,
			OutburstHealth = 91011,
			OutburstChargingKilled = 91012,
		},

		FacelessBaneStepsOn = 91013,
		FacelessBaneDeaths = 91014,
		FacelessBaneResetSteps = 91015,
	}
end
