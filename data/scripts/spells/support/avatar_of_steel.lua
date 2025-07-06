local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
	if not creature or not creature:isPlayer() then
		return false
	end
	
	local grade = creature:revelationStageWOD("Avatar of Steel")
	if grade == 0 then
		creature:sendCancelMessage("You cannot cast this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	-- Tabela com os lookTypes baseados no vocation ID
	local vocationOutfits = {
		[10] = 1593, -- Vocation ID 10 usa lookType 1593
		[20] = 1716, -- Vocation ID 20 usa lookType 1716
		[24] = 1224  -- Vocation ID 24 usa lookType 1224
	}
	
	-- Pega o vocation ID do jogador
	local vocationId = creature:getVocation():getId()
	
	-- Verifica se existe um lookType para essa vocação
	local lookType = vocationOutfits[vocationId]
	if not lookType then
		creature:sendCancelMessage("Your vocation cannot use this spell")
		creature:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	end
	
	-- Cria a condição com o lookType específico da vocação
	local condition = Condition(CONDITION_OUTFIT)
	condition:setOutfit({ lookType = lookType })
	
	local duration = 15000
	condition:setTicks(duration)
	creature:getPosition():sendMagicEffect(CONST_ME_AVATAR_APPEAR)
	creature:addCondition(condition)
	creature:avatarTimer((os.time() * 1000) + duration)
	creature:reloadData()
	addEvent(ReloadDataEvent, duration, creature:getId())
	return true
end

spell:group("support")
spell:id(264)
spell:name("Avatar of Steel")
spell:words("uteta res eq")
spell:level(300)
spell:mana(800)
spell:isPremium(true)
spell:cooldown(1000) -- Default cooldown = 2 hours
spell:groupCooldown(2 * 60 * 60 * 1000)
spell:vocation("chaos knight;true", "artisan weaponsmith;true", "barbarian warmonger;true")
spell:hasParams(true)
spell:isAggressive(false)
spell:needLearn(true)
spell:register()