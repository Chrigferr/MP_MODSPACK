-- JFD_Muscovy_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Muscovy Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumConqueredCapitals
function JFD_GetNumConqueredCapitals(playerID)
	local numCapitals = 0
	for city in Players[playerID]:Cities() do
		if (city:GetOriginalOwner() ~= playerID and city:IsOriginalCapital()) then
			numCapitals = numCapitals + 1
		end
	end
	return numCapitals
end

-- JFD_GetNumConqueredCities
function JFD_GetNumConqueredCities(playerID)
	local numCities = 0
	for city in Players[playerID]:Cities() do
		if city:GetOriginalOwner() ~= playerID then
			numCities = numCities + 1
		end
	end
	return numCities
end

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerTeam 	= Teams[Game.GetActiveTeam()]
local civilisationID 	= GameInfoTypes["CIVILIZATION_JFD_MUSCOVY"]
local eraRenaissanceID  = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil 			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Muscovy: Found the Russian Tsardom
-------------------------------------------------------------------------------------------------------------------------
local buildingStBasilsID = GameInfoTypes["BUILDING_DECISIONS_JFD_ST_BASILS"]
local policyRussiaID = GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA"]
local Decisions_JFD_Muscovy_Russia = {}
	Decisions_JFD_Muscovy_Russia.Name = "TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIA"
	Decisions_JFD_Muscovy_Russia.Desc = "TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIA_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_Muscovy_Russia, "CIVILIZATION_JFD_MUSCOVY")
	Decisions_JFD_Muscovy_Russia.Pedia = "TXT_KEY_DECISIONS_BUILDING_JFD_ST_BASILS"
	Decisions_JFD_Muscovy_Russia.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if player:HasPolicy(policyRussiaID) then
			Decisions_JFD_Muscovy_Russia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIA_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil(400*iMod)
		local faithCost = mathCeil(500*iMod)
		Decisions_JFD_Muscovy_Russia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_MUSCOVY_RUSSIA_DESC", cultureCost, faithCost)
		local playerID = player:GetID()
		if (JFD_GetNumConqueredCapitals(playerID) < 4 and JFD_GetNumConqueredCities(playerID) < 7) then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetFaith() < faithCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_Muscovy_Russia.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(400*iMod)
		local faithCost = mathCeil(500*iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGoldenAgeTurns(12*iGAMod)
		player:GetCapitalCity():SetNumRealBuilding(buildingStBasilsID, 1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRussiaID, true)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_RUSSIA_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_RUSSIA_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_RUSSIA_ADJECTIVE")
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MUSCOVY_RUSSIA", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_JFD_Muscovy_Russia", Decisions_JFD_Muscovy_Russia)
--------------------------------------------------------------------------------------------------------------------------
-- Muscovy: Unleash the Oprichniki (City-Based)
--------------------------------------------------------------------------------------------------------------------------
tDecisions.Decisions_RussiaOprichnina = nil
local Decisions_RussiaOprichnina = {}
	Decisions_RussiaOprichnina.Name = "TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA"
	Decisions_RussiaOprichnina.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC"
	Decisions_RussiaOprichnina.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return end
		if pPlayer:GetCurrentEra() > GameInfoTypes.ERA_MODERN then return end
		
		--Generate Decisions
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE) or pCity:IsCapital() then
				local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
				local sName = pCity:GetName()
				
				tTempDecisions[sKey] = {}
				tTempDecisions[sKey].Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA", sName)
				tTempDecisions[sKey].Desc = "TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC"
				tTempDecisions[sKey].Data1 = pCity
				tTempDecisions[sKey].Weight = 0
				tTempDecisions[sKey].Type = "Civilization"
				HookDecisionCivilizationIcon(tTempDecisions[sKey], "CIVILIZATION_JFD_MUSCOVY")
				tTempDecisions[sKey].CanFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
					local sName = pCity:GetName()
					local iPop = pCity:GetPopulation()
					local iReward = math.ceil(iPop * 30 * iMod)
					
					if load(pPlayer, sKey) == true then
						if pCity:IsCapital() then
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_ENACTED_DESC", sName) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_NOTE")
						else
							tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_ENACTED_DESC", sName)
						end
						return false, false, true
					end
					
					if pCity:IsCapital() then
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC", sName, iReward) .. Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_NOTE")
					else
						tTempDecisions[sKey].Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIAOPRICHNINA_DESC", sName, iReward)
					end
					if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
					if not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_CONSTABLE)) then return true, false end
					return true, true
				end
				)
				
				tTempDecisions[sKey].DoFunc = (
				function(pPlayer, pCity)
				
					local sKey = "Decisions_RussiaOprichnina" .. CompileCityID(pCity)
					local iPop = pCity:GetPopulation()
					local iReward = math.ceil(iPop * 30 * iMod)
					
					pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
					pPlayer:ChangeGold(iReward)
					pPlayer:ChangeJONSCulture(iReward)
					
					save(pPlayer, sKey, true)
				end
				)
				
			end
		end
		
		--End Generation
		return
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_RussiaOprichnina", Decisions_RussiaOprichnina)
--=======================================================================================================================
--=======================================================================================================================
