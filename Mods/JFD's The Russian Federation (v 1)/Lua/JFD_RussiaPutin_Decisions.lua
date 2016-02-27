-- JFD_RussiaPutin_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Russia (Putin) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingClaimsCore = JFD_GetUserSetting("JFD_CID_CLAIMS_CORE") == 1
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
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
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_RUSSIA_PUTIN"]
local mathCeil		  = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Putin): Restore the Imperial Throne
-------------------------------------------------------------------------------------------------------------------------
local policyRussiaPutinImperialThroneID = GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE"]
local techEconomicsID = GameInfoTypes["TECH_ECONOMICS"]
local Decisions_JFD_RussiaPutin_ImperialThrone = {}
	Decisions_JFD_RussiaPutin_ImperialThrone.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE"
	Decisions_JFD_RussiaPutin_ImperialThrone.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RussiaPutin_ImperialThrone, "CIVILIZATION_JFD_RUSSIA_PUTIN")
	Decisions_JFD_RussiaPutin_ImperialThrone.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyRussiaPutinImperialThroneID) then
			if userSettingClaimsCore then
				Decisions_JFD_RussiaPutin_ImperialThrone.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE_ENACTED_DESC_CLAIMS")
			else
				Decisions_JFD_RussiaPutin_ImperialThrone.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE_ENACTED_DESC")
			end
			return false, false, true
		end
		local faithCost = mathCeil(700*iMod)
		if userSettingClaimsCore then
			Decisions_JFD_RussiaPutin_ImperialThrone.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE_DESC_CLAIMS", faithCost)
		else
			local cultureReward = 0
			for policy in GameInfo.Policies("PolicyBranchType = 'POLICY_BRANCH_TRADITION'") do
				if player:HasPolicy(policy.ID) then
					cultureReward = cultureReward + mathCeil(120*iMod)
				end
			end
			Decisions_JFD_RussiaPutin_ImperialThrone.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_IMPERIAL_THRONE_DESC", faithCost, cultureReward)
		end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetFaith() < faithCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_RussiaPutin_ImperialThrone.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local faithCost = mathCeil(700*iMod)
		player:ChangeFaith(-faithCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRussiaPutinImperialThroneID, true)
		if (not userSettingClaimsCore) then
			local cultureReward = 0
			for policy in GameInfo.Policies("PolicyBranchType = 'POLICY_BRANCH_TRADITION'") do
				if player:HasPolicy(policy.ID) then
					cultureReward = cultureReward + mathCeil(120*iMod)
				else
					player:SetHasPolicy(policy.ID, true)
				end
			end
			player:ChangeJONSCulture(cultureReward)
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PUTIN_II_IMPERIAL_THRONE", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RussiaPutin_ImperialThrone", Decisions_JFD_RussiaPutin_ImperialThrone)
-------------------------------------------------------------------------------------------------------------------------
-- Russia (Putin): Seize Broadcasting Companies
-------------------------------------------------------------------------------------------------------------------------
local greatWorkMusicID = GameInfoTypes["GREAT_WORK_SLOT_MUSIC"]
local policyRussiaPutinBroadcastingID	= GameInfoTypes["POLICY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING"]
local techRadioID = GameInfoTypes["TECH_RADIO"]
local unitGreatMusicianID = GameInfoTypes["UNIT_EVENTS_JFD_RUSSIA_PUTIN_MUSICIAN"]
local unitMissionCreateGreatWorkID = GameInfoTypes["MISSION_CREATE_GREAT_WORK"]
local Decisions_JFD_RussiaPutin_Broadcasting = {}
	Decisions_JFD_RussiaPutin_Broadcasting.Name = "TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING"
	Decisions_JFD_RussiaPutin_Broadcasting.Desc = "TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_RussiaPutin_Broadcasting, "CIVILIZATION_JFD_RUSSIA_PUTIN")
	Decisions_JFD_RussiaPutin_Broadcasting.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyRussiaPutinBroadcastingID) then
			Decisions_JFD_RussiaPutin_Broadcasting.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING_ENACTED_DESC")
			return false, false, true
		end
		local cultureCost = mathCeil(500*iMod)
		Decisions_JFD_RussiaPutin_Broadcasting.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_RUSSIA_PUTIN_BROADCASTING_DESC", cultureCost)
		if (not player:HasAvailableGreatWorkSlot(greatWorkMusicID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetJONSCulture() < cultureCost then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techRadioID)) then return true, false	end
		return true, true
	end
	)
	
	Decisions_JFD_RussiaPutin_Broadcasting.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local capital = player:GetCapitalCity()
		local cultureCost = mathCeil(500*iMod)
		player:ChangeJONSCulture(-cultureCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyRussiaPutinBroadcastingID, true)
		player:InitUnit(unitGreatMusicianID, capital:GetX(), capital:GetY()):PushMission(unitMissionCreateGreatWorkID)
		if player:IsHuman() then
			Events.GameplayAlertMessage("And now for something completely different!") 
			Events.AudioPlay2DSound("AS2D_LEADER_MUSIC_JFD_PUTIN_ANTHEM")
		end
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_PUTIN_II_BROADCASTING", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_RussiaPutin_Broadcasting", Decisions_JFD_RussiaPutin_Broadcasting)
--=======================================================================================================================
--=======================================================================================================================