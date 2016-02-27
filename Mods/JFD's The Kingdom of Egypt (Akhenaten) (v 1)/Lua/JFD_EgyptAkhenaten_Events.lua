-- JFD_EgyptAkhenaten_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Egypt (Akhenaten) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
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
--------------------------------------------------------------------------------------------------------------------------
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingPiety
function JFD_IsUsingPiety()
	local pietyModID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
	   if (mod.ID == pietyModID) then
	      return true
	   end
	end
	return false
end
local isUsingPiety = JFD_IsUsingPiety()
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_EGYPT_AKHENATEN"]
--------------------------------------------------------------------------------------------------------------------------
-- Egypt (Akhenaten): Religious Dissidents
--------------------------------------------------------------------------------------------------------------------------
local cityID = nil
local dissidentGods = {}
	dissidentGods[1] = "Amun"
	dissidentGods[2] = "Hathor"
	dissidentGods[3] = "Anubis"
	dissidentGods[4] = "Isis"
	dissidentGods[5] = "Thoth"
	dissidentGods[6] = "Osiris"
	dissidentGods[7] = "Natan"
local policyAmenhotepID = GameInfoTypes["POLICY_EVENTS_JFD_AMENHOTEP"]
local Event_JFD_AkhenatenEgypt_ReligiousDissidents = {}
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_DESC"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Weight = 7
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.CanFunc = (
		function(player)			
			if player:HasPolicy(policyAmenhotepID) then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			local playerID = player:GetID()
			if isUsingPiety then 
				local hasStateReligion = JFD_HasStateReligion(playerID)
				if (not hasStateReligion) then return false end
			end
			local cities = {}
			local cityCount = 1
			for city in player:Cities() do
				cities[cityCount] = city:GetID()
				cityCount = cityCount + 1
			end
			cityID = cities[GetRandom(1,#cities)]
			if (not cityID) then return false end
			local city = player:GetCityByID(cityID)
			local dissidentGod = dissidentGods[GetRandom(1,#dissidentGods)]
			Event_JFD_AkhenatenEgypt_ReligiousDissidents.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_DESC", city:GetName(), dissidentGod)
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes = {}
	----=========================================================
	---- Outcome 1
	----=========================================================
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1] = {}
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_1"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_1"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1].Weight = 3
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local city = player:GetCityByID(cityID)
			local yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			local yieldCostType = "[ICON_PEACE] Faith"
			if isUsingPiety then 
				yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(23*iMod))
				yieldCostType = "[ICON_JFD_PIETY] Piety"
				if JFD_CalculatePietyRate(playerID) < yieldCost then return false end
			else
				if player:GetFaith() < yieldCost then return false end
			end
			Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_1", yieldCost, yieldCostType, city:GetName())
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local city = player:GetCityByID(cityID)
			local yieldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(65*iMod))
			if isUsingPiety then 
				yieldCostEraAdj = JFD_GetEraAdjustedValue(playerID, mathCeil(23*iMod))
				JFD_ChangePiety(playerID, -yieldCost)
			else
				player:ChangeFaith(-yieldCostEraAdj)
			end
			city:ChangeWeLoveTheKingDayCounter(20)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2] = {}
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_2"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_2"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2].Weight = 5
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local city = player:GetCityByID(cityID)
			local yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			local yieldRewardType = "[ICON_PEACE] Faith"
			if isUsingPiety then 
				yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
				yieldRewardType = "[ICON_JFD_PIETY] Piety"
			end
			Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_2", city:GetName(), yieldReward, yieldRewardType)
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local city = player:GetCityByID(cityID)
			local yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(60*iMod))
			if isUsingPiety then 
				yieldReward = JFD_GetEraAdjustedValue(playerID, mathCeil(15*iMod))
				JFD_ChangePiety(playerID, yieldReward)
			else
				player:ChangeFaith(yieldReward)
			end
			city:ChangeResistanceTurns(1)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS"))
		end)
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3] = {}
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3].Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_3"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3].Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_3"
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3].Weight = 1
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			if isUsingPiety then
				local hasStateReligion = JFD_HasStateReligion(playerID)
				if (not hasStateReligion) then return false end
			else
				return false
			end
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(64*iMod))
			Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_3", cultureReward)
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_ReligiousDissidents.Outcomes[3].DoFunc = (
		function(player)
			local playerID = player:GetID()
			local cultureReward = JFD_GetEraAdjustedValue(playerID, mathCeil(64*iMod))
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyAmenhotepID, true)
			player:ChangeJONSCulture(cultureReward)
			JFD_Secularise(playerID)
			PreGame.SetLeaderName(playerID, Locale.ConvertTextKey("TXT_KEY_LEADER_JFD_AMENHOTEP"))
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EGYPT_AKHENATEN_RELIGIOUS_DISSIDENTS", player:GetName(), player:GetCivilizationShortDescription()))
		end)

Events_AddCivilisationSpecific(civilizationID, "Event_JFD_AkhenatenEgypt_ReligiousDissidents", Event_JFD_AkhenatenEgypt_ReligiousDissidents)
--------------------------------------------------------------------------------------------------------------------------
--  Egypt (Akhenaten): Relations Sour
--------------------------------------------------------------------------------------------------------------------------
local cityStateID
local Event_JFD_AkhenatenEgypt_RelationsSour = {}
	Event_JFD_AkhenatenEgypt_RelationsSour.Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR"
	Event_JFD_AkhenatenEgypt_RelationsSour.Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_DESC"
	Event_JFD_AkhenatenEgypt_RelationsSour.Weight = 2
	Event_JFD_AkhenatenEgypt_RelationsSour.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			local playerTeam = Teams[player:GetTeam()]
			local minorPlayers = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MINOR_CIVS - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsMinorCiv() and otherPlayer:IsAlive()) then
					if playerTeam:IsHasMet(otherPlayer:GetTeam()) then
						minorPlayers[count] = otherPlayerID
						count = count + 1
					end
				end
			end
			cityStateID = minorPlayers[GetRandom(1, #minorPlayers)]
			if (not cityStateID) then return false end
			local minorPlayer = Players[cityStateID]
			Event_JFD_AkhenatenEgypt_RelationsSour.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_DESC", minorPlayer:GetName())
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1] = {}
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_1"
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_RESULT_1"
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1].Weight = 5
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local minorPlayer = Players[cityStateID]
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_RESULT_1", influenceCost, minorPlayer:GetName())
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local influenceCost = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			if cityStateID then
				local minorPlayer = Players[cityStateID]
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, -influenceCost)			
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_RESULT_1_NOTIFICATION", minorPlayer:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR", player:GetCivilizationShortDescription(), minorPlayer:GetName())) 
			end
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2] = {}
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_2"
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_RESULT_2"
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2].Weight = 5
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2].CanFunc = (
		function(player)			
			local playerID = player:GetID()
			local minorPlayer = Players[cityStateID]
			local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
			local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
			if player:GetGold() < goldCost then return false end
			Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_RESULT_2", goldCost, influenceReward, minorPlayer:GetName())
			return true
		end
		)
	Event_JFD_AkhenatenEgypt_RelationsSour.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if cityStateID then
				local minorPlayer = Players[cityStateID]
				local goldCost = JFD_GetEraAdjustedValue(playerID, mathCeil(150*iMod))
				local influenceReward = JFD_GetEraAdjustedValue(playerID, mathCeil(20*iMod))
				player:ChangeGold(-goldCost)
				minorPlayer:ChangeMinorCivFriendshipWithMajor(playerID, influenceReward)			
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR_OUTCOME_RESULT_2_NOTIFICATION", minorPlayer:GetName()), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_EGYPT_AKHENATEN_RELATIONS_SOUR"))
			end
		end)
		
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_AkhenatenEgypt_RelationsSour", Event_JFD_AkhenatenEgypt_RelationsSour)
--=======================================================================================================================
--=======================================================================================================================


