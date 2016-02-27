-- JFD_NriDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Nri Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_HasRiverCity
------------------------------------------------------------------------------------------------------------------------
function JFD_HasRiverCity(playerID)
	local player = Players[playerID]
	local hasRiverCity = false
	for city in player:Cities() do
		if city:CountNumRiverPlots() > 0 then
			hasRiverCity = true
			break
		end
	end
	
	return hasRiverCity
end 
------------------------------------------------------------------------------------------------------------------------
-- JFD_IsAtPeace
--------------------------------------------------------------------------------------------------------------------------
function JFD_AtPeace(playerID)
	local atPeace = false
	if Teams[Players[playerID]:GetTeam()]:GetAtWarCount(true) == 0 then atPeace = true end

	return atPeace
end
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_JFD_NRI"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Nri: Journey to the Anambra River
-------------------------------------------------------------------------------------------------------------------------
local Decisions_AnambraRiver = {}
	Decisions_AnambraRiver.Name = "TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER"
	Decisions_AnambraRiver.Desc = "TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_DESC"
	HookDecisionCivilizationIcon(Decisions_AnambraRiver, "CIVILIZATION_JFD_NRI")
	Decisions_AnambraRiver.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		local eraID = load(player, "Decisions_AnambraRiver")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_AnambraRiver", nil)
			else
				Decisions_AnambraRiver.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local faithCost = mathCeil(180 * iMod)
		local goldenAgeReward = mathCeil(3 * iGAMod)
		Decisions_AnambraRiver.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_ANAMBRA_RIVER_DESC", faithCost, goldenAgeReward)
		
		local playerID = player:GetID()
		if (not JFD_AtPeace(playerID))				then return true, false end
		if (not JFD_HasRiverCity(playerID))			then return true, false end
		if player:GetFaith() < faithCost 			then return true, false end
		if player:GetReligionCreatedByPlayer() <= 0	then return true, false end

		return true, true
	end
	)
	
	Decisions_AnambraRiver.DoFunc = (
	function(player)
		local faithCost = mathCeil(180 * iMod)
		local goldenAgeReward = mathCeil(3 * iGAMod)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, 1)
		player:ChangeGoldenAgeTurns(goldenAgeReward)
		save(player, "Decisions_AnambraRiver", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AnambraRiver", Decisions_AnambraRiver)
-------------------------------------------------------------------------------------------------------------------------
-- Nri: Sanctify the Ìkénga
-------------------------------------------------------------------------------------------------------------------------
local Decisions_SanctifyIkenga = {}
	Decisions_SanctifyIkenga.Name = "TXT_KEY_DECISIONS_JFD_NRI_IKENGA"
	Decisions_SanctifyIkenga.Desc = "TXT_KEY_DECISIONS_JFD_NRI_IKENGA_DESC"
	HookDecisionCivilizationIcon(Decisions_SanctifyIkenga, "CIVILIZATION_JFD_NRI")
	Decisions_SanctifyIkenga.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end

		if load(player, "Decisions_SanctifyIkenga") == true then
			Decisions_SanctifyIkenga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_IKENGA_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_SanctifyIkenga.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_NRI_IKENGA_DESC")
		if player:GetReligionCreatedByPlayer() <= 0					then return true, false end
		if (not JFD_AtPeace(player:GetID()))						then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end

		return true, true
	end
	)
	
	Decisions_SanctifyIkenga.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		save(player, "Decisions_SanctifyIkenga", true)
	end
	)
	
	Decisions_SanctifyIkenga.Monitors = {}
	Decisions_SanctifyIkenga.Monitors[GameEvents.CityConstructed] =  (
	function(playerID, cityID, buildingID, withGold, withFaithorCulture)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationID then return end
		if load(player, "Decisions_SanctifyIkenga") == true then
			local city = player:GetCityByID(cityID)
			local buildingData = GameInfo.Buildings[buildingID]
			local buildingCost = city:GetBuildingPurchaseCost(buildingID)
			local buildingName = buildingData.Description
			if withGold then
				local reward = (buildingCost * 20/100)
				player:ChangeFaith(reward)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PEACE] Faith from a {2_BuildingName} purchased in {3_CityName}", reward, buildingName, city:GetName())) 
				end
			elseif withFaithorCulture then
				local buildingCost = buildingData.FaithCost
				local reward = (buildingCost * 20/100)
				player:ChangeGold(reward)
				if player:IsHuman() then
					Events.GameplayAlertMessage(Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLD] Gold from a {2_BuildingName} purchased in {3_CityName}", reward, buildingName, city:GetName())) 
				end
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilisationID, "Decisions_SanctifyIkenga", Decisions_SanctifyIkenga)
--=======================================================================================================================
--=======================================================================================================================
