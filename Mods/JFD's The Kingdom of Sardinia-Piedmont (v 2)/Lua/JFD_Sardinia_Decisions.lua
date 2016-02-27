-- JFD_Sardinia_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Sardinia-Piedmont Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetNumAnnexedCityStates
function JFD_GetNumAnnexedCityStates(playerID)
	local player = Players[playerID]
	local numAnnexedCS = 0
	for city in player:Cities() do
		if Players[city:GetOriginalOwner()]:IsMinorCiv() then
			numAnnexedCS = numAnnexedCS + 1		
		end
	end
	return numAnnexedCS
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
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SARDINIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local mathCeil = math.ceil
local mathMin = math.min
-------------------------------------------------------------------------------------------------------------------------
-- Sardinia-Piedmont: Form Italian Nation
-------------------------------------------------------------------------------------------------------------------------
local policyItalyID = GameInfoTypes["POLICY_DECISIONS_JFD_ITALY"]
local Decisions_Sardinia_Italy = {}
	Decisions_Sardinia_Italy.Name = "TXT_KEY_DECISIONS_JFD_SARDINIA_FORM_ITALY"
	Decisions_Sardinia_Italy.Desc = "TXT_KEY_DECISIONS_JFD_SARDINIA_FORM_ITALY_DESC"
	HookDecisionCivilizationIcon(Decisions_Sardinia_Italy, "CIVILIZATION_JFD_SARDINIA")
	Decisions_Sardinia_Italy.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyItalyID) then
			Decisions_Sardinia_Italy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SARDINIA_FORM_ITALY_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil(600*iMod)
		Decisions_Sardinia_Italy.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SARDINIA_FORM_ITALY_DESC", cultureCost)
		if player:GetJONSCulture() < cultureCost then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if JFD_GetNumAnnexedCityStates(player:GetID()) < 4 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		return true, true
	end
	)
	
	Decisions_Sardinia_Italy.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local cultureCost = mathCeil(600*iMod)
		player:ChangeJONSCulture(cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyItalyID, true)
		player:ChangeGoldenAgeTurns(12)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_JFD_ITALY_SARDINIA_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_JFD_ITALY_SARDINIA_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_JFD_ITALY_SARDINIA_ADJECTIVE")
		for city in player:Cities() do
			if Players[city:GetOriginalOwner()]:IsMinorCiv() then
				local plot = Map.GetPlot(city:GetX(), city:GetY())
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					if (not loopPlot:IsCity()) then
						loopPlot:SetOwner(playerID, city:GetID(), true, true)
						loopPlot:SetRevealed(Teams[player:GetTeam()], true)	
					end
				end
			end
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_SARDINIA_FORM_ITALY", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_Sardinia_Italy", Decisions_Sardinia_Italy)
-------------------------------------------------------------------------------------------------------------------------
-- Sardinia-Piedmont: Establish Royal Vineyard
-------------------------------------------------------------------------------------------------------------------------
local buildingRoyalVineyardID = GameInfoTypes["BUILDING_DECISIONS_JFD_ROYAL_VINEYARD"]
local buildingRoyalVineyardHappinessID = GameInfoTypes["BUILDING_DECISIONS_JFD_ROYAL_VINEYARD_HAPPINESS"]
local resourceWineID = GameInfoTypes["RESOURCE_WINE"]
local Decisions_Sardinia_Vineyard = {}
	Decisions_Sardinia_Vineyard.Name = "TXT_KEY_DECISIONS_JFD_SARDINIA_ROYAL_VINEYARD"
	Decisions_Sardinia_Vineyard.Desc = "TXT_KEY_DECISIONS_JFD_SARDINIA_ROYAL_VINEYARD_DESC"
	Decisions_Sardinia_Vineyard.Pedia = "TXT_KEY_BUILDING_DECISIONS_JFD_ROYAL_VINEYARD"
	HookDecisionCivilizationIcon(Decisions_Sardinia_Vineyard, "CIVILIZATION_JFD_SARDINIA")
	Decisions_Sardinia_Vineyard.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if load(player, "Decisions_Sardinia_Vineyard") == true then
			Decisions_Sardinia_Vineyard.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SARDINIA_ROYAL_VINEYARD_ENACTED_DESC")
			return false, false, true
		end
		local goldCost = mathCeil(1000*iMod)
		Decisions_Sardinia_Vineyard.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_SARDINIA_ROYAL_VINEYARD_DESC", goldCost)
		if player:GetNumResourceAvailable(resourceWineID, true) == 0 then return true, false end
		if player:GetCurrentEra() < eraRenaissanceID then return true, false end
		if player:GetGold() < goldCost	then return true, false end
		return true, true
	end
	)
	
	Decisions_Sardinia_Vineyard.DoFunc = (
	function(player)
		local goldCost = mathCeil(1000 * iMod)
		player:ChangeGold(-goldCost)
		if player:IsHuman() then
			LuaEvents.JFD_Sardinia_ShowVineyardPopup()
		else
			local capital = player:GetCapitalCity()
			capital:SetNumRealBuilding(buildingRoyalVineyardID, 1)
			capital:SetNumRealBuilding(buildingRoyalVineyardHappinessID, mathMin(5, player:GetNumResourceAvailable(resourceWineID, true)))
			JFD_SendWorldEvent(Game.GetActivePlayer(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_SARDINIA_ROYAL_VINEYARD", player:GetName(), player:GetCivilizationShortDescription(), capital:GetName()))
		end
		save(player, "Decisions_Sardinia_Vineyard", true)
	end
	)

	Decisions_Sardinia_Vineyard.Monitors = {}
	Decisions_Sardinia_Vineyard.Monitors[GameEvents.PlayerDoTurn] =  (
	function(playerID)
		local player = Players[playerID]
		if load(player, "Decisions_Sardinia_Vineyard") == true then
			for city in player:Cities() do	
				if city:IsHasBuilding(buildingRoyalVineyardID) then
					city:SetNumRealBuilding(buildingRoyalVineyardHappinessID, mathMin(5, player:GetNumResourceAvailable(resourceWineID, true)))
				end
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_Sardinia_Vineyard", Decisions_Sardinia_Vineyard)
--=======================================================================================================================
--=======================================================================================================================
