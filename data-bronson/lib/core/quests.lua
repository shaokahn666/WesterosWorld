if not Quests then
	Quests = {
		[1] = {
			name = "Task Hunting Society",
			startStorageId = Storage.joinTaskSystem,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "Task Hunting",
					storageId = Storage.questLogEntry,
					missionId = 1,
					startValue = 0,
					endValue = 1,
					description = function(player)
						return string.format(
							"You joined the 'Task Hunting Society'. Ask Task Manager for some hunting tasks. You already gained %d points.",
							(math.max(player:getStorageValue(Storage.taskPoints), 0))
						)
					end,
				},
				[2] = {
					name = "Task Hunting - Rank: Huntsman",
					storageId = Storage.taskRank,
					missionId = 2,
					startValue = 0,
					endValue = 1,
					description = "You have been promoted to the rank of a 'Huntsman' in the 'Task Hunting Society'.",
				},
				[3] = {
					name = "Task Hunting - Rank: Ranger",
					storageId = Storage.taskRank,
					missionId = 3,
					startValue = 2,
					endValue = 3,
					description = "You have been promoted to the rank of a 'Ranger' in the 'Task Hunting Society'.",
				},
				[4] = {
					name = "Task Hunting - Rank: Big Game Hunter",
					storageId = Storage.taskRank,
					missionId = 4,
					startValue = 4,
					endValue = 5,
					description = "You have been promoted to the rank of a 'Big Game Hunter' in the 'Task Hunting Society'.",
				},
				[5] = {
					name = "Task Hunting - Rank: Trophy Hunter",
					storageId = Storage.taskRank,
					missionId = 5,
					startValue = 5,
					endValue = 6,
					description = "You have been promoted to the rank of a 'Trophy Hunter' in the 'Task Hunting Society'.",
				},
				[6] = {
					name = "Task Hunting - Rank: Elite Hunter",
					storageId = Storage.taskRank,
					missionId = 6,
					startValue = 7,
					endValue = 8,
					description = "You have been promoted to the rank of a 'Elite Hunter' in the 'Task Hunting Society'.",
				},
				[7] = { -- Task Manager
					name = "Task Hunting: Dragons",
					storageId = Storage.taskIdBase + 1,
					missionId = 7,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/300 dragons.",
								player:getStorageValue(Storage.creaturesKillCounter + 1)
							)
						end,
						[2] = "You successfully hunted 300 dragons. If you want to you may complete this task again.",
					},
				},
				[8] = { -- Task Manager
					name = "Task Hunting: Vampires",
					storageId = Storage.taskIdBase + 2,
					missionId = 8,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/1000 vampires.",
								player:getStorageValue(Storage.creaturesKillCounter + 2)
							)
						end,
						[2] = "You successfully hunted 1000 vampires. If you want to you may complete this task again.",
					},
				},
				[9] = { -- Task Manager
					name = "Task Hunting: Energy Elemental",
					storageId = Storage.taskIdBase + 3,
					missionId = 9,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/1700 energy elementals.",
								player:getStorageValue(Storage.creaturesKillCounter + 3)
							)
						end,
						[2] = "You successfully hunted 1700 energy elementals. If you want to you may complete this task again.",
					},
				},
				[10] = { -- Task Manager
					name = "Task Hunting: Lizards",
					storageId = Storage.taskIdBase + 4,
					missionId = 10,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/2400 lizards.",
								player:getStorageValue(Storage.creaturesKillCounter + 4)
							)
						end,
						[2] = "You successfully hunted 2400 lizards. If you want to you may complete this task again.",
					},
				},
				[11] = { -- Task Manager
					name = "Task Hunting: Bandits",
					storageId = Storage.taskIdBase + 5,
					missionId = 11,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/3100 bandits.",
								player:getStorageValue(Storage.creaturesKillCounter + 5)
							)
						end,
						[2] = "You successfully hunted 3100 bandits. If you want to you may complete this task again.",
					},
				},
				[12] = { -- Task Manager
					name = "Task Hunting: Moohtants",
					storageId = Storage.taskIdBase + 6,
					missionId = 12,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/3800 moohtants.",
								player:getStorageValue(Storage.creaturesKillCounter + 6)
							)
						end,
						[2] = "You successfully hunted 3800 moohtants. If you want to you may complete this task again.",
					},
				},
				[13] = { -- Task Manager
					name = "Task Hunting: Cave Devourers",
					storageId = Storage.taskIdBase + 7,
					missionId = 13,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/4500 cave devourers.",
								player:getStorageValue(Storage.creaturesKillCounter + 7)
							)
						end,
						[2] = "You successfully hunted 4500 cave devourers. If you want to you may complete this task again.",
					},
				},
				[14] = { -- Task Manager
					name = "Task Hunting: Medusas",
					storageId = Storage.taskIdBase + 8,
					missionId = 14,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/5200 medusas.",
								player:getStorageValue(Storage.creaturesKillCounter + 8)
							)
						end,
						[2] = "You successfully hunted 5200 medusas. If you want to you may complete this task again.",
					},
				},
				[15] = { -- Task Manager
					name = "Task Hunting: Behemoths",
					storageId = Storage.taskIdBase + 9,
					missionId = 15,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/5900 behemoths.",
								player:getStorageValue(Storage.creaturesKillCounter + 9)
							)
						end,
						[2] = "You successfully hunted 5900 behemoths. If you want to you may complete this task again.",
					},
				},
				[16] = { -- Task Manager
					name = "Task Hunting: Furys",
					storageId = Storage.taskIdBase + 10,
					missionId = 16,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/6600 furys.",
								player:getStorageValue(Storage.creaturesKillCounter + 10)
							)
						end,
						[2] = "You successfully hunted 6600 furys. If you want to you may complete this task again.",
					},
				},
				[17] = { -- Task Manager
					name = "Task Hunting: Drakens",
					storageId = Storage.taskIdBase + 11,
					missionId = 17,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/7300 drakens.",
								player:getStorageValue(Storage.creaturesKillCounter + 11)
							)
						end,
						[2] = "You successfully hunted 7300 drakens. If you want to you may complete this task again.",
					},
				},
				[18] = { -- Task Manager
					name = "Task Hunting: Lava Lurkers",
					storageId = Storage.taskIdBase + 12,
					missionId = 18,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/7500 lava lurkers.",
								player:getStorageValue(Storage.creaturesKillCounter + 12)
							)
						end,
						[2] = "You successfully hunted 7500 lava lurkers. If you want to you may complete this task again.",
					},
				},
				[19] = { -- Task Manager
					name = "Task Hunting: Warlocks",
					storageId = Storage.taskIdBase + 13,
					missionId = 19,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/7500 warlocks.",
								player:getStorageValue(Storage.creaturesKillCounter + 13)
							)
						end,
						[2] = "You successfully hunted 7500 warlocks. If you want to you may complete this task again.",
					},
				},
				[20] = { -- Task Manager
					name = "Task Hunting: Dawnfire Asuras",
					storageId = Storage.taskIdBase + 14,
					missionId = 20,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/7500 dawnfire asuras.",
								player:getStorageValue(Storage.creaturesKillCounter + 14)
							)
						end,
						[2] = "You successfully hunted 7500 dawnfire asuras. If you want to you may complete this task again.",
					},
				},
				[21] = { -- Task Manager
					name = "Task Hunting: Gazer Spectres",
					storageId = Storage.taskIdBase + 15,
					missionId = 21,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/7700 gazer spectres.",
								player:getStorageValue(Storage.creaturesKillCounter + 15)
							)
						end,
						[2] = "You successfully hunted 7700 gazer spectres. If you want to you may complete this task again.",
					},
				},
				[22] = { -- Task Manager
					name = "Task Hunting: Phantasms",
					storageId = Storage.taskIdBase + 16,
					missionId = 22,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/8000 phantasms.",
								player:getStorageValue(Storage.creaturesKillCounter + 16)
							)
						end,
						[2] = "You successfully hunted 8000 phantasms. If you want to you may complete this task again.",
					},
				},
				[23] = { -- Task Manager
					name = "Task Hunting: Lost Berserkers",
					storageId = Storage.taskIdBase + 17,
					missionId = 23,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/8300 lost berserkers.",
								player:getStorageValue(Storage.creaturesKillCounter + 17)
							)
						end,
						[2] = "You successfully hunted 8300 lost berserkers. If you want to you may complete this task again.",
					},
				},
				[24] = { -- Task Manager
					name = "Task Hunting: Skeleton Elite Warriors",
					storageId = Storage.taskIdBase + 18,
					missionId = 24,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/8500 skeleton elite warriors.",
								player:getStorageValue(Storage.creaturesKillCounter + 18)
							)
						end,
						[2] = "You successfully hunted 8500 skeleton elite warriors. If you want to you may complete this task again.",
					},
				},
				[25] = { -- Task Manager
					name = "Task Hunting: Ghastly Dragons",
					storageId = Storage.taskIdBase + 19,
					missionId = 25,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/8700 ghastly dragons.",
								player:getStorageValue(Storage.creaturesKillCounter + 19)
							)
						end,
						[2] = "You successfully hunted 8700 ghastly dragons. If you want to you may complete this task again.",
					},
				},
				[26] = { -- Task Manager
					name = "Task Hunting: Choking Fears",
					storageId = Storage.taskIdBase + 20,
					missionId = 26,
					startValue = 1,
					endValue = 2,
					states = {
						[1] = function(player)
							return string.format(
								"You already hunted %d/9000 choking fears.",
								player:getStorageValue(Storage.creaturesKillCounter + 20)
							)
						end,
						[2] = "You successfully hunted 9000 choking fears. If you want to you may complete this task again.",
					},
				},
			}
		},
		
		[2] = {
			name = "Annihilator",
			startStorageId = Storage.Quest.U01_24.Annihilator.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "The True Hero",
					storageId = Storage.Quest.U01_24.Annihilator.TheTrueHero,
					missionId = 1,
					startValue = 1,
					endValue = 1,
					description = "Prove sua honra sobrevivendo ao desafio mortal dos anoes de Moria.",
					states = {
						[1] = "Prove sua honra sobrevivendo ao desafio mortal dos anoes de Moria.",
					},
				},
			},
		},
		[3] = {
			name = "Pentagrama",
			startStorageId = Storage.Quest.U01_24.Pentagrama.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "In The Hell With Devil",
					storageId = Storage.Quest.U01_24.Pentagrama.InTheHellWithDevil,
					missionId = 1,
					startValue = 1,
					endValue = 1,
					description = "Sobreviva a sua visita ao inferno e retorne com sua recompensa.",
					states = {
						[1] = "Sobreviva a sua visita ao inferno e retorne com sua recompensa.",
					},
				},
			},
		},
		[4] = {
			name = "Bronson Old Quests",
			startStorageId = Storage.Quest.U02_24.quest_ChestNumber1.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "Frosty & Freezing",
					storageId = Storage.Quest.U02_24.quest_ChestNumber1.Mission1,
					missionId = 1,
					startValue = 0,
					endValue = 1,
					description = "No pequeno mirante ao norte de Ice, temos uma surpresa deixada por um aventureiro druid.",
					states = {
						[1] = "No pequeno mirante ao norte de Ice, temos uma surpresa deixada por um aventureiro druid.",
					},
				},
				[2] = {
					name = "Black Knight Camp",
					storageId = Storage.Quest.U02_24.quest_ChestNumber2.Mission1,
					missionId = 2,
					startValue = 0,
					endValue = 1,
					description = "Um dos guerreiros da ordem dos blacknights esconderam este knight axe em uma de suas torres.",
					states = {
						[1] = "Um dos guerreiros da ordem dos blacknights esconderam este knight axe em uma de suas torres.",
					},
				},
				[3] = {
					name = "Inside Erebor",
					storageId = Storage.Quest.U02_24.quest_ChestNumber3.Mission1,
					missionId = 2,
					startValue = 0,
					endValue = 1,
					description = "Os anoes possuem tecnicas incriveis de forja, criaram esta legs resistente aos mais fortes golpes.",
					states = {
						[1] = "Os anoes possuem tecnicas incriveis de forja, criaram esta legs resistente aos mais fortes golpes.",
					},
				},
				[4] = {
					name = "Valkires Village Eriador",
					storageId = Storage.Quest.U02_24.quest_ChestNumber4.Mission1,
					missionId = 4,
					startValue = 0,
					endValue = 1,
					description = "As Valquirias e Amazonas escoderam esta lança usada em seus treinos, devo ter cuidado ao usa-la.",
					states = {
						[1] = "As Valquirias e Amazonas escoderam esta lança usada em seus treinos, devo ter cuidado ao usa-la.",
					},
				},
				[5] = {
					name = "Underground of Blessing Cathedral",
					storageId = Storage.Quest.U02_24.quest_ChestNumber5.Mission1,
					missionId = 5,
					startValue = 0,
					endValue = 1,
					description = "O Bispo guardou seu segredo que participava de rituais de magia, esta robe e a prova que ele e um dos cults.",
					states = {
						[1] = "O Bispo guardou seu segredo que participava de rituais de magia, esta robe e a prova que ele e um dos cults.",
					},
				},
				[6] = {
					name = "Underground of Blessing Cathedral II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber6.Mission1,
					missionId = 6,
					startValue = 0,
					endValue = 1,
					description = "Mais uma prova que o bispo participava de rituais, este cajado com uma caveira me da arrepios...",
					states = {
						[1] = "Mais uma prova que o bispo participava de rituais, este cajado com uma caveira me da arrepios...",
					},
				},
				[7] = {
					name = "The Bree Blacksmith",
					storageId = Storage.Quest.U02_24.quest_ChestNumber7.Mission1,
					missionId = 7,
					startValue = 0,
					endValue = 1,
					description = "Um ferreiro que morava no interior do bueiro de Bree, escondeu uma de suas armaduras em seu barril.",
					states = {
						[1] = "Um ferreiro que morava no interior do bueiro de Bree, escondeu uma de suas armaduras em seu barril.",
					},
				},
				[8] = {
					name = "The Soup For Minotaurs",
					storageId = Storage.Quest.U02_24.quest_ChestNumber8.Mission1,
					missionId = 8,
					startValue = 0,
					endValue = 1,
					description = "Algum aventureiro acabou sendo capturado e tornou-se uma bela sopa aos minotauros, ainda bem que sobrou sua armadura.",
					states = {
						[1] = "Algum aventureiro acabou sendo capturado e tornou-se uma bela sopa aos minotauros, ainda bem que sobrou sua armadura.",
					},
				},
				[9] = {
					name = "Slain Bog Rider",
					storageId = Storage.Quest.U02_24.quest_ChestNumber9.Mission1,
					missionId = 9,
					startValue = 0,
					endValue = 1,
					description = "Encontrei uma armadura dentro de um resquicio de Bog Rider, era a armadura de algum nativo.",
					states = {
						[1] = "Encontrei uma armadura dentro de um resquicio de Bog Rider, era a armadura de algum nativo.",
					},
				},
				[10] = {
					name = "In The Dragon Cage",
					storageId = Storage.Quest.U02_24.quest_ChestNumber10.Mission1,
					missionId = 10,
					startValue = 0,
					endValue = 1,
					description = "Na estatua do oraculo brilhava uma intensa chama, ao toca-la revelou-se uma wand of inferno.",
					states = {
						[1] = "Na estatua do oraculo brilhava uma intensa chama, ao toca-la revelou-se uma wand of inferno.",
					},
				},
				[11] = {
					name = "Frosty & Freezing II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber11.Mission1,
					missionId = 11,
					startValue = 0,
					endValue = 1,
					description = "Um manto congelado foi encontrado sendo guardado por diversos dragoes de gelo, espero que seu antigo dono esteja bem.",
					states = {
						[1] = "Um manto congelado foi encontrado sendo guardado por diversos dragoes de gelo, espero que seu antigo dono esteja bem.",
					},
				},
				[12] = {
					name = "A Stolen Boots",
					storageId = Storage.Quest.U02_24.quest_ChestNumber12.Mission1,
					missionId = 12,
					startValue = 0,
					endValue = 1,
					description = "Um pirata capitao teve suas botas roubadas por um marujo, ele as escondeu em uma estatua antiga.",
					states = {
						[1] = "Um pirata capitao teve suas botas roubadas por um marujo, ele as escondeu em uma estatua antiga.",
					},
				},
				[13] = {
					name = "Fight or Flight!",
					storageId = Storage.Quest.U02_24.quest_ChestNumber13.Mission1,
					missionId = 13,
					startValue = 0,
					endValue = 1,
					description = "Prestes a encarar o poderoso Emilianenko, tive a oportunidade de recolher uma espada esquecida em seu bau.",
					states = {
						[1] = "Prestes a encarar o poderoso Emilianenko, tive a oportunidade de recolher uma espada esquecida em seu bau.",
					},
				},
				[14] = {
					name = "The Death Corridor",
					storageId = Storage.Quest.U02_24.quest_ChestNumber14.Mission1,
					missionId = 14,
					startValue = 0,
					endValue = 1,
					description = "Os poderosos Heros esconderam uma de suas armaduras em uma sala secreta, preparada com um corredor da morte.",
					states = {
						[1] = "Os poderosos Heros esconderam uma de suas armaduras em uma sala secreta, preparada com um corredor da morte.",
					},
				},
				[15] = {
					name = "The Death Corridor II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber15.Mission1,
					missionId = 15,
					startValue = 0,
					endValue = 1,
					description = "No corredor da morte contava com a presença de Hunters, mas encontrei tambem um elmo de algum guerreiro falecido.",
					states = {
						[1] = "No corredor da morte contava com a presença de Hunters, mas encontrei tambem um elmo de algum guerreiro falecido.",
					},
				},
				[16] = {
					name = "Pit - Devil Helmet",
					storageId = Storage.Quest.U02_24.quest_ChestNumber16.Mission1,
					missionId = 16,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[17] = {
					name = "Cyclops Village",
					storageId = Storage.Quest.U02_24.quest_ChestNumber17.Mission1,
					missionId = 17,
					startValue = 0,
					endValue = 1,
					description = "Em algum lugar no alto de uma vila de Cyclops, repousava este elmo, talvez fosse um presente adquirido dos humanos.",
					states = {
						[1] = "Em algum lugar no alto de uma vila de Cyclops, repousava este elmo, talvez fosse um presente adquirido dos humanos.",
					},
				},
				[18] = {
					name = "Swimming With Quaras",
					storageId = Storage.Quest.U02_24.quest_ChestNumber18.Mission1,
					missionId = 18,
					startValue = 0,
					endValue = 1,
					description = "Nadando nas profundesas de esgaroth encontrei um bau escondido, era um belo kilt que pertenceu a alguma bruxa.",
					states = {
						[1] = "Nadando nas profundesas de esgaroth encontrei um bau escondido, era um belo kilt que pertenceu a alguma bruxa.",
					},
				},
				[19] = {
					name = "Breathing In The Sea",
					storageId = Storage.Quest.U02_24.quest_ChestNumber19.Mission1,
					missionId = 19,
					startValue = 0,
					endValue = 1,
					description = "Um genio a frente de seu tempo desenvolveu este capacete de mergulho... Eu duvido que ele era apenas um pirata...",
					states = {
						[1] = "Um genio a frente de seu tempo desenvolveu este capacete de mergulho... Eu duvido que ele era apenas um pirata...",
					},
				},
				[20] = {
					name = "Dig Deep Like a Rotworm",
					storageId = Storage.Quest.U02_24.quest_ChestNumber20.Mission1,
					missionId = 20,
					startValue = 0,
					endValue = 1,
					description = "Nas profundezas de edoras, após as carvenas de grandes aranhas e tarantulas, os rotworms guardaram este presente de um antigo amigo mago.",
					states = {
						[1] = "Nas profundezas de edoras, após as carvenas de grandes aranhas e tarantulas, os rotworms guardaram este presente de um antigo amigo mago.",
					},
				},
				[21] = {
					name = "Barbarian Glacier Camp",
					storageId = Storage.Quest.U02_24.quest_ChestNumber21.Mission1,
					missionId = 21,
					startValue = 0,
					endValue = 1,
					description = "Ao norte do mundo encontrei uma ponte gelida, la havia a presença de varios barbaros, porem havia tambem este sapato em um bau congelado.",
					states = {
						[1] = "Ao norte do mundo encontrei uma ponte gelida, la havia a presença de varios barbaros, porem havia tambem este sapato em um bau congelado.",
					},
				},
				[22] = {
					name = "The Forbidden City",
					storageId = Storage.Quest.U02_24.quest_ChestNumber22.Mission1,
					missionId = 22,
					startValue = 0,
					endValue = 1,
					description = "No alto de uma torre, protegido por varios caes de tres cabeças, havia uma legs. Seu material me remete a lava.",
					states = {
						[1] = "No alto de uma torre, protegido por varios caes de tres cabeças, havia uma legs. Seu material me remete a lava.",
					},
				},
				[23] = {
					name = "Chave macacos - reservado",
					storageId = Storage.Quest.U02_24.quest_ChestNumber23.Mission1,
					missionId = 23,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[24] = {
					name = "The Fallen Adventurer",
					storageId = Storage.Quest.U02_24.quest_ChestNumber24.Mission1,
					missionId = 24,
					startValue = 0,
					endValue = 1,
					description = "Encontrei um aventureiro morto, logo a frente de uma estatua de heroi. Com ele encontrei este machado de barbaro.",
					states = {
						[1] = "Encontrei um aventureiro morto, logo a frente de uma estatua de heroi. Com ele encontrei este machado de barbaro.",
					},
				},
				[25] = {
					name = "Inside The Succubus Secret",
					storageId = Storage.Quest.U02_24.quest_ChestNumber25.Mission1,
					missionId = 25,
					startValue = 0,
					endValue = 1,
					description = "Estes demonios inferiores forjaram uma armadura de lava, a qual protege de danos magicos. Esconderam em sua estatua do Deus Obsidiano.",
					states = {
						[1] = "Estes demonios inferiores forjaram uma armadura de lava, a qual protege de danos magicos. Esconderam em sua estatua do Deus Obsidiano.",
					},
				},
				[26] = {
					name = "The Fortress Labirinty",
					storageId = Storage.Quest.U02_24.quest_ChestNumber26.Mission1,
					missionId = 26,
					startValue = 0,
					endValue = 1,
					description = "Um labirinto escondido no interior da Orc Fortress possuia uma clava cravejada de safiras, certamente roubada de um dwarf.",
					states = {
						[1] = "Um labirinto escondido no interior da Orc Fortress possuia uma clava cravejada de safiras, certamente roubada de um dwarf.",
					},
				},
				[27] = {
					name = "Warlock hideout",
					storageId = Storage.Quest.U02_24.quest_ChestNumber27.Mission1,
					missionId = 27,
					startValue = 0,
					endValue = 1,
					description = "Um dos grandes Warlocks guardou este machado de fogo, adquirido em uma de suas aventuras caçando demons.",
					states = {
						[1] = "Um dos grandes Warlocks guardou este machado de fogo, adquirido em uma de suas aventuras caçando demons.",
					},
				},
				[28] = {
					name = "Ferumbras Treasure",
					storageId = Storage.Quest.U02_24.quest_ChestNumber28.Mission1,
					missionId = 28,
					startValue = 0,
					endValue = 1,
					description = "O temido mago Ferumbras guardava este cajado a sete chaves. Com ele um poderoso mage pode causar um enorme dano.",
					states = {
						[1] = "O temido mago Ferumbras guardava este cajado a sete chaves. Com ele um poderoso mage pode causar um enorme dano.",
					},
				},
				[29] = {
					name = "The Knight of Tarrasque",
					storageId = Storage.Quest.U02_24.quest_ChestNumber29.Mission1,
					missionId = 29,
					startValue = 0,
					endValue = 1,
					description = "Um nobre knight sucumbiu ao poder dos dragons lords, em seu leito de morte deixou este anel preso ao seu dedo.",
					states = {
						[1] = "Um nobre knight sucumbiu ao poder dos dragons lords, em seu leito de morte deixou este anel preso ao seu dedo.",
					},
				},
				[30] = {
					name = "Sharp Like Ice",
					storageId = Storage.Quest.U02_24.quest_ChestNumber30.Mission1,
					missionId = 30,
					startValue = 0,
					endValue = 1,
					description = "As bruxas de gelo guardaram este machado no topo de sua montanha. Ele foi criado a partir de uma escama do poderoso Scatha.",
					states = {
						[1] = "As bruxas de gelo guardaram este machado no topo de sua montanha. Ele foi criado a partir de uma escama do poderoso Scatha.",
					},
				},
				[31] = {
					name = "Knight Village Tower",
					storageId = Storage.Quest.U02_24.quest_ChestNumber31.Mission1,
					missionId = 31,
					startValue = 0,
					endValue = 1,
					description = "Uma pequena e brilhante espada repousava na estatua de um grande black knight, a subida em sua torre foi desafiadora.",
					states = {
						[1] = "Uma pequena e brilhante espada repousava na estatua de um grande black knight, a subida em sua torre foi desafiadora.",
					},
				},
				[32] = {
					name = "The Newbie Start",
					storageId = Storage.Quest.U02_24.quest_ChestNumber32.Mission1,
					missionId = 32,
					startValue = 0,
					endValue = 1,
					description = "Uma balestra encontrei na estatua de legolas, um grande heroi de rivendell.",
					states = {
						[1] = "Uma balestra encontrei na estatua de legolas, um grande heroi de rivendell.",
					},
				},
				[33] = {
					name = "Stick..ick Spider Boots",
					storageId = Storage.Quest.U02_24.quest_ChestNumber33.Mission1,
					missionId = 33,
					startValue = 0,
					endValue = 1,
					description = "Sob o poder da perigosa Laracna, encontrei esta bota que garante o poder de correr como uma Laracna.",
					states = {
						[1] = "Sob o poder da perigosa Laracna, encontrei esta bota que garante o poder de correr como uma Laracna.",
					},
				},
				[34] = {
					name = "The Ruined Crown",
					storageId = Storage.Quest.U02_24.quest_ChestNumber34.Mission1,
					missionId = 34,
					startValue = 0,
					endValue = 1,
					description = "Nos arredores de Minas Tirith, sob a guarda de Black Knights, Heros e Furys, a coroa do rei de Minas. Talvez ele queira ela de volta.",
					states = {
						[1] = "Nos arredores de Minas Tirith, sob a guarda de Black Knights, Heros e Furys, a coroa do rei de Minas. Talvez ele queira ela de volta.",
					},
				},
				[35] = {
					name = "Worst Nightmare in Forochel",
					storageId = Storage.Quest.U02_24.quest_ChestNumber35.Mission1,
					missionId = 35,
					startValue = 0,
					endValue = 1,
					description = "Sob os escombros de uma caverna de nightmares, encontrei este pequeno corredor tomado por criaturas de gelo, ao menos me esperava uma recompensa no altar de gelo.",
					states = {
						[1] = "Sob os escombros de uma caverna de nightmares, encontrei este pequeno corredor tomado por criaturas de gelo, ao menos me esperava uma recompensa no altar de gelo.",
					},
				},
				[36] = {
					name = "Aghanim Lost Trouser",
					storageId = Storage.Quest.U02_24.quest_ChestNumber36.Mission1,
					missionId = 36,
					startValue = 0,
					endValue = 1,
					description = "Um poderoso mago utilizava esta legs para melhorar seu regeneramento de mana, conta-se que este mago era o poderoso Ferumbras, antes de tornar-se mal.",
					states = {
						[1] = "Um poderoso mago utilizava esta legs para melhorar seu regeneramento de mana, conta-se que este mago era o poderoso Ferumbras, antes de tornar-se mal.",
					},
				},
				[37] = {
					name = "Through The Evil Corridor",
					storageId = Storage.Quest.U02_24.quest_ChestNumber37.Mission1,
					missionId = 37,
					startValue = 0,
					endValue = 1,
					description = "Apos percorrer corredores gigantes repletos de Juggernault's, eis que encontro uma estranha chave de ouro... O que sera que ela abre?",
					states = {
						[1] = "Apos percorrer corredores gigantes repletos de Juggernault's, eis que encontro uma estranha chave de ouro... O que sera que ela abre?",
					},
				},
				[38] = {
					name = "A Visit To Purgatory",
					storageId = Storage.Quest.U02_24.quest_ChestNumber38.Mission1,
					missionId = 38,
					startValue = 0,
					endValue = 1,
					description = "Nesta formidavel visita aos nightmares e hellfire fights, encontrei um cajado diferente de tudo que ja vi... me parece servir para causar dano aos impuros.",
					states = {
						[1] = "Nesta formidavel visita aos nightmares e hellfire fights, encontrei um cajado diferente de tudo que ja vi... me parece servir para causar dano aos impuros.",
					},
				},
				[39] = {
					name = "Cyclops Village II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber39.Mission1,
					missionId = 39,
					startValue = 0,
					endValue = 1,
					description = "No ponto mais alto da torre havia uma estatua vestindo um capacete com chifres. Nao imagino onde estes Cyclops conseguiram um capacete assim.",
					states = {
						[1] = "No ponto mais alto da torre havia uma estatua vestindo um capacete com chifres. Nao imagino onde estes Cyclops conseguiram um capacete assim.",
					},
				},
				[40] = {
					name = "Burried Like a Dwarf",
					storageId = Storage.Quest.U02_24.quest_ChestNumber40.Mission1,
					missionId = 40,
					startValue = 0,
					endValue = 1,
					description = "Nas profundezas de Moria, os Dwarfs Miners esconderam sua nova invencao. Uma nova pa muito mais leve e eficiente para suas escavacoes.",
					states = {
						[1] = "Nas profundezas de Moria, os Dwarfs Miners esconderam sua nova invencao. Uma nova pa muito mais leve e eficiente para suas escavacoes.",
					},
				},
				[41] = {
					name = "Sharped Ice Sword",
					storageId = Storage.Quest.U02_24.quest_ChestNumber41.Mission1,
					missionId = 41,
					startValue = 0,
					endValue = 1,
					description = "Em um buraco na cidade de Forodwaith encontrei aranhas de cristal, capazes de matar qualquer aventureiro. Em seu esconderijo fui presenteado com uma ice rapier.",
					states = {
						[1] = "Em um buraco na cidade de Forodwaith encontrei aranhas de cristal, capazes de matar qualquer aventureiro. Em seu esconderijo fui presenteado com uma ice rapier."
					},
				},
				[42] = {
					name = "The Flower Tomb",
					storageId = Storage.Quest.U02_24.quest_ChestNumber42.Mission1,
					missionId = 42,
					startValue = 0,
					endValue = 1,
					description = "No meio da floresta das hydras, econtrei uma tumba de uma falecida amazona. Com ela foi enterrada a sua poderosa armadura.",
					states = {
						[1] = "No meio da floresta das hydras, econtrei uma tumba de uma falecida amazona. Com ela foi enterrada a sua poderosa armadura.",
					},
				},
				[43] = {
					name = "Geomancer Stone",
					storageId = Storage.Quest.U02_24.quest_ChestNumber43.Mission1,
					missionId = 43,
					startValue = 0,
					endValue = 1,
					description = "Nas profundezas de moria, mais exato no convil dos dwarfs geomancers, havia um bau guardando uma estranha pedra... Esta pedra pode ser o segredo de novas aventuras.",
					states = {
						[1] = "Nas profundezas de moria, mais exato no convil dos dwarfs geomancers, havia um bau guardando uma estranha pedra... Esta pedra pode ser o segredo de novas aventuras.",
					},
				},
				[44] = {
					name = "Lich Hell",
					storageId = Storage.Quest.U02_24.quest_ChestNumber44.Mission1,
					missionId = 44,
					startValue = 0,
					endValue = 1,
					description = "Em um estranho monumento onde os Lich's fazem suas ofertas de magias, havia um escudo enganchado... Me parece o escudo de algum knight.",
					states = {
						[1] = "Em um estranho monumento onde os Lich's fazem suas ofertas de magias, havia um escudo enganchado... Me parece o escudo de algum knight.",
					},
				},
				[45] = {
					name = "A Forgotten Halberd",
					storageId = Storage.Quest.U02_24.quest_ChestNumber45.Mission1,
					missionId = 45,
					startValue = 0,
					endValue = 1,
					description = "Um belo machado foi encontrado na caverna dos dragon lords de ashenport. Com certeza isto esta aqui antes mesmo da chegada dos dragons.",
					states = {
						[1] = "Um belo machado foi encontrado na caverna dos dragon lords de ashenport. Com certeza isto esta aqui antes mesmo da chegada dos dragons.",
					},
				},
				[46] = {
					name = "The Grey One Ring",
					storageId = Storage.Quest.U02_24.quest_ChestNumber46.Mission1,
					missionId = 46,
					startValue = 0,
					endValue = 1,
					description = "O anel pertenceu ao maior mago de todos, gandalf o cinzento. Este anel caiu de seu dedo durante sua grande luta com o Balrog. Foi trazido ao vulcao por seus lacaios pervesos.",
					states = {
						[1] = "O anel pertenceu ao maior mago de todos, gandalf o cinzento. Este anel caiu de seu dedo durante sua grande luta com o Balrog. Foi trazido ao vulcao por seus lacaios pervesos.",
					},
				},
				[47] = {
					name = "In The Path to Ancalagon",
					storageId = Storage.Quest.U02_24.quest_ChestNumber47.Mission1,
					missionId = 47,
					startValue = 0,
					endValue = 1,
					description = "Uma poderosa bota de regeneracao de mana foi encontrada sob guarda dos juggernaults de Orodruin. Como diria um grande amigo, uma vez de soft para sempre soft.",
					states = {
						[1] = "Uma poderosa bota de regeneracao de mana foi encontrada sob guarda dos juggernaults de Orodruin. Como diria um grande amigo, uma vez de soft para sempre soft",
					},
				},
				[48] = {
					name = "Another Piece of Aghanim",
					storageId = Storage.Quest.U02_24.quest_ChestNumber48.Mission1,
					missionId = 48,
					startValue = 0,
					endValue = 1,
					description = "Uma das peças do famoso Aghanim foi escondida dentro da caverna do rei dos wyverns, o mesmo que tambem e filho do temido Ancalagon.",
					states = {
						[1] = "Uma das peças do famoso Aghanim foi escondida dentro da caverna do rei dos wyverns, o mesmo que tambem e filho do temido Ancalagon.",
					},
				},
				[49] = {
					name = "Holy Flower of Orchid",
					storageId = Storage.Quest.U02_24.quest_ChestNumber49.Mission1,
					missionId = 49,
					startValue = 0,
					endValue = 1,
					description = "Uma estranha planta foi encontrada nos escombros de uma cidade habitada por magos e plaguesmiths. Talvez ela tenha um fim para comestico.",
					states = {
						[1] = "Uma estranha planta foi encontrada nos escombros de uma cidade habitada por magos e plaguesmiths. Talvez ela tenha um fim para comestico.",
					},
				},
				[50] = {
					name = "The Spooky Boots",
					storageId = Storage.Quest.U02_24.quest_ChestNumber50.Mission1,
					missionId = 50,
					startValue = 0,
					endValue = 1,
					description = "Sob dominio de varios fantasmas piratas, encontrei uma outra bota de pirata. Com certeza deveria ser de algum destes piratas que matei.",
					states = {
						[1] = "Sob dominio de varios fantasmas piratas, encontrei uma outra bota de pirata. Com certeza deveria ser de algum destes piratas que matei.",
					},
				},
				[51] = {
					name = "The Tower Shield Labirinty",
					storageId = Storage.Quest.U02_24.quest_ChestNumber51.Mission1,
					missionId = 51,
					startValue = 0,
					endValue = 1,
					description = "Nas profundezas da masmorra de moria, onde os dwarfs isolaram os magos, demonios e behemooths, encontrava-se um tesouro do rei. Um belo escudo com uma defesa incrivel.",
					states = {
						[1] = "Nas profundezas da masmorra de moria, onde os dwarfs isolaram os magos, demonios e behemooths, encontrava-se um tesouro do rei. Um belo escudo com uma defesa incrivel.",
					},
				},
				[52] = {
					name = "A Tiny Part Of an Antique Helmet",
					storageId = Storage.Quest.U02_24.quest_ChestNumber52.Mission1,
					missionId = 52,
					startValue = 0,
					endValue = 1,
					description = "Os dragoes sao conhecidos por escoderem grandes tesouros, ate mesmos seus filhotes seguem a tradicao. Uma pequena parte do elmo conhecido por Helmet Of The Ancients foi encontrado.",
					states = {
						[1] = "Os dragoes sao conhecidos por escoderem grandes tesouros, ate mesmos seus filhotes seguem a tradicao. Uma pequena parte do elmo conhecido por Helmet Of The Ancients foi encontrado.",
					},
				},
				[53] = {
					name = "A Tiny Part Of an Antique Helmet II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber53.Mission1,
					missionId = 53,
					startValue = 0,
					endValue = 1,
					description = "Um pequeno pedaço responsavel por guardar a gema do poderoso HOTA. Estava escondido dentro de uma cripta ao oeste de Eriador.",
					states = {
						[1] = "Um pequeno pedaço responsavel por guardar a gema do poderoso HOTA foi encontrado em uma carverna repleta de animais peçonhentos.",
					},
				},
				[54] = {
					name = "A Tiny Part Of an Antique Helmet III",
					storageId = Storage.Quest.U02_24.quest_ChestNumber54.Mission1,
					missionId = 54,
					startValue = 0,
					endValue = 1,
					description = "No gelido castelo de ered, encontrava-se proximo ao poderoso Stacha um dos pedaços que compoe o temido HOTA.",
					states = {
						[1] = "No gelido castelo de ered, encontrava-se proximo ao poderoso Stacha um dos pedaços que compoe o temido HOTA.",
					},
				},
				[55] = {
					name = "A Tiny Part Of an Antique Helmet IV",
					storageId = Storage.Quest.U02_24.quest_ChestNumber55.Mission1,
					missionId = 55,
					startValue = 0,
					endValue = 1,
					description = "Nas aguas gelidas do subsolo ao redor do castelo de ered, repousava sobre a guarda de Quaras um dos pedaços do elmo. Apenas um mergulhador poderia acessar este local.",
					states = {
						[1] = "Nas aguas gelidas do subsolo ao redor do castelo de ered, repousava sobre a guarda de Quaras um dos pedaços do elmo. Apenas um mergulhador poderia acessar este local.",
					},
				},
				[56] = {
					name = "A Tiny Part Of an Antique Helmet V",
					storageId = Storage.Quest.U02_24.quest_ChestNumber56.Mission1,
					missionId = 56,
					startValue = 0,
					endValue = 1,
					description = "Os warlocks de Minas Tirith esconderam o par de chifres do Helmet of The Ancients com medo de cair em boas maos.",
					states = {
						[1] = "Os warlocks de Minas Tirith esconderam o par de chifres do Helmet of The Ancients com medo de cair em boas maos.",
					},
				},
				[57] = {
					name = "A Tiny Part Of an Antique Helmet VI",
					storageId = Storage.Quest.U02_24.quest_ChestNumber57.Mission1,
					missionId = 57,
					startValue = 0,
					endValue = 1,
					description = "O poder e o enconderijo dos Warlocks nao foram palio suficiente para um grande aventureiro.",
					states = {
						[1] = "O poder e o enconderijo dos Warlocks nao foram palio suficiente para um grande aventureiro.",
					},
				},
				[58] = {
					name = "The Deep Hydra Secret",
					storageId = Storage.Quest.U02_24.quest_ChestNumber58.Mission1,
					missionId = 58,
					startValue = 0,
					endValue = 1,
					description = "Nas profundezas das carvenas de hydra de Minas, encontrei sob uma cachoeira uma estranha passagem. Nesta carve, sob guarda de perigosas Giant Spiders, encontrei um amuleto da terra.",
					states = {
						[1] = "Nas profundezas das carvenas de hydra de Minas, encontrei sob uma cachoeira uma estranha passagem. Nesta carve, sob guarda de perigosas Giant Spiders, encontrei um amuleto da terra.",
					},
				},
				[59] = {
					name = "Voila... Masterchef",
					storageId = Storage.Quest.U02_24.quest_ChestNumber59.Mission1,
					missionId = 59,
					startValue = 0,
					endValue = 1,
					description = "A tribo de dworcs de carn guarda este livro de culinaria a seculos, neste livro contem ate mesmo receitas de humanos. Um livro de receitas poderia me servir para que?",
					states = {
						[1] = "A tribo de dworcs de carn guarda este livro de culinaria a seculos, neste livro contem ate mesmo receitas de humanos. Um livro de receitas poderia me servir para que?",
					},
				},
				[60] = {
					name = "A Vampire Horror Dairy",
					storageId = Storage.Quest.U02_24.quest_ChestNumber60.Mission1,
					missionId = 60,
					startValue = 0,
					endValue = 1,
					description = "O que este livro estava fazendo naquela carvena? Ha um simbolo de vampiro neste livro, sera que pertenceu a algum Viscount? Seu simbolo macabro me instiga a utiliza-lo para abrir caminhos.",
					states = {
						[1] = "O que este livro estava fazendo naquela carvena? Ha um simbolo de vampiro neste livro, sera que pertenceu a algum Viscount? Seu simbolo macabro me instiga a utiliza-lo para abrir caminhos.",
					},
				},
				[61] = {
					name = "A Lonely Remains",
					storageId = Storage.Quest.U02_24.quest_ChestNumber61.Mission1,
					missionId = 61,
					startValue = 0,
					endValue = 1,
					description = "Dentro de uma fonte de agua encontrei isto que parece ser o que sobrou de um defiler. Sinto uma ma energia percorrendo estes restos mortais.",
					states = {
						[1] = "Dentro de uma fonte de agua encontrei isto que parece ser o que sobrou de um defiler. Sinto uma ma energia percorrendo estes restos mortais.",
					},
				},
				[62] = {
					name = "A Lost Wizard Robe",
					storageId = Storage.Quest.U02_24.quest_ChestNumber62.Mission1,
					missionId = 62,
					startValue = 0,
					endValue = 1,
					description = "Uma das ultimas peças do grande mago Aghanim foi encontrada juntamente com o poderoso Adramalech. O que faz um demonio como aquele estar se aproveitando dos poderes magicos deste robe?",
					states = {
						[1] = "Uma das ultimas peças do grande mago Aghanim foi encontrada juntamente com o poderoso Adramalech. O que faz um demonio como aquele estar se aproveitando dos poderes magicos deste robe?",
					},
				},
				[63] = {
					name = "A Lost Toy",
					storageId = Storage.Quest.U02_24.quest_ChestNumber63.Mission1,
					missionId = 63,
					startValue = 0,
					endValue = 1,
					description = "Um estilingue estava perdido dentro da caverna de poderosos dragoes em Minas, me parece algum brinquedo perdido de um pequeno elfo.",
					states = {
						[1] = "Um estilingue estava perdido dentro da caverna de poderosos dragoes em Minas, me parece algum brinquedo perdido de um pequeno elfo.",
					},
				},
				[64] = {
					name = "The Bright Bow",
					storageId = Storage.Quest.U02_24.quest_ChestNumber64.Mission1,
					missionId = 64,
					startValue = 0,
					endValue = 1,
					description = "Um arco elfico com a incial L pertencia a um Chaos Draco, habitante do ultimo andar da torre de dragoes. Esta inicial seria do grande elfo Legolas?",
					states = {
						[1] = "Um arco elfico com a incial L pertencia a um Chaos Draco, habitante do ultimo andar da torre de dragoes. Esta inicial seria do grande elfo Legolas?",
					},
				},
				[65] = {
					name = "For You Are Dust... To Dust Return”",
					storageId = Storage.Quest.U02_24.quest_ChestNumber65.Mission1,
					missionId = 65,
					startValue = 0,
					endValue = 1,
					description = "Algum vampiro nao obteve sorte quando passeava pelos arredores de Beleghost, afinal o Varalaukar nunca foi proximo aos vampiros.",
					states = {
						[1] = "Algo genérico",
					},
				},
				[66] = {
					name = "A Lost Loss",
					storageId = Storage.Quest.U02_24.quest_ChestNumber66.Mission1,
					missionId = 66,
					startValue = 0,
					endValue = 1,
					description = "Um amuleto que descrevem com o poder de proteger todos seus equipamentos durante a morte, uma pena que estava perdido no meio deste pantano nojento.",
					states = {
						[1] = "Um amuleto que descrevem com o poder de proteger todos seus equipamentos durante a morte, uma pena que estava perdido no meio deste pantano nojento.",
					},
				},
				[67] = {
					name = "A SoulBurner Heart",
					storageId = Storage.Quest.U02_24.quest_ChestNumber67.Mission1,
					missionId = 67,
					startValue = 0,
					endValue = 1,
					description = "O coracao pertencente a uma alma atortamentada pelo fogo. Em seus veios pulsam sentimentos profanos e odiosos de vingança. Um poderoso artefato para magias de escuridão.",
					states = {
						[1] = "O coracao pertencente a uma alma atortamentada pelo fogo. Em seus veios pulsam sentimentos profanos e odiosos de vingança. Um poderoso artefato para magias de escuridão.",
					},
				},
				[68] = {
					name = "A Hunter Bedroom",
					storageId = Storage.Quest.U02_24.quest_ChestNumber68.Mission1,
					missionId = 68,
					startValue = 0,
					endValue = 1,
					description = "Em um bau nos aposentos de um isolado Hunter, encontrei este elmo perdido e sem uso a muito tempo. Talvez tenha adquirido de algum aventureiro intruso que ousou pisar em sua propriedade.",
					states = {
						[1] = "Em um bau nos aposentos de um isolado Hunter, encontrei este elmo perdido e sem uso a muito tempo. Talvez tenha adquirido de algum aventureiro intruso que ousou pisar em sua propriedade.",
					},
				},
				[69] = {
					name = "A Cyclops Banquet",
					storageId = Storage.Quest.U02_24.quest_ChestNumber69.Mission1,
					missionId = 69,
					startValue = 0,
					endValue = 1,
					description = "No salao de jantar dos Cyclops, adentro de seus aposentos subterraneos, encontrei sobre um monumento uma armadura encaixada nele.",
					states = {
						[1] = "No salao de jantar dos Cyclops, adentro de seus aposentos subterraneos, encontrei sobre um monumento uma armadura encaixada nele.",
					},
				},
				[70] = {
					name = "The Elf Statue",
					storageId = Storage.Quest.U02_24.quest_ChestNumber70.Mission1,
					missionId = 70,
					startValue = 0,
					endValue = 1,
					description = "Como num passe de magica, ao tocar nesta estatua, apareceu em minha mochila esta armadura. Seria um presente dado a todos os elfs?",
					states = {
						[1] = "Como num passe de magica, ao tocar nesta estatua, apareceu em minha mochila esta armadura. Seria um presente dado a todos os elfs?",
					},
				},
				[71] = {
					name = "A Arabic Sword",
					storageId = Storage.Quest.U02_24.quest_ChestNumber71.Mission1,
					missionId = 71,
					startValue = 0,
					endValue = 1,
					description = "Perdida em uma cabana na floresta encontrei esta scimitar, uma espada do povo de Dunedain. Ouvi dizer que muito antigamente custumavam ser raras.",
					states = {
						[1] = "Perdida em uma cabana na floresta encontrei esta scimitar, uma espada do povo de Dunedain. Ouvi dizer que muito antigamente custumavam ser raras.",
					},
				},
				[72] = {
					name = "The Assassin House",
					storageId = Storage.Quest.U02_24.quest_ChestNumber72.Mission1,
					missionId = 72,
					startValue = 0,
					endValue = 1,
					description = "Encontrei uma calça nos aposentos de um assassin, talvez utiliza-se as para treinos mais barulhentos.",
					states = {
						[1] = "Encontrei uma calça nos aposentos de um assassin, talvez utiliza-se as para treinos mais barulhentos.",
					},
				},
				[73] = {
					name = "The Sleepy Crocodile",
					storageId = Storage.Quest.U02_24.quest_ChestNumber73.Mission1,
					missionId = 73,
					startValue = 0,
					endValue = 1,
					description = "Um belo par de botas de crocodilo estavam em um bau proximo aos wyverns, me parece que algum crocodilo foi pego dormindo.",
					states = {
						[1] = "Um belo par de botas de crocodilo estavam em um bau proximo aos wyverns, me parece que algum crocodilo foi pego dormindo.",
					},
				},
				[74] = {
					name = "A Globin Cult",
					storageId = Storage.Quest.U02_24.quest_ChestNumber74.Mission1,
					missionId = 74,
					startValue = 0,
					endValue = 1,
					description = "No campo dos globins ao redor de edoras encontrei este machado, estranhamente cultuavam junto a uma estatua. A estatua creo ser de um lider goblin.",
					states = {
						[1] = "No campo dos globins ao redor de edoras encontrei este machado, estranhamente cultuavam junto a uma estatua. A estatua creo ser de um lider goblin.",
					},
				},
				[75] = {
					name = "Misterius Fetish",
					storageId = Storage.Quest.U02_24.quest_ChestNumber75.Mission1,
					missionId = 75,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[76] = {
					name = "The Ritual Drum",
					storageId = Storage.Quest.U02_24.quest_ChestNumber76.Mission1,
					missionId = 76,
					startValue = 0,
					endValue = 1,
					description = "Os smugglers conhecidos por serem larapios, roubaram um tambor do ritual dos Cults. Este tambor e magico, e dizem ser capaz de por até mesmo estatuas para dançarem.",
					states = {
						[1] = "Os smugglers conhecidos por serem larapios, roubaram um tambor do ritual dos Cults. Este tambor e magico, e dizem ser capaz de por até mesmo estatuas para dançarem.",
					},
				},
				[77] = {
					name = "Lonely Camping",
					storageId = Storage.Quest.U02_24.quest_ChestNumber77.Mission1,
					missionId = 77,
					startValue = 0,
					endValue = 1,
					description = "Na entrada de moria havia um acampamento abandonado, ainda com sua fogueira acessa. Alguem deixou para tras esta armadura proximo as pedras de um moinho.",
					states = {
						[1] = "Na entrada de moria havia um acampamento abandonado, ainda com sua fogueira acessa. Alguem deixou para tras esta armadura proximo as pedras de um moinho.",
					},
				},
				[78] = {
					name = "Amazon Pearl",
					storageId = Storage.Quest.U02_24.quest_ChestNumber78.Mission1,
					missionId = 78,
					startValue = 0,
					endValue = 1,
					description = "Um conjunto de perolas negras foram encontradas nos acampamentos das valquirias e amazons de eriador, certamente conseguiram com os cults, que moram logo ali abaixo.",
					states = {
						[1] = "Um conjunto de perolas negras foram encontradas nos acampamentos das valquirias e amazons de eriador, certamente conseguiram com os cults, que moram logo ali abaixo.",
					},
				},
				[79] = {
					name = "A Hidden Dwarf Tunnel",
					storageId = Storage.Quest.U02_24.quest_ChestNumber79.Mission1,
					missionId = 79,
					startValue = 0,
					endValue = 1,
					description = "Em suas magnificas escavaçoes os dwarfs chegaram logo abaixo da cidade dos elfos, em sua nova mina guadaram em uma estatua de um grande dwarf sua calça famosa por conceder proteçao aos guerreiros.",
					states = {
						[1] = "Em suas magnificas escavaçoes os dwarfs chegaram logo abaixo da cidade dos elfos, em sua nova mina guadaram em uma estatua de um grande dwarf sua calça famosa por conceder proteçao aos guerreiros.",
					},
				},
				[80] = {
					name = "Green Like a Slime",
					storageId = Storage.Quest.U02_24.quest_ChestNumber80.Mission1,
					missionId = 80,
					startValue = 0,
					endValue = 1,
					description = "Dentro das construçoes subterraneas dos assassinos de ashenport, agora tomada por slimes, encontrei repousando dentro de uma fonte um Green Gem.",
					states = {
						[1] = "Dentro das construçoes subterraneas dos assassinos de ashenport, agora tomada por slimes, encontrei repousando dentro de uma fonte um Green Gem.",
					},
				},
				[81] = {
					name = "Fishing In a Well",
					storageId = Storage.Quest.U02_24.quest_ChestNumber81.Mission1,
					missionId = 81,
					startValue = 0,
					endValue = 1,
					description = "Ao recolher a corda de um poço ao lado de smugglers, encontrei um elmo no lugar do balde. Prontamente retirei este elmo para mim.",
					states = {
						[1] = "Ao recolher a corda de um poço ao lado de smugglers, encontrei um elmo no lugar do balde. Prontamente retirei este elmo para mim.",
					},
				},
				[82] = {
					name = "The Minomage Murder",
					storageId = Storage.Quest.U02_24.quest_ChestNumber82.Mission1,
					missionId = 82,
					startValue = 0,
					endValue = 1,
					description = "Em uma sala nas profundezas da caverna de minotauros de Bree, encontrei uma wand dentro do corpo de um minotauro mage. Com certeza, este minotaur foi assassinado por alguem proximo.",
					states = {
						[1] = "Em uma sala nas profundezas da caverna de minotauros de Bree, encontrei uma wand dentro do corpo de um minotauro mage. Com certeza, este minotaur foi assassinado por alguem proximo.",
					},
				},
				[83] = {
					name = "Inside The Necromancer Covil",
					storageId = Storage.Quest.U02_24.quest_ChestNumber83.Mission1,
					missionId = 83,
					startValue = 0,
					endValue = 1,
					description = "Nas antigas historias da Terra Media, contam que Evendim foi criada pelo proprio The Necromancer. Seu objetivo era construir um exercito de mortos vivos, para atacar e tomar a cidade de Bree.",
					states = {
						[1] = "Nas antigas historias da Terra Media, contam que Evendim foi criada pelo proprio The Necromancer. Seu objetivo era construir um exercito de mortos vivos, para atacar e tomar a cidade de Bree.",
					},
				},
				[84] = {
					name = "Inside The Necromancer Covil II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber84.Mission1,
					missionId = 84,
					startValue = 0,
					endValue = 1,
					description = "Ao invadir o covil, encontrei sua poderosa Wand e seu temido manto. Dizem que este manto foi confeccionado com o proprio couro de um Varalaukar.",
					states = {
						[1] = "Ao invadir o covil, encontrei sua poderosa Wand e seu temido manto. Dizem que este manto foi confeccionado com o proprio couro de um Varalaukar.",
					},
				},
				[85] = {
					name = "A Balrog Reward",
					storageId = Storage.Quest.U02_24.quest_ChestNumber85.Mission1,
					missionId = 85,
					startValue = 0,
					endValue = 1,
					description = "Nas entranhas do proprio inferno a um demonio completamente feito de fogo. Balrog carregar consigo um grande poder de destruiçao. Nos arredores havia um excepcional arco, seu nome e Warsinger Bow.",
					states = {
						[1] = "Nas entranhas do proprio inferno a um demonio completamente feito de fogo. Balrog carregar consigo um grande poder de destruiçao. Nos arredores havia um excepcional arco, seu nome e Warsinger Bow.",
					},
				},
				[86] = {
					name = "The Jormungandr Crown",
					storageId = Storage.Quest.U02_24.quest_ChestNumber86.Mission1,
					missionId = 86,
					startValue = 0,
					endValue = 1,
					description = "A temida serpente Jormungandr com seu exercito de spernt spawns protegiam esta coroa. Um tesouro protegido a sete chaves pela rainha das serpents. Seu uso confere poderes magicos ao dono.",
					states = {
						[1] = "A temida serpente Jormungandr com seu exercito de spernt spawns protegiam esta coroa. Um tesouro protegido a sete chaves pela rainha das serpents. Seu uso confere poderes magicos ao dono.",
					},
				},
				[87] = {
					name = "The Evil One Hellhound",
					storageId = Storage.Quest.U02_24.quest_ChestNumber87.Mission1,
					missionId = 87,
					startValue = 0,
					endValue = 1,
					description = "A magia dos Istari Follower foi capaz de criar um grande demonio, dizem ser o mais poderoso Hellhound ja invocado. A força incontrolavel de Cerberus o fez ficar isolado em uma masmorra.",
					states = {
						[1] = "A magia dos Istari Follower foi capaz de criar um grande demonio, dizem ser o mais poderoso Hellhound ja invocado. A força incontrolavel de Cerberus o fez ficar isolado em uma masmorra.",
					},
				},
				[88] = {
					name = "The Evil One Hellhound II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber88.Mission1,
					missionId = 88,
					startValue = 0,
					endValue = 1,
					description = "Na mais alta torre ao sul das instalaçoes dos Istaris, duas grandes recompensam foram escondidas, uma armadura de lava e um machado tao afinado capaz de degolar cabeças em apenas um toque.",
					states = {
						[1] = "Na mais alta torre ao sul das instalaçoes dos Istaris, duas grandes recompensam foram escondidas, uma armadura de lava e um machado tao afinado capaz de degolar cabeças em apenas um toque.",
					},
				},
				[89] = {
					name = "A Gem Inside The Montain",
					storageId = Storage.Quest.U02_24.quest_ChestNumber89.Mission1,
					missionId = 89,
					startValue = 0,
					endValue = 1,
					description = "Uma linda espada com empunhadura de esmeraldas foi perdida dentro de Orodruin, quando seu dono estava indo enfrentar o temido Ancalagon. Os Mancubos e behemoths existentes a roubaram e esconderam.",
					states = {
						[1] = "Uma linda espada com empunhadura de esmeraldas foi perdida dentro de Orodruin, quando seu dono estava indo enfrentar o temido Ancalagon. Os Mancubos e behemoths existentes a roubaram e esconderam.",
					},
				},
				[90] = {
					name = "Istari Backpack",
					storageId = Storage.Quest.U02_24.quest_ChestNumber90.Mission1,
					missionId = 90,
					startValue = 0,
					endValue = 1,
					description = "Na grande masmorra subterranea dos Istaris, no corpo de uma falecida guerreira havia uma mochila. A mesma que os seguidores de Istari usam.",
					states = {
						[1] = "Na grande masmorra subterranea dos Istaris, no corpo de uma falecida guerreira havia uma mochila. A mesma que os seguidores de Istari usam.",
					},
				},
				[91] = {
					name = "Ice Torog Weapon",
					storageId = Storage.Quest.U02_24.quest_ChestNumber91.Mission1,
					missionId = 91,
					startValue = 0,
					endValue = 1,
					description = "Um grande pedaço de gelo, pontiagudo e resistente, foi encontrado preso em um pilar na caverna dos Ice Torog. Este pedaço de gelo facilmente viraria uma arma. ",
					states = {
						[1] = "Um grande pedaço de gelo, pontiagudo e resistente, foi encontrado preso em um pilar na caverna dos Ice Torog. Este pedaço de gelo facilmente viraria uma arma.",
					},
				},
				[92] = {
					name = "The Song of Nimrais",
					storageId = Storage.Quest.U02_24.quest_ChestNumber92.Mission1,
					missionId = 92,
					startValue = 0,
					endValue = 1,
					description = "Esculpida em forma de nota musical, a cancao de Nimrais esta eternizada e presa dentro desta nota. Nem mesmo os maiores magos podem tira-la desta prisao.",
					states = {
						[1] = "Esculpida em forma de nota musical, a cancao de Nimrais esta eternizada e presa dentro desta nota. Nem mesmo os maiores magos podem tira-la desta prisao.",
					},
				},
				[93] = {
					name = "Scatha Crystalline",
					storageId = Storage.Quest.U02_24.quest_ChestNumber93.Mission1,
					missionId = 93,
					startValue = 0,
					endValue = 1,
					description = "Uma poderosa armadura feita de pequenas escamas de gelo do temido dragao Scatha. As escamas oferecem protecao ao frio de Nimrais.",
					states = {
						[1] = "Uma poderosa armadura feita de pequenas escamas de gelo do temido dragao Scatha. As escamas oferecem protecao ao frio de Nimrais.",
					},
				},
				[94] = {
					name = "A Frozen Tear",
					storageId = Storage.Quest.U02_24.quest_ChestNumber94.Mission1,
					missionId = 94,
					startValue = 0,
					endValue = 1,
					description = "As lagrimas do pequeno povo de Nimrais permaneceram congeladas por todos estes anos. Choraram em sua partida de Nimrais, quando souberam que nao seria mais possivel permanecer em Nimrais.",
					states = {
						[1] = "As lagrimas do pequeno povo de Nimrais permaneceram congeladas por todos estes anos. Choraram em sua partida de Nimrais, quando souberam que nao seria mais possivel permanecer em Nimrais.",
					},
				},
				[95] = {
					name = "The Witch Rod",
					storageId = Storage.Quest.U02_24.quest_ChestNumber95.Mission1,
					missionId = 95,
					startValue = 0,
					endValue = 1,
					description = "As bruxas de gelo que habitam o topo da montanha nos arredores de Minas Tirinth, guardavam uma poderosa varinha de gelo em um totem de caveiras em sua caverna.",
					states = {
						[1] = "As bruxas de gelo que habitam o topo da montanha nos arredores de Minas Tirinth, guardavam uma poderosa varinha de gelo em um totem de caveiras em sua caverna.",
					},
				},
				[96] = {
					name = "The Hobbit Treasure",
					storageId = Storage.Quest.U02_24.quest_ChestNumber96.Mission1,
					missionId = 96,
					startValue = 0,
					endValue = 1,
					description = "Uma pequena caverna nos arredores de Condado, escondia um escudo adquirido ilegalmente por algum Hobbit. Este escudo me parece ter pertencido a algum guerreiro de Bree.",
					states = {
						[1] = "Uma pequena caverna nos arredores de Condado, escondia um escudo adquirido ilegalmente por algum Hobbit. Este escudo me parece ter pertencido a algum guerreiro de Bree.",
					},
				},
				[97] = {
					name = "RaspBerry I",
					storageId = Storage.Quest.U02_24.quest_ChestNumber97.Mission1,
					missionId = 97,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[98] = {
					name = "A Raspberry For a Pie",
					storageId = Storage.Quest.U02_24.quest_ChestNumber98.Mission1,
					missionId = 98,
					startValue = 0,
					endValue = 1,
					description = "Os elfos do Oeste de Edoras sempre foram conhecidos por cultivarem as melhores framboesas. Elas concedem poderes magicos a quem as possue, infelizmente alguns individuos usam para fazer tortas.",
					states = {
						[1] = "Os elfos do Oeste de Edoras sempre foram conhecidos por cultivarem as melhores framboesas. Elas concedem poderes magicos a quem as possue, infelizmente alguns individuos usam para fazer tortas.",
					},
				},
				[99] = {
					name = "Honour For The Turtles",
					storageId = Storage.Quest.U02_24.quest_ChestNumber99.Mission1,
					missionId = 99,
					startValue = 0,
					endValue = 1,
					description = "Sob um ninho de tartarugas marinhas, econtrei este escudo de honra. Este escudo pertenceu a um knight poderoso, uma pena ter parado proximo a praia.",
					states = {
						[1] = "Sob um ninho de tartarugas marinhas, econtrei este escudo de honra. Este escudo pertenceu a um knight poderoso, uma pena ter parado proximo a praia.",
					},
				},
				[100] = {
					name = "A Minotaur Farmer",
					storageId = Storage.Quest.U02_24.quest_ChestNumber100.Mission1,
					missionId = 100,
					startValue = 0,
					endValue = 1,
					description = "Dentro de uma caverna nas proximidades de condado, havia um minotauro especialista em cultivar mamoeiros. No topo da arvore ao inves de um mamao, havia um Yellow Gem. Algum passaro deve ter colocado isto ai.",
					states = {
						[1] = "Dentro de uma caverna nas proximidades de condado, havia um minotauro especialista em cultivar mamoeiros. No topo da arvore ao inves de um mamao, havia um Yellow Gem. Algum passaro deve ter colocado isto ai.",
					},
				},
				[101] = {
					name = "A Ex Native Cloth",
					storageId = Storage.Quest.U02_24.quest_ChestNumber101.Mission1,
					missionId = 101,
					startValue = 0,
					endValue = 1,
					description = "Nas profundezas do acampamento dos canibais Dworcs, havia em um armario uma armadura de um povo nativo. Infelizmente, havia apenas sua roupa, seu corpo já não estava mais ai.",
					states = {
						[1] = "Nas profundezas do acampamento dos canibais Dworcs, havia em um armario uma armadura de um povo nativo. Infelizmente, havia apenas sua roupa, seu corpo já não estava mais ai.",
					},
				},
				[102] = {
					name = "A Forgotten Piece of Gold",
					storageId = Storage.Quest.U02_24.quest_ChestNumber102.Mission1,
					missionId = 102,
					startValue = 0,
					endValue = 1,
					description = "Uma pepita de ouro estava escondida sob uma poça de veneno, ao investigar os restos de um defiler a encontrei. Isto certamente vale algum dinheiro na cidade.",
					states = {
						[1] = "Uma pepita de ouro estava escondida sob uma poça de veneno, ao investigar os restos de um defiler a encontrei. Isto certamente vale algum dinheiro na cidade.",
					},
				},
				[103] = {
					name = "Azaka The Magic Dworc",
					storageId = Storage.Quest.U02_24.quest_ChestNumber103.Mission1,
					missionId = 103,
					startValue = 0,
					endValue = 1,
					description = "Sob o poder da pequena e poderosa Azaka, descansando logo acima de sua bola de cristal estava este chapeu magico. Apenas de vesti-lo ja me sinto muito mais poderoso.",
					states = {
						[1] = "Sob o poder da pequena e poderosa Azaka, descansando logo acima de sua bola de cristal estava este chapeu magico. Apenas de vesti-lo ja me sinto muito mais poderoso.",
					},
				},
				[104] = {
					name = "Divine Plate",
					storageId = Storage.Quest.U02_24.quest_ChestNumber104.Mission1,
					missionId = 104,
					startValue = 0,
					endValue = 1,
					description = "quest divine plate",
					states = {
						[1] = "quest divine plate",
					},
				},
				[105] = {
					name = "The Legolas Plate ", -- Avaliable para incluir outra quest.
					storageId = Storage.Quest.U02_24.quest_ChestNumber105.Mission1,
					missionId = 105,
					startValue = 0,
					endValue = 1,
					description = "quest Adicionada a Parte fora dos Baus.",
					states = {
						[1] = "Algo genérico",
					},
				},
				[106] = {
					name = "The Pharaoh Relic",
					storageId = Storage.Quest.U02_24.quest_ChestNumber106.Mission1,
					missionId = 106,
					startValue = 0,
					endValue = 1,
					description = "Uma estranha espada pertecente a algum farao estava cravada em um pilar. Seu local ja nao percentece mais ao Farao, mas sim a creaturas demoniacas que habitam o subsolo de Dunedain.",
					states = {
						[1] = "Uma estranha espada pertecente a algum farao estava cravada em um pilar. Seu local ja nao percentece mais ao Farao, mas sim a creaturas demoniacas que habitam o subsolo de Dunedain.",
					},
				},
				[107] = {
					name = "Divine Cuirass", -- Avaliable para incluir outra quest.
					storageId = Storage.Quest.U02_24.quest_ChestNumber107.Mission1,
					missionId = 107,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[108] = {
					name = "A High Lizard Lord",
					storageId = Storage.Quest.U02_24.quest_ChestNumber108.Mission1,
					missionId = 108,
					startValue = 0,
					endValue = 1,
					description = "O grande e poderoso Lord Lizard, conhecido por Azzazel,carrega nas profundezas de beleghost seu temido exercito. Em sua sala havia um manto divino, o qual exalava um intenso brilho.",
					states = {
						[1] = "O grande e poderoso Lord Lizard, conhecido por Azzazel,carrega nas profundezas de beleghost seu temido exercito. Em sua sala havia um manto divino, o qual exalava um intenso brilho.",
					},
				},
				[109] = {
					name = "A High Lizard Lord II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber109.Mission1,
					missionId = 109,
					startValue = 0,
					endValue = 1,
					description = "O cajado de algum mago divino estava junto ao manto, na sala do Azzazel. Nunca nenhum mago havia tentado enfrentar o temido Azzazel, agora sabemos o destino dele.",
					states = {
						[1] = "O cajado de algum mago divino estava junto ao manto, na sala do Azzazel. Nunca nenhum mago havia tentado enfrentar o temido Azzazel, agora sabemos o destino dele.",
					},
				},
				[110] = {
					name = "The Melkor Boots",
					storageId = Storage.Quest.U02_24.quest_ChestNumber110.Mission1,
					missionId = 110,
					startValue = 0,
					endValue = 1,
					description = "Melkor alem de habitar as profudenzas de Northern, tambem faz raras apariçoes nesta caverna. Acompanhado das medusas mais poderosas, se reune para planejar o mau. Em seu crystal guarda uma poderosa bota de escamas.",
					states = {
						[1] = "Melkor alem de habitar as profudenzas de Northern, tambem faz raras apariçoes para seus lacaios de terra. Acompanhado das medusas mais poderosas, se reune nesta caverna para planejar o mau.",
					},
				},
				[111] = {
					name = "The Glorious Blocker Ring",
					storageId = Storage.Quest.U02_24.quest_ChestNumber111.Mission1,
					missionId = 111,
					startValue = 0,
					endValue = 1,
					description = "Um anel poderoso, pertecente ao mais nobre Knight que ja pisou na Terra Media, ha boatos que apenas usando este anel seria possivel bloquear os mais duros e incriveis golpes fisicos.",
					states = {
						[1] = "Um anel poderoso, pertecente ao mais nobre Knight que ja pisou na Terra Media, ha boatos que apenas usando este anel seria possivel bloquear os mais duros e incriveis golpes fisicos.",
					},
				},
				[112] = {
					name = "Feed The Hive",
					storageId = Storage.Quest.U02_24.quest_ChestNumber112.Mission1,
					missionId = 112,
					startValue = 0,
					endValue = 1,
					description = "Um enigmatico trevo de quatro folhas estava dentro de um cogumelo. Os insetos desta colmeia se alimentam destes trevos. Quem sabe eu nao consiga convencer um inseto a tornar-se minha montaria?",
					states = {
						[1] = "Um enigmatico trevo de quatro folhas estava dentro de um cogumelo. Os insetos desta colmeia se alimentam destes trevos. Quem sabe eu nao consiga convencer um inseto a tornar-se minha montaria?",
					},
				},
				[113] = {
					name = "The Atlantida Giant Shrimp",
					storageId = Storage.Quest.U02_24.quest_ChestNumber113.Mission1,
					missionId = 113,
					startValue = 0,
					endValue = 1,
					description = "Um enorme camarao estava preso dentro de um bau nas profundezas de Atlantida. Os atlantis sao apreciadores destes camaroes, com toda certeza alguem guardou este para comer mais tarde.",
					states = {
						[1] = "Um enorme camarao estava preso dentro de um bau nas profundezas de Atlantida. Os atlantis sao apreciadores destes camaroes, com toda certeza alguem guardou este para comer mais tarde.",
					},
				},
				[114] = {
					name = "The Lost Dark Mage Village",
					storageId = Storage.Quest.U02_24.quest_ChestNumber114.Mission1,
					missionId = 114,
					startValue = 0,
					endValue = 1,
					description = "Nesta vila ha diversos magos e feiticeiros do mais alto poder, conseguindo ate mesmo evocar criaturas flamejantes enormes. No alto da sua maior torre sob a guarda de magos estava este escudo da tempestade.",
					states = {
						[1] = "Nesta vila ha diversos magos e feiticeiros do mais alto poder, conseguindo ate mesmo evocar criaturas flamejantes enormes. No alto da sua maior torre sob a guarda de magos estava este escudo da tempestade.",
					},
				},
				[115] = {
					name = "The Lost Dark Mage Village II",
					storageId = Storage.Quest.U02_24.quest_ChestNumber115.Mission1,
					missionId = 115,
					startValue = 0,
					endValue = 1,
					description = "Havia uma boa explicaçao para os fortes magos estarem protegendo a torre, pois havia em seus baús, além de um escudo poderoso também havia este colar. Dizem fornecer uma protecao incrivel.",
					states = {
						[1] = "Havia uma boa explicaçao para os fortes magos estarem protegendo a torre, pois havia em seus baús, além de um escudo poderoso também havia este colar. Dizem fornecer uma protecao incrivel.",
					},
				},
				[116] = {
					name = "spirit shovel",
					storageId = Storage.Quest.U02_24.quest_ChestNumber116.Mission1,
					missionId = 116,
					startValue = 0,
					endValue = 1,
					description = "Necessario criar ainda",
					states = {
						[1] = "Necessario criar ainda",
					},
				},
				[117] = {
					name = "The Sailor Warrior",
					storageId = Storage.Quest.U02_24.quest_ChestNumber117.Mission1,
					missionId = 117,
					startValue = 0,
					endValue = 1,
					description = "Adentro do navio pirata ancorado na praia de ashenport, havia um pirata que possuia seu sonho de ser guerreiro. Guardava na cabine do capitao um machado de herança de seu pai.",
					states = {
						[1] = "Adentro do navio pirata ancorado na praia de ashenport, havia um pirata que possuia seu sonho de ser guerreiro. Guardava na cabine do capitao um machado de herança de seu pai.",
					},
				},
				[118] = {
					name = "Royal Draken", --- Avaliable para uso em outra quest.
					storageId = Storage.Quest.U02_24.quest_ChestNumber118.Mission1,
					missionId = 118,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[119] = {
					name = "Royal Draken Mail", --- Avaliable para uso em outra quest.
					storageId = Storage.Quest.U02_24.quest_ChestNumber119.Mission1,
					missionId = 119,
					startValue = 0,
					endValue = 1,
					description = "Algo genérico",
					states = {
						[1] = "Algo genérico",
					},
				},
				[120] = {
					name = "A Tiny Part Of an Antique Helmet VII",
					storageId = Storage.Quest.U02_24.quest_ChestNumber120.Mission1,
					missionId = 120,
					startValue = 0,
					endValue = 1,
					description = "No meio de animais despreziveis como tarantulas, aranhas gigantes e centopeias, havia um pequeno pedaço para completar o Helmet Of The Ancients.",
					states = {
						[1] = "No meio de animais despreziveis como tarantulas, aranhas gigantes e centopeias, havia um pequeno pedaço para completar o Helmet Of The Ancients.",
					},
				},
				[121] = {
					name = "Rock, Steel and Mancubos",
					storageId = Storage.Quest.U02_24.quest_ChestNumber121.Mission1,
					missionId = 121,
					startValue = 0,
					endValue = 1,
					description = "Nos mais profundos confins de Anfallas, isolados ao norte da cidade, convivem demonios, maquinas, e ciclops unidos. Um demonio em formato de maquina, Terminator, guardava esta Zenit Cuirass.",
					states = {
						[1] = "Nos mais profundos confins de Anfallas, isolados ao norte da cidade, convivem demonios, maquinas, e ciclops unidos. Um demonio em formato de maquina, Terminator, guardava esta Zenit Cuirass.",
					},
				},

			}
		},
		
		[5] = {
			name = "The Northern Challenge",
			startStorageId = Storage.Quest.U01_24.Northern.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "Facing The Melkor Summon",
					storageId = Storage.Quest.U01_24.Northern.FacingTheMelkorSummons,
					missionId = 1,
					startValue = 1,
					endValue = 1,
					description = "A grande fortaleza de Northern guardava incriveis tesouros em seu interior. No entanto, lutar face a face com o poderoso Melkor Summon foi desafiador. A Sorte estava ao meu lado.",
					states = {
						[1] = "A grande fortaleza de Northern guardava incriveis tesouros em seu interior. No entanto, lutar face a face com o poderoso Melkor Summon foi desafiador. A Sorte estava ao meu lado.",
					},
				},
			},
		},
		[6] = {
			name = "The True Lord of Drakens",
			startStorageId = Storage.Quest.U01_24.Drakens.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "Imprisioned In A Nightmare",
					storageId = Storage.Quest.U01_24.Drakens.ImprisionedInANightmare,
					missionId = 1,
					startValue = 1,
					endValue = 1,
					description = "Uma grande luta contra o evancing foi o que custou obter estas armaduras. A vivida imagem de estar preso em um pesadelo ainda me assombra. Jamais voltarei a perturbar o Evancing.",
					states = {
						[1] = "Uma grande luta contra o evancing foi o que custou obter estas armaduras. A vivida imagem de estar preso em um pesadelo ainda me assombra. Jamais voltarei a perturbar o Evancing.",
					},
				},
			},
		},
		[7] = {
			name = "The Zamulosh DarkMagic",
			startStorageId = Storage.Quest.U01_24.Zamulosh.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "In a Fight Against The Madness",
					storageId = Storage.Quest.U01_24.Zamulosh.InaFightAgainstTheMadness,
					missionId = 1,
					startValue = 1,
					endValue = 1,
					description = "Preso em uma luta mortal! Lutando contra Zamulosh e contra sua magia negra, a qual tentava dominar meus pensamentos. Sua magia tentava me induzir a derrota...",
					states = {
						[1] = "Preso em uma luta mortal! Lutando contra Zamulosh e contra sua magia negra, a qual tentava dominar meus pensamentos. Sua magia tentava me induzir a derrota...",
					},
				},
			},
		},
		[8] = {
			name = "The Void",
			startStorageId = Storage.Quest.U01_24.TheVoid.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "In a Fight With Too Much Energy",
					storageId = Storage.Quest.U01_24.TheVoid.InaFightWithTooMuchEnergy,
					missionId = 1,
					startValue = 1,
					endValue = 1,
					description = "Uma luta intensa e dificil contra estes demonios eletricos. Lutar contra quatro poderos monstros me fazem pensar se terei uma recompensa digna...",
					states = {
						[1] = "Uma luta intensa e dificil contra estes demonios eletricos. Lutar contra quatro poderos monstros me fazem pensar se terei uma recompensa digna...",
					},
				},
			},
		},
		[9] = {
			name = "The Inquisition",
			startStorageId = Storage.Quest.U01_24.Inquisition.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "In Search For The Vampire Lord",
					storageId = Storage.Quest.U01_24.Inquisition.TheInquisition,
					missionId = 1,
					startValue = 0,
					endValue = 5,
					states = {
						[1] = "Henricus nos relatou sobre um antigo vampiro que assola os moradores de Dunedain. Principalmente os que arriscam-se em seguir ao sul. Nas noites mais sobrias ele os ataca...",
						[2] = "Devo voltar ao Henricus e reportar o que acabei de descobrir. Uma pobre moca chamada Amelie parece ter sido vitima do vampiro.",
						[3] = "Como o inquisitor devo buscar ajuda de um antigo amigo de henricus, Van Helsing, e um cacador de vampiros e outros monstros, ele deve se encontrar proximo a bree.",
						[4] = "Van Helsing, um antigo amigo de Henricus nos vendeu um kit para matarmos o vampiro. Devemos agora buscar pelo vampiro com nosso kit!",
						[5] = "Execucao feita! Isto deve bastar para dar um fim a este vampiro, e tambem garantir que nao havera mais ataques... Devo voltar a Henricus para reportar nossa missao.",
					},
				},
				[2] = {
					name = "For the Faith of God",
					storageId = Storage.Quest.U01_24.Inquisition.SecondInquisition,
					missionId = 2,
					startValue = 0,
					endValue = 4,
					states = {
						[1] = "Henricus me comentou que existe um padre que foi durante muito tempo O Inquisitor, ele cacava o mal em suas formas mais malignas. Hoje esta aposentado, na fortaleza dos Falcons.",
						[2] = "Lawrence ira me formar para ser o proximo Inquisitor, mas e necessario ajuda-lo primeiro. A ajuda consiste em matar um dragao especifico, preso na fortaleza dos falcons.",
						[3] = "A historia que Lawrence me contou foi que ha muitos destes Vampiros, assim como o Lord Dunedain... Preciso provar que sou capaz, para isto devo retornar 16 Vampire Lord Tokens. Em caso de duvidas, devo buscar pelo Henricus",
						[4] = "Com a bencao de Lawrence, agora sou o Inquisitor. Com isso, posso combater o mal, diretamente em seu local de maior concentracao... A Inquisition!.",
					},
				},
				[3] = {
					name = "The Dark Path",
					storageId = Storage.Quest.U01_24.Inquisition.TheDarkPath,
					missionId = 3,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "Logo acima do hall a uma escada para um caminho sombrio, certamente este e o caminho inicial para a primeira missao...",
						[2] = "Ushuriel um demonio protegido por centenas de olhos foi derrotado... Sua morte me garantiu o poder de avancar um novo caminho na inquisicao.",
					},
				},
				[4] = {
					name = "The Crystal Caves",
					storageId = Storage.Quest.U01_24.Inquisition.TheCrystalCaves,
					missionId = 4,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "O frio me espera no proximo desafio... Havera caminhos que me tornarao louco. Ser mergulhador parece ser um pre requisito...",
						[2] = "Nosso caminho para a vitoria foi mais complicado que a luta contra Zugurosh. O demonio dito impossivel morreu, mesmo com a ajuda de suas estatuas salvadoras.",
					},
				},
				[5] = {
					name = "The Blood Halls",
					storageId = Storage.Quest.U01_24.Inquisition.TheBloodHalls,
					missionId = 5,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "Uma grande orda de monstros mortos-vivos protegem o caminho de Madareth. Ainda teremos que passar pela fundicao, local onde produzem suas armas mais mortais.",
						[2] = "Madareth nao conteve-se e tentou me executar. Nao foi facil vencer esta batalha, mas tornei este demonio em po... Do po viemos e ao po...",
					},
				},
				[6] = {
					name = "The Vats",
					storageId = Storage.Quest.U01_24.Inquisition.TheVats,
					missionId = 6,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "Nosso objetivo sera executar ambos os demonios que moram nestes caminhos. Sera um grande desafio, pois me parece ser dois irmaos.",
						[2] = "Nunca duvide do poder do Inquisitor. Destrui ambos os demonios, agora eles moram em um local pior... Assim acredito!",
					},
				},
				[7] = {
					name = "The Arcanum",
					storageId = Storage.Quest.U01_24.Inquisition.TheArcanum,
					missionId = 7,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "O caminho com a maior quantidade de criaturas magicas. Devo tomar cuidado para nao cair em seus feitiços e falecer durante a jornada.",
						[2] = "A luta pela inquisicao busca trazer apenas a verdade. Annihilion recusou-se relevar seus segredos perante ao inquisitor. Seu fim chegou...",
					},
				},
				[8] = {
					name = "The Hive",
					storageId = Storage.Quest.U01_24.Inquisition.TheHive,
					missionId = 8,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "A colmeia, este seria o nome deste local, soube que trata-se de uma cratera imensa, com diversos niveis. Seus monstros tem sua propria hierarquia e organizacao.",
						[2] = "Uma cratera cheia de creaturas despreziveis, houve momentos que pensei que jamais conseguiria escalar ate o final desta cratera. Hellgorak certamente era a pior criatura entre eles. Minha fe jamais sera abalada por este demonio.",
					},
				},
				[9] = {
					name = "The Shadow Nexus",
					storageId = Storage.Quest.U01_24.Inquisition.ShadowNexus,
					missionId = 9,
					startValue = 0,
					endValue = 2,
					states = {
						[1] = "A recompensa por um grande trabalho sempre sera mais trabalho...Preciso destruir o nexus e vencer estes demonios de uma vez por todas. Caso eu me perca, posso voltar ao nexus matando novamente o Hellgorak.",
						[2] = "A destruicao do Nexus representa uma vitoria para nos Inquisitores. A verdade sempre prevalecera, e o mal deve se curvar aos Inquisitores. Devo retornar a Henricus para contar lhe as novidades.",
					},
				},
			},
		},
		[10] = {
			name = "The Saruman Treasure",
			startStorageId = Storage.Quest.U01_24.TheSarumanTreasure.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "A Legendary Reward",
					storageId = Storage.Quest.U01_24.TheSarumanTreasure.ALegendaryReward,
					missionId = 1,
					startValue = 0,
					endValue = 1,
					description = "Saruman mostrou seu verdadeiro poder contra nos. A vitoria parecia impossivel e improvavel. Sua derrota nao apenas livrou a terra media contra seu terrivel poder, mas tambem nos garantiu recompensas unicas.",
					states = {
						[1] = "Saruman mostrou seu verdadeiro poder contra nos. A vitoria parecia impossivel e improvavel. Sua derrota nao apenas livrou a terra media contra seu terrivel poder, mas tambem nos garantiu recompensas unicas.",
					},
				},
			},
		},
		[11] = {
			name = "The Alchemist Quest",
			startStorageId = Storage.Quest.U01_24.TheAlchemistQuest.QuestLine,
			startStorageValue = 1,
			missions = {
				[1] = {
					name = "The Inicial Magic",
					storageId = Storage.Quest.U01_24.TheAlchemistQuest.TheInitialMagic,
					missionId = 1,
					startValue = 0,
					endValue = 6,
					states = {
						[1] = "Encontrei uma feiticeira na entrada de Dol Guldur, ela me convenceu a ajudar em uma pocao magica para transformar seus inimigos em ratos. Devo buscar por mais informacoes no purgatorio.",
						[2] = "TrailBlazer o grande alquimista que reside no purgatorio nos ajudara na missao, no entanto, preciso buscar os itens necessarios para preparar a pocao.",
						[3] = "O alquimista preparou nossa pocao, devo retornar a pocao ate a feiticeira para receber um novo direcional.",
						[4] = "Devo buscar informacoes de como entrar na torre do alquimista, talvez procurar uma entrada escondida.",
						[5] = "Este buraco na parede me deu uma ideia, devo utilizar a pocao para me transformar em rato e adentrar na torre do alquimista.",
						[6] = "Toda vez que eu necessitar adentrar na torre, posso me rastejar por este buraco. Nao necessito mais da pocao para entrar na torre.",
					},
				},
				
				[2] = {
					name = "A Trip To An Strange World",
					storageId = Storage.Quest.U01_24.TheAlchemistQuest.ATripToAnStrangeWorld,
					missionId = 1,
					startValue = 0,
					endValue = 5,
					states = {
						[1] = "O mago Trailbone, morador do quinto andar da torre, possui um armario completamente estranho...Sua porta brilha e feixes de luz saem por ela, devo investigar o que ha de especial no armario.",
						[2] = "Estou ligado a um novo mundo, acessado diretamente pelo armario de trailbone, devo investigar um labirinto e entender o que ha alem do teleporte.",
						[3] = "Devo me preparar para a batalha contra o poderoso Minus, guardiao do labirinto. Ao derrota-lo poderei voltar a Trailbone.",
						[4] = "Eliminei o grande Minus! Devo encontrar o mago Trailbone e contar meu grande feito!",
						[5] = "Trailbone me recompensou com pontos de experiencia, e agora me permitiu avancar para a proxima missao para tornar-se um alquimista.",
					},
				},
				
				[3] = {
					name = "To Become Alchemist",
					storageId = Storage.Quest.U01_24.TheAlchemistQuest.ToBecomeAlchemist,
					missionId = 1,
					startValue = 0,
					endValue = 5,
					states = {
						[1] = "Trailglacier relevou que tornou-se um alquimista apos seu mestre desaparecer em uma expedicao ate beleghost. Ele buscava conectar-se e conhecer mais sobre o elemento terra.",
						[2] = "Encontrei um acampamento ao norte de Beleghost, me parece que eles enfrentaram uma emboscada enquanto dormiam... Todos estao mortos. Devo seguir no caminho a esquerda para buscar mais pistas.",
						[3] = "Abaixo da superficie encontrei esta sociedade de demonios do elemento terra. Me parece que estes que foram os responsaveis pelo desaparecimento do mestre de Trailglacier. Devo investigar ao norte da caverna.",
						[4] = "Eliminei o espirito da natureza que mantinha essas criaturas sob seu dominio. Essas criaturas agora estao livres para viver sem a tirania deste espirito que as convencia a atacar os humanos. Devo retornar ao Trailglacier.",
						[5] = "Trailglacier ficou triste ao saber do destino cruel de seu mestre, porem aliviado agora em saber a verdade. Trailglacier deve tornar-se o proximo grande alquimista.",
					},
				},
			},
		},
	}
end
