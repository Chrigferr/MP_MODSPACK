-- JFD_Milan_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Milan Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingMercenaries
function JFD_IsUsingMercenaries()
	local mercenariesModID = "a19351c5-c0b3-4b07-8695-4affaa199949"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == mercenariesModID) then
			return true
		end
	end
	return false
end

-- JFD_IsUsingPiety
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == pietyPrestigeModID) then
			return true
		end
	end
	return false
end
--------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
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
-- Civ Specific Events
--=======================================================================================================================
local civilizationID	= GameInfoTypes["CIVILIZATION_JFD_MILAN"]
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local eraRenaissanceID	= GameInfoTypes["ERA_RENAISSANCE"]
local isUsingPiety		= JFD_IsUsingPiety()
--------------------------------------------------------------------------------------------------------------------------
--  Milan: Guelph-Ghibelle Feud
--------------------------------------------------------------------------------------------------------------------------
local playerBarbarian = Players[63]
local Event_JFD_Milan_Feud = {}
	Event_JFD_Milan_Feud.Name = "TXT_KEY_EVENT_JFD_MILAN_FEUD"
	Event_JFD_Milan_Feud.Desc = "TXT_KEY_EVENT_JFD_MILAN_FEUD_DESC"
	Event_JFD_Milan_Feud.EventImage = 'Event_Milan_Feud.dds'
	Event_JFD_Milan_Feud.Weight = 5
	Event_JFD_Milan_Feud.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (player:GetCurrentEra() < eraRenaissanceID or player:GetCurrentEra() > eraIndustrialID) then return false end
			if isUsingPiety then
				if (not player:HasStateReligion()) then return false end
			end
			return true
		end
		)
	Event_JFD_Milan_Feud.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Milan_Feud.Outcomes[1] = {}
	Event_JFD_Milan_Feud.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_1"
	Event_JFD_Milan_Feud.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_1"
	Event_JFD_Milan_Feud.Outcomes[1].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			local yieldRewardType = "[ICON_PEACE] Faith"
			if isUsingPiety then
				yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(13*iMod))
				yieldRewardType = "[ICON_JFD_PIETY] Piety"
			end
			Event_JFD_Milan_Feud.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_1", yieldReward, yieldRewardType)
			return true
		end
		)
	Event_JFD_Milan_Feud.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			if isUsingPiety then
				yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(13*iMod))
				player:ChangePiety(yieldReward)
			else
				player:ChangeFaith(yieldReward)
			end
			if GetRandom(1,100) <= 50 then
				local capital = player:GetCapitalCity()
				local capitalX = capital:GetX() + GetRandom(1,2)
				local capitalY = capital:GetY() + GetRandom(1,2)
				local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				if unitToSpawnID then
					local unit = playerBarbarian:InitUnit(unitToSpawnID, capitalX, capitalY)
					unit:SetName("Ghibelle Mercenaries")
					unit:JumpToNearestValidPlot()
				end
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MILAN_FEUD_1"))
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_FEUD_OUTCOME_RESULT_1_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_FEUD_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD"))
			end
			save(player, "Event_JFD_Milan_Feud", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Milan_Feud.Outcomes[2] = {}
	Event_JFD_Milan_Feud.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_2"
	Event_JFD_Milan_Feud.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_2"
	Event_JFD_Milan_Feud.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(90*iMod))
			Event_JFD_Milan_Feud.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFD_Milan_Feud.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(90*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			if GetRandom(1,100) <= 50 then
				local capital = player:GetCapitalCity()
				local capitalX = capital:GetX() + GetRandom(1,2)
				local capitalY = capital:GetY() + GetRandom(1,2)
				local unitToSpawnID = GetStrongestMilitaryUnit(player, false, "UNITCOMBAT_MELEE", "UNITCOMBAT_GUN")
				if unitToSpawnID then
					local unit = playerBarbarian:InitUnit(unitToSpawnID, capitalX, capitalY)
					unit:SetName("Guelph Mercenaries")
					unit:JumpToNearestValidPlot()
				end
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_MILAN_FEUD_2"))
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_FEUD_OUTCOME_RESULT_2_ALT_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD"))
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_FEUD_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_FEUD"))
			end
			save(player, "Event_JFD_Milan_Feud", true)
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Milan_Feud", Event_JFD_Milan_Feud)
--------------------------------------------------------------------------------------------------------------------------
--  Treatise by Machiavelli
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_Milan_Machiavelli = {}
	Event_JFD_Milan_Machiavelli.Name = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI"
	Event_JFD_Milan_Machiavelli.Desc = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_DESC"
	Event_JFD_Milan_Machiavelli.EventImage = 'Event_Milan_Machiavelli.dds'
	Event_JFD_Milan_Machiavelli.Weight = 5
	Event_JFD_Milan_Machiavelli.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_Milan_Machiavelli") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			return true
		end
		)
	Event_JFD_Milan_Machiavelli.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Milan_Machiavelli.Outcomes[1] = {}
	Event_JFD_Milan_Machiavelli.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_1"
	Event_JFD_Milan_Machiavelli.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1"
	Event_JFD_Milan_Machiavelli.Outcomes[1].CanFunc = (	
		function(player)	
			Event_JFD_Milan_Machiavelli.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFD_Milan_Machiavelli.Outcomes[1].DoFunc = (
		function(player) 
			player:ChangeNumResourceTotal(iMagistrate, 1)
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI"))
			save(player, "Event_JFD_Milan_Machiavelli", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Milan_Machiavelli.Outcomes[2] = {}
	Event_JFD_Milan_Machiavelli.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_2"
	Event_JFD_Milan_Machiavelli.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_2"
	Event_JFD_Milan_Machiavelli.Outcomes[2].CanFunc = (
		function(player)	
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			Event_JFD_Milan_Machiavelli.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_2", goldenAgeReward)
			return true
		end
		)
	Event_JFD_Milan_Machiavelli.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldenAgeReward = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			player:ChangeGoldenAgeProgressMeter(goldenAgeReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_MILAN_MACHIAVELLI_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_MILAN_MACHIAVELLI"))
			save(player, "Event_JFD_Milan_Machiavelli", true)
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Milan_Machiavelli", Event_JFD_Milan_Machiavelli)
--=======================================================================================================================
--=======================================================================================================================


