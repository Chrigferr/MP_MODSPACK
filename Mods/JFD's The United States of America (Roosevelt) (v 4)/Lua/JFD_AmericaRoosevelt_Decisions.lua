-- JFD_AmericaRooseveltDecisions
-- Author: JFD
--=======================================================================================================================
print("JFD's United States (Roosevelt) Decisions: loaded")
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("NewSaveUtils.lua"); MY_MOD_NAME = "JFD_AmericaRoosevelt";
--==========================================================================================================================
-- MapModData
--==========================================================================================================================
local MapModData		= MapModData
MapModData.g_Properties	= MapModData.g_Properties or {}
g_Properties			= MapModData.g_Properties;
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetNumFriends
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetNumFriends(playerID)	
	local player = Players[playerID]
	local numFriends = 0
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local otherPlayer = Players[iPlayer]
		if (otherPlayer:IsAlive() and otherPlayer ~= player) then
			if Teams[player:GetTeam()]:IsHasMet(otherPlayer:GetTeam()) then
				if otherPlayer:IsDoF(playerID) then
					numFriends = numFriends + 1
				end
			end
		end
	end

	return numFriends
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsActivePlayer()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_AMERICA_ROOSEVELT"]
local mathCeil			= math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- America (Roosevelt): Declare America the Arsenal of Democracy
-------------------------------------------------------------------------------------------------------------------------
local buildingAssemblyPlantID		= GameInfoTypes["BUILDING_JFD_ARMS_FACTORY"]
local policyArsenalOfDemocracyID	= GameInfoTypes["POLICY_JFD_ARSENAL_OF_DEMOCRACY"]
local techIndustrialisationID		= GameInfoTypes["TECH_INDUSTRIALIZATION"]

local Decisions_AssemblyLine = {}
	Decisions_AssemblyLine.Name = "TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_ARSENAL_OF_DEMOCRACY"
	Decisions_AssemblyLine.Desc = "TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_ARSENAL_OF_DEMOCRACY_DESC"
	HookDecisionCivilizationIcon(Decisions_AssemblyLine, "CIVILIZATION_JFD_AMERICA_ROOSEVELT")
	Decisions_AssemblyLine.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_AssemblyLine") == true then
			Decisions_AssemblyLine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_ARSENAL_OF_DEMOCRACY_ENACTED_DESC")
			return false, false, true 
		end
		
		local cultureCost = mathCeil(player:GetNextPolicyCost() * iMod)
		Decisions_AssemblyLine.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_ARSENAL_OF_DEMOCRACY_DESC", cultureCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 			then return true, false end
		if JFD_GetNumFriends(player:GetID()) < 1 							then return true, false end
		if player:GetJONSCulture() < cultureCost 							then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techIndustrialisationID)) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_AssemblyLine.DoFunc = (
	function(player)
		local cultureCost = mathCeil(player:GetNextPolicyCost() * iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyArsenalOfDemocracyID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_AMERICA_ROOSEVELT_ARSENAL_OF_DEMOCRACY"))
		save(player, "Decisions_AssemblyLine", true)
	end
	)
	
	Decisions_AssemblyLine.Monitors = {}
	Decisions_AssemblyLine.Monitors[GameEvents.DeclareWar] =  (
	function(teamID, otherTeamID)
		local player = Players[Teams[otherTeamID]:GetLeaderID()]
		if (player:GetCivilizationType() ~= civilisationID and player:IsEverAlive()) then return end
		if load(player, "Decisions_AssemblyLine") == true then
			for city in player:Cities() do
				if city:IsHasBuilding(buildingAssemblyPlantID) then
					city:ChangeProduction(city:GetProductionNeeded())
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_AssemblyLine", Decisions_AssemblyLine)
-------------------------------------------------------------------------------------------------------------------------
-- America (Roosevelt): Create the Emergency Relief Administration
-------------------------------------------------------------------------------------------------------------------------
local policyEmergencyReliefFundID	= GameInfoTypes["POLICY_JFD_EMERGENCY_RELIEF_ADMIN"]
local techEconomicsID				= GameInfoTypes["TECH_ECONOMICS"]

local Decisions_EmergencyReliefAdmin = {}
	Decisions_EmergencyReliefAdmin.Name = "TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_EMERGENCY_RELIEF_ADMINISTRATION"
	Decisions_EmergencyReliefAdmin.Desc = "TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_EMERGENCY_RELIEF_ADMINISTRATION_DESC"
	HookDecisionCivilizationIcon(Decisions_EmergencyReliefAdmin, "CIVILIZATION_JFD_AMERICA_ROOSEVELT")
	Decisions_EmergencyReliefAdmin.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_EmergencyReliefAdmin") == true then
			local goldInvested = GetPersistentProperty("JFD_EmergencyReliefFund") or 10
			Decisions_EmergencyReliefAdmin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_EMERGENCY_RELIEF_ADMINISTRATION_ENACTED_DESC", goldInvested)
			return false, false, true
		end
		
		Decisions_EmergencyReliefAdmin.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_AMERICA_ROOSEVELT_EMERGENCY_RELIEF_ADMINISTRATION_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 	then return true, false end
		if player:GetGold() <= 0 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techEconomicsID))	then return true, false end

		return true, true
	end
	)
	
	Decisions_EmergencyReliefAdmin.DoFunc = (
	function(player)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyEmergencyReliefFundID, true)
		if player:IsActivePlayer() then
			LuaEvents.JFD_ShowChooseEmergencyReliefFundGoldPopup()
		else
			local goldCost = mathCeil(player:GetGold() * 20/100)
			player:ChangeGold(-goldCost)
		end
		save(player, "Decisions_EmergencyReliefAdmin", true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_AMERICA_ROOSEVELT_EMERGENCY_RELIEF_FUND"))
	end
	)
	
	Decisions_EmergencyReliefAdmin.Monitors = {}
	Decisions_EmergencyReliefAdmin.Monitors[GameEvents.DeclareWar] =  (
	function(teamID, otherTeamID)
		local warPlayer = Players[Teams[teamID]:GetLeaderID()]
		local player = Players[Teams[otherTeamID]:GetLeaderID()]
		if (player:GetCivilizationType() ~= civilisationID and player:IsEverAlive()) then return end
		if load(player, "Decisions_EmergencyReliefAdmin") == true then
			local goldInvested = GetPersistentProperty("JFD_EmergencyReliefFund") or (player:GetCalculateGoldRate() * 20 / 100)
			player:ChangeGold(goldInvested)
			if player:IsActivePlayer() then
				player:AddNotification(NotificationTypes["NOTIFICATION_GENERIC"], Locale.ConvertTextKey("TXT_KEY_JFD_EMERGENCY_RELIEF_FUND_RETURN", goldInvested, warPlayer:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_JFD_EMERGENCY_RELIEF_FUND_SHORT"), -1, -1)
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_EmergencyReliefAdmin", Decisions_EmergencyReliefAdmin)
--=======================================================================================================================
--=======================================================================================================================
