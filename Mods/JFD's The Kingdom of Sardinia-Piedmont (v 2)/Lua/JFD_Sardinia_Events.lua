-- JFD_Sardinia_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Sardinia-Piedmont Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
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
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_SARDINIA"]
local eraRenaissanceID = GameInfoTypes["ERA_RENAISSANCE"]
local isUsingPiety = JFD_IsUsingPiety()
--------------------------------------------------------------------------------------------------------------------------
-- Sardinia-Piedmont: Shroud of Turin
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_Sardinia_ShroudOfTurin = {}
	Event_JFD_Sardinia_ShroudOfTurin.Name = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN"
	Event_JFD_Sardinia_ShroudOfTurin.Desc = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_DESC"
	Event_JFD_Sardinia_ShroudOfTurin.EventImage = 'Event_Sardinia_ShroudOfTurin.dds'
	Event_JFD_Sardinia_ShroudOfTurin.Weight = 5
	Event_JFD_Sardinia_ShroudOfTurin.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_Sardinia_ShroudOfTurin") == true	then return false end
			if player:GetCivilizationType() ~= civilizationID 	then return false end
			if player:GetCurrentEra() < eraRenaissanceID then return false end
			if isUsingPiety then
				if (not player:HasStateReligion()) then return false end
			end
			if player:GetCurrentResearch() <= -1 then return false end
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(80*iMod))
			if player:GetFaith() < faithCost then return false end
			return true
		end
		)
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1] = {}
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_1"
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_1"
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].Weight = 5
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].CanFunc = (	
		function(player)	
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(80*iMod))
			local scienceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(41*iMod))
			if player:GetFaith() < faithCost then return false end
			Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_1", faithCost, scienceReward)
			return true
		end
		)
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithCost = JFD_GetEraAdjustedValue(playerID, mathCeil(80*iMod))
			local scienceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(41*iMod))
			player:ChangeFaith(-faithCost)
			LuaEvents.Sukritact_ChangeResearchProgress(playerID, scienceReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_NOTIFICATION_1", player:GetCivilizationShortDescription()))
			save(player, "Event_JFD_Sardinia_ShroudOfTurin", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[2] = {}
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_2"
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_2"
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].Weight = 3
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[2].CanFunc = (	
		function(player)	
			local playerID = player:GetID()
			local yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(80*iMod))
			local yieldCostType = "[ICON_PEACE] Faith"
			if isUsingPiety then
				yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(6*iMod))
				yieldCostType = "[ICON_JFD_PIETY] Piety"
				if player:GetPiety() < yieldCost then return false end
			else
				if player:GetFaith() < yieldCost then return false end
			end
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(57*iMod))
			Event_JFD_Sardinia_ShroudOfTurin.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_2", yieldCost, yieldCostType, cultureReward)
			return true
		end
		)
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(80*iMod))
			if isUsingPiety then
				yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(6*iMod))
				player:ChangePiety(-yieldCost)
			else
				player:ChangeFaith(-yieldCost)
			end
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(57*iMod))
			player:ChangeJONSCulture(cultureReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_NOTIFICATION_2", player:GetCivilizationShortDescription()))
			save(player, "Event_JFD_Sardinia_ShroudOfTurin", true)
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[3] = {}
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_3"
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_3"
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[1].Weight = 2
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[3].CanFunc = (	
		function(player)	
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(97*iMod))
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(49*iMod))
			if player:GetJONSCulture() < cultureCost then return false end
			Event_JFD_Sardinia_ShroudOfTurin.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_3", cultureCost, faithReward)
			return true
		end
		)
	Event_JFD_Sardinia_ShroudOfTurin.Outcomes[3].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local faithReward = JFD_GetEraAdjustedValue(playerID, mathCeil(97*iMod))
			local cultureCost = JFD_GetEraAdjustedValue(playerID, mathCeil(49*iMod))
			player:ChangeJONSCulture(-cultureCost)
			player:ChangeFaith(faithReward)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SARDINIA_SHROUD_OF_TURIN_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SARDINIA_SHROUD_OF_TURIN_NOTIFICATION_3", player:GetName()))
			save(player, "Event_JFD_Sardinia_ShroudOfTurin", true)
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Sardinia_ShroudOfTurin", Event_JFD_Sardinia_ShroudOfTurin)
--------------------------------------------------------------------------------------------------------------------------
-- Sardinia-Piedmont: Va, pensiero
--------------------------------------------------------------------------------------------------------------------------
local eventVerdiCity = nil
local policyItalyID = GameInfoTypes["POLICY_DECISIONS_JFD_ITALY"]
local techRiflingID = GameInfoTypes["TECH_RIFLING"]
local unitGaribaldinoID = GameInfoTypes["UNIT_JFD_GARIBALDINO"]
local Event_JFD_Sardinia_Verdi = {}
	Event_JFD_Sardinia_Verdi.Name = "TXT_KEY_EVENT_JFD_SARDINIA_VERDI"
	Event_JFD_Sardinia_Verdi.Desc = "TXT_KEY_EVENT_JFD_SARDINIA_VERDI_DESC"
	Event_JFD_Sardinia_Verdi.EventImage = 'Event_Sardinia_Verdi.dds'
	Event_JFD_Sardinia_Verdi.Weight = 5
	Event_JFD_Sardinia_Verdi.CanFunc = (
		function(player)	
			if player:HasPolicy(policyItalyID) then return false end		
			if player:GetCivilizationType() ~= civilizationID then return false end
			if (not Teams[player:GetTeam()]:IsHasTech(techRiflingID)) then return false end
			local cities = {}
			local count = 1
			for city in player:Cities() do
				cities[count] = city
				count = count + 1
			end
			eventVerdiCity = cities[GetRandom(1, #cities)]
			if (not eventVerdiCity) then return false end
			Event_JFD_Sardinia_Verdi.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_VERDI_DESC", eventVerdiCity:GetName())
			return true
		end
		)
	Event_JFD_Sardinia_Verdi.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_Sardinia_Verdi.Outcomes[1] = {}
	Event_JFD_Sardinia_Verdi.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_SARDINIA_VERDI_OUTCOME_1"
	Event_JFD_Sardinia_Verdi.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_SARDINIA_VERDI_OUTCOME_RESULT_1"
	Event_JFD_Sardinia_Verdi.Outcomes[1].CanFunc = (	
		function(player)	
			Event_JFD_Sardinia_Verdi.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_VERDI_OUTCOME_RESULT_1", eventVerdiCity:GetName())
			return true
		end
		)
	Event_JFD_Sardinia_Verdi.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			player:InitUnit(unitGaribaldinoID, eventVerdiCity:GetX(), eventVerdiCity:GetY())
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_SARDINIA_VERDI_OUTCOME_RESULT_1_NOTIFICATION", eventVerdiCity:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_SARDINIA_VERDI"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_SARDINIA_VERDI_NOTIFICATION_1", player:GetCivilizationAdjective(), eventVerdiCity:GetName()))
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_Sardinia_Verdi", Event_JFD_Sardinia_Verdi)
--=======================================================================================================================
--=======================================================================================================================


